package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mi6 extends mh6 {
    public static final /* synthetic */ fj6[] g;
    public final k1b c;
    public final k1b d;
    public final vq6 e;
    public final vq6 f;

    static {
        u4a u4aVar = new u4a(mi6.class, "kotlinClass", "getKotlinClass()Lorg/jetbrains/kotlin/descriptors/runtime/components/ReflectKotlinClass;", 0);
        s1b s1bVar = n1b.a;
        g = new fj6[]{s1bVar.g(u4aVar), km4.t(mi6.class, "scope", "getScope()Lorg/jetbrains/kotlin/resolve/scopes/MemberScope;", 0, s1bVar), km4.t(mi6.class, "members", "getMembers()Ljava/util/Collection;", 0, s1bVar)};
    }

    public mi6(ni6 ni6Var) {
        super(ni6Var);
        int i = 1;
        this.c = no7.y(null, new ji6(ni6Var, i));
        this.d = no7.y(null, new ki6(this, 0));
        yw6 yw6Var = yw6.PUBLICATION;
        this.e = vx0.d0(yw6Var, new li6(this, ni6Var));
        this.f = vx0.d0(yw6Var, new ki6(this, i));
        no7.y(null, new li6(ni6Var, this));
    }
}
