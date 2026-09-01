package defpackage;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ViewTreeObserver;
import android.widget.ListAdapter;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c30 extends k27 implements e30 {
    public CharSequence D;
    public z20 E;
    public final Rect F;
    public int G;
    public final /* synthetic */ f30 H;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c30(f30 f30Var, Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.spinnerStyle, 0);
        this.H = f30Var;
        this.F = new Rect();
        this.o = f30Var;
        this.y = true;
        this.z.setFocusable(true);
        this.p = new a30(0, this);
    }

    @Override // defpackage.e30
    public final CharSequence d() {
        return this.D;
    }

    @Override // defpackage.e30
    public final void h(CharSequence charSequence) {
        this.D = charSequence;
    }

    @Override // defpackage.e30
    public final void l(int i) {
        this.G = i;
    }

    @Override // defpackage.e30
    public final void m(int i, int i2) {
        ViewTreeObserver viewTreeObserver;
        p20 p20Var = this.z;
        boolean zIsShowing = p20Var.isShowing();
        r();
        p20Var.setInputMethodMode(2);
        e();
        ym3 ym3Var = this.c;
        ym3Var.setChoiceMode(1);
        ym3Var.setTextDirection(i);
        ym3Var.setTextAlignment(i2);
        f30 f30Var = this.H;
        int selectedItemPosition = f30Var.getSelectedItemPosition();
        ym3 ym3Var2 = this.c;
        if (p20Var.isShowing() && ym3Var2 != null) {
            ym3Var2.setListSelectionHidden(false);
            ym3Var2.setSelection(selectedItemPosition);
            if (ym3Var2.getChoiceMode() != 0) {
                ym3Var2.setItemChecked(selectedItemPosition, true);
            }
        }
        if (zIsShowing || (viewTreeObserver = f30Var.getViewTreeObserver()) == null) {
            return;
        }
        w20 w20Var = new w20(1, this);
        viewTreeObserver.addOnGlobalLayoutListener(w20Var);
        p20Var.setOnDismissListener(new b30(this, w20Var));
    }

    @Override // defpackage.k27, defpackage.e30
    public final void o(ListAdapter listAdapter) {
        super.o(listAdapter);
        this.E = (z20) listAdapter;
    }

    public final void r() {
        int i;
        p20 p20Var = this.z;
        Drawable background = p20Var.getBackground();
        f30 f30Var = this.H;
        Rect rect = f30Var.h;
        if (background != null) {
            background.getPadding(rect);
            boolean z = bwe.a;
            i = f30Var.getLayoutDirection() == 1 ? rect.right : -rect.left;
        } else {
            i = 0;
            rect.right = 0;
            rect.left = 0;
        }
        int paddingLeft = f30Var.getPaddingLeft();
        int paddingRight = f30Var.getPaddingRight();
        int width = f30Var.getWidth();
        int i2 = f30Var.g;
        if (i2 == -2) {
            int iA = f30Var.a(this.E, p20Var.getBackground());
            int i3 = (f30Var.getContext().getResources().getDisplayMetrics().widthPixels - rect.left) - rect.right;
            if (iA > i3) {
                iA = i3;
            }
            q(Math.max(iA, (width - paddingLeft) - paddingRight));
        } else if (i2 == -1) {
            q((width - paddingLeft) - paddingRight);
        } else {
            q(i2);
        }
        boolean z2 = bwe.a;
        this.f = f30Var.getLayoutDirection() == 1 ? (((width - paddingRight) - this.e) - this.G) + i : paddingLeft + this.G + i;
    }
}
