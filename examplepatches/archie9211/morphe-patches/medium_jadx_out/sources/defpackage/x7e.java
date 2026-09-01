package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x7e extends w7e {
    public final String a;
    public final Throwable b;
    public final SourceParameter c;

    public x7e(SourceParameter sourceParameter, String str, Throwable th) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = th;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x7e)) {
            return false;
        }
        x7e x7eVar = (x7e) obj;
        return g76.L(this.a, x7eVar.a) && this.b.equals(x7eVar.b) && g76.L(this.c, x7eVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("UnMuteUserFailure(userId=");
        sb.append(this.a);
        sb.append(", exception=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
