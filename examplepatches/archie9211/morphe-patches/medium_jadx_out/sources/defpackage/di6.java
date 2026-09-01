package defpackage;

import kotlin.reflect.full.IllegalCallableAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class di6 extends lj6 implements c55 {
    public final ei6 k;

    public di6(ei6 ei6Var) {
        this.k = ei6Var;
    }

    @Override // defpackage.hj6
    public final mj6 D() {
        return this.k;
    }

    @Override // defpackage.si6
    public final fj6 a() {
        return this.k;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) throws IllegalCallableAccessException {
        ((di6) this.k.p.getValue()).call(obj, obj2, obj3);
        return c1e.a;
    }
}
