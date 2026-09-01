package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ard implements crd {
    public final int a;

    public ard(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ard) && this.a == ((ard) obj).a;
    }

    @Override // defpackage.crd
    public final int getCount() {
        return this.a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("Others(count=", this.a, ")");
    }
}
