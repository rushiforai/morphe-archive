package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jc7 {
    public final int a;

    public /* synthetic */ jc7(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof jc7) {
            return this.a == ((jc7) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("RawRes(resId=", this.a, ")");
    }
}
