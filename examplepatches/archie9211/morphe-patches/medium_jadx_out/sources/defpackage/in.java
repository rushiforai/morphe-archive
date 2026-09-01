package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class in extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ in(int i, int i2) {
        super(1);
        this.a = i2;
        this.b = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(((es4) obj).P0(i2));
            case 1:
                return Boolean.valueOf(((es4) obj).P0(i2));
            case 2:
                return Boolean.valueOf(((es4) obj).P0(i2));
            case 3:
                return Boolean.valueOf(((es4) obj).P0(i2));
            default:
                return Boolean.valueOf(((es4) obj).I0(i2));
        }
    }
}
