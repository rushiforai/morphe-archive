package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nt2 extends co6 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nt2(int i) {
        super(0);
        this.b = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return ev6.w("Unexpected status code ", this.b, " on upload request: Logs Request");
            default:
                return ev6.w("too many tags were added, ", this.b, " had to be discarded.");
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nt2(int i, lbb lbbVar) {
        super(0);
        this.b = i;
    }
}
