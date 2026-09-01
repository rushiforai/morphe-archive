package defpackage;

import android.util.Log;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.channels.ReadableByteChannel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ga6 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ na6 b;

    public /* synthetic */ ga6(na6 na6Var, int i) {
        this.a = i;
        this.b = na6Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        int i2 = 0;
        int i3 = 1;
        na6 na6Var = this.b;
        switch (i) {
            case 0:
                ReadableByteChannel readableByteChannel = na6Var.C;
                if (readableByteChannel != null) {
                    try {
                        readableByteChannel.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    na6Var.C = null;
                }
                break;
            case 1:
                na6Var.M++;
                break;
            case 2:
                la6 la6Var = na6Var.G;
                if (la6Var != null) {
                    try {
                        if (la6Var.n != null && la6Var.m.compareAndSet(false, true)) {
                            la6Var.n.close();
                        }
                    } catch (IOException e2) {
                        Log.e("na6", "Exception when closing OutputChannel", e2);
                    }
                }
                HttpURLConnection httpURLConnection = na6Var.F;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                    na6Var.F = null;
                }
                break;
            default:
                na6Var.v.add(na6Var.B);
                na6Var.f0(new ha6(na6Var, new fa6(na6Var, i3), i2), CspinKvYN.sKI);
                break;
        }
    }
}
