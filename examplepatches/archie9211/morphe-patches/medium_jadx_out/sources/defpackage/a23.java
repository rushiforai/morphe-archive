package defpackage;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a23 implements bfc {
    public final OutputStream a;
    public final zjc b;
    public final /* synthetic */ n0c c;

    public a23(n0c n0cVar) {
        this.c = n0cVar;
        Socket socket = (Socket) n0cVar.b;
        this.a = socket.getOutputStream();
        this.b = new zjc(socket);
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.b;
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        dm2.A(kz0Var.b, 0L, j);
        while (j > 0) {
            zjc zjcVar = this.b;
            zjcVar.f();
            iwb iwbVar = kz0Var.a;
            iwbVar.getClass();
            int iMin = (int) Math.min(j, iwbVar.c - iwbVar.b);
            zjcVar.i();
            try {
                try {
                    this.a.write(iwbVar.a, iwbVar.b, iMin);
                    if (zjcVar.j()) {
                        throw zjcVar.l(null);
                    }
                    int i = iwbVar.b + iMin;
                    iwbVar.b = i;
                    long j2 = iMin;
                    j -= j2;
                    kz0Var.b -= j2;
                    if (i == iwbVar.c) {
                        kz0Var.a = iwbVar.a();
                        lwb.a(iwbVar);
                    }
                } catch (IOException e) {
                    if (!zjcVar.j()) {
                        throw e;
                    }
                    throw zjcVar.l(e);
                }
            } catch (Throwable th) {
                zjcVar.j();
                throw th;
            }
        }
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        int i;
        OutputStream outputStream = this.a;
        n0c n0cVar = this.c;
        zjc zjcVar = this.b;
        zjcVar.i();
        try {
            AtomicInteger atomicInteger = (AtomicInteger) n0cVar.c;
            Socket socket = (Socket) n0cVar.b;
            atomicInteger.getClass();
            while (true) {
                int i2 = atomicInteger.get();
                if ((i2 & 1) != 0) {
                    i = 0;
                    break;
                }
                int i3 = i2 | 1;
                if (atomicInteger.compareAndSet(i2, i3)) {
                    i = i3;
                    break;
                }
            }
            if (i != 0) {
                if (i != 3) {
                    if (!socket.isClosed() && !socket.isOutputShutdown()) {
                        outputStream.flush();
                        try {
                            socket.shutdownOutput();
                        } catch (UnsupportedOperationException unused) {
                            outputStream.close();
                        }
                    }
                    return;
                }
                socket.close();
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

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() throws IOException {
        zjc zjcVar = this.b;
        zjcVar.i();
        try {
            this.a.flush();
            if (zjcVar.j()) {
                throw zjcVar.l(null);
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

    public final String toString() {
        return "sink(" + ((Socket) this.c.b) + ')';
    }
}
