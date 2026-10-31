package d00;

import android.content.Context;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.crashlytics.FirebaseCrashlytics;
import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.MobileSdk;
import com.instabridge.mobilesdk.MobileSdkConfig;
import com.instabridge.mobilesdk.MobileSdkTheme;
import com.teslacoilsw.launcher.NovaApplication;
import mx.g0;

/* loaded from: classes4.dex */
public abstract class n {
    public static void a(NovaApplication novaApplication) {
        MobileSdk.INSTANCE.initialize(novaApplication, new MobileSdkConfig(Brand.NOVA, MobileSdkTheme.INSTANCE.nova(2131231664), null, null, null, "747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com", null, null, new cv.n(22), "AIzaSyBdDzbs3DuxucMmToxLxRe49qSf9oA3W-s", null, null, null, a.f48675a, a.f48678d, null, m.f48704a, a.f48677c, false, 40156, null));
    }

    public static void b(long j11) {
        String strValueOf = String.valueOf(j11);
        zy.c cVar = zy.c.f98823a;
        FirebaseCrashlytics firebaseCrashlytics = zy.c.f98826d;
        if (firebaseCrashlytics != null) {
            firebaseCrashlytics.setUserId(strValueOf == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strValueOf);
        }
        FirebaseAnalytics firebaseAnalytics = zy.c.f98824b;
        if (firebaseAnalytics != null) {
            firebaseAnalytics.f34688a.D(strValueOf);
        }
        try {
            Context context = g0.f77088a;
            if (g0.m()) {
                String str = null;
                String string = g0.e().getSharedPreferences("nova_ai_sdk_login", 0).getString("linked_google_account_id", null);
                if (string != null) {
                    if (!r70.k.U0(string)) {
                        str = string;
                    }
                }
                if (str != null) {
                    yx.b bVar = yx.b.f97678a;
                    yx.b.d(strValueOf, "ib_user_id");
                    return;
                }
            }
        } catch (Throwable unused) {
        }
        yx.b bVar2 = yx.b.f97678a;
        yx.b.c(strValueOf);
    }
}
