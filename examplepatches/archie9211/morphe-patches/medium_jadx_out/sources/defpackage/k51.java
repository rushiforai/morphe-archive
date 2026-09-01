package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k51 extends f51 {
    public final /* synthetic */ int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k51(int i, int i2, Method method, boolean z) {
        super(method, z, i);
        this.g = i2;
    }

    @Override // defpackage.f51, defpackage.v41
    public final Object call(Object[] objArr) {
        int i = this.g;
        objArr.getClass();
        switch (i) {
            case 0:
                d(objArr);
                return f(objArr[0], objArr.length <= 1 ? new Object[0] : k80.m0(1, objArr.length, objArr));
            case 1:
                d(objArr);
                e(k80.u0(objArr));
                return f(null, objArr.length <= 1 ? new Object[0] : k80.m0(1, objArr.length, objArr));
            default:
                d(objArr);
                return f(null, objArr);
        }
    }
}
