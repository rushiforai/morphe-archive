package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ioc extends b8 implements m45 {
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ioc(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.h = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.h;
        c1e c1eVar = c1e.a;
        Object obj = this.a;
        switch (i) {
            case 0:
                ((c5d) obj).a.h(x4d.a);
                break;
            default:
                ((c5d) obj).a.h(y4d.a);
                break;
        }
        return c1eVar;
    }
}
