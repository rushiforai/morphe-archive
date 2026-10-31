package jj;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.v1;
import com.google.android.material.carousel.CarouselLayoutManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class a extends v1 {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f69563a;

    /* renamed from: b, reason: collision with root package name */
    public final List f69564b;

    public a() {
        Paint paint = new Paint();
        this.f69563a = paint;
        this.f69564b = Collections.unmodifiableList(new ArrayList());
        paint.setStrokeWidth(5.0f);
        paint.setColor(-65281);
    }

    @Override // androidx.recyclerview.widget.v1
    public final void onDrawOver(Canvas canvas, RecyclerView recyclerView, o2 o2Var) throws Resources.NotFoundException {
        Canvas canvas2;
        super.onDrawOver(canvas, recyclerView, o2Var);
        float dimension = recyclerView.getResources().getDimension(2131165674);
        Paint paint = this.f69563a;
        paint.setStrokeWidth(dimension);
        Iterator it = this.f69564b.iterator();
        while (it.hasNext()) {
            ((c) it.next()).getClass();
            paint.setColor(r4.a.f(0.0f, -65281, -16776961));
            if (((CarouselLayoutManager) recyclerView.getLayoutManager()).o()) {
                canvas2 = canvas;
                canvas2.drawLine(0.0f, ((CarouselLayoutManager) recyclerView.getLayoutManager()).f34148b.m(), 0.0f, ((CarouselLayoutManager) recyclerView.getLayoutManager()).f34148b.i(), paint);
            } else {
                canvas2 = canvas;
                canvas2.drawLine(((CarouselLayoutManager) recyclerView.getLayoutManager()).f34148b.j(), 0.0f, ((CarouselLayoutManager) recyclerView.getLayoutManager()).f34148b.k(), 0.0f, paint);
            }
            canvas = canvas2;
        }
    }
}
