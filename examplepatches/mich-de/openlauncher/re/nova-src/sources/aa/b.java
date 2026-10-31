package aa;

import android.graphics.drawable.BitmapDrawable;

/* loaded from: classes.dex */
public final class b extends BitmapDrawable {
    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return getBitmap().getWidth();
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return getBitmap().getWidth();
    }
}
