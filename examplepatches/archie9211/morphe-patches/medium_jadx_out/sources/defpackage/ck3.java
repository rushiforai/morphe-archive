package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ck3 extends co6 implements x45 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ nya b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ck3(md5 md5Var, dk3 dk3Var, nya nyaVar) {
        super(1);
        this.b = nyaVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        nya nyaVar = this.b;
        switch (i) {
            case 0:
                dk3 dk3Var = (dk3) obj;
                if (dk3Var.n) {
                    if (dk3Var.p != null) {
                        b26.b("DragAndDropTarget self reference must be null at the start of a drag and drop session");
                    }
                    dk3Var.p = null;
                    nyaVar.a = nyaVar.a;
                }
                break;
            default:
                if (((rr5) obj).q) {
                    nyaVar.a = false;
                }
                break;
        }
        return rsd.ContinueTraversal;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ck3(nya nyaVar) {
        super(1);
        this.b = nyaVar;
    }
}
