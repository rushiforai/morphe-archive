package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rd5 implements x45 {
    public final /* synthetic */ int a;
    public final x45 b;

    public /* synthetic */ rd5(int i, x45 x45Var) {
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        long j;
        switch (this.a) {
            case 0:
                sic sicVar = (sic) obj;
                synchronized (uic.c) {
                    j = uic.e;
                    uic.e = 1 + j;
                }
                return new vua(j, sicVar, this.b);
            case 1:
                x45 x45Var = this.b;
                mn6 mn6Var = (mn6) obj;
                mn6Var.getClass();
                return x45Var.invoke(mn6Var).toString();
            default:
                return this.b.invoke(Long.valueOf(((Number) obj).longValue() / 1000000));
        }
    }
}
