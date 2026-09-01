package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dbg extends bzf {
    public final int a;
    public final bbg b;

    public dbg(int i, bbg bbgVar) {
        this.a = i;
        this.b = bbgVar;
    }

    public static d2f b() {
        d2f d2fVar = new d2f(17);
        d2fVar.b = null;
        d2fVar.c = bbg.d;
        return d2fVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.b != bbg.d;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof dbg)) {
            return false;
        }
        dbg dbgVar = (dbg) obj;
        return dbgVar.a == this.a && dbgVar.b == this.b;
    }

    public final int hashCode() {
        return Objects.hash(dbg.class, Integer.valueOf(this.a), this.b);
    }

    public final String toString() {
        return ho2.C(this.a, "AesSiv Parameters (variant: ", String.valueOf(this.b), ", ", "-byte key)");
    }
}
