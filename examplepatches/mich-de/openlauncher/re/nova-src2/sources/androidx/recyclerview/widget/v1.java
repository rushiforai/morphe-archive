package androidx.recyclerview.widget;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.view.View;

/* loaded from: classes.dex */
public abstract class v1 {
    @Deprecated
    public void getItemOffsets(Rect rect, int i5, RecyclerView recyclerView) {
        rect.set(0, 0, 0, 0);
    }

    @Deprecated
    public void onDraw(Canvas canvas, RecyclerView recyclerView) {
    }

    @Deprecated
    public void onDrawOver(Canvas canvas, RecyclerView recyclerView) {
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, o2 o2Var) {
        getItemOffsets(rect, ((a2) view.getLayoutParams()).f14880a.getLayoutPosition(), recyclerView);
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        onDraw(canvas, recyclerView);
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        onDrawOver(canvas, recyclerView);
    }
}
