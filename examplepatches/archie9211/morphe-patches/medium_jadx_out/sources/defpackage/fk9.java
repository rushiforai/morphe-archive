package defpackage;

import com.medium.android.graphql.type.PublicationSubmissionStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fk9 implements gk9 {
    public final PublicationSubmissionStatus a;
    public final String b;
    public final String c;
    public final String d;

    public fk9(PublicationSubmissionStatus publicationSubmissionStatus, String str, String str2, String str3) {
        publicationSubmissionStatus.getClass();
        str.getClass();
        this.a = publicationSubmissionStatus;
        this.b = str;
        this.c = str2;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fk9)) {
            return false;
        }
        fk9 fk9Var = (fk9) obj;
        return this.a == fk9Var.a && g76.L(this.b, fk9Var.b) && g76.L(this.c, fk9Var.c) && g76.L(this.d, fk9Var.d);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("InactiveSubmission(status=");
        sb.append(this.a);
        sb.append(", publicationId=");
        sb.append(this.b);
        sb.append(", publicationName=");
        return km4.C(sb, this.c, ", publicationAvatar=", this.d, ")");
    }
}
