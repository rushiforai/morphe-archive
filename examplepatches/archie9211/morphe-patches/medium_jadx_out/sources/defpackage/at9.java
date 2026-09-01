package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.medium.android.core.models.ReadingContext;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class at9 implements ou9 {
    public final String a;
    public final String b;
    public final String c;
    public final ReadingContext d;

    public at9(String str, String str2, String str3, ReadingContext readingContext, int i) {
        str3 = (i & 4) != 0 ? null : str3;
        readingContext = (i & 8) != 0 ? ReadingContext.Default.INSTANCE : readingContext;
        str.getClass();
        str2.getClass();
        readingContext.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = readingContext;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof at9)) {
            return false;
        }
        at9 at9Var = (at9) obj;
        return g76.L(this.a, at9Var.a) && g76.L(this.b, at9Var.b) && g76.L(this.c, at9Var.c) && this.d.equals(at9Var.d);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return this.d.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToPost(postId=", this.a, ", source=", this.b, ", paragraphName=");
        sbU.append(this.c);
        sbU.append(", readingContext=");
        sbU.append(this.d);
        sbU.append(kSWQKWZ.iMEDXto);
        return sbU.toString();
    }
}
