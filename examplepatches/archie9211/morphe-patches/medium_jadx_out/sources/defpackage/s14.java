package defpackage;

import java.util.Arrays;
import java.util.Collection;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class s14 implements ev7 {
    public final String b;

    public s14(t14 t14Var, String... strArr) {
        t14Var.getClass();
        String debugMessage = t14Var.getDebugMessage();
        Object[] objArrCopyOf = Arrays.copyOf(strArr, strArr.length);
        this.b = String.format(debugMessage, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
    }

    @Override // defpackage.ev7
    public Set b() {
        return ny3.a;
    }

    @Override // defpackage.ev7
    public Set c() {
        return ny3.a;
    }

    @Override // defpackage.ev7
    public co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return new w04(n98.g(String.format(g14.ERROR_CLASS.getDebugText(), Arrays.copyOf(new Object[]{n98Var}, 1))));
    }

    @Override // defpackage.ev7
    public Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ev7
    public Set g() {
        return ny3.a;
    }

    @Override // defpackage.ev7
    /* JADX INFO: renamed from: h, reason: merged with bridge method [inline-methods] */
    public Set a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        w04 w04Var = l24.c;
        w04Var.getClass();
        h14 h14Var = new h14(w04Var, null, cd7.e, n98.g(g14.ERROR_FUNCTION.getDebugText()), e41.DECLARATION, jkc.g0);
        i24 i24VarC = l24.c(k24.RETURN_TYPE_FOR_FUNCTION, new String[0]);
        c28 c28Var = c28.OPEN;
        g93 g93Var = h93.e;
        ey3 ey3Var = ey3.a;
        h14Var.D0(null, null, ey3Var, ey3Var, ey3Var, i24VarC, c28Var, g93Var);
        return qo7.B(h14Var);
    }

    @Override // defpackage.ev7
    /* JADX INFO: renamed from: i, reason: merged with bridge method [inline-methods] */
    public Set f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        l24 l24Var = l24.a;
        return l24.f;
    }

    public String toString() {
        return ev6.z(new StringBuilder("ErrorScope{"), this.b, '}');
    }
}
