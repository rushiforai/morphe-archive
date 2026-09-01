package defpackage;

import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gmd extends frb implements Runnable {
    public final long e;

    public gmd(long j, n92 n92Var) {
        super(n92Var, n92Var.getContext());
        this.e = j;
    }

    @Override // defpackage.db6
    public final String X() {
        return super.X() + "(timeMillis=" + this.e + ')';
    }

    @Override // java.lang.Runnable
    public final void run() {
        ib2 ib2Var = this.c;
        gsa.g0(ib2Var);
        String str = ((nb2) ib2Var.o0(nb2.b)) != null ? "Room Invalidation Tracker Refresh" : null;
        String strX = b09.x("Timed out waiting for ", " ms", this.e);
        if (str != null) {
            StringBuilder sbU = lv8.u("Coroutine \"", str, "\" ");
            if (strX.length() > 0) {
                strX = Character.toLowerCase(strX.charAt(0)) + strX.substring(1);
            }
            sbU.append(strX);
            strX = sbU.toString();
        }
        k(new TimeoutCancellationException(strX, this));
    }
}
