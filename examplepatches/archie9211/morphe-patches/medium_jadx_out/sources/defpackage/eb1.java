package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eb1 implements bc1 {
    public final int a;

    public eb1(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof eb1) && this.a == ((eb1) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("DownloadListFailed(resId=", this.a, ")");
    }
}
