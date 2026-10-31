package aa;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Path;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public abstract class p {
    public static byte[] a(Bitmap bitmap) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bitmap.getHeight() * bitmap.getWidth() * 4);
        try {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException unused) {
            Log.w("GraphicsUtils", "Could not write bitmap");
            return null;
        }
    }

    public static int b(Context context, int i5) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{i5});
        int color = typedArrayObtainStyledAttributes.getColor(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        return color;
    }

    public static Path c() {
        AdaptiveIconDrawable adaptiveIconDrawable = new AdaptiveIconDrawable(new ColorDrawable(-16777216), new ColorDrawable(-16777216));
        adaptiveIconDrawable.setBounds(0, 0, 100, 100);
        return new Path(adaptiveIconDrawable.getIconMask());
    }

    public static int d(int i5, int i11) {
        if (i11 < 0) {
            i11 = 0;
        } else if (i11 > 255) {
            i11 = 255;
        }
        return (i5 & 16777215) | (i11 << 24);
    }
}
