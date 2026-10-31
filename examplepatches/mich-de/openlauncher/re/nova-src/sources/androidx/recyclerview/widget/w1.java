package androidx.recyclerview.widget;

import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes.dex */
public final class w1 implements f3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15161a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f15162b;

    public /* synthetic */ w1(Object obj, int i5) {
        this.f15161a = i5;
        this.f15162b = obj;
    }

    @Override // androidx.recyclerview.widget.f3
    public int a(View view) {
        int decoratedLeft;
        int i5;
        switch (this.f15161a) {
            case 0:
                a2 a2Var = (a2) view.getLayoutParams();
                decoratedLeft = ((z1) this.f15162b).getDecoratedLeft(view);
                i5 = ((ViewGroup.MarginLayoutParams) a2Var).leftMargin;
                break;
            default:
                a2 a2Var2 = (a2) view.getLayoutParams();
                decoratedLeft = ((z1) this.f15162b).getDecoratedTop(view);
                i5 = ((ViewGroup.MarginLayoutParams) a2Var2).topMargin;
                break;
        }
        return decoratedLeft - i5;
    }

    @Override // androidx.recyclerview.widget.f3
    public int b() {
        switch (this.f15161a) {
            case 0:
                return ((z1) this.f15162b).getPaddingLeft();
            default:
                return ((z1) this.f15162b).getPaddingTop();
        }
    }

    @Override // androidx.recyclerview.widget.f3
    public int c() {
        int width;
        int paddingRight;
        switch (this.f15161a) {
            case 0:
                z1 z1Var = (z1) this.f15162b;
                width = z1Var.getWidth();
                paddingRight = z1Var.getPaddingRight();
                break;
            default:
                z1 z1Var2 = (z1) this.f15162b;
                width = z1Var2.getHeight();
                paddingRight = z1Var2.getPaddingBottom();
                break;
        }
        return width - paddingRight;
    }

    @Override // androidx.recyclerview.widget.f3
    public View d(int i5) {
        switch (this.f15161a) {
        }
        return ((z1) this.f15162b).getChildAt(i5);
    }

    @Override // androidx.recyclerview.widget.f3
    public int e(View view) {
        int decoratedRight;
        int i5;
        switch (this.f15161a) {
            case 0:
                a2 a2Var = (a2) view.getLayoutParams();
                decoratedRight = ((z1) this.f15162b).getDecoratedRight(view);
                i5 = ((ViewGroup.MarginLayoutParams) a2Var).rightMargin;
                break;
            default:
                a2 a2Var2 = (a2) view.getLayoutParams();
                decoratedRight = ((z1) this.f15162b).getDecoratedBottom(view);
                i5 = ((ViewGroup.MarginLayoutParams) a2Var2).bottomMargin;
                break;
        }
        return decoratedRight + i5;
    }
}
