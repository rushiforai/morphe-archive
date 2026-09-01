package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aud {
    public final String a;
    public final String b;

    public aud(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final long a(float f) {
        return ((long) (((muc.p0(this.b, new String[]{" "}, 0, 6).size() * f) * 200.0f) / 60.0f)) / 10;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aud)) {
            return false;
        }
        aud audVar = (aud) obj;
        return g76.L(this.a, audVar.a) && this.b.equals(audVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("Track(utteranceId=", this.a, ", text=", this.b, ")");
    }
}
