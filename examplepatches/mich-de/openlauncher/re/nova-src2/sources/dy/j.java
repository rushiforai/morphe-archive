package dy;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

/* loaded from: classes4.dex */
public final class j extends h {
    @Override // dy.h, java.lang.ThreadLocal
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final BitmapFactory.Options get() {
        BitmapFactory.Options options = (BitmapFactory.Options) super.get();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        options.inJustDecodeBounds = false;
        return options;
    }

    @Override // java.lang.ThreadLocal
    public final Object initialValue() {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inTempStorage = f.a();
        return options;
    }
}
