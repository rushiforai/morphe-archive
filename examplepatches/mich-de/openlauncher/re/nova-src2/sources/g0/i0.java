package g0;

import androidx.compose.foundation.gestures.DraggableElement;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final h0 f56576a = new h0(3, null, 0);

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f56577b = new h0(3, null, 1);

    public static b2.t a(b2.t tVar, l0 l0Var, d1 d1Var, boolean z11, i0.i iVar, boolean z12, Function3 function3, boolean z13, int i5) {
        if ((i5 & 4) != 0) {
            z11 = true;
        }
        boolean z14 = z11;
        if ((i5 & 8) != 0) {
            iVar = null;
        }
        return tVar.then(new DraggableElement(l0Var, d1Var, z14, iVar, (i5 & 16) != 0 ? false : z12, f56576a, function3, (i5 & 128) != 0 ? false : z13));
    }

    public static final l0 b(Function1 function1, p1.o oVar) {
        p1.e1 e1VarM = androidx.compose.runtime.d.m(function1, oVar);
        p1.t tVar = (p1.t) oVar;
        Object objP = tVar.P();
        if (objP == p1.n.f81514a) {
            h hVar = new h(new a1.g(e1VarM, 20));
            tVar.m0(hVar);
            objP = hVar;
        }
        return (l0) objP;
    }
}
