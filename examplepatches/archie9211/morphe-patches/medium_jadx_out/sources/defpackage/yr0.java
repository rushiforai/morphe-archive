package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yr0 implements ew5 {
    public final Bitmap a;

    public yr0(Bitmap bitmap) {
        this.a = bitmap;
    }

    @Override // defpackage.ew5
    public final int a() {
        return this.a.getHeight();
    }

    @Override // defpackage.ew5
    public final int b() {
        return this.a.getWidth();
    }

    @Override // defpackage.ew5
    public final boolean c() {
        return true;
    }

    @Override // defpackage.ew5
    public final void d(Canvas canvas) {
        canvas.drawBitmap(this.a, 0.0f, 0.0f, (Paint) null);
    }

    @Override // defpackage.ew5
    public final long e() {
        return u36.j(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yr0) && g76.L(this.a, ((yr0) obj).a);
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + 1231;
    }

    public final String toString() {
        return "BitmapImage(bitmap=" + this.a + ", shareable=true)";
    }
}
