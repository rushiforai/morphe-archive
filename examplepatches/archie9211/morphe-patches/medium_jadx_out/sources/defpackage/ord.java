package defpackage;

import android.graphics.Bitmap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ord {
    public abstract String a();

    public abstract Bitmap b(Bitmap bitmap, cfc cfcVar);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ord) && g76.L(a(), ((ord) obj).a());
    }

    public int hashCode() {
        return a().hashCode();
    }

    public final String toString() {
        return n1b.a.b(getClass()).j() + "(cacheKey=" + a() + ')';
    }
}
