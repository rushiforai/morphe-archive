package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kr5 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lr5[] b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kr5(lr5[] lr5VarArr, int i) {
        super(2);
        this.a = i;
        this.b = lr5VarArr;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        lr5[] lr5VarArr = this.b;
        switch (i) {
            case 0:
                return Float.valueOf(kk7.A((s99) obj, true, lr5VarArr, ((Number) obj2).floatValue()));
            default:
                return Float.valueOf(kk7.A((s99) obj, false, lr5VarArr, ((Number) obj2).floatValue()));
        }
    }
}
