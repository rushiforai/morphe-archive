package defpackage;

import android.content.Context;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.appcompat.widget.Toolbar;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class und implements ky7 {
    public lx7 a;
    public sx7 b;
    public final /* synthetic */ Toolbar c;

    public und(Toolbar toolbar) {
        this.c = toolbar;
    }

    @Override // defpackage.ky7
    public final boolean c(dvc dvcVar) {
        return false;
    }

    @Override // defpackage.ky7
    public final boolean d() {
        return false;
    }

    @Override // defpackage.ky7
    public final boolean f(sx7 sx7Var) {
        Toolbar toolbar = this.c;
        KeyEvent.Callback callback = toolbar.i;
        if (callback instanceof lq1) {
            ((ux7) ((lq1) callback)).a.onActionViewCollapsed();
        }
        toolbar.removeView(toolbar.i);
        toolbar.removeView(toolbar.h);
        toolbar.i = null;
        ArrayList arrayList = toolbar.E;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            toolbar.addView((View) arrayList.get(size));
        }
        arrayList.clear();
        this.b = null;
        toolbar.requestLayout();
        sx7Var.C = false;
        sx7Var.n.p(false);
        toolbar.t();
        return true;
    }

    @Override // defpackage.ky7
    public final boolean h(sx7 sx7Var) {
        Toolbar toolbar = this.c;
        toolbar.c();
        ViewParent parent = toolbar.h.getParent();
        if (parent != toolbar) {
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(toolbar.h);
            }
            toolbar.addView(toolbar.h);
        }
        View actionView = sx7Var.getActionView();
        toolbar.i = actionView;
        this.b = sx7Var;
        ViewParent parent2 = actionView.getParent();
        if (parent2 != toolbar) {
            if (parent2 instanceof ViewGroup) {
                ((ViewGroup) parent2).removeView(toolbar.i);
            }
            vnd vndVarH = Toolbar.h();
            vndVarH.a = (toolbar.n & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8388611;
            vndVarH.b = 2;
            toolbar.i.setLayoutParams(vndVarH);
            toolbar.addView(toolbar.i);
        }
        for (int childCount = toolbar.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = toolbar.getChildAt(childCount);
            if (((vnd) childAt.getLayoutParams()).b != 2 && childAt != toolbar.a) {
                toolbar.removeViewAt(childCount);
                toolbar.E.add(childAt);
            }
        }
        toolbar.requestLayout();
        sx7Var.C = true;
        sx7Var.n.p(false);
        KeyEvent.Callback callback = toolbar.i;
        if (callback instanceof lq1) {
            ((ux7) ((lq1) callback)).a.onActionViewExpanded();
        }
        toolbar.t();
        return true;
    }

    @Override // defpackage.ky7
    public final void i() {
        if (this.b != null) {
            lx7 lx7Var = this.a;
            if (lx7Var != null) {
                int size = lx7Var.f.size();
                for (int i = 0; i < size; i++) {
                    if (this.a.getItem(i) == this.b) {
                        return;
                    }
                }
            }
            f(this.b);
        }
    }

    @Override // defpackage.ky7
    public final void k(Context context, lx7 lx7Var) {
        sx7 sx7Var;
        lx7 lx7Var2 = this.a;
        if (lx7Var2 != null && (sx7Var = this.b) != null) {
            lx7Var2.d(sx7Var);
        }
        this.a = lx7Var;
    }

    @Override // defpackage.ky7
    public final void b(lx7 lx7Var, boolean z) {
    }
}
