package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hm5 implements uue {
    public static final xsa d = new xsa(17);
    public final xq6 a;
    public final uue b;
    public final w7 c;

    public hm5(xq6 xq6Var, uue uueVar, s26 s26Var) {
        this.a = xq6Var;
        this.b = uueVar;
        this.c = new w7(2, s26Var);
    }

    @Override // defpackage.uue
    public final que a(Class cls) {
        if (!this.a.containsKey(cls)) {
            return this.b.a(cls);
        }
        ik4.k("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
        return null;
    }

    @Override // defpackage.uue
    public final que b(Class cls, g68 g68Var) {
        return this.a.containsKey(cls) ? this.c.b(cls, g68Var) : this.b.b(cls, g68Var);
    }

    @Override // defpackage.uue
    public final /* synthetic */ que c(wg6 wg6Var, g68 g68Var) {
        return wgd.a(this, wg6Var, g68Var);
    }
}
