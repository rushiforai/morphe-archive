package m0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kw.p2;

/* loaded from: classes.dex */
public final class g extends androidx.compose.foundation.lazy.layout.b implements u {

    /* renamed from: a, reason: collision with root package name */
    public final c30.c f75423a = new c30.c(4, (byte) 0);

    /* renamed from: b, reason: collision with root package name */
    public z.b0 f75424b;

    public g(Function1 function1) {
        function1.invoke(this);
    }

    @Override // androidx.compose.foundation.lazy.layout.b
    public final c30.c c() {
        return this.f75423a;
    }

    public final void g(Function3 function3) {
        this.f75423a.a(1, new f(null, new p2(8), new x1.e(new f00.x(function3, 2), true, -857469575)));
    }

    public final void h(int i5, Function1 function1, Function1 function12, x1.e eVar) {
        this.f75423a.a(i5, new f(function1, function12, eVar));
    }
}
