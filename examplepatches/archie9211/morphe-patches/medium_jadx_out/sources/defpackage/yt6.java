package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yt6 implements bl7 {
    public final ut6 a;
    public final lvc b;
    public final wt6 c;
    public final k68 d;

    public yt6(ut6 ut6Var, lvc lvcVar) {
        this.a = ut6Var;
        this.b = lvcVar;
        this.c = (wt6) ut6Var.b.invoke();
        j46.a();
        this.d = new k68();
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.b.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.b.N(i);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return this.b.Q(f);
    }

    @Override // defpackage.m73
    public final float U() {
        return this.b.U();
    }

    @Override // defpackage.y66
    public final boolean W() {
        return this.b.W();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.b.Z(f);
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final List a(int i) {
        k68 k68Var = this.d;
        List list = (List) k68Var.b(i);
        if (list != null) {
            return list;
        }
        wt6 wt6Var = this.c;
        Object objC = wt6Var.c(i);
        List listX = this.b.x(this.a.a(objC, i, wt6Var.d(i)), objC);
        k68Var.i(i, listX);
        return listX;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.b.b();
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        return this.b.c0(j);
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.b.getLayoutDirection();
    }

    @Override // defpackage.bl7
    public final al7 h0(int i, int i2, Map map, x45 x45Var, x45 x45Var2) {
        return this.b.h0(i, i2, fy3.a, x45Var, x45Var2);
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        return this.b.i0(f);
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        return this.b.m0(j);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        return this.b.p0(j);
    }

    @Override // defpackage.bl7
    public final al7 q0(int i, int i2, Map map, x45 x45Var) {
        return this.b.q0(i, i2, map, x45Var);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        return this.b.r(j);
    }

    @Override // defpackage.m73
    public final float z(long j) {
        return this.b.z(j);
    }
}
