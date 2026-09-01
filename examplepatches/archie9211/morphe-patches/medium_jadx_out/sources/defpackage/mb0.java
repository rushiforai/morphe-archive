package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mb0 {
    public final String a;
    public final String b;
    public final String c;
    public final sw5 d;
    public final boolean e;

    public mb0(ytd ytdVar) {
        wtd wtdVar = ytdVar.a;
        String str = wtdVar.a;
        String str2 = wtdVar.c;
        vtd vtdVar = wtdVar.e;
        String str3 = vtdVar != null ? vtdVar.b : null;
        sw5 sw5Var = wtdVar.d;
        boolean z = ytdVar.d;
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sw5Var;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mb0)) {
            return false;
        }
        mb0 mb0Var = (mb0) obj;
        return this.a.equals(mb0Var.a) && g76.L(this.b, mb0Var.b) && g76.L(this.c, mb0Var.c) && g76.L(this.d, mb0Var.d) && this.e == mb0Var.e;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        sw5 sw5Var = this.d;
        return ((iHashCode3 + (sw5Var != null ? sw5Var.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NotificationState(postId=", this.a, ", postTitle=", this.b, ", authorName=");
        sbU.append(this.c);
        sbU.append(", imageData=");
        sbU.append(this.d);
        sbU.append(", isPlaying=");
        return lv8.t(sbU, this.e, ")");
    }
}
