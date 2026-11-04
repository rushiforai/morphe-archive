package dev.utaa.linimal.extension.features.googleauth;

import android.accounts.Account;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import dev.utaa.linimal.extension.config.LinimalConfig;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Google ドライブ連携（トークのバックアップ・復元）で使う {@code GoogleAuthUtil} の token 要求だけを、
 * 端末本体の Google Play services から MicroG-RE へ向けます（ADR 0003）。
 *
 * <p>再署名した LINE では、端末本体の Google Play services が実際の署名で OAuth client を照合するため
 * token を取得できません。MicroG-RE は LINE の manifest の meta-data で申告された公式証明書の SHA-1 を
 * 使うので、{@code GetToken} の bind 先を MicroG-RE にすると token を取得できます。</p>
 *
 * <p>設定 OFF、未初期化、例外時は LINE 本来の経路（端末本体の Google Play services）をそのまま使います。
 * 設定 ON で MicroG-RE が未導入、または公式リリースの証明書で署名されていなければ元の経路を使い、
 * 導入を案内する通知を出します。FCM、FIS など他の GMS の呼び出しには触れません。</p>
 *
 * <p>同じ設定で、Google アカウントでの LINE へのログイン（Identity API の Sign-In）も MicroG-RE へ向けます（ADR 0004）。</p>
 */
public final class GoogleAuthRoutingHooks {
    static final String GMS_PACKAGE = "com.google.android.gms";
    static final String MICROG_PACKAGE = "app.revanced.android.gms";
    static final String GET_TOKEN_CLASS = "com.google.android.gms.auth.GetToken";
    /** Identity API の Sign-In サービス。MicroG-RE は action の接頭辞を自分のパッケージ名に変えて公開します。 */
    static final String GMS_IDENTITY_SIGN_IN_ACTION = "com.google.android.gms.auth.api.identity.service.signin.START";
    static final String MICROG_IDENTITY_SIGN_IN_ACTION = "app.revanced.android.gms.auth.api.identity.service.signin.START";
    static final String GMS_CHOOSE_ACCOUNT_ACTION = "com.google.android.gms.common.account.CHOOSE_ACCOUNT";
    static final String MICROG_CHOOSE_ACCOUNT_ACTION = "app.revanced.android.gms.common.account.CHOOSE_ACCOUNT";
    /** MicroG-RE が自分の Google アカウントを登録する種別（{@code basePackageName}）。 */
    static final String MICROG_ACCOUNT_TYPE = "app.revanced";
    static final String GOOGLE_ACCOUNT_TYPE = "com.google";
    /** Credential Manager の「Google でログイン」系 option の type。 */
    static final String GOOGLE_ID_TOKEN_CREDENTIAL_TYPE =
            "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL";

    /**
     * MorpheApp/MicroG-RE の公式リリースの署名証明書（SHA-256）。同じパッケージ名の別アプリへ token の要求や
     * バックアップを渡さないよう、この証明書で署名された MicroG-RE だけを向け先にします。
     * 7.1.1 から 7.2.1-dev.2 までのリリースで同じ値であることを確認しています。
     */
    static final String MICROG_CERTIFICATE_SHA256 =
            "0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7";

    interface PackagePresence {
        /** [packageName] が入っていて、MicroG-RE の公式証明書で署名されているかどうか。 */
        boolean isTrustedInstalled(String packageName);
    }

    /** 設定と MicroG-RE の有無から決まる、token 要求の扱い。 */
    enum Routing {
        /** 設定 OFF。LINE 本来の経路を使います。 */
        ORIGINAL,
        /** 設定 ON で、公式証明書の MicroG-RE がない。LINE 本来の経路を使い、導入を案内します。 */
        MICROG_MISSING,
        /** 設定 ON で MicroG-RE がある。MicroG-RE へ向けます。 */
        MICROG
    }

    private GoogleAuthRoutingHooks() {
    }

    /**
     * {@code GoogleAuthUtil} の「GoogleAuthServiceClient を使うか」の判定の先頭で呼ばれます。
     * true を返すと判定を false にして、{@code GetToken} を bind する経路へ回します。
     * GoogleAuthServiceClient は bind 先を GMS client 共通の定数で決めるため、MicroG-RE へ向けられません。
     */
    public static boolean shouldSkipAuthServiceClient(Context context) {
        try {
            Routing routing = routingFor(context);
            if (routing == Routing.MICROG_MISSING) {
                MicrogInstallNotifier.notifyMissing(context);
            }
            return routing == Routing.MICROG;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * {@code GoogleAuthUtil} が {@code GetToken} を bind する直前で呼ばれ、bind 先を返します。
     *
     * <p>LINE の判定は別のフラグとの {@code &&} の後ろにあり、フラグが false だと
     * {@link #shouldSkipAuthServiceClient} は呼ばれません。そのため導入の案内はここからも出します。
     * 案内は一定時間に 1 回までなので、両方から呼ばれても重複しません。</p>
     */
    public static ComponentName authServiceComponent(Context context, ComponentName original) {
        try {
            if (original == null) {
                return null;
            }
            Routing routing = routingFor(context);
            if (routing == Routing.MICROG_MISSING && isGmsGetToken(original)) {
                MicrogInstallNotifier.notifyMissing(context);
            }
            String routed = routedPackage(
                    routing == Routing.MICROG,
                    original.getPackageName(),
                    original.getClassName());
            if (routed.equals(original.getPackageName())) {
                return original;
            }
            return new ComponentName(routed, original.getClassName());
        } catch (Throwable ignored) {
            return original;
        }
    }

    /**
     * バックアップのアカウント選択の Intent を返す直前で呼ばれます。MicroG-RE へ向けるときは、
     * 端末本体の Google Play services ではなく MicroG-RE の選択画面を開き、MicroG-RE のアカウントだけを表示させます。
     * token は MicroG-RE がアカウント名で探すため、選択も MicroG-RE で行うと、選んだアカウントが必ず見つかります。
     */
    public static Intent chooseAccountIntent(Intent intent) {
        try {
            if (intent == null || !GMS_CHOOSE_ACCOUNT_ACTION.equals(intent.getAction())
                    || !GMS_PACKAGE.equals(intent.getPackage())) {
                return intent;
            }
            // Intent を作る処理は Context の register を途中で再利用するため、プロセスの Application を使います。
            Context context = currentApplication();
            Routing routing = routingFor(context);
            if (routing == Routing.MICROG_MISSING) {
                MicrogInstallNotifier.notifyMissing(context);
            }
            if (routing != Routing.MICROG) {
                return intent;
            }
            // 途中で失敗しても元の Intent が残るよう、コピーを書き換えて、すべて成功したときだけ返します。
            Intent routed = new Intent(intent);
            routed.setAction(MICROG_CHOOSE_ACCOUNT_ACTION);
            routed.setPackage(MICROG_PACKAGE);
            routed.putExtra("allowableAccountTypes", new String[] {MICROG_ACCOUNT_TYPE});
            return routed;
        } catch (Throwable ignored) {
            return intent;
        }
    }

    /**
     * Drive の資格情報がアカウント名から Account を探す処理の先頭で呼ばれます。MicroG-RE へ向けるときは、
     * 端末本体の {@code com.google} アカウントを探さず、名前から Account を作って返します。
     * MicroG-RE だけにあるアカウントは端末本体の一覧に無いため、探すと名前ごと消えてしまいます。
     * null を返すと元の処理（端末本体のアカウントの検索）を続けます。
     *
     * <p>MicroG-RE のアカウントが MicroG-RE に実在するかは確かめません。Android のアカウントの可視性はアカウントごとに決まり、
     * LINE から見える一覧では判定できないためです。MicroG-RE に無い名前（以前に端末本体のアカウントで設定した自動バックアップなど）は、
     * MicroG-RE が NetworkError を返して失敗します。バックアップの設定でアカウントを選び直す必要があります。</p>
     */
    public static Account selectedAccount(Object credential, String name) {
        try {
            if (name == null || name.isEmpty() || routingFor(contextOf(credential)) != Routing.MICROG) {
                return null;
            }
            return new Account(name, GOOGLE_ACCOUNT_TYPE);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Google ログインを始めてから、次の Sign-In client の接続を MicroG-RE へ向ける準備の期限。 */
    static final long SIGN_IN_WINDOW_MILLIS = 60_000L;
    private static volatile long signInArmedUntil;
    private static final java.util.Map<Object, Boolean> IDENTITY_DECISIONS =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());

    /**
     * androidx.credentials が provider を選ぶ処理の先頭で呼ばれます。true を返すと、Android 本体の
     * Credential Manager ではなく、LINE 同梱の Play services 版 provider を使わせます（ADR 0004）。
     *
     * <p>Android 本体の Credential Manager は呼び出し元の実際の署名を端末本体の Google Play services に渡すため、
     * 再署名した LINE では Google ログインが通りません。対象は option がすべて Google ID token の要求だけで、
     * パスキーやパスワードを含む要求は変えません。</p>
     */
    public static boolean shouldUsePlayServicesCredentialProvider(Object factory, Object request) {
        try {
            return isRoutedGoogleIdRequest(contextOf(factory), request, true);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Play services 版 provider が、新しい Identity Credentials API を使うかの判定（{@code original}）の直後で呼ばれ、
     * 最終的な判定を返します。MicroG-RE へ向ける Google ログインでは false を返して Sign-In client
     * （{@code getSignInIntent}）を使わせ、次の 1 回の Sign-In client の接続だけを MicroG-RE へ向けます。
     * 元の判定が false（旧経路）のときも、向け替えの準備は行います。
     */
    public static boolean useIdentityCredentialsApi(boolean original, Context context, Object request) {
        try {
            if (!isRoutedGoogleIdRequest(context, request, true)) {
                return original;
            }
            signInArmedUntil = android.os.SystemClock.elapsedRealtime() + SIGN_IN_WINDOW_MILLIS;
            return false;
        } catch (Throwable ignored) {
            return original;
        }
    }

    private static boolean isRoutedGoogleIdRequest(Context context, Object request, boolean notify)
            throws IllegalAccessException {
        if (!isGoogleIdTokenOnlyRequest(request)) {
            return false;
        }
        Routing routing = routingFor(context);
        if (notify && routing == Routing.MICROG_MISSING) {
            MicrogInstallNotifier.notifyMissing(context);
        }
        return routing == Routing.MICROG;
    }

    /**
     * Identity API の Sign-In client が bind するパッケージ。接続処理は E、D、F の順に読むため、
     * ここで 1 回の接続の向け先を決め、{@link #identitySignInAction} と {@link #identitySignInDynamicLookup} は同じ判定を使います。
     */
    public static String identitySignInPackage(Object client, String original) {
        boolean routed = false;
        try {
            // 準備は 1 回の接続で使い切ります。後から別の要求が同じ client を接続しても向け替えません。
            routed = consumeSignInArm() && routingFor(contextOf(client)) == Routing.MICROG;
        } catch (Throwable ignored) {
            routed = false;
        }
        try {
            IDENTITY_DECISIONS.put(client, routed);
        } catch (Throwable ignored) {
            return original;
        }
        return routedIdentityPackage(routed, original);
    }

    /** Identity API の Sign-In client が bind する action。MicroG-RE へ向けるときはその接頭辞の action を返します。 */
    public static String identitySignInAction(Object client, String original) {
        try {
            return routedIdentityAction(decisionFor(client), original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    /**
     * Sign-In client が端末本体の Google Play services の dynamic lookup で接続先を解決するかどうか。
     * dynamic lookup はパッケージ名を無視して本体の service を返すため、MicroG-RE へ向けるときは使いません。
     */
    public static boolean identitySignInDynamicLookup(Object client, boolean original) {
        try {
            return decisionFor(client) ? false : original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    /** E で決めた判定。E を経ずに読まれた場合は、MicroG-RE へ向けない（公式の組み合わせ）とします。 */
    private static boolean decisionFor(Object client) {
        Boolean decision = IDENTITY_DECISIONS.get(client);
        return decision != null && decision;
    }

    private static synchronized boolean consumeSignInArm() {
        boolean armed = android.os.SystemClock.elapsedRealtime() < signInArmedUntil;
        signInArmedUntil = 0L;
        return armed;
    }

    private static Context currentApplication() {
        try {
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static String routedIdentityPackage(boolean routeToMicrog, String original) {
        return routeToMicrog && GMS_PACKAGE.equals(original) ? MICROG_PACKAGE : original;
    }

    static String routedIdentityAction(boolean routeToMicrog, String original) {
        return routeToMicrog && GMS_IDENTITY_SIGN_IN_ACTION.equals(original) ? MICROG_IDENTITY_SIGN_IN_ACTION : original;
    }

    /**
     * 難読化された GetCredentialRequest の option が、1 つ以上あり、すべて Google ID token の type を持つか。
     * 型名ではなく、request が持つ List の要素の String field の値で判定します。
     */
    static boolean isGoogleIdTokenOnlyRequest(Object request) throws IllegalAccessException {
        if (request == null) {
            return false;
        }
        boolean found = false;
        for (Field field : instanceFields(request.getClass())) {
            Object value = field.get(request);
            if (!(value instanceof List)) {
                continue;
            }
            for (Object option : (List<?>) value) {
                if (option == null || !hasStringValue(option, GOOGLE_ID_TOKEN_CREDENTIAL_TYPE)) {
                    return false;
                }
                found = true;
            }
        }
        return found;
    }

    private static boolean hasStringValue(Object target, String expected) throws IllegalAccessException {
        for (Field field : instanceFields(target.getClass())) {
            if (field.getType() == String.class && expected.equals(field.get(target))) {
                return true;
            }
        }
        return false;
    }

    /** factory や GMS client が保持する Context。最初に見つかった Context 型の instance field を使います。 */
    static Context contextOf(Object owner) throws IllegalAccessException {
        if (owner == null) {
            return null;
        }
        for (Field field : instanceFields(owner.getClass())) {
            if (Context.class.isAssignableFrom(field.getType())) {
                return (Context) field.get(owner);
            }
        }
        return null;
    }

    private static List<Field> instanceFields(Class<?> type) {
        List<Field> fields = new java.util.ArrayList<>();
        for (Class<?> current = type; current != null && current != Object.class; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    fields.add(field);
                }
            }
        }
        return fields;
    }

    private static Routing routingFor(Context context) {
        return routing(LinimalConfig.get().isGoogleDriveBackupViaMicrogEnabled(), presenceOf(context));
    }

    static Routing routing(boolean enabled, PackagePresence presence) {
        if (!enabled || presence == null) {
            return Routing.ORIGINAL;
        }
        return presence.isTrustedInstalled(MICROG_PACKAGE) ? Routing.MICROG : Routing.MICROG_MISSING;
    }

    private static boolean isGmsGetToken(ComponentName component) {
        return GMS_PACKAGE.equals(component.getPackageName()) && GET_TOKEN_CLASS.equals(component.getClassName());
    }

    /** 端末本体の Google Play services の {@code GetToken} だけを MicroG-RE の同名 component に向けます。 */
    static String routedPackage(boolean routeToMicrog, String packageName, String className) {
        if (routeToMicrog && GMS_PACKAGE.equals(packageName) && GET_TOKEN_CLASS.equals(className)) {
            return MICROG_PACKAGE;
        }
        return packageName;
    }

    static byte[] hexToBytes(String hex) {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        }
        return bytes;
    }

    private static PackagePresence presenceOf(Context context) {
        if (context == null) {
            return null;
        }
        final PackageManager packageManager = context.getPackageManager();
        final byte[] certificate = hexToBytes(MICROG_CERTIFICATE_SHA256);
        // 未導入でも false を返します。鍵のローテーション後の証明書も lineage で照合されます。
        return packageName -> packageManager.hasSigningCertificate(
                packageName, certificate, PackageManager.CERT_INPUT_SHA256);
    }
}
