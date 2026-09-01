package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class asd implements zrd {
    public final Object a;
    public final Object b;

    public asd(Object obj, Object obj2) {
        this.a = obj;
        this.b = obj2;
    }

    @Override // defpackage.zrd
    public final Object a() {
        return this.a;
    }

    @Override // defpackage.zrd
    public final boolean b(Object obj, Object obj2) {
        return g76.L(obj, a()) && g76.L(obj2, c());
    }

    @Override // defpackage.zrd
    public final Object c() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zrd)) {
            return false;
        }
        zrd zrdVar = (zrd) obj;
        return g76.L(this.a, zrdVar.a()) && g76.L(this.b, zrdVar.c());
    }

    public final int hashCode() {
        Object obj = this.a;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * 31;
        Object obj2 = this.b;
        return iHashCode + (obj2 != null ? obj2.hashCode() : 0);
    }
}
