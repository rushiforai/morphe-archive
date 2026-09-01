package defpackage;

import kotlin.reflect.full.IllegalCallableAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yh6 extends lj6 implements x45 {
    public final zh6 k;

    public yh6(zh6 zh6Var) {
        this.k = zh6Var;
    }

    @Override // defpackage.hj6
    public final mj6 D() {
        return this.k;
    }

    @Override // defpackage.si6
    public final fj6 a() {
        return this.k;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws IllegalCallableAccessException {
        ((yh6) this.k.p.getValue()).call(obj);
        return c1e.a;
    }
}
