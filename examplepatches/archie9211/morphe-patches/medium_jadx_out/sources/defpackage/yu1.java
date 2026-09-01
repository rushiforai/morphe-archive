package defpackage;

import android.graphics.Canvas;
import android.graphics.Paint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu1 implements ew5 {
    public final int a;
    public Paint b;

    public yu1(int i) {
        this.a = i;
    }

    @Override // defpackage.ew5
    public final int a() {
        return -1;
    }

    @Override // defpackage.ew5
    public final int b() {
        return -1;
    }

    @Override // defpackage.ew5
    public final boolean c() {
        return true;
    }

    @Override // defpackage.ew5
    public final void d(Canvas canvas) {
        Paint paint = this.b;
        if (paint == null) {
            paint = new Paint();
            paint.setColor(this.a);
            this.b = paint;
        }
        canvas.drawPaint(paint);
    }

    @Override // defpackage.ew5
    public final long e() {
        return 0L;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yu1) && this.a == ((yu1) obj).a;
    }

    public final int hashCode() {
        return (((((this.a * 31) - 1) * 31) - 1) * 961) + 1231;
    }

    public final String toString() {
        return ho2.H(new StringBuilder("ColorImage(color="), this.a, ", width=-1, height=-1, size=0, shareable=true)");
    }
}
