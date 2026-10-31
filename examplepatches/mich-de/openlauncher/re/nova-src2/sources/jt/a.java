package jt;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.networking.PaymentAnalyticsRequestFactory$ThreeDS2UiType;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends fr.c {

    /* renamed from: j, reason: collision with root package name */
    public final Set f69752j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(PackageManager packageManager, PackageInfo packageInfo, String str, w60.a aVar, w60.a aVar2, Set defaultProductUsageTokens) {
        super(packageManager, packageInfo, str, aVar, aVar2);
        Intrinsics.g(defaultProductUsageTokens, "defaultProductUsageTokens");
        this.f69752j = defaultProductUsageTokens;
    }

    public static fr.b c(a aVar, PaymentAnalyticsEvent event, Set productUsageTokens, String str, PaymentAnalyticsRequestFactory$ThreeDS2UiType paymentAnalyticsRequestFactory$ThreeDS2UiType, String str2, int i5) {
        if ((i5 & 2) != 0) {
            productUsageTokens = EmptySet.f71734a;
        }
        if ((i5 & 4) != 0) {
            str = null;
        }
        if ((i5 & 16) != 0) {
            paymentAnalyticsRequestFactory$ThreeDS2UiType = null;
        }
        if ((i5 & 32) != 0) {
            str2 = null;
        }
        aVar.getClass();
        Intrinsics.g(event, "event");
        Intrinsics.g(productUsageTokens, "productUsageTokens");
        LinkedHashSet linkedHashSetB0 = b70.n.b0(aVar.f69752j, productUsageTokens);
        LinkedHashSet linkedHashSet = !linkedHashSetB0.isEmpty() ? linkedHashSetB0 : null;
        Map mapN = linkedHashSet != null ? a80.m.n("product_usage", b70.g.f1(linkedHashSet, ",", null, null, 0, null, 62)) : null;
        Map map = b70.h.f17594a;
        if (mapN == null) {
            mapN = map;
        }
        Map mapN2 = str != null ? a80.m.n("source_type", str) : null;
        if (mapN2 == null) {
            mapN2 = map;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapN, mapN2);
        String str3 = str == null ? "unknown" : null;
        Map mapN3 = str3 != null ? a80.m.n("token_type", str3) : null;
        if (mapN3 == null) {
            mapN3 = map;
        }
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN3);
        Map mapN4 = paymentAnalyticsRequestFactory$ThreeDS2UiType != null ? a80.m.n("3ds2_ui_type", paymentAnalyticsRequestFactory$ThreeDS2UiType.getF44103b()) : null;
        if (mapN4 == null) {
            mapN4 = map;
        }
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN4);
        Map mapN5 = str2 != null ? a80.m.n("error_message", str2) : null;
        if (mapN5 != null) {
            map = mapN5;
        }
        return aVar.a(event, MapsKt.m0(linkedHashMapM03, map));
    }

    @Override // fr.c
    public final fr.b a(fr.a event, Map additionalParams) {
        Object objA;
        Map mapJ0;
        b70.h hVar = b70.h.f17594a;
        Intrinsics.g(event, "event");
        Intrinsics.g(additionalParams, "additionalParams");
        Set set = this.f69752j;
        if (set.isEmpty()) {
            set = null;
        }
        Map mapN = set != null ? a80.m.n("product_usage", b70.g.f1(set, ",", null, null, 0, null, 62)) : null;
        if (mapN == null) {
            mapN = hVar;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapN, additionalParams);
        Pair pair = new Pair("analytics_ua", "analytics.stripe_android-1.0");
        try {
            int i5 = Result.f71687b;
            String str = (String) this.f55592d.get();
            Intrinsics.d(str);
            boolean zI0 = r70.j.I0(str, "uk_", false);
            objA = str;
            if (zI0) {
                objA = "[REDACTED_LIVE_KEY]";
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        boolean z11 = objA instanceof Result.Failure;
        Object obj = objA;
        if (z11) {
            obj = "pk_undefined";
        }
        Map mapJ02 = MapsKt.j0(pair, new Pair("publishable_key", obj), new Pair(TrackingOptions.AMP_TRACKING_OPTION_OS_NAME, Build.VERSION.CODENAME), new Pair("os_release", Build.VERSION.RELEASE), new Pair(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, Integer.valueOf(Build.VERSION.SDK_INT)), new Pair("device_type", fr.c.f55587h), new Pair("bindings_version", "22.7.0"), new Pair("is_development", Boolean.FALSE), new Pair(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, fr.c.f55586g), new Pair("timestamp", Double.valueOf(System.currentTimeMillis() / 1000.0d)), new Pair("locale", Locale.getDefault().toString()));
        String str2 = (String) this.f55593e.get();
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(mapJ02, str2 == null ? hVar : a80.m.n("network_type", str2));
        String str3 = (String) this.f55594f.get();
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, str3 != null ? a80.m.n("plugin_type", str3) : hVar);
        PackageInfo packageInfo = this.f55590b;
        PackageManager packageManager = this.f55589a;
        if (packageManager == null || packageInfo == null) {
            mapJ0 = hVar;
        } else {
            ApplicationInfo applicationInfo = packageInfo.applicationInfo;
            CharSequence charSequenceLoadLabel = applicationInfo != null ? applicationInfo.loadLabel(packageManager) : null;
            if (charSequenceLoadLabel == null || r70.k.U0(charSequenceLoadLabel)) {
                charSequenceLoadLabel = null;
            }
            if (charSequenceLoadLabel == null) {
                charSequenceLoadLabel = this.f55591c;
            }
            mapJ0 = MapsKt.j0(new Pair("app_name", charSequenceLoadLabel), new Pair("app_version", Integer.valueOf(packageInfo.versionCode)));
        }
        return new fr.b(MapsKt.m0(MapsKt.m0(MapsKt.m0(linkedHashMapM03, mapJ0), b70.k.e0(new Pair(DatabaseConstants.EVENT_FIELD, event.c()))), linkedHashMapM0), fr.i0.f55639b.a());
    }

    public final fr.b b(PaymentAnalyticsEvent paymentAnalyticsEvent, String str) {
        Object next;
        PaymentAnalyticsRequestFactory$ThreeDS2UiType.f44098c.getClass();
        Iterator it = PaymentAnalyticsRequestFactory$ThreeDS2UiType.f44101f.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((PaymentAnalyticsRequestFactory$ThreeDS2UiType) next).f44102a, str)) {
                break;
            }
        }
        PaymentAnalyticsRequestFactory$ThreeDS2UiType paymentAnalyticsRequestFactory$ThreeDS2UiType = (PaymentAnalyticsRequestFactory$ThreeDS2UiType) next;
        if (paymentAnalyticsRequestFactory$ThreeDS2UiType == null) {
            paymentAnalyticsRequestFactory$ThreeDS2UiType = PaymentAnalyticsRequestFactory$ThreeDS2UiType.f44099d;
        }
        return c(this, paymentAnalyticsEvent, null, null, paymentAnalyticsRequestFactory$ThreeDS2UiType, null, 46);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(Context context, String publishableKey, Set defaultProductUsageTokens) {
        this(context, new dq.r(publishableKey, 0), defaultProductUsageTokens);
        Intrinsics.g(context, "context");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(defaultProductUsageTokens, "defaultProductUsageTokens");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public a(Context context, w60.a aVar) {
        Object objA;
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        try {
            int i5 = Result.f71687b;
            objA = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 0);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        PackageInfo packageInfo = (PackageInfo) (objA instanceof Result.Failure ? null : objA);
        String packageName = context.getApplicationContext().getPackageName();
        this(packageManager, packageInfo, packageName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : packageName, aVar, new f10.o(new fr.p0(context), 29), EmptySet.f71734a);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public a(Context context, Function0 publishableKeyProvider, Set defaultProductUsageTokens) {
        Object objA;
        Intrinsics.g(context, "context");
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(defaultProductUsageTokens, "defaultProductUsageTokens");
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        try {
            int i5 = Result.f71687b;
            objA = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 0);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        PackageInfo packageInfo = (PackageInfo) (objA instanceof Result.Failure ? null : objA);
        String packageName = context.getApplicationContext().getPackageName();
        this(packageManager, packageInfo, packageName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : packageName, new dq.y(publishableKeyProvider, 3), new f10.o(new fr.p0(context), 29), defaultProductUsageTokens);
    }
}
