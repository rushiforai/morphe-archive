package defpackage;

import java.util.Arrays;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lbb {
    public final String a;
    public final String b;
    public final Map c;
    public final byte[] d;

    public lbb(String str, String str2, Map map, byte[] bArr) {
        this.a = str;
        this.b = str2;
        this.c = map;
        this.d = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lbb)) {
            return false;
        }
        lbb lbbVar = (lbb) obj;
        return this.a.equals(lbbVar.a) && this.b.equals(lbbVar.b) && this.c.equals(lbbVar.c) && this.d.equals(lbbVar.d);
    }

    public final int hashCode() {
        return ((Arrays.hashCode(this.d) + ((this.c.hashCode() + wgd.o(((this.a.hashCode() * 31) + 1558061342) * 31, 31, this.b)) * 31)) * 31) - 43840953;
    }

    public final String toString() {
        String string = Arrays.toString(this.d);
        StringBuilder sbU = y30.u("Request(id=", this.a, ", description=Logs Request, url=", this.b, ", headers=");
        sbU.append(this.c);
        sbU.append(", body=");
        sbU.append(string);
        sbU.append(", contentType=application/json)");
        return sbU.toString();
    }
}
