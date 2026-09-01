package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zz4 {
    public final int a;

    public /* synthetic */ zz4(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zz4) {
            return this.a == ((zz4) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        int i = this.a;
        return i == 0 ? "Normal" : i == 1 ? "Italic" : "Invalid";
    }
}
