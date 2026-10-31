package u20;

import android.widget.ImageView;

/* loaded from: classes4.dex */
public abstract class e {
    public boolean a() {
        return false;
    }

    public ImageView.ScaleType b() {
        return ImageView.ScaleType.FIT_CENTER;
    }

    public abstract CharSequence c();

    public String toString() {
        return "ThumbnailInfo{" + ((Object) c()) + "}";
    }
}
