package fr;

import android.os.Build;
import com.amplitude.android.TrackingOptions;
import com.tiktok.util.TTConst;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public abstract class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final String f55658a;

    static {
        String strName = Charsets.f72000b.name();
        Intrinsics.f(strName, "name(...)");
        f55658a = strName;
    }

    public static LinkedHashMap b() {
        Pair pair = new Pair("lang", "kotlin");
        Pair pair2 = new Pair("bindings_version", "22.7.0");
        Pair pair3 = new Pair(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, String.valueOf(Build.VERSION.SDK_INT));
        String str = Build.MANUFACTURER;
        String str2 = Build.BRAND;
        String str3 = Build.MODEL;
        return MapsKt.k0(pair, pair2, pair3, new Pair(TTConst.TRACK_TYPE, str + "_" + str2 + "_" + str3), new Pair("model", str3));
    }

    public final LinkedHashMap a() {
        return MapsKt.m0(c(), MapsKt.j0(new Pair("User-Agent", d()), new Pair("Accept-Charset", f55658a), new Pair("X-Stripe-User-Agent", e())));
    }

    public abstract Map c();

    public abstract String d();

    public abstract String e();
}
