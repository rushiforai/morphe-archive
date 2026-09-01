package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class u4a extends w4a implements xi6 {
    public u4a(Class cls, String str, String str2, int i) {
        super(h41.NO_RECEIVER, cls, str, str2, i);
    }

    @Override // defpackage.fj6
    public final zi6 b() {
        return ((xi6) getReflected()).b();
    }

    @Override // defpackage.h41
    public final rg6 computeReflected() {
        return n1b.a.g(this);
    }

    public Object get(Object obj) {
        return b().call(obj);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return get(obj);
    }
}
