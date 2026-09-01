package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uxc extends r6c implements vpc {
    @Override // defpackage.vpc
    public final Object getValue() {
        Integer numValueOf;
        synchronized (this) {
            Object[] objArr = this.h;
            objArr.getClass();
            numValueOf = Integer.valueOf(((Number) objArr[((int) ((this.i + ((long) ((int) ((q() + ((long) this.k)) - this.i)))) - 1)) & (objArr.length - 1)]).intValue());
        }
        return numValueOf;
    }

    public final void x(int i) {
        synchronized (this) {
            Object[] objArr = this.h;
            objArr.getClass();
            h(Integer.valueOf(((Number) objArr[((int) ((this.i + ((long) ((int) ((q() + ((long) this.k)) - this.i)))) - 1)) & (objArr.length - 1)]).intValue() + i));
        }
    }
}
