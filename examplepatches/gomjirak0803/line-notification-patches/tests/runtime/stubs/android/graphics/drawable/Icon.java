package android.graphics.drawable;

import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;

public final class Icon implements Parcelable {
    private final String kind;
    private final Bitmap bitmap;

    private Icon(String kind, Bitmap bitmap) {
        this.kind = kind;
        this.bitmap = bitmap;
    }

    public static Icon createWithBitmap(Bitmap bits) {
        return new Icon("bitmap", bits);
    }

    public static Icon createWithResource(String resPackage, int resId) {
        return new Icon("res:" + resPackage + ":" + resId, null);
    }

    public Bitmap getBitmapForTest() { return bitmap; }
    @Override public String toString() { return "Icon(" + kind + ")"; }
    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}
}
