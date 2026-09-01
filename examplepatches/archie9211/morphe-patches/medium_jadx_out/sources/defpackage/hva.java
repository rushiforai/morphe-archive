package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hva {
    public final Context a;
    public final ox5 b;
    public final w5d c;
    public final w5d d;
    public final w5d e;
    public final gz1 f;

    public hva(Context context, ox5 ox5Var, w5d w5dVar, w5d w5dVar2, w5d w5dVar3, gz1 gz1Var) {
        this.a = context;
        this.b = ox5Var;
        this.c = w5dVar;
        this.d = w5dVar2;
        this.e = w5dVar3;
        this.f = gz1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof hva) {
            hva hvaVar = (hva) obj;
            return g76.L(this.a, hvaVar.a) && this.b.equals(hvaVar.b) && this.c == hvaVar.c && this.d == hvaVar.d && this.e == hvaVar.e && this.f == hvaVar.f;
        }
        return false;
    }

    public final int hashCode() {
        return (this.f.hashCode() + ((j34.a.hashCode() + ((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
    }

    public final String toString() {
        return "Options(application=" + this.a + ", defaults=" + this.b + ", mainCoroutineContextLazy=" + this.c + ", memoryCacheLazy=" + this.d + ", diskCacheLazy=" + this.e + ", eventListenerFactory=" + j34.a + ", componentRegistry=" + this.f + ", logger=null)";
    }
}
