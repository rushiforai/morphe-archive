package i30;

import android.graphics.Bitmap;

/* loaded from: classes4.dex */
public final class w implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public boolean f61364a;

    /* renamed from: b, reason: collision with root package name */
    public Bitmap.Config f61365b;

    /* renamed from: c, reason: collision with root package name */
    public int f61366c;

    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final w clone() {
        try {
            return (w) super.clone();
        } catch (CloneNotSupportedException e3) {
            throw new AssertionError(e3);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return this.f61364a == wVar.f61364a && this.f61365b == wVar.f61365b && this.f61366c == wVar.f61366c;
    }

    public final int hashCode() {
        int iHashCode = this.f61365b.hashCode() ^ this.f61366c;
        return this.f61364a ? iHashCode : -iHashCode;
    }
}
