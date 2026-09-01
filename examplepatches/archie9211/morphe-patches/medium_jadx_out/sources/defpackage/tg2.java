package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tg2 extends q62 {
    public final String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tg2(String str) {
        super(l3d.GOOGLE, str, null, null, null, 20);
        str.getClass();
        this.f = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof tg2) && g76.L(this.f, ((tg2) obj).f);
    }

    public final int hashCode() {
        return this.f.hashCode() * 31;
    }

    public final String toString() {
        return ev6.x("Google(token=", this.f, ", email=null)");
    }
}
