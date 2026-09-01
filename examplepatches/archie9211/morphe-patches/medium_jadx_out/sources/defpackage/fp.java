package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fp {
    public final Context a;
    public final m73 b;
    public final long c;
    public final jy8 d;

    public fp(Context context, m73 m73Var, long j, jy8 jy8Var) {
        this.a = context;
        this.b = m73Var;
        this.c = j;
        this.d = jy8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!fp.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        fp fpVar = (fp) obj;
        if (!g76.L(this.a, fpVar.a) || !g76.L(this.b, fpVar.b)) {
            return false;
        }
        long j = fpVar.c;
        int i = uu1.i;
        return ezd.a(this.c, j) && this.d.equals(fpVar.d);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        int i = uu1.i;
        return this.d.hashCode() + lv8.g(iHashCode, 31, this.c);
    }
}
