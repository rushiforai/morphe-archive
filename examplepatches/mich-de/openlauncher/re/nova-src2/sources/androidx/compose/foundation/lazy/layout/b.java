package androidx.compose.foundation.lazy.layout;

import b2.t;
import g0.d1;
import kotlin.jvm.functions.Function1;
import kotlin.reflect.KProperty0;
import n0.f;
import n0.j;
import n0.n;
import n0.u0;

/* loaded from: classes.dex */
public abstract class b {
    public static final t e(n nVar, j jVar, d1 d1Var) {
        return new LazyLayoutBeyondBoundsModifierElement(nVar, jVar, d1Var);
    }

    public static final t f(t tVar, KProperty0 kProperty0, u0 u0Var, d1 d1Var, boolean z11) {
        return tVar.then(new LazyLayoutSemanticsModifier(kProperty0, u0Var, d1Var, z11));
    }

    public Object b(int i5) {
        f fVarI = c().i(i5);
        return fVarI.f77413c.getType().invoke(Integer.valueOf(i5 - fVarI.f77411a));
    }

    public abstract c30.c c();

    public Object d(int i5) {
        Object objInvoke;
        f fVarI = c().i(i5);
        int i11 = i5 - fVarI.f77411a;
        Function1 key = fVarI.f77413c.getKey();
        return (key == null || (objInvoke = key.invoke(Integer.valueOf(i11))) == null) ? new DefaultLazyKey(i5) : objInvoke;
    }
}
