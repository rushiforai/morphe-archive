package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uba {
    public final Object a;
    public final Integer b;
    public final rba c;
    public final String d;

    public uba(Object obj, Integer num, rba rbaVar, String str) {
        rbaVar.getClass();
        this.a = obj;
        this.b = num;
        this.c = rbaVar;
        this.d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uba)) {
            return false;
        }
        uba ubaVar = (uba) obj;
        return g76.L(this.a, ubaVar.a) && g76.L(this.b, ubaVar.b) && this.c == ubaVar.c && g76.L(this.d, ubaVar.d);
    }

    public final int hashCode() {
        Object obj = this.a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        Integer num = this.b;
        int iHashCode2 = (this.c.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31)) * 31;
        String str = this.d;
        return iHashCode2 + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        return "PostsQuery(idResult=" + bjb.d(this.a) + ", year=" + this.b + ", sort=" + this.c + ", tagId=" + this.d + ")";
    }
}
