package s90;

import android.util.Log;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.channels.ReadableByteChannel;

/* loaded from: classes5.dex */
public final /* synthetic */ class q0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86999a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a1 f87000b;

    public /* synthetic */ q0(a1 a1Var, int i5) {
        this.f86999a = i5;
        this.f87000b = a1Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        int i5 = this.f86999a;
        int i11 = 1;
        a1 a1Var = this.f87000b;
        switch (i5) {
            case 0:
                ReadableByteChannel readableByteChannel = a1Var.n;
                if (readableByteChannel != null) {
                    try {
                        readableByteChannel.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                    a1Var.n = null;
                    break;
                }
                break;
            case 1:
                a1Var.f86874x++;
                break;
            case 2:
                y0 y0Var = a1Var.f86868r;
                if (y0Var != null) {
                    try {
                        if (y0Var.f87069k != null && y0Var.f87068j.compareAndSet(false, true)) {
                            y0Var.f87069k.close();
                        }
                    } catch (IOException e11) {
                        Log.e("a1", "Exception when closing OutputChannel", e11);
                    }
                }
                HttpURLConnection httpURLConnection = a1Var.f86867q;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                    a1Var.f86867q = null;
                    break;
                }
                break;
            default:
                a1Var.f86857e.add(a1Var.f86865m);
                a1Var.d("fireOpenConnection", new o0(a1Var, new p0(a1Var, i11), 2));
                break;
        }
    }
}
