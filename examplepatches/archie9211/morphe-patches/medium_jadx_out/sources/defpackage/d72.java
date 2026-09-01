package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d72 {
    public final Uri a;
    public final boolean b;

    public d72(boolean z, Uri uri) {
        this.a = uri;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!d72.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        d72 d72Var = (d72) obj;
        return this.a.equals(d72Var.a) && this.b == d72Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }
}
