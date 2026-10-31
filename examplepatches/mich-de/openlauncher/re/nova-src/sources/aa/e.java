package aa;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;

/* loaded from: classes.dex */
public interface e {
    BitmapInfo a(Bitmap bitmap, int i5, c cVar, float f11, UserHandle userHandle);

    void b(Canvas canvas);

    Drawable e(Context context);
}
