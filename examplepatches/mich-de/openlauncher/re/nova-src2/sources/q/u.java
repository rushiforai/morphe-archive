package q;

import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.PopupWindow;

/* loaded from: classes2.dex */
public class u {

    /* renamed from: a, reason: collision with root package name */
    public final Context f83294a;

    /* renamed from: b, reason: collision with root package name */
    public final k f83295b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f83296c;

    /* renamed from: d, reason: collision with root package name */
    public final int f83297d;

    /* renamed from: e, reason: collision with root package name */
    public View f83298e;

    /* renamed from: g, reason: collision with root package name */
    public boolean f83300g;

    /* renamed from: h, reason: collision with root package name */
    public v f83301h;

    /* renamed from: i, reason: collision with root package name */
    public s f83302i;

    /* renamed from: j, reason: collision with root package name */
    public PopupWindow.OnDismissListener f83303j;

    /* renamed from: f, reason: collision with root package name */
    public int f83299f = 8388611;

    /* renamed from: k, reason: collision with root package name */
    public final t f83304k = new t(this, 0);

    public u(Context context, k kVar, View view, boolean z11, int i5, int i11) {
        this.f83294a = context;
        this.f83295b = kVar;
        this.f83298e = view;
        this.f83296c = z11;
        this.f83297d = i5;
    }

    public final s a() {
        s b0Var;
        if (this.f83302i == null) {
            Context context = this.f83294a;
            Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            if (Math.min(point.x, point.y) >= context.getResources().getDimensionPixelSize(2131165206)) {
                b0Var = new e(context, this.f83298e, this.f83297d, this.f83296c);
            } else {
                b0Var = new b0(this.f83294a, this.f83295b, this.f83298e, this.f83297d, this.f83296c);
            }
            b0Var.i(this.f83295b);
            b0Var.p(this.f83304k);
            b0Var.l(this.f83298e);
            b0Var.h(this.f83301h);
            b0Var.m(this.f83300g);
            b0Var.n(this.f83299f);
            this.f83302i = b0Var;
        }
        return this.f83302i;
    }

    public final boolean b() {
        s sVar = this.f83302i;
        return sVar != null && sVar.isShowing();
    }

    public void c() {
        this.f83302i = null;
        PopupWindow.OnDismissListener onDismissListener = this.f83303j;
        if (onDismissListener != null) {
            onDismissListener.onDismiss();
        }
    }

    public final void d(int i5, int i11, boolean z11, boolean z12) {
        s sVarA = a();
        sVarA.q(z12);
        if (z11) {
            if ((Gravity.getAbsoluteGravity(this.f83299f, this.f83298e.getLayoutDirection()) & 7) == 5) {
                i5 -= this.f83298e.getWidth();
            }
            sVarA.o(i5);
            sVarA.r(i11);
            int i12 = (int) ((this.f83294a.getResources().getDisplayMetrics().density * 48.0f) / 2.0f);
            sVarA.f83291a = new Rect(i5 - i12, i11 - i12, i5 + i12, i11 + i12);
        }
        sVarA.show();
    }
}
