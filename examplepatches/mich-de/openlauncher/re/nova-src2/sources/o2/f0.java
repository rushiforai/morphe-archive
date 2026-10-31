package o2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f79250a;

    public abstract void a(k2.f fVar);

    public Function1 b() {
        return this.f79250a;
    }

    public final void c() {
        Function1 function1B = b();
        if (function1B != null) {
            function1B.invoke(this);
        }
    }

    public void d(b0.x xVar) {
        this.f79250a = xVar;
    }
}
