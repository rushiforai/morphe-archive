package k9;

import android.graphics.Bitmap;

/* loaded from: classes2.dex */
public final class g implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public boolean f71233a;

    /* renamed from: b, reason: collision with root package name */
    public Bitmap.Config f71234b;

    /* renamed from: c, reason: collision with root package name */
    public int f71235c;

    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final g clone() {
        try {
            return (g) super.clone();
        } catch (CloneNotSupportedException e3) {
            throw new AssertionError(e3);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f71233a == gVar.f71233a && this.f71234b == gVar.f71234b && this.f71235c == gVar.f71235c;
    }

    public final int hashCode() {
        int iHashCode = this.f71234b.hashCode() ^ this.f71235c;
        return this.f71233a ? iHashCode : -iHashCode;
    }
}
