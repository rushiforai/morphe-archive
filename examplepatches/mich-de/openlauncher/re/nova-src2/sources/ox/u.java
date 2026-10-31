package ox;

import ads_mobile_sdk.gq;
import ads_mobile_sdk.hq;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import com.google.ads.mediation.pangle.PangleMediationAdapter;
import com.google.android.gms.internal.consent_sdk.c3;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.crashlytics.FirebaseCrashlytics;
import com.instabridge.mobilesdk.MobileSdk;
import com.moloco.sdk.publisher.privacy.MolocoPrivacy;
import e10.y2;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function0;
import ni.b0;
import ni.c0;
import ni.d0;
import ni.e0;
import ni.f0;
import p1.e1;
import p1.s2;
import t70.m0;

/* loaded from: classes.dex */
public abstract class u {

    /* renamed from: c, reason: collision with root package name */
    public static c3 f81114c;

    /* renamed from: e, reason: collision with root package name */
    public static volatile boolean f81116e;

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicBoolean f81112a = new AtomicBoolean(false);

    /* renamed from: b, reason: collision with root package name */
    public static final t70.s f81113b = m0.b();

    /* renamed from: d, reason: collision with root package name */
    public static final e1 f81115d = androidx.compose.runtime.d.k(Boolean.FALSE);

    /* renamed from: f, reason: collision with root package name */
    public static final String f81117f = r70.l.G1(8, UUID.randomUUID().toString());

    public static void a(Context context) {
        zy.c cVar = zy.c.f98823a;
        y2.f51877a.getClass();
        Boolean bool = (Boolean) y2.j().l();
        boolean zBooleanValue = bool.booleanValue();
        FirebaseAnalytics firebaseAnalytics = zy.c.f98824b;
        if (firebaseAnalytics != null) {
            firebaseAnalytics.f34688a.F(bool);
        }
        FirebaseCrashlytics firebaseCrashlytics = zy.c.f98826d;
        if (firebaseCrashlytics != null) {
            firebaseCrashlytics.setCrashlyticsCollectionEnabled(zBooleanValue);
        }
        AtomicBoolean atomicBoolean = zy.c.f98829g;
        atomicBoolean.set(true);
        if (zBooleanValue && atomicBoolean.get()) {
            while (true) {
                zy.d dVar = (zy.d) zy.c.f98828f.poll();
                if (dVar == null) {
                    break;
                } else {
                    zy.c.k(dVar.f98832a, dVar.f98833b);
                }
            }
        }
        g gVarD = d(context);
        boolean z11 = gVarD.f81074c;
        boolean z12 = gVarD.f81072a;
        boolean zB = yx.d.b(context, gVarD);
        yx.a aVar = zB ? yx.a.f97675a : yx.a.f97676b;
        yx.b bVar = yx.b.f97678a;
        y2.f51877a.getClass();
        bVar.b(context, ((Boolean) y2.j().l()).booleanValue(), aVar);
        yx.h hVar = yx.h.f97704a;
        yx.h.j(z12 && z11 && ((Boolean) y2.j().l()).booleanValue());
        px.c cVar2 = px.c.f83110a;
        mh.c cVarA = px.c.a();
        if (cVarA != null) {
            cVarA.L();
        }
        b(gVarD);
        MobileSdk mobileSdk = MobileSdk.INSTANCE;
        if (mobileSdk.isEligibleForMobile(context)) {
            mobileSdk.setAnalyticsConsent(zB);
        }
        if (z12) {
            zy.c cVar3 = zy.c.f98823a;
            zy.c.l(((Boolean) y2.j().l()).booleanValue(), z11, gVarD.f81075d, gVarD.f81076e);
        }
    }

    public static void b(g gVar) {
        if (f81116e) {
            PangleMediationAdapter.setPAConsent(gVar.f81075d ? 1 : 0);
            Boolean boolValueOf = Boolean.valueOf(gVar.f81075d);
            Boolean bool = Boolean.FALSE;
            MolocoPrivacy.setPrivacy(new MolocoPrivacy.PrivacySettings(boolValueOf, bool, bool));
        }
    }

    public static void c(Context context) {
        Object objA;
        Object objA2;
        String str = f81117f;
        try {
            int i5 = Result.f71687b;
            hq hqVar = gq.f4020a;
            objA = "1.4.0";
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = "?";
        }
        Log.i("NovaAds", "initAdSdks START session=" + str + " path=legacy appId=ca-app-pub-4858839354660716~2363379427 gmaVersion=" + objA);
        String str2 = f81117f;
        try {
            Bundle bundle = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128).metaData;
            objA2 = Integer.valueOf(Log.i("NovaAds", "Manifest meta session=" + str2 + " admob=" + (bundle != null ? bundle.getString("com.google.android.gms.ads.APPLICATION_ID") : null) + " facebook=" + (bundle != null ? bundle.getString("com.facebook.sdk.ApplicationId") : null)));
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        Throwable thA = Result.a(objA2);
        if (thA != null) {
            Log.w("NovaAds", "Manifest meta read failed session=" + str2 + ": " + thA.getMessage());
        }
        f81116e = true;
        b(d(context));
        Bundle bundle2 = new Bundle();
        d0 d0Var = d0.f78259a;
        e0 e0Var = e0.f78267a;
        li.a.a(context, new x7.u("ca-app-pub-4858839354660716~2363379427", new f0(b0.f78250b, ul.b.h("B3EEABB8EE11C2BE770B684D95219ECB"), c0.f78254b), bundle2), new t());
    }

    public static g d(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        if (!defaultSharedPreferences.contains("IABTCF_gdprApplies") && !defaultSharedPreferences.contains("IABTCF_TCString")) {
            return new g(false, false, false, false, false);
        }
        if (defaultSharedPreferences.getInt("IABTCF_gdprApplies", 0) != 1) {
            return new g(true, false, true, true, true);
        }
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String string = defaultSharedPreferences.getString("IABTCF_PurposeConsents", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        if (string != null) {
            str = string;
        }
        Character chE1 = r70.l.E1(0, str);
        boolean z11 = chE1 != null && chE1.charValue() == '1';
        Character chE12 = r70.l.E1(2, str);
        boolean z12 = chE12 != null && chE12.charValue() == '1';
        Character chE13 = r70.l.E1(3, str);
        return new g(true, true, z11, z11 && z12, z11 && z12 && (chE13 != null && chE13.charValue() == '1'));
    }

    public static void e() {
        c3 c3Var = f81114c;
        ((s2) f81115d).setValue(Boolean.valueOf((c3Var != null ? c3Var.b() : 0) == 3));
    }

    public static void f(Activity activity, Function0 function0) {
        c3 c3Var = f81114c;
        if (c3Var == null) {
            function0.invoke();
        } else {
            c3Var.c(activity, new o2.f(13), new s(activity, function0), new s(activity, function0));
        }
    }
}
