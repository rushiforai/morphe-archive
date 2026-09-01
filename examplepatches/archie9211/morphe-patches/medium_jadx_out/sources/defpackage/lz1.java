package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lz1 extends b8 implements b55 {
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lz1(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.h = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.h;
        c1e c1eVar = c1e.a;
        Object obj3 = this.a;
        switch (i) {
            case 0:
                ((mz1) obj3).a((x12) obj, ((Number) obj2).intValue());
                break;
            case 1:
                msb msbVar = (msb) obj3;
                vx0.c0(msbVar.L.c(), null, null, new ksb(msbVar, ((qre) obj).a, null, 2), 3);
                break;
            default:
                msb msbVar2 = (msb) obj3;
                vx0.c0(msbVar2.L.c(), null, null, new ksb(msbVar2, ((qre) obj).a, null, 1), 3);
                break;
        }
        return c1eVar;
    }
}
