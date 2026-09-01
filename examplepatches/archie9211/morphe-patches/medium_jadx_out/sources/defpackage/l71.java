package defpackage;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.carousel.CarouselLayoutManager;
import com.medium.reader.R;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l71 extends qxa {
    public final Paint a;
    public final List b;

    public l71() {
        Paint paint = new Paint();
        this.a = paint;
        this.b = DesugarCollections.unmodifiableList(new ArrayList());
        paint.setStrokeWidth(5.0f);
        paint.setColor(-65281);
    }

    @Override // defpackage.qxa
    public final void a(Canvas canvas, RecyclerView recyclerView) {
        int iF;
        Canvas canvas2;
        int iD;
        float dimension = recyclerView.getResources().getDimension(R.dimen.m3_carousel_debug_keyline_width);
        Paint paint = this.a;
        paint.setStrokeWidth(dimension);
        Iterator it2 = this.b.iterator();
        while (it2.hasNext()) {
            ((bl6) it2.next()).getClass();
            ThreadLocal threadLocal = rv1.a;
            float f = 1.0f - 0.0f;
            paint.setColor(Color.argb((int) ((Color.alpha(-16776961) * 0.0f) + (Color.alpha(-65281) * f)), (int) ((Color.red(-16776961) * 0.0f) + (Color.red(-65281) * f)), (int) ((Color.green(-16776961) * 0.0f) + (Color.green(-65281) * f)), (int) ((Color.blue(-16776961) * 0.0f) + (Color.blue(-65281) * f))));
            int iE = 0;
            if (((CarouselLayoutManager) recyclerView.getLayoutManager()).F0()) {
                m71 m71Var = ((CarouselLayoutManager) recyclerView.getLayoutManager()).q;
                switch (m71Var.b) {
                    case 0:
                        break;
                    default:
                        iE = m71Var.c.G();
                        break;
                }
                float f2 = iE;
                m71 m71Var2 = ((CarouselLayoutManager) recyclerView.getLayoutManager()).q;
                switch (m71Var2.b) {
                    case 0:
                        iD = m71Var2.c.o;
                        break;
                    default:
                        CarouselLayoutManager carouselLayoutManager = m71Var2.c;
                        iD = carouselLayoutManager.o - carouselLayoutManager.D();
                        break;
                }
                float f3 = iD;
                canvas2 = canvas;
                canvas2.drawLine(0.0f, f2, 0.0f, f3, paint);
            } else {
                m71 m71Var3 = ((CarouselLayoutManager) recyclerView.getLayoutManager()).q;
                switch (m71Var3.b) {
                    case 0:
                        iE = m71Var3.c.E();
                        break;
                }
                float f4 = iE;
                m71 m71Var4 = ((CarouselLayoutManager) recyclerView.getLayoutManager()).q;
                switch (m71Var4.b) {
                    case 0:
                        CarouselLayoutManager carouselLayoutManager2 = m71Var4.c;
                        iF = carouselLayoutManager2.n - carouselLayoutManager2.F();
                        break;
                    default:
                        iF = m71Var4.c.n;
                        break;
                }
                canvas2 = canvas;
                canvas2.drawLine(f4, 0.0f, iF, 0.0f, paint);
            }
            canvas = canvas2;
        }
    }
}
