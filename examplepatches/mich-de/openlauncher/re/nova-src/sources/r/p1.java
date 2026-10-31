package r;

/* loaded from: classes.dex */
public final class p1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84836a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t1 f84837b;

    public /* synthetic */ p1(t1 t1Var, int i5) {
        this.f84836a = i5;
        this.f84837b = t1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f84836a) {
            case 0:
                g1 g1Var = this.f84837b.f84862c;
                if (g1Var != null) {
                    g1Var.c(true);
                    g1Var.requestLayout();
                    break;
                }
                break;
            default:
                t1 t1Var = this.f84837b;
                g1 g1Var2 = t1Var.f84862c;
                if (g1Var2 != null && g1Var2.isAttachedToWindow() && t1Var.f84862c.getCount() > t1Var.f84862c.getChildCount() && t1Var.f84862c.getChildCount() <= t1Var.f84872m) {
                    t1Var.f84883z.setInputMethodMode(2);
                    t1Var.show();
                    break;
                }
                break;
        }
    }
}
