package fr;

import android.content.Context;
import android.net.ConnectivityManager;
import android.os.Build;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.core.AppInfo;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class p0 {

    /* renamed from: b, reason: collision with root package name */
    public static final f1.o0 f55680b = new f1.o0(17);

    /* renamed from: a, reason: collision with root package name */
    public final Object f55681a;

    public p0() {
        this.f55681a = f55680b;
    }

    public Map a(AppInfo appInfo) {
        Map mapJ0 = MapsKt.j0(new Pair("os.name", "android"), new Pair("os.version", String.valueOf(Build.VERSION.SDK_INT)), new Pair("bindings.version", "22.7.0"), new Pair("lang", "Java"), new Pair("publisher", "Stripe"), new Pair("http.agent", ((Function1) this.f55681a).invoke("http.agent")));
        Map mapO = appInfo != null ? k2.o("application", appInfo.b()) : null;
        if (mapO == null) {
            mapO = b70.h.f17594a;
        }
        return a80.m.n("X-Stripe-Client-User-Agent", new JSONObject(MapsKt.m0(mapJ0, mapO)).toString());
    }

    public p0(Context context) {
        Intrinsics.g(context, "context");
        Object systemService = context.getApplicationContext().getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        this.f55681a = (ConnectivityManager) systemService;
    }
}
