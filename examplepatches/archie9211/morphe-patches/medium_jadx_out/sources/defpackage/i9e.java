package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i9e implements k9e {
    public final boolean a;
    public final String b;

    public i9e(boolean z, String str) {
        this.a = z;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i9e)) {
            return false;
        }
        i9e i9eVar = (i9e) obj;
        return this.a == i9eVar.a && g76.L(this.b, i9eVar.b);
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        String str = this.b;
        return i + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "NoActivity(isCurrentUser=" + this.a + ", userName=" + this.b + ")";
    }
}
