package defpackage;

import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.PopupWindow;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class cy7 {
    public final Context a;
    public final lx7 b;
    public final boolean c;
    public final int d;
    public View e;
    public boolean g;
    public jy7 h;
    public ay7 i;
    public PopupWindow.OnDismissListener j;
    public int f = 8388611;
    public final by7 k = new by7(this);

    public cy7(Context context, lx7 lx7Var, View view, boolean z, int i, int i2) {
        this.a = context;
        this.b = lx7Var;
        this.e = view;
        this.c = z;
        this.d = i;
    }

    public final ay7 a() {
        ay7 kncVar = this.i;
        if (kncVar == null) {
            Context context = this.a;
            Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            int iMin = Math.min(point.x, point.y);
            int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.abc_cascading_menus_min_smallest_width);
            Context context2 = this.a;
            if (iMin >= dimensionPixelSize) {
                kncVar = new p71(context2, this.e, this.d, this.c);
            } else {
                kncVar = new knc(context2, this.b, this.e, this.d, this.c);
            }
            kncVar.l(this.b);
            kncVar.r(this.k);
            kncVar.n(this.e);
            kncVar.g(this.h);
            kncVar.o(this.g);
            kncVar.p(this.f);
            this.i = kncVar;
        }
        return kncVar;
    }

    public final boolean b() {
        ay7 ay7Var = this.i;
        return ay7Var != null && ay7Var.a();
    }

    public void c() {
        this.i = null;
        PopupWindow.OnDismissListener onDismissListener = this.j;
        if (onDismissListener != null) {
            onDismissListener.onDismiss();
        }
    }

    public final void d(int i, int i2, boolean z, boolean z2) {
        ay7 ay7VarA = a();
        ay7VarA.s(z2);
        if (z) {
            if ((Gravity.getAbsoluteGravity(this.f, this.e.getLayoutDirection()) & 7) == 5) {
                i -= this.e.getWidth();
            }
            ay7VarA.q(i);
            ay7VarA.t(i2);
            int i3 = (int) ((this.a.getResources().getDisplayMetrics().density * 48.0f) / 2.0f);
            ay7VarA.a = new Rect(i - i3, i2 - i3, i + i3, i2 + i3);
        }
        ay7VarA.e();
    }
}
