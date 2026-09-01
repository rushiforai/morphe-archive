package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class am1 extends ord {
    public final String a = String.valueOf(n1b.a.b(am1.class).d());

    @Override // defpackage.ord
    public final String a() {
        return this.a;
    }

    @Override // defpackage.ord
    public final Bitmap b(Bitmap bitmap, cfc cfcVar) {
        int iMin = Math.min(bitmap.getWidth(), bitmap.getHeight());
        Bitmap.Config config = bitmap.getConfig();
        if (config == null) {
            config = Bitmap.Config.ARGB_8888;
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iMin, iMin, config);
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        Paint paintS = qq7.s(bitmap, iMin, iMin);
        float f = iMin / 2.0f;
        canvas.drawCircle(f, f, f, paintS);
        return bitmapCreateBitmap;
    }
}
