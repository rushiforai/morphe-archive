package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f9a implements q9a {
    public final o9a a;
    public final i9a b;
    public final boolean c;
    public final SourceParameter d;
    public final String e;
    public final boolean f;

    public f9a(o9a o9aVar, i9a i9aVar, boolean z, SourceParameter sourceParameter) {
        o9aVar.getClass();
        i9aVar.getClass();
        sourceParameter.getClass();
        this.a = o9aVar;
        this.b = i9aVar;
        this.c = z;
        this.d = sourceParameter;
        this.e = o9aVar.a;
        this.f = o9aVar.d || i9aVar.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f9a)) {
            return false;
        }
        f9a f9aVar = (f9a) obj;
        return this.a.equals(f9aVar.a) && this.b.equals(f9aVar.b) && this.c == f9aVar.c && g76.L(this.d, f9aVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Content(monthlyContent=" + this.a + ", lifeTimeContent=" + this.b + ", showBottomSheet=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}
