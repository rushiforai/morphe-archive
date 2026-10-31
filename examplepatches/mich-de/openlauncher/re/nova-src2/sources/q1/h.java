package q1;

import kotlin.KotlinNothingValueException;
import p1.d1;
import p1.k2;

/* loaded from: classes2.dex */
public final class h extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final h f83390c = new h(0, 4, 1);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        d1 d1Var = (d1) l0Var.i(2);
        p1.w wVar = (p1.w) l0Var.i(1);
        wVar.l(d1Var);
        p1.u.d("Could not resolve state for movable content");
        throw new KotlinNothingValueException();
    }
}
