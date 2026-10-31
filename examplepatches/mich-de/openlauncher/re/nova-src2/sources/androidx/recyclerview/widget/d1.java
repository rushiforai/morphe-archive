package androidx.recyclerview.widget;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes2.dex */
public final class d1 extends f1 {
    public d1(z1 z1Var) {
        super(z1Var);
    }

    @Override // androidx.recyclerview.widget.f1
    public final int b(View view) {
        return this.f14956a.getDecoratedRight(view) + ((ViewGroup.MarginLayoutParams) ((a2) view.getLayoutParams())).rightMargin;
    }

    @Override // androidx.recyclerview.widget.f1
    public final int c(View view) {
        a2 a2Var = (a2) view.getLayoutParams();
        return this.f14956a.getDecoratedMeasuredWidth(view) + ((ViewGroup.MarginLayoutParams) a2Var).leftMargin + ((ViewGroup.MarginLayoutParams) a2Var).rightMargin;
    }

    @Override // androidx.recyclerview.widget.f1
    public final int d(View view) {
        a2 a2Var = (a2) view.getLayoutParams();
        return this.f14956a.getDecoratedMeasuredHeight(view) + ((ViewGroup.MarginLayoutParams) a2Var).topMargin + ((ViewGroup.MarginLayoutParams) a2Var).bottomMargin;
    }

    @Override // androidx.recyclerview.widget.f1
    public final int e(View view) {
        return this.f14956a.getDecoratedLeft(view) - ((ViewGroup.MarginLayoutParams) ((a2) view.getLayoutParams())).leftMargin;
    }

    @Override // androidx.recyclerview.widget.f1
    public final int f() {
        return this.f14956a.getWidth();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int g() {
        z1 z1Var = this.f14956a;
        return z1Var.getWidth() - z1Var.getPaddingRight();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int h() {
        return this.f14956a.getPaddingRight();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int i() {
        return this.f14956a.getWidthMode();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int j() {
        return this.f14956a.getHeightMode();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int k() {
        return this.f14956a.getPaddingLeft();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int l() {
        z1 z1Var = this.f14956a;
        return (z1Var.getWidth() - z1Var.getPaddingLeft()) - z1Var.getPaddingRight();
    }

    @Override // androidx.recyclerview.widget.f1
    public final int n(View view) {
        z1 z1Var = this.f14956a;
        Rect rect = this.f14958c;
        z1Var.getTransformedBoundingBox(view, true, rect);
        return rect.right;
    }

    @Override // androidx.recyclerview.widget.f1
    public final int o(View view) {
        z1 z1Var = this.f14956a;
        Rect rect = this.f14958c;
        z1Var.getTransformedBoundingBox(view, true, rect);
        return rect.left;
    }

    @Override // androidx.recyclerview.widget.f1
    public final void p(int i5) {
        this.f14956a.offsetChildrenHorizontal(i5);
    }
}
