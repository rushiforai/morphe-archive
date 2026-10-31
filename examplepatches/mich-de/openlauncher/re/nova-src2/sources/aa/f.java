package aa;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Picture;
import android.os.Build;

/* loaded from: classes.dex */
public interface f {
    public static final boolean No;

    static {
        No = Build.VERSION.SDK_INT >= 28;
    }

    static Bitmap a(int i5, int i11, f fVar) {
        if (!No) {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
            fVar.b(new Canvas(bitmapCreateBitmap));
            return bitmapCreateBitmap;
        }
        Picture picture = new Picture();
        fVar.b(picture.beginRecording(i5, i11));
        picture.endRecording();
        return Bitmap.createBitmap(picture);
    }

    void b(Canvas canvas);
}
