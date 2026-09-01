package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class end implements and {
    public final boolean a;
    public final String b;
    public final String c;
    public final SourceParameter d;
    public final String e;

    public end(boolean z, String str, String str2, SourceParameter sourceParameter, String str3) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        str3.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = sourceParameter;
        this.e = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof end)) {
            return false;
        }
        end endVar = (end) obj;
        return this.a == endVar.a && g76.L(this.b, endVar.b) && g76.L(this.c, endVar.c) && g76.L(this.d, endVar.d) && g76.L(this.e, endVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ev6.o(this.d, wgd.o(wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b), 31, this.c), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ToggleMutePublicationSuccess(isMuted=");
        sb.append(this.a);
        sb.append(", collectionId=");
        sb.append(this.b);
        sb.append(", postId=");
        sb.append(this.c);
        sb.append(", sourceParameter=");
        sb.append(this.d);
        sb.append(", referrerSource=");
        return ka1.v(sb, this.e, ")");
    }
}
