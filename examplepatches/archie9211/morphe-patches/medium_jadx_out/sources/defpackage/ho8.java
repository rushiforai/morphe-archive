package defpackage;

import android.graphics.Bitmap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ho8 {
    public final String a;
    public final Bitmap b;

    public ho8(String str, Bitmap bitmap) {
        this.a = str;
        this.b = bitmap;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ho8)) {
            return false;
        }
        ho8 ho8Var = (ho8) obj;
        return this.a.equals(ho8Var.a) && this.b.equals(ho8Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ImageDownloaded(key=" + this.a + ", bitmap=" + this.b + ")";
    }
}
