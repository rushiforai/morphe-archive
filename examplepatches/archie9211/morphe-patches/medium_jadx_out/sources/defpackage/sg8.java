package defpackage;

import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sg8 implements l66 {
    public static final sg8 a;
    public static final nig b;

    static {
        sg8 sg8Var = new sg8();
        a = sg8Var;
        System.currentTimeMillis();
        b = new nig(sg8Var);
    }

    @Override // defpackage.l66
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.l66
    public final void b(String str) {
        str.getClass();
    }

    @Override // defpackage.l66
    public final String c() {
        return "";
    }

    @Override // defpackage.l66
    public final void d(ea4 ea4Var) {
        f49.K(b, d66.ERROR, e66.USER, new ga7((ha7) ea4Var, 1), null, true, 40);
    }

    @Override // defpackage.l66
    public final f66 e() {
        return b;
    }

    @Override // defpackage.l66
    public final vu2 f(Set set) {
        set.getClass();
        return null;
    }

    @Override // defpackage.l66
    public final rv8 g() {
        return new p23();
    }

    @Override // defpackage.l66
    public final ysb getFeature(String str) {
        str.getClass();
        f49.K(b, d66.ERROR, e66.USER, new hm0(str, 19), null, true, 40);
        return null;
    }

    @Override // defpackage.l66
    public final String getName() {
        return "no-op";
    }

    @Override // defpackage.l66
    public final void h(String str, ha7 ha7Var) {
        str.getClass();
    }
}
