package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r66 extends s66 {
    @Override // defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        Object obj = objArr[0];
        Object[] objArrM0 = objArr.length <= 1 ? new Object[0] : k80.m0(1, objArr.length, objArr);
        return this.a.invoke(obj, Arrays.copyOf(objArrM0, objArrM0.length));
    }
}
