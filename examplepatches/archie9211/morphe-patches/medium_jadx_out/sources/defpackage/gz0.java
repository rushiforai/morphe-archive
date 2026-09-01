package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gz0 implements wid {
    public final g3c a;
    public final float b;

    public gz0(g3c g3cVar, float f) {
        this.a = g3cVar;
        this.b = f;
    }

    @Override // defpackage.wid
    public final float a() {
        return this.b;
    }

    @Override // defpackage.wid
    public final long b() {
        int i = uu1.i;
        return uu1.h;
    }

    @Override // defpackage.wid
    public final /* synthetic */ wid c(wid widVar) {
        return wgd.b(this, widVar);
    }

    @Override // defpackage.wid
    public final wid d(m45 m45Var) {
        return !equals(vid.a) ? this : (wid) m45Var.invoke();
    }

    @Override // defpackage.wid
    public final ez0 e() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gz0)) {
            return false;
        }
        gz0 gz0Var = (gz0) obj;
        return this.a.equals(gz0Var.a) && Float.compare(this.b, gz0Var.b) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (this.a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BrushStyle(value=");
        sb.append(this.a);
        sb.append(", alpha=");
        return lv8.s(sb, this.b, ')');
    }
}
