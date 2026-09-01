package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bnd implements and {
    public final boolean a;
    public final String b;
    public final String c;
    public final SourceParameter d;
    public final String e;
    public final Throwable f;

    public bnd(boolean z, String str, String str2, SourceParameter sourceParameter, String str3, Throwable th) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        str3.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = sourceParameter;
        this.e = str3;
        this.f = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bnd)) {
            return false;
        }
        bnd bndVar = (bnd) obj;
        return this.a == bndVar.a && g76.L(this.b, bndVar.b) && g76.L(this.c, bndVar.c) && g76.L(this.d, bndVar.d) && g76.L(this.e, bndVar.e) && this.f.equals(bndVar.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + wgd.o(ev6.o(this.d, wgd.o(wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b), 31, this.c), 31), 31, this.e);
    }

    public final String toString() {
        return "ToggleMuteAuthorFailure(isMuted=" + this.a + ", creatorId=" + this.b + ", postId=" + this.c + ", sourceParameter=" + this.d + ", referrerSource=" + this.e + ", exception=" + this.f + ")";
    }
}
