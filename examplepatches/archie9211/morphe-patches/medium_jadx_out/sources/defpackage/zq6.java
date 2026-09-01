package defpackage;

import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zq6 extends o33 {
    public final n92 d;

    public zq6(ib2 ib2Var, b55 b55Var) {
        super(ib2Var, false);
        this.d = pwd.F(b55Var, this, this);
    }

    @Override // defpackage.db6
    public final void b0() throws Throwable {
        try {
            op8.k0(pwd.Q(this.d), c1e.a);
        } catch (Throwable th) {
            th = th;
            if (th instanceof DispatchException) {
                th = ((DispatchException) th).a;
            }
            resumeWith(new ajb(th));
            throw th;
        }
    }
}
