package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k04 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l04 b;

    public /* synthetic */ k04(l04 l04Var, int i) {
        this.a = i;
        this.b = l04Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        l04 l04Var = this.b;
        switch (i) {
            case 0:
                n98 n98Var = (n98) obj;
                if (n98Var != null) {
                    return l04Var.j(n98Var, l04Var.i().a(n98Var, ng8.FOR_NON_TRACKED_SCOPE));
                }
                l04.h(8);
                throw null;
            default:
                n98 n98Var2 = (n98) obj;
                if (n98Var2 != null) {
                    return l04Var.j(n98Var2, l04Var.i().f(n98Var2, ng8.FOR_NON_TRACKED_SCOPE));
                }
                l04.h(4);
                throw null;
        }
    }
}
