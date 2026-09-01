package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w49 implements rsa, mc9 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ w49(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.mc9
    public final Object c(String str, x45 x45Var, p92 p92Var) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((b59) obj).c(str, x45Var, p92Var);
            default:
                return ((uc9) obj).c(str, x45Var, p92Var);
        }
    }

    @Override // defpackage.rsa
    public final anb d() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((b59) obj).b;
            default:
                return ((uc9) obj).b;
        }
    }
}
