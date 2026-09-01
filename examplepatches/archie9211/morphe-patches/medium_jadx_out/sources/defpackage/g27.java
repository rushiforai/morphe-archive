package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g27 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ k27 b;

    public /* synthetic */ g27(k27 k27Var, int i) {
        this.a = i;
        this.b = k27Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        k27 k27Var = this.b;
        switch (i) {
            case 0:
                ym3 ym3Var = k27Var.c;
                if (ym3Var != null) {
                    ym3Var.setListSelectionHidden(true);
                    ym3Var.requestLayout();
                }
                break;
            default:
                ym3 ym3Var2 = k27Var.c;
                if (ym3Var2 != null && ym3Var2.isAttachedToWindow() && k27Var.c.getCount() > k27Var.c.getChildCount() && k27Var.c.getChildCount() <= k27Var.m) {
                    k27Var.z.setInputMethodMode(2);
                    k27Var.e();
                    break;
                }
                break;
        }
    }
}
