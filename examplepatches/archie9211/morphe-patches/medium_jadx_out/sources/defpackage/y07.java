package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y07 extends u07 {
    public final /* synthetic */ int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y07(b17 b17Var, int i) {
        super(b17Var);
        this.f = i;
    }

    @Override // defpackage.u07, java.util.Iterator
    public Object next() {
        switch (this.f) {
            case 1:
                return b().f;
            default:
                return super.next();
        }
    }
}
