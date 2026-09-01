package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ew8 {
    public final Context a;
    public final cfc b;
    public final dqb c;
    public final ux9 d;
    public final String e;
    public final ch4 f;
    public final j31 g;
    public final j31 h;
    public final j31 i;
    public final r84 j;

    public ew8(Context context, cfc cfcVar, dqb dqbVar, ux9 ux9Var, String str, ch4 ch4Var, j31 j31Var, j31 j31Var2, j31 j31Var3, r84 r84Var) {
        this.a = context;
        this.b = cfcVar;
        this.c = dqbVar;
        this.d = ux9Var;
        this.e = str;
        this.f = ch4Var;
        this.g = j31Var;
        this.h = j31Var2;
        this.i = j31Var3;
        this.j = r84Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ew8)) {
            return false;
        }
        ew8 ew8Var = (ew8) obj;
        return g76.L(this.a, ew8Var.a) && g76.L(this.b, ew8Var.b) && this.c == ew8Var.c && this.d == ew8Var.d && g76.L(this.e, ew8Var.e) && g76.L(this.f, ew8Var.f) && this.g == ew8Var.g && this.h == ew8Var.h && this.i == ew8Var.i && g76.L(this.j, ew8Var.j);
    }

    public final int hashCode() {
        int iHashCode = (this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31;
        String str = this.e;
        return this.j.a.hashCode() + ((this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Options(context=" + this.a + ", size=" + this.b + ", scale=" + this.c + ", precision=" + this.d + ", diskCacheKey=" + this.e + ", fileSystem=" + this.f + ", memoryCachePolicy=" + this.g + ", diskCachePolicy=" + this.h + ", networkCachePolicy=" + this.i + ", extras=" + this.j + ')';
    }
}
