package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c51 extends f51 implements tx0 {
    public final Object g;

    public c51(Field field, boolean z, Object obj) {
        super(field, z, false);
        this.g = obj;
    }

    @Override // defpackage.f51, defpackage.v41
    public final Object call(Object[] objArr) throws IllegalAccessException {
        objArr.getClass();
        d(objArr);
        ((Field) this.a).set(this.g, k80.t0(objArr));
        return c1e.a;
    }
}
