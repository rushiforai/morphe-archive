package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jl8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bo4[] b;

    public /* synthetic */ jl8(bo4[] bo4VarArr, int i) {
        this.a = i;
        this.b = bo4VarArr;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return new fl8[this.b.length];
            case 1:
                return new Object[this.b.length];
            default:
                return new m72[this.b.length];
        }
    }
}
