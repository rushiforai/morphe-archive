package defpackage;

import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupWindow;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w10 extends mve {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ w10(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.mve, defpackage.lve
    public void b() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((u10) obj).b.u.setVisibility(0);
                break;
            case 1:
                f20 f20Var = (f20) obj;
                f20Var.u.setVisibility(0);
                if (f20Var.u.getParent() instanceof View) {
                    View view = (View) f20Var.u.getParent();
                    WeakHashMap weakHashMap = ute.a;
                    view.requestApplyInsets();
                }
                break;
        }
    }

    @Override // defpackage.lve
    public final void c() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                f20 f20Var = ((u10) obj).b;
                f20Var.u.setAlpha(1.0f);
                f20Var.x.d(null);
                f20Var.x = null;
                break;
            case 1:
                f20 f20Var2 = (f20) obj;
                f20Var2.u.setAlpha(1.0f);
                f20Var2.x.d(null);
                f20Var2.x = null;
                break;
            default:
                f20 f20Var3 = (f20) ((lig) obj).c;
                f20Var3.u.setVisibility(8);
                PopupWindow popupWindow = f20Var3.v;
                if (popupWindow != null) {
                    popupWindow.dismiss();
                } else if (f20Var3.u.getParent() instanceof View) {
                    View view = (View) f20Var3.u.getParent();
                    WeakHashMap weakHashMap = ute.a;
                    view.requestApplyInsets();
                }
                f20Var3.u.e();
                f20Var3.x.d(null);
                f20Var3.x = null;
                ViewGroup viewGroup = f20Var3.A;
                WeakHashMap weakHashMap2 = ute.a;
                viewGroup.requestApplyInsets();
                break;
        }
    }
}
