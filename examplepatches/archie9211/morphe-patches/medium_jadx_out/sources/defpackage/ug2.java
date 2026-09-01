package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ug2 extends q62 {
    public final String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ug2(String str) {
        super(l3d.MEDIUM, str, null, null, null, 28);
        str.getClass();
        this.f = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ug2) && g76.L(this.f, ((ug2) obj).f);
    }

    public final int hashCode() {
        return this.f.hashCode();
    }

    public final String toString() {
        return ev6.x("Medium(token=", this.f, ")");
    }
}
