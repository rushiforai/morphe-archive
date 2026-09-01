package defpackage;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import org.chromium.net.impl.CallbackExceptionImpl;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class da6 implements oa6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ la6 b;

    public /* synthetic */ da6(la6 la6Var, int i) {
        this.a = i;
        this.b = la6Var;
    }

    @Override // defpackage.oa6
    public final void run() throws IOException {
        int i = this.a;
        la6 la6Var = this.b;
        int i2 = 2;
        switch (i) {
            case 0:
                AtomicBoolean atomicBoolean = la6Var.m;
                na6 na6Var = la6Var.p;
                long j = la6Var.i;
                if (j != -1 && j - la6Var.j < la6Var.h.remaining()) {
                    na6Var.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", new IllegalArgumentException(String.format(Locale.getDefault(), "Read upload data length %d exceeds expected length %d", Long.valueOf(la6Var.j + ((long) la6Var.h.remaining())), Long.valueOf(la6Var.i)))));
                } else if (la6Var.h.remaining() != 0) {
                    long j2 = la6Var.j;
                    ByteBuffer byteBuffer = la6Var.h;
                    int iWrite = 0;
                    while (byteBuffer.hasRemaining()) {
                        iWrite += la6Var.n.write(byteBuffer);
                    }
                    la6Var.o.flush();
                    long j3 = j2 + ((long) iWrite);
                    la6Var.j = j3;
                    long j4 = la6Var.i;
                    if (j3 < j4 || j4 == -1) {
                        la6Var.d.set(0);
                        la6Var.J(new da6(la6Var, i2), "readFromProvider");
                    } else if (j4 == -1) {
                        if (la6Var.n != null && atomicBoolean.compareAndSet(false, true)) {
                            la6Var.n.close();
                        }
                        na6Var.f0(new ha6(na6Var, new fa6(na6Var, 0), 0), "fireGetHeaders");
                    } else if (j4 != j3) {
                        na6Var.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", new IllegalArgumentException(String.format(Locale.getDefault(), "Read upload data length %d exceeds expected length %d", Long.valueOf(la6Var.j), Long.valueOf(la6Var.i)))));
                    } else {
                        if (la6Var.n != null && atomicBoolean.compareAndSet(false, true)) {
                            la6Var.n.close();
                        }
                        na6Var.f0(new ha6(na6Var, new fa6(na6Var, 0), 0), "fireGetHeaders");
                    }
                } else {
                    na6Var.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", new IllegalStateException("Bytes read can't be zero except for last chunk!")));
                }
                break;
            case 1:
                HttpURLConnection httpURLConnection = la6Var.l;
                if (la6Var.n == null) {
                    httpURLConnection.setDoOutput(true);
                    httpURLConnection.connect();
                    OutputStream outputStream = httpURLConnection.getOutputStream();
                    la6Var.o = outputStream;
                    la6Var.n = Channels.newChannel(outputStream);
                }
                la6Var.d.set(0);
                la6Var.J(new da6(la6Var, i2), "readFromProvider");
                break;
            default:
                la6Var.g.p(la6Var, la6Var.h);
                la6Var.f.execute(new v0(24, la6Var));
                break;
        }
    }
}
