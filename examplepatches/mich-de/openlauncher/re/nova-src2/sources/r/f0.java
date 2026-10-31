package r;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ViewTreeObserver;
import android.widget.ListAdapter;
import android.widget.SpinnerAdapter;

/* loaded from: classes2.dex */
public final class f0 extends t1 implements g0 {
    public CharSequence C;
    public ListAdapter D;
    public final Rect E;
    public int F;
    public final /* synthetic */ androidx.appcompat.widget.b G;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f0(androidx.appcompat.widget.b bVar, Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130970014, 0);
        this.G = bVar;
        this.E = new Rect();
        this.o = bVar;
        p();
        this.f84873p = new fk.q(this, 1);
    }

    @Override // r.g0
    public final CharSequence c() {
        return this.C;
    }

    @Override // r.g0
    public final void e(CharSequence charSequence) {
        this.C = charSequence;
    }

    @Override // r.g0
    public final void g(int i5) {
        this.F = i5;
    }

    @Override // r.g0
    public final void h(int i5, int i11) {
        ViewTreeObserver viewTreeObserver;
        u uVar = this.f84883z;
        boolean zIsShowing = uVar.isShowing();
        q();
        o();
        show();
        g1 g1Var = this.f84862c;
        g1Var.setChoiceMode(1);
        g1Var.setTextDirection(i5);
        g1Var.setTextAlignment(i11);
        androidx.appcompat.widget.b bVar = this.G;
        int selectedItemPosition = bVar.getSelectedItemPosition();
        g1 g1Var2 = this.f84862c;
        if (uVar.isShowing() && g1Var2 != null) {
            g1Var2.f84716h = false;
            g1Var2.setSelection(selectedItemPosition);
            if (g1Var2.getChoiceMode() != 0) {
                g1Var2.setItemChecked(selectedItemPosition, true);
            }
        }
        if (zIsShowing || (viewTreeObserver = bVar.getViewTreeObserver()) == null) {
            return;
        }
        d9.d dVar = new d9.d(this, 5);
        viewTreeObserver.addOnGlobalLayoutListener(dVar);
        uVar.setOnDismissListener(new e0(this, dVar));
    }

    @Override // r.t1
    public final void j(ListAdapter listAdapter) {
        super.j(listAdapter);
        this.D = listAdapter;
    }

    public final void q() {
        int i5;
        androidx.appcompat.widget.b bVar = this.G;
        Rect rect = bVar.f13838h;
        u uVar = this.f84883z;
        Drawable background = uVar.getBackground();
        if (background != null) {
            background.getPadding(rect);
            boolean z11 = p2.f84838a;
            i5 = bVar.getLayoutDirection() == 1 ? rect.right : -rect.left;
        } else {
            i5 = 0;
            rect.right = 0;
            rect.left = 0;
        }
        int paddingLeft = bVar.getPaddingLeft();
        int paddingRight = bVar.getPaddingRight();
        int width = bVar.getWidth();
        int i11 = bVar.f13837g;
        if (i11 == -2) {
            int iA = bVar.a((SpinnerAdapter) this.D, uVar.getBackground());
            int i12 = (bVar.getContext().getResources().getDisplayMetrics().widthPixels - rect.left) - rect.right;
            if (iA > i12) {
                iA = i12;
            }
            n(Math.max(iA, (width - paddingLeft) - paddingRight));
        } else if (i11 == -1) {
            n((width - paddingLeft) - paddingRight);
        } else {
            n(i11);
        }
        boolean z12 = p2.f84838a;
        this.f84865f = bVar.getLayoutDirection() == 1 ? (((width - paddingRight) - this.f84864e) - this.F) + i5 : paddingLeft + this.F + i5;
    }
}
