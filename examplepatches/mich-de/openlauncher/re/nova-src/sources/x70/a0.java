package x70;

import kotlin.jvm.internal.Intrinsics;
import w70.g2;
import w70.t1;

/* loaded from: classes.dex */
public final class a0 extends t1 implements g2 {
    @Override // w70.g2
    public final Object getValue() {
        Integer numValueOf;
        synchronized (this) {
            Object[] objArr = this.f94024h;
            Intrinsics.d(objArr);
            numValueOf = Integer.valueOf(((Number) objArr[((int) ((this.f94025i + ((int) ((o() + this.f94027k) - this.f94025i))) - 1)) & (objArr.length - 1)]).intValue());
        }
        return numValueOf;
    }

    public final void v(int i5) {
        synchronized (this) {
            Object[] objArr = this.f94024h;
            Intrinsics.d(objArr);
            c(Integer.valueOf(((Number) objArr[((int) ((this.f94025i + ((int) ((o() + this.f94027k) - this.f94025i))) - 1)) & (objArr.length - 1)]).intValue() + i5));
        }
    }
}
