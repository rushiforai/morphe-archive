package defpackage;

import kotlin.reflect.full.IllegalCallableAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class c78 extends d78 implements ai6 {
    public c78(Class cls, String str, String str2, int i) {
        super(h41.NO_RECEIVER, cls, str, str2, i);
    }

    @Override // defpackage.fj6
    public final zi6 b() {
        return ((ai6) getReflected()).b();
    }

    @Override // defpackage.fi6
    public final bi6 c() {
        return ((ai6) getReflected()).c();
    }

    @Override // defpackage.h41
    public final rg6 computeReflected() {
        return n1b.a.e(this);
    }

    public Object get(Object obj) {
        return b().call(obj);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return get(obj);
    }

    public void m(Object obj, Object obj2) throws IllegalCallableAccessException {
        c().call(obj, obj2);
    }
}
