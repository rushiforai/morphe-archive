package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o6c implements yh3 {
    public final r6c a;
    public final long b;
    public final Object c;
    public final x51 d;

    public o6c(r6c r6cVar, long j, Object obj, x51 x51Var) {
        this.a = r6cVar;
        this.b = j;
        this.c = obj;
        this.d = x51Var;
    }

    @Override // defpackage.yh3
    public final void dispose() {
        r6c r6cVar = this.a;
        synchronized (r6cVar) {
            if (this.b >= r6cVar.q()) {
                Object[] objArr = r6cVar.h;
                objArr.getClass();
                long j = this.b;
                if (objArr[((int) j) & (objArr.length - 1)] == this) {
                    k40.N0(objArr, j, k40.l);
                    r6cVar.l();
                }
            }
        }
    }
}
