package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sq4 extends d1 {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sq4(iq4 iq4Var, int i) {
        super(iq4Var);
        this.c = i;
    }

    @Override // defpackage.iq4
    public final void b(ywc ywcVar) {
        int i = this.c;
        iq4 iq4Var = this.b;
        switch (i) {
            case 0:
                iq4Var.a(new qq4(ywcVar));
                break;
            default:
                iq4Var.a(new tq4(ywcVar));
                break;
        }
    }
}
