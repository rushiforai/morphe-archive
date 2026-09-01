package defpackage;

import kotlin.reflect.full.IllegalCallableAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bi6 extends lj6 implements b55 {
    public final ci6 k;

    public bi6(ci6 ci6Var) {
        this.k = ci6Var;
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
    public final Object invoke(Object obj, Object obj2) throws IllegalCallableAccessException {
        this.k.m(obj, obj2);
        return c1e.a;
    }
}
