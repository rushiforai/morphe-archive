package p0;

import j00.k0;
import kotlin.jvm.functions.Function0;
import p1.e1;
import p1.s2;

/* loaded from: classes2.dex */
public final class b extends y {
    public static final ab.c0 J = y1.j.b(new k0(25, 0), new nq.a(16));
    public final e1 I;

    public b(int i5, float f11, Function0 function0) {
        super(i5, f11);
        this.I = androidx.compose.runtime.d.k(function0);
    }

    @Override // p0.y
    public final int m() {
        return ((Number) ((Function0) ((s2) this.I).getValue()).invoke()).intValue();
    }
}
