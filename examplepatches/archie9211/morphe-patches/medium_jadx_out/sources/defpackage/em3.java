package defpackage;

import android.graphics.Canvas;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class em3 implements ew5 {
    public final Drawable a;

    public em3(Drawable drawable) {
        this.a = drawable;
    }

    @Override // defpackage.ew5
    public final int a() {
        return spe.a(this.a);
    }

    @Override // defpackage.ew5
    public final int b() {
        return spe.b(this.a);
    }

    @Override // defpackage.ew5
    public final boolean c() {
        return false;
    }

    @Override // defpackage.ew5
    public final void d(Canvas canvas) {
        this.a.draw(canvas);
    }

    @Override // defpackage.ew5
    public final long e() {
        Drawable drawable = this.a;
        long jB = ((long) spe.b(drawable)) * 4 * ((long) spe.a(drawable));
        if (jB < 0) {
            return 0L;
        }
        return jB;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof em3) && g76.L(this.a, ((em3) obj).a);
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + 1237;
    }

    public final String toString() {
        return "DrawableImage(drawable=" + this.a + ", shareable=false)";
    }
}
