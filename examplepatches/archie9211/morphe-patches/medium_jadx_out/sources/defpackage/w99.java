package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class w99 {
    public final long a;
    public final long b;
    public final int c;

    public w99(long j, long j2, int i) {
        this.a = j;
        this.b = j2;
        this.c = i;
        rkd[] rkdVarArr = qkd.b;
        if ((j & 1095216660480L) == 0) {
            c26.a("width cannot be TextUnit.Unspecified");
        }
        if ((j2 & 1095216660480L) == 0) {
            c26.a("height cannot be TextUnit.Unspecified");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w99)) {
            return false;
        }
        w99 w99Var = (w99) obj;
        return qkd.a(this.a, w99Var.a) && qkd.a(this.b, w99Var.b) && this.c == w99Var.c;
    }

    public final int hashCode() {
        rkd[] rkdVarArr = qkd.b;
        return ((ev6.n(this.b) + (ev6.n(this.a) * 31)) * 31) + this.c;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Placeholder(width=");
        sb.append((Object) qkd.e(this.a));
        sb.append(", height=");
        sb.append((Object) qkd.e(this.b));
        sb.append(", placeholderVerticalAlign=");
        int i = this.c;
        sb.append((Object) (i == 1 ? "AboveBaseline" : i == 2 ? "Top" : i == 3 ? uuLAxLN.AJXfEyRYpc : i == 4 ? "Center" : i == 5 ? "TextTop" : i == 6 ? "TextBottom" : i == 7 ? "TextCenter" : "Invalid"));
        sb.append(')');
        return sb.toString();
    }
}
