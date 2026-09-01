package j$.util.stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v extends y {
    public final /* synthetic */ int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(a aVar, int i, int i2) {
        super(aVar, i);
        this.l = i2;
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        switch (this.l) {
            case 0:
                return l5Var;
            case 1:
                return new r(this, l5Var, 2);
            case 2:
                return new v0(1, l5Var);
            case 3:
                return new v0(this, l5Var, 4);
            case 4:
                return new c1(l5Var);
            default:
                return new c1(this, l5Var, 3);
        }
    }
}
