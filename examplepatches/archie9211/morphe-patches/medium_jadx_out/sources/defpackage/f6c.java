package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f6c extends g6c {
    public final Uri a;
    public final String b;

    public f6c(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        this.a = uri;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f6c)) {
            return false;
        }
        f6c f6cVar = (f6c) obj;
        return g76.L(this.a, f6cVar.a) && g76.L(this.b, f6cVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ShareToInstagramStories(uri=" + this.a + ", facebookApplicationId=" + this.b + ")";
    }
}
