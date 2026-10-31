package m;

import a5.a1;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupWindow;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class v extends jk.b {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f75375c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f75376d;

    public /* synthetic */ v(Object obj, int i5) {
        this.f75375c = i5;
        this.f75376d = obj;
    }

    @Override // jk.b, a5.j1
    public void b() {
        int i5 = this.f75375c;
        Object obj = this.f75376d;
        switch (i5) {
            case 0:
                ((t) obj).f75372b.f75239v.setVisibility(0);
                break;
            case 1:
                f0 f0Var = (f0) obj;
                f0Var.f75239v.setVisibility(0);
                if (f0Var.f75239v.getParent() instanceof View) {
                    View view = (View) f0Var.f75239v.getParent();
                    WeakHashMap weakHashMap = a1.f250a;
                    a5.q0.c(view);
                    break;
                }
                break;
        }
    }

    @Override // a5.j1
    public final void c() {
        int i5 = this.f75375c;
        Object obj = this.f75376d;
        switch (i5) {
            case 0:
                f0 f0Var = ((t) obj).f75372b;
                f0Var.f75239v.setAlpha(1.0f);
                f0Var.f75242y.d(null);
                f0Var.f75242y = null;
                break;
            case 1:
                f0 f0Var2 = (f0) obj;
                f0Var2.f75239v.setAlpha(1.0f);
                f0Var2.f75242y.d(null);
                f0Var2.f75242y = null;
                break;
            default:
                f0 f0Var3 = (f0) ((w) obj).f75379c;
                f0Var3.f75239v.setVisibility(8);
                PopupWindow popupWindow = f0Var3.f75240w;
                if (popupWindow != null) {
                    popupWindow.dismiss();
                } else if (f0Var3.f75239v.getParent() instanceof View) {
                    View view = (View) f0Var3.f75239v.getParent();
                    WeakHashMap weakHashMap = a1.f250a;
                    a5.q0.c(view);
                }
                f0Var3.f75239v.e();
                f0Var3.f75242y.d(null);
                f0Var3.f75242y = null;
                ViewGroup viewGroup = f0Var3.A;
                WeakHashMap weakHashMap2 = a1.f250a;
                a5.q0.c(viewGroup);
                break;
        }
    }
}
