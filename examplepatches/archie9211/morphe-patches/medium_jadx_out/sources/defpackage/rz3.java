package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rz3 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rz3(int i, x45 x45Var) {
        super(1);
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                return new k46(((long) ((Number) x45Var.invoke(Integer.valueOf((int) (((s46) obj).a & 4294967295L)))).intValue()) & 4294967295L);
            case 1:
                return new k46(((long) ((Number) x45Var.invoke(Integer.valueOf((int) (((s46) obj).a & 4294967295L)))).intValue()) & 4294967295L);
            default:
                return (que) x45Var.invoke(obj);
        }
    }
}
