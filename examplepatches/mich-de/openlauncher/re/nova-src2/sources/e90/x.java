package e90;

import java.net.SocketTimeoutException;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class x extends m90.e {

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ y f52397m;

    public x(y yVar) {
        this.f52397m = yVar;
    }

    @Override // m90.e
    public final void j() {
        this.f52397m.e(9);
        q qVar = this.f52397m.f52399b;
        synchronized (qVar) {
            long j11 = qVar.n;
            long j12 = qVar.f52358m;
            if (j11 < j12) {
                return;
            }
            qVar.f52358m = j12 + 1;
            qVar.o = System.nanoTime() + 1000000000;
            Unit unit = Unit.f71706a;
            qVar.f52353h.c(new o(b.c0.q(new StringBuilder(), qVar.f52348c, " ping"), qVar), 0L);
        }
    }

    public final void k() {
        if (i()) {
            throw new SocketTimeoutException("timeout");
        }
    }
}
