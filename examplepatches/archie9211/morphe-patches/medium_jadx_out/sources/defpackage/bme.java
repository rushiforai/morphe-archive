package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bme implements cme {
    public final boolean a;
    public final String b;

    public bme(boolean z, String str) {
        this.a = z;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bme)) {
            return false;
        }
        bme bmeVar = (bme) obj;
        return this.a == bmeVar.a && g76.L(this.b, bmeVar.b);
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        String str = this.b;
        return i + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "NoReposts(isCurrentUser=" + this.a + ", userName=" + this.b + ")";
    }
}
