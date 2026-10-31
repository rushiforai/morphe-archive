package o0;

import com.google.android.gms.internal.measurement.v6;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class f extends androidx.compose.foundation.lazy.layout.b {

    /* renamed from: a, reason: collision with root package name */
    public final c30.c f78728a;

    /* renamed from: b, reason: collision with root package name */
    public final v6 f78729b;

    public f(Function1 function1) {
        c30.c cVar = new c30.c(4, (byte) 0);
        this.f78728a = cVar;
        this.f78729b = new v6(cVar, 15);
        function1.invoke(this);
    }

    public static void g(f fVar, x1.e eVar, int i5) {
        b0 b0Var = (i5 & 4) != 0 ? null : b0.f78718a;
        fVar.getClass();
        fVar.f78728a.a(1, new d(null, new lm.h(29), b0Var != null ? new b00.t(b0Var, 26) : null, new x1.e(new e(eVar), true, 1062451479)));
    }

    @Override // androidx.compose.foundation.lazy.layout.b
    public final c30.c c() {
        return this.f78728a;
    }
}
