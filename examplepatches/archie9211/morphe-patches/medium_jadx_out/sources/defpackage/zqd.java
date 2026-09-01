package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zqd implements crd {
    public final int a;

    public zqd(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zqd) && this.a == ((zqd) obj).a;
    }

    @Override // defpackage.crd
    public final int getCount() {
        return this.a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("Direct(count=", this.a, ")");
    }
}
