/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.BroadcastOptions;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Binder;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECGenParameterSpec;
import java.security.spec.ECPoint;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Notifications through a UnifiedPush app such as ntfy, for phones where Firebase can't sign this
 * patched Telegram up.
 *
 * <p>The address goes to Telegram as a Web Push sign-up, token type 10: the address plus a public
 * key and auth secret its servers encrypt each message to. Type 4, "Simple push", a plain web
 * address, is what Telegram's documentation names for UnifiedPush, but its servers only call that
 * one for events that carry no content. On the S22 on 2026-10-13 a type 4 sign-up was accepted and
 * a message from a bot never reached the address, while Nagram signs up type 10 for ordinary
 * messages. The UnifiedPush app hands over only a message's body, without the headers that body
 * needs to be decrypted, so the private key isn't kept and each message is a wake-up: the app turns
 * it into a broadcast here, and Telegram then connects and fetches what's new the same way it does
 * after a Firebase push it couldn't read.
 *
 * <p>Sign-up follows the UnifiedPush Android spec (AND_3): a REGISTER broadcast to the chosen app
 * with a random token, answered by NEW_ENDPOINT with the address. Every broadcast back has to carry
 * that token, which is how a stranger's broadcast is told apart. On Android 14 and up Android
 * tells the app who's asking (the spec's FLAG_SHARE_IDENTITY), and below it a PendingIntent that
 * names nothing but this package does. The address goes to Telegram through its own
 * {@code PushListenerController.sendRegistrationToServer}, and while the switch is on the patch
 * keeps Firebase from taking that place back at the next start. Telegram's servers call only an
 * https address, so a plain http one is turned away.
 *
 * <p>A refusal before any address came in means a new token next time, as the spec asks, and one
 * after this token's address came in is ignored. TEMP_UNAVAILABLE, the app's server being down,
 * keeps the sign-up and its address. The next NEW_ENDPOINT says it's back.
 *
 * <p>Everything this keeps is in its own prefs file: which app, the token, the address, and the
 * Web Push public key and auth secret. None of it is a setting, so it isn't in settings backups. A sign-up goes out to the app only
 * once its token is on disk, and an address goes to Telegram only once it's saved, so a restart
 * never finds a sign-up it forgot. An address is acknowledged as it comes in, saved or not: the
 * next start's sign-up brings it again.
 */
public final class UnifiedPush {
    static final String PREFS = "hushtelegram_unified_push";
    static final String CHOSEN = "chosen";
    static final String DISTRIBUTOR = "distributor";
    static final String TOKEN = "token";
    static final String ENDPOINT = "endpoint";
    static final String PROBLEM = "problem";
    static final String REFUSED = "refused";
    static final String ENDED = "ended";
    /** The app's server is down for now. The sign-up stays. */
    static final String UNAVAILABLE = "unavailable";
    /** The app gave a plain http address, which Telegram's servers don't call. */
    static final String INSECURE = "insecure";

    static final String REGISTER = "org.unifiedpush.android.distributor.REGISTER";
    static final String UNREGISTER = "org.unifiedpush.android.distributor.UNREGISTER";
    static final String MESSAGE_ACK = "org.unifiedpush.android.distributor.MESSAGE_ACK";
    static final String NEW_ENDPOINT = "org.unifiedpush.android.connector.NEW_ENDPOINT";
    static final String MESSAGE = "org.unifiedpush.android.connector.MESSAGE";
    static final String UNREGISTERED = "org.unifiedpush.android.connector.UNREGISTERED";
    static final String REGISTRATION_FAILED = "org.unifiedpush.android.connector.REGISTRATION_FAILED";
    static final String TEMP_UNAVAILABLE = "org.unifiedpush.android.connector.TEMP_UNAVAILABLE";
    /** The spec's stand-in package: the PendingIntent only tells the app who's asking. */
    static final String DUMMY_APP = "org.unifiedpush.dummy_app";
    static final String NTFY = "io.heckel.ntfy";
    /** The Web Push public key Telegram's servers encrypt to, an uncompressed P-256 point in base64url. */
    static final String WEB_PUSH_KEY = "web_push_key";
    /** The Web Push auth secret, 16 random bytes in base64url. */
    static final String WEB_PUSH_AUTH = "web_push_auth";
    /** Telegram's token type for a Web Push address, "Web push" in its API, the one ordinary messages go to. */
    static final int WEB_PUSH = 10;
    /** The spec's limit on an address. */
    static final int MAX_ENDPOINT = 1000;

    private UnifiedPush() {}

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** Hands the address to Telegram's own sign-up, unless Telegram already holds it. */
        void register(String endpoint);

        /** Starts Telegram if it isn't yet and has each signed-in account fetch what's new. Runs done after. */
        void wake(Runnable done);

        /**
         * With the switch off, or the app gone or done with the sign-up: if Telegram still holds this
         * address, asks its push provider for a new token now.
         */
        void release(String endpoint);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public void register(String endpoint) {
            Utils.runOnMainThread(() -> {
                try {
                    startTelegram();
                    String signUp = webPushToken(Utils.getContext(), endpoint, true);
                    if (signUp == null || signUp.equals(telegramToken())) return;
                    sendToTelegram(WEB_PUSH, signUp);
                    HookStatus.counted(FamilyNames.UNIFIED_PUSH, "addresses handed to Telegram");
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.UNIFIED_PUSH, "handing the address to Telegram", failure);
                }
            });
        }

        @Override
        public void wake(Runnable done) {
            Utils.runOnMainThread(() -> {
                try {
                    startTelegram();
                    onStageQueue(() -> {
                        try {
                            wakeAccounts();
                            HookStatus.counted(FamilyNames.UNIFIED_PUSH, "wake-ups");
                        } catch (Throwable failure) {
                            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "wake-up", failure);
                        } finally {
                            done.run();
                        }
                    });
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.UNIFIED_PUSH, "wake-up", failure);
                    done.run();
                }
            });
        }

        @Override
        public void release(String endpoint) {
            Utils.runOnMainThread(() -> {
                try {
                    startTelegram();
                    if (!holds(telegramToken(), Utils.getContext(), endpoint)) return;
                    // Firebase's next token goes out as it is now that no address is saved. On a
                    // phone without it nothing comes, and the address dies with the app's sign-up.
                    requestPushToken();
                    HookStatus.counted(FamilyNames.UNIFIED_PUSH, "handed back to Firebase");
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.UNIFIED_PUSH, "handing back to Firebase", failure);
                }
            });
        }
    };

    /**
     * Sign-ups and switch changes run here one at a time and in order, so turning the switch on
     * and straight off can't leave a live sign-up behind. Tests swap in a direct one.
     */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram UnifiedPush");
        thread.setDaemon(true);
        return thread;
    });

    /** How a broadcast to the app goes out. Tests swap in one that also keeps the options. */
    interface Broadcasts {
        void send(Context context, Intent intent, @Nullable Bundle options);
    }

    static Broadcasts broadcasts = (context, intent, options) -> {
        if (options != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            context.sendBroadcast(intent, null, options);
        } else {
            context.sendBroadcast(intent);
        }
    };

    /** Where the sign-up is kept. Tests swap in one whose writes can fail. */
    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Whether the address replaced Telegram's token in this thread's sign-up, for {@link #type}. */
    private static final ThreadLocal<Boolean> SWAPPED = new ThreadLocal<>();

    /**
     * Held while the Web Push keys are read or made. Telegram's sign-up thread and the main thread
     * can both ask first, and two pairs would leave Telegram signed up with keys no longer kept.
     */
    private static final Object KEYS = new Object();

    /**
     * Injected at the top of {@code sendRegistrationToServer}, before {@link #type}. While the
     * switch is on and an address is saved, any sign-up Telegram starts, Firebase's included,
     * signs up that address instead, as a Web Push token.
     */
    public static String token(int type, String token) {
        HookStatus.invoked(FamilyNames.UNIFIED_PUSH);
        String endpoint = activeEndpoint();
        String signUp = endpoint == null ? null : webPushToken(Utils.getContext(), endpoint, true);
        SWAPPED.set(signUp != null);
        if (signUp == null) return token;
        if (type != WEB_PUSH) HookStatus.counted(FamilyNames.UNIFIED_PUSH, "Firebase sign-ups kept on UnifiedPush");
        return signUp;
    }

    /** Injected right after {@link #token}: the token type that goes with the answer it gave. */
    public static int type(int type) {
        Boolean swapped = SWAPPED.get();
        SWAPPED.remove();
        return Boolean.TRUE.equals(swapped) ? WEB_PUSH : type;
    }

    /**
     * The Web Push token Telegram signs up for this address: {@code {"endpoint", "keys": {"p256dh",
     * "auth"}}}, the shape Telegram's API asks for with type 10. The keys are made the first time
     * and kept, so each start hands Telegram the same token and doesn't sign it up again. With
     * {@code make} false, null until they exist. Null too when they can't be made or saved: unsaved
     * keys would change at every start.
     */
    @Nullable
    static String webPushToken(@Nullable Context context, String endpoint, boolean make) {
        if (context == null) return null;
        try {
            String key;
            String auth;
            synchronized (KEYS) {
                SharedPreferences prefs = prefs(context);
                key = prefs.getString(WEB_PUSH_KEY, null);
                auth = prefs.getString(WEB_PUSH_AUTH, null);
                if (key == null || auth == null) {
                    if (!make) return null;
                    Base64.Encoder base64url = Base64.getUrlEncoder().withoutPadding();
                    key = base64url.encodeToString(newPublicKey());
                    byte[] secret = new byte[16];
                    new SecureRandom().nextBytes(secret);
                    auth = base64url.encodeToString(secret);
                    if (!prefs.edit().putString(WEB_PUSH_KEY, key).putString(WEB_PUSH_AUTH, auth).commit()) {
                        // Android keeps a failed write in memory, where the next ask this run would find them.
                        prefs.edit().remove(WEB_PUSH_KEY).remove(WEB_PUSH_AUTH).commit();
                        HookStatus.counted(FamilyNames.UNIFIED_PUSH, "Web Push keys not saved, made again at the next start");
                        return null;
                    }
                }
            }
            return new JSONObject().put("endpoint", endpoint)
                    .put("keys", new JSONObject().put("p256dh", key).put("auth", auth)).toString();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "Web Push keys", failure);
            return null;
        }
    }

    /**
     * A fresh P-256 public key as the 65-byte uncompressed point Web Push uses (0x04, then X and Y,
     * 32 bytes each). The private half is dropped: nothing here reads a message's content.
     */
    static byte[] newPublicKey() throws GeneralSecurityException {
        KeyPairGenerator generator = KeyPairGenerator.getInstance("EC");
        generator.initialize(new ECGenParameterSpec("secp256r1"));
        ECPoint point = ((ECPublicKey) generator.generateKeyPair().getPublic()).getW();
        byte[] raw = new byte[65];
        raw[0] = 0x04;
        fixed(point.getAffineX(), raw, 1);
        fixed(point.getAffineY(), raw, 33);
        return raw;
    }

    /** A coordinate into 32 bytes, big-endian: toByteArray can add a sign byte or come up short. */
    private static void fixed(BigInteger value, byte[] into, int at) {
        byte[] bytes = value.toByteArray();
        int length = Math.min(bytes.length, 32);
        System.arraycopy(bytes, bytes.length - length, into, at + 32 - length, length);
    }

    /**
     * Whether the token Telegram last signed up is this address: its Web Push token, or the bare
     * address a Simple push sign-up from 0.0.17 left behind.
     */
    static boolean holds(@Nullable String held, @Nullable Context context, String endpoint) {
        if (held == null) return false;
        return held.equals(endpoint) || held.equals(webPushToken(context, endpoint, false));
    }

    /** The saved address while the switch is on and not paused, or null. */
    @Nullable
    static String activeEndpoint() {
        try {
            if (!Utils.settingsReady() || !Settings.UNIFIED_PUSH.get()) return null;
            Context context = Utils.getContext();
            if (context == null) return null;
            String endpoint = prefs(context).getString(ENDPOINT, null);
            return endpoint == null || endpoint.isEmpty() ? null : endpoint;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "switch", failure);
            return null;
        }
    }

    /** From the application's onCreate in the main process: signs up again, as the spec asks at each start. */
    public static void onTelegramStart(Context context) {
        if (context == null || !PatchFamily.UNIFIED_PUSH.inBuild()) return;
        try {
            if (!Utils.settingsReady()) return;
            boolean on = Settings.UNIFIED_PUSH.savedValue();
            Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            work.execute(() -> sync(app, on));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "sign-up", failure);
        }
    }

    /** From the switch, with the value it's about to save. */
    public static void switched(Context context, boolean on) {
        if (context == null || !PatchFamily.UNIFIED_PUSH.inBuild()) return;
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        work.execute(() -> sync(app, on));
    }

    /**
     * Picks the app the next sign-up goes to, and signs up with it now if the switch is on. A
     * pick is a fresh start, so a sign-up the last app ended or turned down doesn't hold it back.
     */
    public static void choose(Context context, String distributor, boolean on) {
        if (context == null || !PatchFamily.UNIFIED_PUSH.inBuild()) return;
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        if (!prefs(app).edit().putString(CHOSEN, distributor).remove(PROBLEM).commit()) {
            HookStatus.counted(FamilyNames.UNIFIED_PUSH, "app choice not saved");
            return;
        }
        work.execute(() -> sync(app, on));
    }

    /**
     * Signs up with the chosen app when on, and ends the sign-up when off. Pause doesn't come
     * through here: callers pass the switch as saved, so a paused Telegram keeps its address. A
     * sign-up the app ended stays ended until the switch is turned off and on again, or another
     * app is picked.
     */
    static synchronized void sync(Context context, boolean on) {
        try {
            SharedPreferences prefs = prefs(context);
            String current = prefs.getString(DISTRIBUTOR, null);
            String token = prefs.getString(TOKEN, null);
            if (!on) {
                String endpoint = prefs.getString(ENDPOINT, null);
                // The choice of app stays. Everything about the sign-up goes, before the app hears,
                // so a broadcast with the old token is somebody else's from here on.
                boolean forgotten = prefs.edit().remove(DISTRIBUTOR).remove(TOKEN).remove(ENDPOINT).remove(PROBLEM).commit();
                if (token != null && current != null) send(context, new Intent(UNREGISTER), current, token);
                if (endpoint != null) telegram.release(endpoint);
                // Still on disk, it's ended again at the next start with the switch off. The app ignores a token it no longer knows.
                if (!forgotten) HookStatus.counted(FamilyNames.UNIFIED_PUSH, "sign-up not forgotten, ended again at the next start");
                return;
            }
            if (ENDED.equals(prefs.getString(PROBLEM, null))) return;
            List<String> installed = distributors(context);
            String distributor = pick(installed, prefs.getString(CHOSEN, current));
            if (distributor == null) {
                // The app is gone, or there are several and none is picked yet. An address nothing
                // answers any more would keep Firebase out for good, so the sign-up goes with it.
                if (token != null && current != null && installed.contains(current)) {
                    send(context, new Intent(UNREGISTER), current, token);
                }
                String endpoint = prefs.getString(ENDPOINT, null);
                if (!prefs.edit().remove(DISTRIBUTOR).remove(TOKEN).remove(ENDPOINT).commit()) {
                    HookStatus.counted(FamilyNames.UNIFIED_PUSH, "sign-up not forgotten, ended again at the next start");
                }
                // Telegram's servers may still hold the dead address, from before or from a sign-up
                // that ran ahead of this one at start, so Firebase is asked again the way off does.
                if (endpoint != null) telegram.release(endpoint);
                return;
            }
            if (token == null || !distributor.equals(current)) {
                if (token != null && current != null) send(context, new Intent(UNREGISTER), current, token);
                String fresh = UUID.randomUUID().toString();
                // The token goes out only once it's on disk. An app holding a token this side forgot
                // would have its answers dropped as a stranger's.
                if (!prefs.edit().putString(DISTRIBUTOR, distributor).putString(TOKEN, fresh)
                        .remove(ENDPOINT).remove(PROBLEM).commit()) {
                    HookStatus.counted(FamilyNames.UNIFIED_PUSH, "sign-up not saved, tried again at the next start");
                    return;
                }
                token = fresh;
            }
            send(context, new Intent(REGISTER)
                    .putExtra("application", context.getPackageName())
                    .putExtra("message", "Telegram"), distributor, token);
            Logger.printInfo(() -> "UnifiedPush: asked " + distributor + " for an address");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "sign-up", failure);
        }
    }

    /**
     * A REGISTER or UNREGISTER to the app, carrying the token and this app's identity: Android's
     * own on 14 and up, a PendingIntent that names only this package below it.
     */
    private static void send(Context context, Intent intent, String distributor, String token) {
        toStopped(intent.setPackage(distributor).putExtra("token", token));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            broadcasts.send(context, intent, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
        } else {
            intent.putExtra("pi", PendingIntent.getBroadcast(context, 0, new Intent(DUMMY_APP), PendingIntent.FLAG_IMMUTABLE));
            broadcasts.send(context, intent, null);
        }
    }

    /**
     * An app installed and never opened is in Android's stopped state, and a broadcast skips it
     * unless it asks not to. Picking ntfy straight after installing it is the usual order.
     */
    private static Intent toStopped(Intent intent) {
        return intent.addFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
    }

    /**
     * The saved choice while it's still installed, then ntfy, then the only app there is. With
     * several and none of them picked, none: whichever app gets the token learns when messages
     * arrive, so that one is the user's call and not the alphabet's.
     */
    @Nullable
    static String pick(List<String> installed, @Nullable String chosen) {
        if (chosen != null && installed.contains(chosen)) return chosen;
        if (installed.contains(NTFY)) return NTFY;
        return installed.size() == 1 ? installed.get(0) : null;
    }

    /** Package names of the installed apps that take a UnifiedPush sign-up, sorted, this one left out. */
    public static List<String> distributors(Context context) {
        List<String> found = new ArrayList<>();
        try {
            for (ResolveInfo info : context.getPackageManager().queryBroadcastReceivers(new Intent(REGISTER), 0)) {
                if (info.activityInfo == null) continue;
                String name = info.activityInfo.packageName;
                if (name != null && !name.equals(context.getPackageName()) && !found.contains(name)) found.add(name);
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "UnifiedPush: could not list the apps that take a sign-up", failure);
        }
        Collections.sort(found);
        return found;
    }

    /**
     * From {@link UnifiedPushReceiver}. Anything without the saved token is somebody else's and
     * is dropped. Runs done once the broadcast is handled, which for a message is after Telegram
     * has been told to fetch.
     */
    static void receive(Context context, @Nullable Intent intent, Runnable done) {
        Runnable once = once(done);
        try {
            if (intent == null || !PatchFamily.UNIFIED_PUSH.inBuild()) { once.run(); return; }
            SharedPreferences prefs = prefs(context);
            String token = prefs.getString(TOKEN, null);
            if (token == null || !token.equals(intent.getStringExtra("token"))) {
                Logger.printInfo(() -> "UnifiedPush: dropped a broadcast without this sign-up's token");
                once.run();
                return;
            }
            String action = String.valueOf(intent.getAction());
            switch (action) {
                case NEW_ENDPOINT:
                    // The spec asks for this acknowledgement too, and an app may drop an address nobody acknowledged.
                    acknowledge(context, prefs, token, intent.getStringExtra("id"));
                    endpoint(context, prefs, intent.getStringExtra("endpoint"));
                    break;
                case MESSAGE:
                    acknowledge(context, prefs, token, intent.getStringExtra("id"));
                    if (Utils.settingsReady() && Settings.UNIFIED_PUSH.get()) {
                        telegram.wake(once);
                        return;
                    }
                    break;
                case REGISTRATION_FAILED:
                    if (prefs.getString(ENDPOINT, null) != null) {
                        // This token's address already came in, so the spec says a refusal is ignored.
                        // Asked again at a start, the app can fail for a moment while the address still works.
                        Logger.printInfo(() -> "UnifiedPush: ignored a refusal after the address came in ("
                                + intent.getStringExtra("reason") + ")");
                        break;
                    }
                    // The spec asks for a new token on the next sign-up, so this one is let go.
                    if (!prefs.edit().remove(TOKEN).putString(PROBLEM, REFUSED).commit()) {
                        HookStatus.counted(FamilyNames.UNIFIED_PUSH, "refusal not saved");
                    }
                    Logger.printInfo(() -> "UnifiedPush: the app turned the sign-up down ("
                            + intent.getStringExtra("reason") + ")");
                    break;
                case TEMP_UNAVAILABLE:
                    // The app's server is down for now. The sign-up and its address stay, and its next
                    // NEW_ENDPOINT says it's back. A stand-in app it suggests (useDistributor) isn't used.
                    if (!prefs.edit().putString(PROBLEM, UNAVAILABLE).commit()) {
                        HookStatus.counted(FamilyNames.UNIFIED_PUSH, "outage not saved");
                    }
                    Logger.printInfo(() -> "UnifiedPush: the app's server is down for now");
                    break;
                case UNREGISTERED: {
                    String ended = prefs.getString(ENDPOINT, null);
                    if (!prefs.edit().remove(TOKEN).remove(ENDPOINT).putString(PROBLEM, ENDED).commit()) {
                        HookStatus.counted(FamilyNames.UNIFIED_PUSH, "ended sign-up not saved");
                    }
                    Logger.printInfo(() -> "UnifiedPush: the app ended the sign-up");
                    // Nothing answers at that address now, so Telegram is pointed back at Firebase.
                    if (ended != null) telegram.release(ended);
                    break;
                }
                default:
                    break;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "UnifiedPush broadcast", failure);
        }
        once.run();
    }

    private static void endpoint(Context context, SharedPreferences prefs, @Nullable String endpoint) {
        if (!usable(endpoint)) {
            if (endpoint != null && endpoint.regionMatches(true, 0, "http://", 0, 7)) {
                // Telegram's servers call only https, so the row says why nothing arrives. A new
                // address replaces the old one, so nothing answers there now either.
                String old = prefs.getString(ENDPOINT, null);
                if (!prefs.edit().remove(ENDPOINT).putString(PROBLEM, INSECURE).commit()) {
                    HookStatus.counted(FamilyNames.UNIFIED_PUSH, "insecure address not saved");
                }
                Logger.printInfo(() -> "UnifiedPush: turned away a plain http address");
                if (old != null) telegram.release(old);
            } else {
                Logger.printInfo(() -> "UnifiedPush: ignored an address that isn't a web address");
            }
            return;
        }
        // Handed to Telegram only once it's on disk. Unsaved, the next start's sign-up brings it again.
        if (!prefs.edit().putString(ENDPOINT, endpoint).remove(PROBLEM).commit()) {
            HookStatus.counted(FamilyNames.UNIFIED_PUSH, "address not saved, asked again at the next start");
            return;
        }
        Logger.printInfo(() -> "UnifiedPush: got an address at " + Uri.parse(endpoint).getHost());
        // Paused, Telegram keeps the address it has; the next start hands this one over.
        if (Utils.settingsReady() && Settings.UNIFIED_PUSH.get()) {
            telegram.register(endpoint);
            OwnConnection.besideUnifiedPush(context);
        }
    }

    /**
     * An https address with a host, no longer than the spec allows. Telegram's push documentation
     * says its servers call "the specified HTTPS endpoint".
     */
    static boolean usable(@Nullable String endpoint) {
        if (endpoint == null || endpoint.isEmpty() || endpoint.length() > MAX_ENDPOINT) return false;
        Uri uri = Uri.parse(endpoint);
        return "https".equalsIgnoreCase(uri.getScheme()) && uri.getHost() != null && !uri.getHost().isEmpty();
    }

    /** The spec asks for an acknowledgement when a message carries an id. */
    private static void acknowledge(Context context, SharedPreferences prefs, String token, @Nullable String id) {
        String distributor = prefs.getString(DISTRIBUTOR, null);
        if (id == null || distributor == null) return;
        broadcasts.send(context, toStopped(new Intent(MESSAGE_ACK).setPackage(distributor).putExtra("token", token).putExtra("id", id)), null);
    }

    /** From {@link UnifiedPushRaise}: a binding that keeps Telegram in front while a message arrives, signed up only. */
    @Nullable
    static IBinder raise(Context context) {
        try {
            if (!PatchFamily.UNIFIED_PUSH.inBuild() || prefs(context).getString(TOKEN, null) == null) return null;
            return new Binder();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "raise", failure);
            return null;
        }
    }

    /** The app the next sign-up goes to, or null when none is installed or several are and none is picked. */
    @Nullable
    public static String chosen(Context context) {
        SharedPreferences prefs = prefs(context);
        return pick(distributors(context), prefs.getString(CHOSEN, prefs.getString(DISTRIBUTOR, null)));
    }

    /** What the Push app row says under its title. */
    public static String status(Context context, boolean on) {
        SharedPreferences prefs = prefs(context);
        String app = chosen(context);
        if (app == null) {
            return distributors(context).isEmpty() ? L10n.t("Install a UnifiedPush app like ntfy, then come back here.")
                    : L10n.t("Tap to pick which UnifiedPush app to use.");
        }
        String name = label(context, app);
        if (!on) return L10n.f("%1$s. Turn the switch on to sign up with it.", name);
        String problem = prefs.getString(PROBLEM, null);
        if (ENDED.equals(problem)) return L10n.f("%1$s ended the sign-up. Turn the switch off and on to sign up again.", name);
        if (REFUSED.equals(problem)) return L10n.f("%1$s turned the sign-up down. Check that it allows UnifiedPush.", name);
        if (INSECURE.equals(problem)) return L10n.f("%1$s gave an address without https, which Telegram's servers won't call.", name);
        if (UNAVAILABLE.equals(problem)) return L10n.f("The server behind %1$s is down for now. Wake-ups come back once it's up.", name);
        if (app.equals(prefs.getString(DISTRIBUTOR, null)) && prefs.getString(ENDPOINT, null) != null) {
            return L10n.f("Telegram's wake-ups come through %1$s.", name);
        }
        return L10n.f("Signing up with %1$s…", name);
    }

    /** The app's name as the launcher shows it, or its package name. */
    public static String label(Context context, String packageName) {
        try {
            PackageManager pm = context.getPackageManager();
            ApplicationInfo info = pm.getApplicationInfo(packageName, 0);
            CharSequence label = pm.getApplicationLabel(info);
            if (label != null && label.length() > 0) return label.toString();
        } catch (Throwable ignored) {
            // Uninstalled since it was listed: the package name still says which one.
        }
        return packageName;
    }

    static SharedPreferences prefs(Context context) {
        return store.apply(context);
    }

    private static Runnable once(Runnable done) {
        AtomicBoolean ran = new AtomicBoolean();
        return () -> {
            if (ran.compareAndSet(false, true)) done.run();
        };
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code PushListenerController.sendRegistrationToServer(type, token)}. */
    public static void sendToTelegram(int type, String token) {}

    /** {@code SharedConfig.pushString}, the token Telegram last signed up. */
    public static String telegramToken() { return null; }

    /** {@code ApplicationLoader.postInitApplication()}, which does nothing once Telegram is up. */
    public static void startTelegram() {}

    /** {@code Utilities.stageQueue.postRunnable(task)}. */
    public static void onStageQueue(Runnable task) { task.run(); }

    /** Each signed-in account reconnects and fetches, as Telegram's {@code onDecryptError} does, without its latch. */
    public static void wakeAccounts() {}

    /** {@code ApplicationLoader.getPushProvider()}: if it has its services, {@code onRequestPushToken()}. */
    public static void requestPushToken() {}
}
