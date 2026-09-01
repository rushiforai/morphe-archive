package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x76 extends xa6 {
    public static final /* synthetic */ long f = m80.a.objectFieldOffset(x76.class.getDeclaredField("_invoked$volatile"));
    private volatile /* synthetic */ int _invoked$volatile;
    public final k0 e;

    public x76(k0 k0Var) {
        this.e = k0Var;
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return true;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) {
        if (m80.a.compareAndSwapInt(this, f, 0, 1)) {
            this.e.invoke(th);
        }
    }
}
