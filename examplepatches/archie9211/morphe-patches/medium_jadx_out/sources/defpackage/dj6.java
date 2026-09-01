package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dj6 extends jj6 implements b55 {
    public final ej6 k;

    public dj6(ej6 ej6Var) {
        this.k = ej6Var;
    }

    @Override // defpackage.hj6
    public final mj6 D() {
        return this.k;
    }

    @Override // defpackage.si6
    public final fj6 a() {
        return this.k;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((dj6) this.k.o.getValue()).call(obj, obj2);
    }
}
