package m;

import a5.a1;
import a5.i1;
import android.view.ViewGroup;
import androidx.recyclerview.widget.u1;

/* loaded from: classes2.dex */
public final class t implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75371a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f0 f75372b;

    public /* synthetic */ t(f0 f0Var, int i5) {
        this.f75371a = i5;
        this.f75372b = f0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ViewGroup viewGroup;
        switch (this.f75371a) {
            case 0:
                f0 f0Var = this.f75372b;
                if ((f0Var.Z & 1) != 0) {
                    f0Var.M(0);
                }
                if ((f0Var.Z & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                    f0Var.M(108);
                }
                f0Var.Y = false;
                f0Var.Z = 0;
                break;
            default:
                f0 f0Var2 = this.f75372b;
                f0Var2.f75240w.showAtLocation(f0Var2.f75239v, 55, 0, 0);
                i1 i1Var = f0Var2.f75242y;
                if (i1Var != null) {
                    i1Var.b();
                }
                if (!f0Var2.f75243z || (viewGroup = f0Var2.A) == null || !viewGroup.isLaidOut()) {
                    f0Var2.f75239v.setAlpha(1.0f);
                    f0Var2.f75239v.setVisibility(0);
                    break;
                } else {
                    f0Var2.f75239v.setAlpha(0.0f);
                    i1 i1VarA = a1.a(f0Var2.f75239v);
                    i1VarA.a(1.0f);
                    f0Var2.f75242y = i1VarA;
                    i1VarA.d(new v(this, 0));
                    break;
                }
                break;
        }
    }
}
