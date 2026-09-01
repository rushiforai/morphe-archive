package defpackage;

import java.io.IOException;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.logging.Level;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zjc extends q90 {
    public final Socket n;

    public zjc(Socket socket) {
        this.n = socket;
    }

    @Override // defpackage.q90
    public final void k() {
        Socket socket = this.n;
        try {
            socket.close();
        } catch (AssertionError e) {
            if (!dgf.a(e)) {
                throw e;
            }
            dgf.a.log(Level.WARNING, "Failed to close timed out socket " + socket, (Throwable) e);
        } catch (Exception e2) {
            dgf.a.log(Level.WARNING, "Failed to close timed out socket " + socket, (Throwable) e2);
        }
    }

    public final IOException l(IOException iOException) {
        SocketTimeoutException socketTimeoutException = new SocketTimeoutException("timeout");
        if (iOException != null) {
            socketTimeoutException.initCause(iOException);
        }
        return socketTimeoutException;
    }
}
