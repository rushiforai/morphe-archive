package defpackage;

import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b23 implements ikc {
    public final InputStream a;
    public final zjc b;
    public final /* synthetic */ n0c c;

    public b23(n0c n0cVar) {
        this.c = n0cVar;
        Socket socket = (Socket) n0cVar.b;
        this.a = socket.getInputStream();
        this.b = new zjc(socket);
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.b;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        int i;
        n0c n0cVar = this.c;
        zjc zjcVar = this.b;
        zjcVar.i();
        try {
            AtomicInteger atomicInteger = (AtomicInteger) n0cVar.c;
            Socket socket = (Socket) n0cVar.b;
            atomicInteger.getClass();
            while (true) {
                int i2 = atomicInteger.get();
                if ((i2 & 2) != 0) {
                    i = 0;
                    break;
                }
                int i3 = i2 | 2;
                if (atomicInteger.compareAndSet(i2, i3)) {
                    i = i3;
                    break;
                }
            }
            if (i != 0) {
                if (i == 3) {
                    socket.close();
                } else {
                    if (socket.isClosed() || socket.isInputShutdown()) {
                        return;
                    }
                    try {
                        socket.shutdownInput();
                    } catch (UnsupportedOperationException unused) {
                        this.a.close();
                    }
                }
                if (zjcVar.j()) {
                    throw zjcVar.l(null);
                }
            }
        } catch (IOException e) {
            if (!zjcVar.j()) {
                throw e;
            }
            throw zjcVar.l(e);
        } finally {
            zjcVar.j();
        }
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        if (j == 0) {
            return 0L;
        }
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        zjc zjcVar = this.b;
        zjcVar.f();
        iwb iwbVarI0 = kz0Var.I0(1);
        int iMin = (int) Math.min(j, 8192 - iwbVarI0.c);
        try {
            zjcVar.i();
            try {
                int i = this.a.read(iwbVarI0.a, iwbVarI0.c, iMin);
                if (zjcVar.j()) {
                    throw zjcVar.l(null);
                }
                if (i != -1) {
                    iwbVarI0.c += i;
                    long j2 = i;
                    kz0Var.b += j2;
                    return j2;
                }
                if (iwbVarI0.b != iwbVarI0.c) {
                    return -1L;
                }
                kz0Var.a = iwbVarI0.a();
                lwb.a(iwbVarI0);
                return -1L;
            } catch (IOException e) {
                if (zjcVar.j()) {
                    throw zjcVar.l(e);
                }
                throw e;
            } finally {
                zjcVar.j();
            }
        } catch (AssertionError e2) {
            if (dgf.a(e2)) {
                throw new IOException(e2);
            }
            throw e2;
        }
    }

    public final String toString() {
        return "source(" + ((Socket) this.c.b) + ')';
    }
}
