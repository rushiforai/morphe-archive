package m2;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.compose.ui.graphics.Canvas;
import i2.c;

/* loaded from: classes2.dex */
public final class a extends ViewGroup {
    public a(Context context) {
        super(context);
        setClipChildren(false);
        setClipToPadding(false);
        setTag(2131428142, Boolean.TRUE);
    }

    public final void a(Canvas canvas, View view, long j11) {
        drawChild(c.a(canvas), view, j11);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(android.graphics.Canvas canvas) {
    }

    public final void dispatchGetDisplayList() {
    }

    @Override // android.view.View
    public final void forceLayout() {
    }

    @Override // android.view.ViewGroup
    public final int getChildCount() {
        return 0;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ViewParent invalidateChildInParent(int[] iArr, Rect rect) {
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
    }
}
