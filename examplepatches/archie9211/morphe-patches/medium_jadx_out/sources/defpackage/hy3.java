package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hy3 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ yrb b;

    public /* synthetic */ hy3(yrb yrbVar, int i) {
        this.a = i;
        this.b = yrbVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        yrb yrbVar = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(yrbVar.g.a());
            case 1:
                return Boolean.valueOf(yrbVar.a.g() < yrbVar.e.g());
            default:
                return Boolean.valueOf(yrbVar.a.g() > 0);
        }
    }
}
