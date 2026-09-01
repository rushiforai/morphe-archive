package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bg8 implements cg8 {
    public final String a;

    public bg8(String str) {
        str.getClass();
        this.a = str;
    }

    @Override // defpackage.cg8
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof bg8) && g76.L(this.a, ((bg8) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x("Subscribed(newsletterId=", this.a, ")");
    }
}
