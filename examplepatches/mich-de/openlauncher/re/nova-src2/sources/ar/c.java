package ar;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.SystemClock;
import android.widget.Toast;
import bn.q;
import com.android.launcher3.LauncherProvider;
import com.google.android.gms.internal.consent_sdk.k0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer.a;
import com.stripe.android.PaymentConfiguration;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import com.teslacoilsw.launcher.homereset.HomeReset;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import com.teslacoilsw.launcher.onboarding.WhatsNewActivity;
import com.teslacoilsw.launcher.rewards.RewardsActivity;
import com.teslacoilsw.tesladirect.DirectLicensingEnterCode;
import db0.q0;
import dq.o;
import e10.a3;
import e10.g2;
import e10.y2;
import e10.z2;
import java.io.File;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import o30.i;
import o9.f2;
import o9.v1;
import ps.o0;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15552a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f15553b;

    public /* synthetic */ c(Context context, int i5) {
        this.f15552a = i5;
        this.f15553b = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        PaymentConfiguration paymentConfiguration;
        q0 q0Var;
        int i5 = this.f15552a;
        Context context = this.f15553b;
        switch (i5) {
            case 0:
                return context.getSharedPreferences("FraudDetectionDataStore", 0);
            case 1:
                int i11 = FirstRunActivityCompose.f45937s;
                k0.w(context, 2132019032, 0).show();
                return Unit.f71706a;
            case 2:
                context.startActivity(o0.x("https://novalauncher.com/privacy/"));
                return Unit.f71706a;
            case 3:
                context.startActivity(o0.x("https://instabridge.com/terms-of-service/"));
                return Unit.f71706a;
            case 4:
                File fileS = z2.S(context, "firebaseSessions/sessionConfigsDataStore.data");
                q.b(fileS);
                return fileS;
            case 5:
                File fileS2 = z2.S(context, "firebaseSessions/sessionDataStore.data");
                q.b(fileS2);
                return fileS2;
            case 6:
                return com.moloco.sdk.internal.publisher.nativead.parser.c.a(context);
            case 7:
                return a.C0290a.a(context);
            case 8:
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://crowdin.com/project/nova"));
                intent.addFlags(268435456);
                context.startActivity(intent);
                return Unit.f71706a;
            case 9:
                Context context2 = g0.f77088a;
                LauncherProvider launcherProvider = g0.f77091d;
                if (launcherProvider == null) {
                    Intrinsics.m("launcherProvider");
                    throw null;
                }
                g2 g2Var = a3.f51435a;
                g2Var.f51545a.unregisterOnSharedPreferenceChangeListener(g2Var);
                SharedPreferences.Editor editorEdit = g2Var.f51545a.edit();
                String[] strArr = {"0", "1"};
                for (String str : g2Var.f51545a.getAll().keySet()) {
                    if (!kotlin.collections.c.o0(str, strArr)) {
                        editorEdit.remove(str);
                    }
                }
                editorEdit.commit();
                f2 f2Var = launcherProvider.f20964a;
                if (f2Var != null) {
                    f2Var.close();
                }
                context.getDatabasePath("nova.db").delete();
                context.getDatabasePath("nova.db-journal").delete();
                context.getDatabasePath("launcher.db").delete();
                context.getDatabasePath("launcher.db-journal").delete();
                List list = v1.f80192a;
                context.getDatabasePath("app_icons.db").delete();
                context.getDatabasePath("app_icons.db-journal").delete();
                context.getDatabasePath("saved_wallpaper_images.db").delete();
                context.getDatabasePath("saved_wallpaper_images.db-journal").delete();
                context.getDatabasePath("widgetpreviews.db").delete();
                context.getDatabasePath("widgetpreviews.db-journal").delete();
                context.getFileStreamPath("device-id").delete();
                context.getFileStreamPath("wo").delete();
                context.getFileStreamPath("downgrade_schema.json").delete();
                File file = new File(context.getDataDir(), "shared_prefs/");
                new File(file, "com.teslacoilsw.launcher_preferences.xml").delete();
                new File(file, "com.android.launcher3.device.prefs.xml").delete();
                new File(file, "com.android.launcher3.prefs.xml").delete();
                new File(file, "preferences.SettingsActivity.xml").delete();
                SystemClock.sleep(200L);
                System.exit(0);
                throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
            case 10:
                context.startActivity(new Intent(context, (Class<?>) FirstRunActivityCompose.class));
                return Unit.f71706a;
            case 11:
                context.startActivity(new Intent(context, (Class<?>) WhatsNewActivity.class));
                return Unit.f71706a;
            case 12:
                context.startActivity(o0.x("https://novalauncher.com/beta"));
                return Unit.f71706a;
            case 13:
                NotificationListener.d(context);
                return Unit.f71706a;
            case 14:
                y2.f51877a.getClass();
                y2.Z0().i(Boolean.FALSE);
                Toast.makeText(context.getApplicationContext(), context.getString(2132019022), 0).show();
                return Unit.f71706a;
            case 15:
                g0.a(null);
                Toast.makeText(context.getApplicationContext(), "Cleared icon cache", 0).show();
                return Unit.f71706a;
            case 16:
                context.startActivity(new Intent(context, (Class<?>) DirectLicensingEnterCode.class));
                return Unit.f71706a;
            case 17:
                context.startActivity(ps.c.n("com.teslacoilsw.launcher.prime").addFlags(268435456));
                return Unit.f71706a;
            case 18:
                context.startActivity(o0.x("https://play.google.com/store/account/subscriptions?package=" + context.getPackageName()));
                return Unit.f71706a;
            case 19:
                context.startActivity(new Intent(context, (Class<?>) NovaAiSettingsActivity.class));
                return Unit.f71706a;
            case 20:
                HomeReset.e(context, true);
                return Unit.f71706a;
            case 21:
                Intent intentN = ps.c.n("com.teslacoilsw.launcher");
                if (a3.f51435a.f51552h && !i.d(context)) {
                    intentN = ps.c.n("com.teslacoilsw.launcher.prime");
                }
                context.startActivity(intentN);
                return Unit.f71706a;
            case 22:
                zy.c cVar = zy.c.f98823a;
                zy.c.i("rewards_settings_entry_tap", null);
                yx.b bVar = yx.b.f97678a;
                yx.b.g("rewards_settings_entry_tap", null);
                int i12 = RewardsActivity.f46163p;
                context.startActivity(new Intent(context, (Class<?>) RewardsActivity.class));
                return Unit.f71706a;
            case 23:
                HomeReset.e(context, true);
                return Unit.f71706a;
            case 24:
                Intent intent2 = new Intent("android.settings.APPLICATION_DEVELOPMENT_SETTINGS");
                intent2.addFlags(268468224);
                context.startActivity(intent2);
                return Unit.f71706a;
            case 25:
                Intrinsics.g(context, "context");
                PaymentConfiguration paymentConfiguration2 = PaymentConfiguration.f42439c;
                if (paymentConfiguration2 == null) {
                    SharedPreferences sharedPreferences = new o(context).f49358a;
                    String string = sharedPreferences.getString("key_publishable_key", null);
                    paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                    if (paymentConfiguration == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                    paymentConfiguration2 = paymentConfiguration;
                }
                return paymentConfiguration2.f42440a;
            case 26:
                return context.getSharedPreferences("PaymentSheet_LinkStore", 0);
            case 27:
                Intrinsics.g(context, "context");
                PaymentConfiguration paymentConfiguration3 = PaymentConfiguration.f42439c;
                if (paymentConfiguration3 == null) {
                    SharedPreferences sharedPreferences2 = new o(context).f49358a;
                    String string2 = sharedPreferences2.getString("key_publishable_key", null);
                    paymentConfiguration = string2 != null ? new PaymentConfiguration(string2, sharedPreferences2.getString("key_account_id", null)) : null;
                    if (paymentConfiguration == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                    paymentConfiguration3 = paymentConfiguration;
                }
                return paymentConfiguration3.f42440a;
            case 28:
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                if (novaLauncher != null && (q0Var = novaLauncher.f45658f1) != null) {
                    q0Var.d(context);
                }
                return Unit.f71706a;
            default:
                HomeReset.e(context, false);
                return Unit.f71706a;
        }
    }
}
