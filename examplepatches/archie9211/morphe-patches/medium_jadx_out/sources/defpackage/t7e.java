package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t7e extends r7e {
    public final String a;
    public final SourceParameter b;

    public t7e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t7e)) {
            return false;
        }
        t7e t7eVar = (t7e) obj;
        return g76.L(this.a, t7eVar.a) && g76.L(this.b, t7eVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "MuteUserSuccess(userId=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
