package m0;

import kotlin.jvm.functions.Function1;
import kw.p2;
import n0.m0;
import p1.s2;

/* loaded from: classes.dex */
public interface s {
    static m0 a(y yVar, int i5) {
        b0 b0Var = yVar.f75513a;
        z1.f fVarL = o2.f.l();
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            q qVar = (q) ((s2) b0Var.f75398f).getValue();
            o2.f.w(fVarL, fVarQ, function1E);
            return b0Var.f75406p.a(i5, qVar.f75475j, b0Var.f75396d, new p2(i5, qVar));
        } catch (Throwable th2) {
            o2.f.w(fVarL, fVarQ, function1E);
            throw th2;
        }
    }
}
