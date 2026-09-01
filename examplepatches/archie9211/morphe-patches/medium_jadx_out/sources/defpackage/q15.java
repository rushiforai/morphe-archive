package defpackage;

import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q15 implements View.OnAttachStateChangeListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public q15(r15 r15Var, s25 s25Var) {
        this.a = 0;
        this.c = r15Var;
        this.b = s25Var;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                s25 s25Var = (s25) obj2;
                j15 j15Var = s25Var.c;
                s25Var.k();
                g23.f((ViewGroup) j15Var.G.getParent(), ((r15) obj).a).e();
                break;
            case 1:
                ((ViewGroup) obj2).addView((j6d) obj, 0);
                view.removeOnAttachStateChangeListener(this);
                break;
            case 2:
                x0 x0Var = (x0) obj2;
                iy6 iy6VarK = fp7.k(x0Var);
                if (iy6VarK == null) {
                    b26.c("View tree for " + x0Var + " has no ViewTreeLifecycleOwner");
                    z72.b();
                } else {
                    ((rya) obj).a = mo7.P(x0Var, iy6VarK.getLifecycle());
                    x0Var.removeOnAttachStateChangeListener(this);
                }
                break;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                ((ViewGroup) obj2).addView((j6d) obj, 0);
                view.removeOnAttachStateChangeListener(this);
                break;
            case 2:
                break;
            default:
                ((View) obj2).removeOnAttachStateChangeListener(this);
                ((swa) obj).y();
                break;
        }
    }

    public /* synthetic */ q15(int i, View view, Object obj) {
        this.a = i;
        this.b = view;
        this.c = obj;
    }

    private final void a(View view) {
    }

    private final void b(View view) {
    }

    private final void c(View view) {
    }
}
