package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gif {
    public final String a;
    public final Set b;

    public gif(String str, Set set) {
        this.a = str;
        this.b = set;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof gif)) {
            return false;
        }
        gif gifVar = (gif) obj;
        String str = gifVar.a;
        String str2 = this.a;
        if (str2 == null) {
            if (str != null) {
                return false;
            }
        } else if (!str2.equals(str)) {
            return false;
        }
        return this.b.equals(gifVar.b);
    }

    public final int hashCode() {
        String str = this.a;
        return this.b.hashCode() ^ (((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003);
    }

    public final String toString() {
        return km4.C(new StringBuilder("StandardIntegrityTokenRequest{requestHash="), this.a, ", verdictOptOut=", this.b.toString(), "}");
    }
}
