package x9;

import android.graphics.Canvas;
import android.graphics.Point;
import android.view.View;

/* loaded from: classes2.dex */
public final class a extends View.DragShadowBuilder {
    @Override // android.view.View.DragShadowBuilder
    public final void onDrawShadow(Canvas canvas) {
    }

    @Override // android.view.View.DragShadowBuilder
    public final void onProvideShadowMetrics(Point point, Point point2) {
        point.set(10, 10);
        point2.set(5, 5);
    }
}
