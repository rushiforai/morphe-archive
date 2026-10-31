package g30;

import android.os.Build;
import android.os.IBinder;
import java.lang.reflect.Method;
import kotlin.LazyKt;
import t70.g2;
import t70.m0;
import w20.m;

/* loaded from: classes.dex */
public final class l extends j {

    /* renamed from: j, reason: collision with root package name */
    public static final Class f57049j;

    /* renamed from: k, reason: collision with root package name */
    public static final Method f57050k;

    /* renamed from: l, reason: collision with root package name */
    public static final a70.d f57051l;

    /* renamed from: h, reason: collision with root package name */
    public float f57052h;

    /* renamed from: i, reason: collision with root package name */
    public g2 f57053i;

    static {
        Class clsF = (m.f93692b || Build.VERSION.SDK_INT < 30) ? null : v30.e.f("android.view.WindowManagerGlobal");
        f57049j = clsF;
        f57050k = clsF != null ? v30.e.g(clsF, "getWindowSession", new Class[0]) : null;
        f57051l = LazyKt.a(new com.moloco.sdk.service_locator.b(29));
    }

    @Override // g30.f
    public final float d() {
        return this.f57052h;
    }

    @Override // g30.f
    public final void f(IBinder iBinder, y70.d dVar, float f11) {
        this.f57052h = f11;
        g2 g2Var = this.f57053i;
        if (g2Var != null) {
            g2Var.c(null);
        }
        this.f57053i = m0.t(dVar, null, null, new k(iBinder, f11, null), 3);
    }
}
