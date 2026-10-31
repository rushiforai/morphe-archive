package androidx.recyclerview.widget;

import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity;

/* loaded from: classes2.dex */
public final class x extends v1 {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f15165d = {16843284};

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f15166a;

    /* renamed from: b, reason: collision with root package name */
    public final int f15167b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f15168c = new Rect();

    public x(TTHistoryActivity tTHistoryActivity) {
        TypedArray typedArrayObtainStyledAttributes = tTHistoryActivity.obtainStyledAttributes(f15165d);
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
        this.f15166a = drawable;
        if (drawable == null) {
            Log.w("DividerItem", "@android:attr/listDivider was not set in the theme used for this DividerItemDecoration. Please set that attribute all call setDrawable()");
        }
        typedArrayObtainStyledAttributes.recycle();
        this.f15167b = 1;
    }

    @Override // androidx.recyclerview.widget.v1
    public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, o2 o2Var) {
        Drawable drawable = this.f15166a;
        if (drawable == null) {
            rect.set(0, 0, 0, 0);
        } else if (this.f15167b == 1) {
            rect.set(0, 0, 0, drawable.getIntrinsicHeight());
        } else {
            rect.set(0, 0, drawable.getIntrinsicWidth(), 0);
        }
    }

    @Override // androidx.recyclerview.widget.v1
    public final void onDraw(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        Drawable drawable;
        int height;
        int paddingTop;
        int width;
        int paddingLeft;
        if (recyclerView.getLayoutManager() == null || (drawable = this.f15166a) == null) {
            return;
        }
        int i5 = this.f15167b;
        int i11 = 0;
        Rect rect = this.f15168c;
        if (i5 == 1) {
            canvas.save();
            if (recyclerView.getClipToPadding()) {
                paddingLeft = recyclerView.getPaddingLeft();
                width = recyclerView.getWidth() - recyclerView.getPaddingRight();
                canvas.clipRect(paddingLeft, recyclerView.getPaddingTop(), width, recyclerView.getHeight() - recyclerView.getPaddingBottom());
            } else {
                width = recyclerView.getWidth();
                paddingLeft = 0;
            }
            int childCount = recyclerView.getChildCount();
            while (i11 < childCount) {
                View childAt = recyclerView.getChildAt(i11);
                recyclerView.getDecoratedBoundsWithMargins(childAt, rect);
                int iRound = Math.round(childAt.getTranslationY()) + rect.bottom;
                drawable.setBounds(paddingLeft, iRound - drawable.getIntrinsicHeight(), width, iRound);
                drawable.draw(canvas);
                i11++;
            }
            canvas.restore();
            return;
        }
        canvas.save();
        if (recyclerView.getClipToPadding()) {
            paddingTop = recyclerView.getPaddingTop();
            height = recyclerView.getHeight() - recyclerView.getPaddingBottom();
            canvas.clipRect(recyclerView.getPaddingLeft(), paddingTop, recyclerView.getWidth() - recyclerView.getPaddingRight(), height);
        } else {
            height = recyclerView.getHeight();
            paddingTop = 0;
        }
        int childCount2 = recyclerView.getChildCount();
        while (i11 < childCount2) {
            View childAt2 = recyclerView.getChildAt(i11);
            recyclerView.getLayoutManager().getDecoratedBoundsWithMargins(childAt2, rect);
            int iRound2 = Math.round(childAt2.getTranslationX()) + rect.right;
            drawable.setBounds(iRound2 - drawable.getIntrinsicWidth(), paddingTop, iRound2, height);
            drawable.draw(canvas);
            i11++;
        }
        canvas.restore();
    }
}
