package ads_mobile_sdk;

import android.util.Base64;
import b.ed;
import b.r6;
import b.s1;
import b.t2;
import b.t4;
import b.x0;
import b0.b0;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes.dex */
public final class jr0 extends c0.g2 {
    public static final long A;
    public static final int B;
    public static final com.google.gson.r C;
    public static final com.google.gson.r D;
    public static final com.google.gson.r E;
    public static final com.google.gson.r F;
    public static final com.google.gson.r G;
    public static final com.google.gson.r H;
    public static final com.google.gson.r I;

    /* renamed from: z, reason: collision with root package name */
    public static final long f5355z;

    /* renamed from: r, reason: collision with root package name */
    public final s1 f5356r;

    /* renamed from: s, reason: collision with root package name */
    public final b.k3 f5357s;

    /* renamed from: t, reason: collision with root package name */
    public final b.fa f5358t;

    /* renamed from: u, reason: collision with root package name */
    public final r6 f5359u;

    /* renamed from: v, reason: collision with root package name */
    public final t4 f5360v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f5361w;

    /* renamed from: x, reason: collision with root package name */
    public double f5362x;

    /* renamed from: y, reason: collision with root package name */
    public int f5363y;

    static {
        Duration.Companion companion = Duration.f72038b;
        DurationUnit durationUnit = DurationUnit.f72046e;
        f5355z = DurationKt.g(20, durationUnit);
        A = DurationKt.g(1, durationUnit);
        B = ph0.TIER_LOW.getNumber();
        com.google.gson.r rVar = new com.google.gson.r();
        cw0 cw0Var = cw0.AD_ID_INFO;
        rVar.q(500, String.valueOf(cw0Var.getNumber()));
        u93 u93Var = u93.f10252b;
        t2.F(rVar, cw0.AD_REQUEST, u93Var);
        u93 u93Var2 = u93.f10255e;
        t2.F(rVar, cw0.AD_SPAM, u93Var2);
        t2.F(rVar, cw0.AD_SIZE, u93Var);
        t2.F(rVar, cw0.AD_TYPE, u93Var);
        t2.F(rVar, cw0.APP_OPEN, u93Var);
        t2.F(rVar, cw0.APP_PERMISSIONS, u93Var);
        t2.F(rVar, cw0.APP_SET_ID, u93Var);
        u93 u93Var3 = u93.f10254d;
        cw0 cw0Var2 = cw0.AUDIO;
        t2.F(rVar, cw0Var2, u93Var3);
        cw0 cw0Var3 = cw0.BATTERY;
        t2.F(rVar, cw0Var3, u93Var);
        u93 u93Var4 = u93.f10253c;
        t2.F(rVar, cw0.CLD, u93Var4);
        t2.F(rVar, cw0.DEBUG_SIGNAL, u93Var);
        t2.F(rVar, cw0.EXPERIMENT_IDS, u93Var);
        t2.F(rVar, cw0.IN_MEMORY_SDK_CORE_DATA, u93Var);
        t2.F(rVar, cw0.MEMORY, u93Var);
        t2.F(rVar, cw0.OMID, u93Var);
        t2.F(rVar, cw0.PACKAGE_INFO, u93Var);
        t2.F(rVar, cw0.PER_APP_ID_V1, u93Var);
        t2.F(rVar, cw0.PER_APP_ID_V2, u93Var);
        t2.F(rVar, cw0.STATIC_DEVICE, u93Var);
        t2.F(rVar, cw0.TELEPHONY, u93Var);
        t2.F(rVar, cw0.CONSENT_STRINGS, u93Var);
        t2.F(rVar, cw0.AD_ID_PERMISSION, u93Var);
        t2.F(rVar, cw0.QUALITY, u93Var);
        t2.F(rVar, cw0.REQUEST_ID, u93Var);
        t2.F(rVar, cw0.SDK_ENV, u93Var);
        t2.F(rVar, cw0.ADAPTER_VERSIONS, u93Var);
        t2.F(rVar, cw0.RTB_SIGNAL, u93Var2);
        t2.F(rVar, cw0.SESSION_ID, u93Var);
        cw0 cw0Var4 = cw0.TRUSTLESS_TOKEN;
        t2.F(rVar, cw0Var4, u93Var);
        t2.F(rVar, cw0.FIREBASE_ANALYTICS, u93Var4);
        t2.F(rVar, cw0.INSPECTOR_SIGNAL, u93Var4);
        t2.F(rVar, cw0.AMAZON_FIRE_AD_ID, u93Var);
        t2.F(rVar, cw0.DISPLAY_COUNT, u93Var);
        t2.F(rVar, cw0.CSRB_ECO_DATA, u93Var);
        t2.F(rVar, cw0.PARENT_AD_CONFIG, u93Var);
        t2.F(rVar, cw0.NATIVE_AD, u93Var4);
        t2.F(rVar, cw0.ICON_AD, u93Var);
        cw0 cw0Var5 = cw0.UNDEFINED;
        t2.F(rVar, cw0Var5, u93Var4);
        t2.F(rVar, cw0.AD_RESPONSE_ENCRYPTION_KEY, u93Var3);
        t2.F(rVar, cw0.SCAR_SIGNAL_TYPE, u93Var);
        t2.F(rVar, cw0.DEVICE_TIER, u93Var);
        t2.F(rVar, cw0.PICTURE_IN_PICTURE_AD_REQUEST, u93Var);
        C = rVar;
        com.google.gson.r rVar2 = new com.google.gson.r();
        String strValueOf = String.valueOf(cw0Var.getNumber());
        Boolean bool = Boolean.TRUE;
        rVar2.r(strValueOf, bool);
        String strValueOf2 = String.valueOf(cw0Var2.getNumber());
        Boolean bool2 = Boolean.FALSE;
        rVar2.r(strValueOf2, bool2);
        rVar2.r(String.valueOf(cw0Var3.getNumber()), bool2);
        rVar2.r(String.valueOf(cw0Var4.getNumber()), bool2);
        rVar2.r(String.valueOf(cw0Var5.getNumber()), bool2);
        D = rVar2;
        com.google.gson.r rVar3 = new com.google.gson.r();
        rVar3.r(String.valueOf(cw0Var.getNumber()), bool);
        rVar3.r(String.valueOf(cw0Var2.getNumber()), bool2);
        rVar3.r(String.valueOf(cw0Var3.getNumber()), bool2);
        rVar3.r(String.valueOf(cw0Var4.getNumber()), bool2);
        rVar3.r(String.valueOf(cw0Var5.getNumber()), bool2);
        E = rVar3;
        com.google.gson.r rVar4 = new com.google.gson.r();
        rVar4.q(0, String.valueOf(cw0Var.getNumber()));
        rVar4.q(0, String.valueOf(cw0Var2.getNumber()));
        rVar4.q(0, String.valueOf(cw0Var3.getNumber()));
        long jG = DurationKt.g(30, durationUnit);
        rVar4.q(Long.valueOf(Duration.h(jG)), String.valueOf(cw0Var4.getNumber()));
        rVar4.q(0, String.valueOf(cw0Var5.getNumber()));
        F = rVar4;
        com.google.gson.r rVar5 = new com.google.gson.r();
        DurationUnit durationUnit2 = DurationUnit.f72047f;
        long jG2 = DurationKt.g(10, durationUnit2);
        rVar5.q(Long.valueOf(Duration.h(jG2)), String.valueOf(cw0Var.getNumber()));
        long jG3 = DurationKt.g(30, durationUnit);
        rVar5.q(Long.valueOf(Duration.h(jG3)), String.valueOf(cw0Var2.getNumber()));
        long jG4 = DurationKt.g(5, durationUnit2);
        rVar5.q(Long.valueOf(Duration.h(jG4)), String.valueOf(cw0Var3.getNumber()));
        long jG5 = DurationKt.g(300, durationUnit);
        rVar5.q(Long.valueOf(Duration.h(jG5)), String.valueOf(cw0Var4.getNumber()));
        rVar5.q(0, String.valueOf(cw0Var5.getNumber()));
        G = rVar5;
        com.google.gson.r rVar6 = new com.google.gson.r();
        rVar6.r(String.valueOf(cw0Var.getNumber()), bool);
        rVar6.r(String.valueOf(cw0Var2.getNumber()), bool2);
        rVar6.r(String.valueOf(cw0Var3.getNumber()), bool2);
        rVar6.r(String.valueOf(cw0Var4.getNumber()), bool);
        rVar6.r(String.valueOf(cw0Var5.getNumber()), bool2);
        H = rVar6;
        com.google.gson.r rVar7 = new com.google.gson.r();
        rVar7.r(String.valueOf(cw0Var.getNumber()), bool2);
        rVar7.r(String.valueOf(cw0Var2.getNumber()), bool2);
        rVar7.r(String.valueOf(cw0Var3.getNumber()), bool2);
        rVar7.r(String.valueOf(cw0Var4.getNumber()), bool2);
        rVar7.r(String.valueOf(cw0Var5.getNumber()), bool2);
        I = rVar7;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jr0(s1 consentFlags, b.k3 sdkCoreFlags, b.fa safeAreaFlags, r6 adShieldFlags, t4 persistentCacheFlags, x0 flagValueProvider) {
        super(flagValueProvider);
        Intrinsics.g(consentFlags, "consentFlags");
        Intrinsics.g(sdkCoreFlags, "sdkCoreFlags");
        Intrinsics.g(safeAreaFlags, "safeAreaFlags");
        Intrinsics.g(adShieldFlags, "adShieldFlags");
        Intrinsics.g(persistentCacheFlags, "persistentCacheFlags");
        Intrinsics.g(flagValueProvider, "flagValueProvider");
        this.f5356r = consentFlags;
        this.f5357s = sdkCoreFlags;
        this.f5358t = safeAreaFlags;
        this.f5359u = adShieldFlags;
        this.f5360v = persistentCacheFlags;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(jr0 jr0Var, CoroutineContext coroutineContext, t70.j0 j0Var, ContinuationImpl continuationImpl) throws Throwable {
        gr0 gr0Var;
        if (continuationImpl instanceof gr0) {
            gr0Var = (gr0) continuationImpl;
            int i5 = gr0Var.f4038d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gr0Var.f4038d = i5 - Integer.MIN_VALUE;
            } else {
                gr0Var = new gr0(jr0Var, continuationImpl);
            }
        }
        Object obj = gr0Var.f4036b;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = gr0Var.f4038d;
        if (i11 == 0) {
            ResultKt.b(obj);
            x0 x0Var = (x0) jr0Var.f18817a;
            gr0Var.f4035a = jr0Var;
            gr0Var.f4038d = 1;
            pn pnVar = (pn) x0Var;
            pnVar.getClass();
            Object objY = m0.y(coroutineContext, new b0(pnVar, j0Var, (Continuation) null, 1), gr0Var);
            if (objY != obj2) {
                objY = Unit.f71706a;
            }
            if (objY == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jr0Var = gr0Var.f4035a;
            ResultKt.b(obj);
        }
        x0 x0Var2 = (x0) jr0Var.f18817a;
        Boolean bool = (Boolean) ((pn) x0Var2).a("gads:csrb:enabled", jn.a$10);
        jr0Var.f5361w = bool != null ? bool.booleanValue() : true;
        pn pnVar2 = (pn) x0Var2;
        Double d5 = (Double) pnVar2.a("gads:csrb_abtest_enabled:ratio", jn.a$1);
        jr0Var.f5362x = d5 != null ? d5.doubleValue() : 0.0d;
        Integer num = (Integer) pnVar2.a("gads:csrb_break_glass_mode", jn.a$2);
        jr0Var.f5363y = num != null ? num.intValue() : 0;
        return Unit.f71706a;
    }

    public final long A0() {
        Duration.Companion companion = Duration.f72038b;
        return ((Duration) a("gad:signal_collection_timeout_ms", ed.k(60, DurationUnit.f72046e, "gad:signal_collection_timeout_ms"), u.a$1)).f72041a;
    }

    public final long D() {
        return ((Duration) a("gads:http_url_connection_factory:timeout_millis", new Duration(f5355z), u.a$1)).f72041a;
    }

    public final boolean E0() {
        return ((Boolean) a("gads:url_encode_scar_ad_response_payload", Boolean.FALSE, jn.a$10)).booleanValue();
    }

    public final boolean H0() {
        return ((Boolean) a("gads:viewability_activity_lifecycle:enabled", Boolean.TRUE, jn.a$10)).booleanValue();
    }

    public final boolean O() {
        return ((Boolean) a("gads:enable_stop_api:enabled", Boolean.TRUE, jn.a$10)).booleanValue();
    }

    public final String Q() {
        return (String) a("gads:firebase_analytics_class_name", "com.google.android.gms.measurement.api.AppMeasurementSdk", u.a$7);
    }

    public final String R() {
        return (String) a("gads_firebase_analytics_url_macro", "%5Bgw_fbsaeid%5D", u.a$7);
    }

    public final long Y() {
        Duration.Companion companion = Duration.f72038b;
        return ((Duration) a("gads:immersive_video_media_data_timeout_ms", ed.k(5, DurationUnit.f72046e, "gads:immersive_video_media_data_timeout_ms"), u.a$1)).f72041a;
    }

    public final boolean a0() {
        return ((Boolean) a("gads:inspector:enabled", Boolean.TRUE, jn.a$10)).booleanValue();
    }

    public final Map l0() {
        Pair pair = new Pair(String.valueOf(wv0.CUI_NAME_SIGNAL.getNumber()), Double.valueOf(0.003d));
        Pair pair2 = new Pair(String.valueOf(wv0.CUI_NAME_SIGNAL_UPDATE_SIGNALS.getNumber()), Double.valueOf(3.0E-4d));
        String strValueOf = String.valueOf(wv0.CUI_NAME_ADREQUEST.getNumber());
        Double dValueOf = Double.valueOf(0.1d);
        Pair pair3 = new Pair(strValueOf, dValueOf);
        Pair pair4 = new Pair(String.valueOf(wv0.CUI_NAME_SDKINIT_SDKCORE.getNumber()), dValueOf);
        Pair pair5 = new Pair(String.valueOf(wv0.CUI_NAME_WEBVIEW_INITIALIZATION.getNumber()), dValueOf);
        Pair pair6 = new Pair(String.valueOf(wv0.CUI_NAME_WEBVIEW_LOAD.getNumber()), dValueOf);
        String strValueOf2 = String.valueOf(wv0.CUI_NAME_INSTALL_REFERRER_DETAILS.getNumber());
        Double dValueOf2 = Double.valueOf(1.0d);
        return (Map) a("gads:per_trace_sample_rate", MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, new Pair(strValueOf2, dValueOf2), new Pair(String.valueOf(wv0.CUI_NAME_INSTALL_REFERRER_TASK.getNumber()), dValueOf2), new Pair(String.valueOf(wv0.CUI_NAME_POST_CLICK_LIFECYCLE_MONITORING.getNumber()), dValueOf2), new Pair(String.valueOf(wv0.CUI_NAME_HSDP_SERVICE.getNumber()), dValueOf2), new Pair(String.valueOf(wv0.CUI_NAME_AD_INSPECTOR_DISABLED.getNumber()), dValueOf2), new Pair(String.valueOf(wv0.CUI_NAME_AD_INSPECTOR_GLOBAL_ALLOWLIST_OVERRIDE.getNumber()), dValueOf2)), jn.a$13);
    }

    public final long p() {
        Duration.Companion companion = Duration.f72038b;
        return ((Duration) a("gads:adapter_initialization:timeout", ed.k(30, DurationUnit.f72046e, "gads:adapter_initialization:timeout"), u.a$3)).f72041a;
    }

    public final String s() {
        String strEncodeToString = Base64.encodeToString(new byte[]{0, 19, -48, -88, -79}, 0);
        Intrinsics.f(strEncodeToString, "encodeToString(...)");
        return (String) a("gads:blob_encryption_public_key_first_hashed_bytes", strEncodeToString, u.a$7);
    }
}
