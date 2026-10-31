package r10;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z1 implements a9.b {

    /* renamed from: a, reason: collision with root package name */
    public final int f85327a;

    /* renamed from: b, reason: collision with root package name */
    public final PorterDuffColorFilter f85328b;

    /* renamed from: c, reason: collision with root package name */
    public final String f85329c;

    public z1(int i5) {
        this.f85327a = i5;
        this.f85328b = new PorterDuffColorFilter(i5, PorterDuff.Mode.SRC_ATOP);
        this.f85329c = b.c0.l("Tint(", Integer.toHexString(i5), ")");
    }

    @Override // a9.b
    public final Bitmap a(Bitmap bitmap, y8.f fVar) {
        int height;
        int width;
        if (Intrinsics.b(fVar, y8.f.f96844c)) {
            width = bitmap.getWidth();
            height = bitmap.getHeight();
        } else {
            v4.a aVar = fVar.f96845a;
            int i5 = aVar instanceof y8.a ? ((y8.a) aVar).f96839d : 0;
            v4.a aVar2 = fVar.f96846b;
            int i11 = i5;
            height = aVar2 instanceof y8.a ? ((y8.a) aVar2).f96839d : 0;
            width = i11;
        }
        Bitmap.Config config = bitmap.getConfig();
        Intrinsics.d(config);
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, config);
        Paint paint = new Paint();
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        paint.setColor(-1);
        paint.setColorFilter(this.f85328b);
        canvas.drawBitmap(bitmap, 0.0f, 0.0f, paint);
        return bitmapCreateBitmap;
    }

    @Override // a9.b
    public final String b() {
        return this.f85329c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof z1) && this.f85327a == ((z1) obj).f85327a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f85327a);
    }

    public final String toString() {
        return this.f85329c;
    }
}
