package io.branch.requery.android.database.sqlite;

import android.database.sqlite.SQLiteTransactionListener;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import io.branch.requery.android.database.CursorWindow;
import java.util.concurrent.locks.LockSupport;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final h f61874a;

    /* renamed from: b, reason: collision with root package name */
    public SQLiteConnection f61875b;

    /* renamed from: c, reason: collision with root package name */
    public int f61876c;

    /* renamed from: d, reason: collision with root package name */
    public int f61877d;

    /* renamed from: e, reason: collision with root package name */
    public w f61878e;

    /* renamed from: f, reason: collision with root package name */
    public w f61879f;

    public x(h hVar) {
        if (hVar == null) {
            throw new IllegalArgumentException("connectionPool must not be null");
        }
        this.f61874a = hVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00f8  */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v2, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String str, int i5, w4.d dVar) {
        ?? r02;
        SQLiteConnection sQLiteConnectionS;
        boolean z11;
        SQLiteConnection sQLiteConnection;
        RuntimeException runtimeException;
        boolean z12;
        boolean z13 = true;
        if (this.f61875b == null) {
            h hVar = this.f61874a;
            hVar.getClass();
            boolean z14 = (i5 & 2) != 0;
            synchronized (hVar.f61839b) {
                try {
                    hVar.P();
                    if (dVar != null) {
                        dVar.c();
                    }
                    sQLiteConnectionS = !z14 ? hVar.S(i5, str) : null;
                    if (sQLiteConnectionS == null) {
                        sQLiteConnectionS = hVar.V(i5);
                    }
                    if (sQLiteConnectionS != null) {
                        z12 = true;
                    } else {
                        int i11 = (i5 & 4) != 0 ? 1 : 0;
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        Thread threadCurrentThread = Thread.currentThread();
                        g gVar = hVar.f61845h;
                        if (gVar != null) {
                            hVar.f61845h = gVar.f61828a;
                            gVar.f61828a = null;
                        } else {
                            gVar = new g();
                        }
                        gVar.f61829b = threadCurrentThread;
                        gVar.f61830c = jUptimeMillis;
                        gVar.f61831d = i11;
                        gVar.f61832e = z14;
                        gVar.f61833f = str;
                        gVar.f61834g = i5;
                        g gVar2 = hVar.f61846i;
                        g gVar3 = null;
                        while (true) {
                            if (gVar2 == null) {
                                break;
                            }
                            if (i11 > gVar2.f61831d) {
                                gVar.f61828a = gVar2;
                                break;
                            } else {
                                gVar3 = gVar2;
                                gVar2 = gVar2.f61828a;
                            }
                        }
                        if (gVar3 != null) {
                            gVar3.f61828a = gVar;
                        } else {
                            hVar.f61846i = gVar;
                        }
                        int i12 = gVar.f61837j;
                        if (dVar != null) {
                            dVar.b(new c00.d(hVar, gVar, i12));
                        }
                        try {
                            long j11 = gVar.f61830c + 30000;
                            long j12 = 30000;
                            while (true) {
                                if (hVar.f61840c.compareAndSet(z13, false)) {
                                    synchronized (hVar.f61839b) {
                                        hVar.c0();
                                    }
                                }
                                z11 = z13;
                                LockSupport.parkNanos(hVar, j12 * 1000000);
                                Thread.interrupted();
                                synchronized (hVar.f61839b) {
                                    try {
                                        hVar.P();
                                        sQLiteConnection = gVar.f61835h;
                                        runtimeException = gVar.f61836i;
                                        if (sQLiteConnection != null || runtimeException != null) {
                                            break;
                                        }
                                        long jUptimeMillis2 = SystemClock.uptimeMillis();
                                        if (jUptimeMillis2 < j11) {
                                            j12 = jUptimeMillis2 - j11;
                                        } else {
                                            hVar.l(i5, jUptimeMillis2 - gVar.f61830c);
                                            j11 = jUptimeMillis2 + 30000;
                                            j12 = 30000;
                                        }
                                    } finally {
                                    }
                                }
                                if (dVar != null) {
                                    dVar.b(null);
                                }
                                sQLiteConnectionS = sQLiteConnection;
                                z12 = z11;
                                z13 = z11 ? 1 : 0;
                            }
                            gVar.f61828a = hVar.f61845h;
                            gVar.f61829b = null;
                            gVar.f61833f = null;
                            gVar.f61835h = null;
                            gVar.f61836i = null;
                            gVar.f61837j += z11 ? 1 : 0;
                            hVar.f61845h = gVar;
                            if (sQLiteConnection == null) {
                                throw runtimeException;
                            }
                            if (dVar != null) {
                            }
                            sQLiteConnectionS = sQLiteConnection;
                            z12 = z11;
                        } catch (Throwable th2) {
                            if (dVar != null) {
                                dVar.b(null);
                            }
                            throw th2;
                        }
                    }
                } finally {
                }
            }
            this.f61875b = sQLiteConnectionS;
            this.f61876c = i5;
            r02 = z12;
        } else {
            r02 = 1;
        }
        this.f61877d += r02;
    }

    public final void b(int i5, SQLiteTransactionListener sQLiteTransactionListener, int i11, w4.d dVar, boolean z11) {
        if (dVar != null) {
            dVar.c();
        }
        if (this.f61879f == null) {
            a(null, i11, dVar);
        }
        try {
            if (this.f61879f == null) {
                if (i5 == 1) {
                    this.f61875b.k("BEGIN IMMEDIATE;", null, dVar, z11);
                } else if (i5 != 2) {
                    this.f61875b.k("BEGIN;", null, dVar, z11);
                } else {
                    this.f61875b.k("BEGIN EXCLUSIVE;", null, dVar, z11);
                }
            }
            if (sQLiteTransactionListener != null) {
                try {
                    sQLiteTransactionListener.onBegin();
                } catch (RuntimeException e3) {
                    if (this.f61879f == null) {
                        this.f61875b.k("ROLLBACK;", null, dVar, false);
                    }
                    throw e3;
                }
            }
            w wVar = this.f61878e;
            if (wVar != null) {
                this.f61878e = wVar.f61869a;
                wVar.f61869a = null;
                wVar.f61872d = false;
                wVar.f61873e = false;
            } else {
                wVar = new w();
            }
            wVar.f61870b = i5;
            wVar.f61871c = sQLiteTransactionListener;
            wVar.f61869a = this.f61879f;
            this.f61879f = wVar;
        } catch (Throwable th2) {
            if (this.f61879f == null) {
                m();
            }
            throw th2;
        }
    }

    public final void c(w4.d dVar, boolean z11) {
        RuntimeException runtimeException;
        if (dVar != null) {
            dVar.c();
        }
        w wVar = this.f61879f;
        boolean z12 = (wVar.f61872d || z11) && !wVar.f61873e;
        SQLiteTransactionListener sQLiteTransactionListener = wVar.f61871c;
        if (sQLiteTransactionListener != null) {
            try {
                if (z12) {
                    sQLiteTransactionListener.onCommit();
                } else {
                    sQLiteTransactionListener.onRollback();
                }
                runtimeException = null;
            } catch (RuntimeException e3) {
                runtimeException = e3;
                z12 = false;
            }
        } else {
            runtimeException = null;
        }
        w wVar2 = wVar.f61869a;
        this.f61879f = wVar2;
        wVar.f61869a = this.f61878e;
        wVar.f61871c = null;
        this.f61878e = wVar;
        if (wVar2 == null) {
            try {
                if (z12) {
                    this.f61875b.k("COMMIT;", null, dVar, false);
                } else {
                    this.f61875b.k("ROLLBACK;", null, dVar, false);
                }
                m();
            } catch (Throwable th2) {
                m();
                throw th2;
            }
        } else if (!z12) {
            wVar2.f61873e = true;
        }
        if (runtimeException != null) {
            throw runtimeException;
        }
    }

    public final void d(int i5, String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return;
        }
        a(str, i5, null);
        try {
            this.f61875b.k(str, objArr, null, false);
        } finally {
            m();
        }
    }

    public final ParcelFileDescriptor e(int i5, String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return null;
        }
        a(str, i5, null);
        try {
            return this.f61875b.l(str, objArr);
        } finally {
            m();
        }
    }

    public final int f(String str, Object[] objArr, int i5, boolean z11) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return 0;
        }
        a(str, i5, null);
        try {
            return this.f61875b.m(str, objArr, z11);
        } finally {
            m();
        }
    }

    public final int g(String str, Object[] objArr, CursorWindow cursorWindow, int i5, int i11, boolean z11, int i12, w4.d dVar) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (cursorWindow == null) {
            throw new IllegalArgumentException("window must not be null.");
        }
        if (k(str, i12, dVar)) {
            cursorWindow.clear();
            return 0;
        }
        a(str, i12, dVar);
        try {
            return this.f61875b.n(str, objArr, cursorWindow, i5, i11, z11, dVar);
        } finally {
            m();
        }
    }

    public final long h(int i5, String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return 0L;
        }
        a(str, i5, null);
        try {
            return this.f61875b.o(str, objArr);
        } finally {
            m();
        }
    }

    public final long i(int i5, String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return 0L;
        }
        a(str, i5, null);
        try {
            return this.f61875b.p(str, objArr);
        } finally {
            m();
        }
    }

    public final String j(int i5, String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (k(str, i5, null)) {
            return null;
        }
        a(str, i5, null);
        try {
            return this.f61875b.q(str, objArr);
        } finally {
            m();
        }
    }

    public final boolean k(String str, int i5, w4.d dVar) {
        if (dVar != null) {
            dVar.c();
        }
        int iR = a.a.R(str);
        if (iR == 4) {
            n();
            b(2, null, i5, dVar, false);
            return true;
        }
        if (iR != 5) {
            if (iR != 6) {
                return false;
            }
            if (this.f61879f == null) {
                throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
            }
            c(dVar, false);
            return true;
        }
        if (this.f61879f == null) {
            throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
        }
        n();
        w wVar = this.f61879f;
        wVar.f61872d = true;
        if (wVar == null) {
            throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
        }
        c(dVar, false);
        return true;
    }

    public final void l(String str, int i5, w4.d dVar, y yVar, boolean z11) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (dVar != null) {
            dVar.c();
        }
        a(str, i5, dVar);
        try {
            this.f61875b.v(str, yVar, z11);
        } finally {
            m();
        }
    }

    public final void m() {
        int i5 = this.f61877d - 1;
        this.f61877d = i5;
        if (i5 == 0) {
            try {
                this.f61874a.K(this.f61875b);
            } finally {
                this.f61875b = null;
            }
        }
    }

    public final void n() {
        w wVar = this.f61879f;
        if (wVar != null && wVar.f61872d) {
            throw new IllegalStateException("Cannot perform this operation because the transaction has already been marked successful.  The only thing you can do now is call endTransaction().");
        }
    }

    public final boolean o(long j11, boolean z11) throws InterruptedException {
        boolean z12;
        if (!z11) {
            w wVar = this.f61879f;
            if (wVar != null && !wVar.f61872d && wVar.f61869a == null) {
            }
            return false;
        }
        if (this.f61879f == null) {
            throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
        }
        n();
        w wVar2 = this.f61879f;
        if (wVar2 != null && wVar2.f61869a != null) {
            throw new IllegalStateException("Cannot perform this operation because a nested transaction is in progress.");
        }
        if (!this.f61879f.f61873e) {
            h hVar = this.f61874a;
            SQLiteConnection sQLiteConnection = this.f61875b;
            int i5 = this.f61876c;
            synchronized (hVar.f61839b) {
                try {
                    if (!hVar.f61849l.containsKey(sQLiteConnection)) {
                        throw new IllegalStateException("Cannot perform this operation because the specified connection was not acquired from this pool or has already been released.");
                    }
                    if (hVar.f61843f) {
                        boolean z13 = sQLiteConnection.f61790e;
                        g gVar = hVar.f61846i;
                        if (gVar == null) {
                            z12 = false;
                        } else {
                            int i11 = (i5 & 4) != 0 ? 1 : 0;
                            while (i11 <= gVar.f61831d) {
                                if (!z13 && gVar.f61832e) {
                                    gVar = gVar.f61828a;
                                    if (gVar == null) {
                                        break;
                                    }
                                }
                                z12 = true;
                            }
                            z12 = false;
                        }
                    } else {
                        z12 = false;
                    }
                } finally {
                }
            }
            if (z12) {
                w wVar3 = this.f61879f;
                int i12 = wVar3.f61870b;
                SQLiteTransactionListener sQLiteTransactionListener = wVar3.f61871c;
                int i13 = this.f61876c;
                c(null, true);
                if (j11 > 0) {
                    try {
                        Thread.sleep(j11);
                    } catch (InterruptedException unused) {
                    }
                }
                b(i12, sQLiteTransactionListener, i13, null, false);
                return true;
            }
        }
        return false;
    }
}
