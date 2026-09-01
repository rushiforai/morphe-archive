package defpackage;

import android.util.Base64;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lz4 {
    public final String a;
    public final String b;
    public final String c;
    public final List d;
    public final String e;
    public final String f;
    public final String g;

    public lz4(String str, String str2, String str3, List list, String str4, String str5) {
        str.getClass();
        this.a = str;
        str2.getClass();
        this.b = str2;
        this.c = str3;
        list.getClass();
        this.d = list;
        this.e = str4;
        this.f = str5;
        this.g = km4.C(y30.u(str, "-", str2, "-", str3), "-", str4, "-", str5);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FontRequest {mProviderAuthority: ");
        sb.append(this.a);
        sb.append(", mProviderPackage: ");
        sb.append(this.b);
        sb.append(", mQuery: ");
        sb.append(this.c);
        sb.append(", mSystemFont: ");
        sb.append(this.e);
        sb.append(", mVariationSettings: ");
        StringBuilder sb2 = new StringBuilder(ka1.v(sb, this.f, ", mCertificates:"));
        int i = 0;
        while (true) {
            List list = this.d;
            if (i >= list.size()) {
                sb2.append("}mCertificatesArray: 0");
                return sb2.toString();
            }
            sb2.append(" [");
            List list2 = (List) list.get(i);
            for (int i2 = 0; i2 < list2.size(); i2++) {
                sb2.append(" \"");
                sb2.append(Base64.encodeToString((byte[]) list2.get(i2), 0));
                sb2.append("\"");
            }
            sb2.append(" ]");
            i++;
        }
    }
}
