package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m3b implements uc7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x51 b;

    public /* synthetic */ m3b(x51 x51Var, int i) {
        this.a = i;
        this.b = x51Var;
    }

    @Override // defpackage.uc7
    public final void onResult(Object obj) {
        int i = this.a;
        x51 x51Var = this.b;
        switch (i) {
            case 0:
                if (!x51Var.x()) {
                    x51Var.resumeWith(obj);
                }
                break;
            default:
                Throwable th = (Throwable) obj;
                if (!x51Var.x()) {
                    th.getClass();
                    x51Var.resumeWith(new ajb(th));
                }
                break;
        }
    }
}
