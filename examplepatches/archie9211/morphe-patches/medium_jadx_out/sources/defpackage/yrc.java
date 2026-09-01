package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yrc implements Runnable {
    public final i2a a;
    public final unc b;
    public final boolean c;
    public final int d;

    public yrc(i2a i2aVar, unc uncVar, boolean z, int i) {
        i2aVar.getClass();
        uncVar.getClass();
        this.a = i2aVar;
        this.b = uncVar;
        this.c = z;
        this.d = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean zI;
        u8f u8fVarB;
        boolean z = this.c;
        i2a i2aVar = this.a;
        unc uncVar = this.b;
        if (z) {
            int i = this.d;
            i2aVar.getClass();
            String str = uncVar.a.a;
            synchronized (i2aVar.k) {
                u8fVarB = i2aVar.b(str);
            }
            zI = i2a.e(str, u8fVarB, i);
        } else {
            zI = i2aVar.i(uncVar, this.d);
        }
        d87.h().d(d87.k("StopWorkRunnable"), "StopWorkRunnable for " + this.b.a.a + "; Processor.stopWork = " + zI);
    }
}
