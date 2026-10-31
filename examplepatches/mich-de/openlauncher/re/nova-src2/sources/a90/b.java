package a90;

import b90.m;
import b90.n;
import e90.k;
import java.io.IOException;
import java.net.Socket;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f513e = 1;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f514f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(n nVar, String str) {
        super(str, true);
        this.f514f = nVar;
    }

    @Override // a90.a
    public final long a() throws IOException {
        switch (this.f513e) {
            case 0:
                ((Function0) this.f514f).invoke();
                return -1L;
            default:
                n nVar = (n) this.f514f;
                long jNanoTime = System.nanoTime();
                Iterator it = nVar.f17721e.iterator();
                int i5 = 0;
                long j11 = Long.MIN_VALUE;
                m mVar = null;
                int i11 = 0;
                while (it.hasNext()) {
                    m connection = (m) it.next();
                    Intrinsics.f(connection, "connection");
                    synchronized (connection) {
                        if (nVar.b(connection, jNanoTime) > 0) {
                            i11++;
                        } else {
                            i5++;
                            long j12 = jNanoTime - connection.f17716q;
                            if (j12 > j11) {
                                mVar = connection;
                                j11 = j12;
                            }
                            Unit unit = Unit.f71706a;
                        }
                    }
                }
                long j13 = nVar.f17718b;
                if (j11 < j13 && i5 <= nVar.f17717a) {
                    if (i5 > 0) {
                        return j13 - j11;
                    }
                    if (i11 > 0) {
                        return j13;
                    }
                    return -1L;
                }
                Intrinsics.d(mVar);
                synchronized (mVar) {
                    if (mVar.f17715p.isEmpty() && mVar.f17716q + j11 == jNanoTime) {
                        mVar.f17711j = true;
                        nVar.f17721e.remove(mVar);
                        Socket socket = mVar.f17705d;
                        Intrinsics.d(socket);
                        y80.c.d(socket);
                        if (nVar.f17721e.isEmpty()) {
                            nVar.f17719c.a();
                        }
                    }
                }
                return 0L;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(String str, k kVar) {
        super(str, true);
        this.f514f = kVar;
    }
}
