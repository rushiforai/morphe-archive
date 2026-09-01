package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class m86 implements id9 {
    public static final /* synthetic */ fj6[] e = {n1b.a.g(new u4a(m86.class, "type", "getType()Lorg/jetbrains/kotlin/types/SimpleType;", 0))};
    public final y05 a;
    public final jkc b;
    public final u67 c;
    public final g0b d;

    public m86(n0c n0cVar, f0b f0bVar, y05 y05Var) {
        n0cVar.getClass();
        k96 k96Var = (k96) n0cVar.b;
        y05Var.getClass();
        this.a = y05Var;
        this.b = f0bVar != null ? rz5.I(f0bVar) : jkc.g0;
        this.c = new u67(k96Var.a, new a3(n0cVar, this, false, 10));
        this.d = f0bVar != null ? (g0b) bu1.y0(f0bVar.b()) : null;
    }

    @Override // defpackage.yx
    public final jkc d() {
        return this.b;
    }

    @Override // defpackage.yx
    public final y05 e() {
        return this.a;
    }

    @Override // defpackage.yx
    public Map f() {
        return fy3.a;
    }

    @Override // defpackage.yx
    public final mn6 getType() {
        return (hec) mk7.z(this.c, e[0]);
    }
}
