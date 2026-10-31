package x30;

import android.content.Context;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import b.c0;

/* loaded from: classes4.dex */
public final class c extends ViewGroup implements AbsListView.SelectionBoundsAdjuster {

    /* renamed from: a, reason: collision with root package name */
    public int f95037a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f95038b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f95039c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, Context context) {
        super(context);
        this.f95039c = eVar;
        this.f95037a = -1;
        this.f95038b = new Rect();
    }

    @Override // android.widget.AbsListView.SelectionBoundsAdjuster
    public final void adjustListItemSelectionBounds(Rect rect) {
        if (this.f95037a == -1) {
            rect.set(0, 0, 0, 0);
            return;
        }
        int i5 = rect.left;
        Rect rect2 = this.f95038b;
        int i11 = i5 + rect2.left;
        rect.left = i11;
        rect.right = rect2.width() + i11;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int childCount = getChildCount();
        int measuredHeight = getMeasuredHeight();
        int i14 = 0;
        for (int i15 = 0; i15 < childCount; i15++) {
            View childAt = getChildAt(i15);
            int measuredWidth = childAt.getMeasuredWidth();
            e eVar = this.f95039c;
            int iC = c0.c(measuredWidth, eVar.f95046e, 2, i14);
            int measuredWidth2 = childAt.getMeasuredWidth() + iC;
            int measuredHeight2 = (childAt.getMeasuredHeight() - measuredHeight) / 2;
            childAt.layout(iC, measuredHeight2, measuredWidth2, childAt.getMeasuredHeight() + measuredHeight2);
            i14 += eVar.f95046e + eVar.f95043b;
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        e eVar;
        int childCount = getChildCount();
        int i12 = 0;
        int iMax = 0;
        int measuredWidth = 0;
        while (true) {
            eVar = this.f95039c;
            if (i12 >= childCount) {
                break;
            }
            View childAt = getChildAt(i12);
            ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
            childAt.measure(ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(eVar.f95046e, 1073741824), 0, layoutParams.width), ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(0, 0), 0, layoutParams.height));
            iMax = Math.max(childAt.getMeasuredHeight(), iMax);
            measuredWidth += childAt.getMeasuredWidth();
            i12++;
        }
        int mode = View.MeasureSpec.getMode(i5);
        setMeasuredDimension((mode == 0 || mode == Integer.MIN_VALUE) ? ((getChildCount() - 1) * eVar.f95043b) + measuredWidth : View.MeasureSpec.getSize(i5), iMax);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            this.f95037a = -1;
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            boolean zIsChildrenDrawingOrderEnabled = isChildrenDrawingOrderEnabled();
            int childCount = getChildCount();
            int i5 = childCount - 1;
            while (true) {
                if (i5 < 0) {
                    break;
                }
                int childDrawingOrder = zIsChildrenDrawingOrderEnabled ? getChildDrawingOrder(childCount, i5) : i5;
                View childAt = getChildAt(childDrawingOrder);
                if (childAt.getLeft() > x11 || childAt.getRight() <= x11 || childAt.getTop() > y11 || childAt.getBottom() <= y11) {
                    i5--;
                } else {
                    this.f95037a = childDrawingOrder;
                    int left = childAt.getLeft();
                    int top = childAt.getTop();
                    int right = childAt.getRight();
                    int bottom = childAt.getBottom();
                    Rect rect = this.f95038b;
                    rect.set(left, top, right, bottom);
                    if (childAt instanceof AbsListView.SelectionBoundsAdjuster) {
                        ((AbsListView.SelectionBoundsAdjuster) childAt).adjustListItemSelectionBounds(rect);
                    }
                    rect.set(rect.left, rect.top, rect.right, rect.bottom);
                }
            }
        }
        return super.onTouchEvent(motionEvent);
    }
}
