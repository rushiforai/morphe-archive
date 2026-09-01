package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ca6 implements oa6, kr8 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ Object b;

    public /* synthetic */ ca6(Object obj, boolean z) {
        this.b = obj;
        this.a = z;
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        SharedPreferences.Editor editorEdit = mo7.O((Context) this.b).edit();
        editorEdit.putBoolean("proxy_retention", this.a);
        editorEdit.apply();
    }

    @Override // defpackage.oa6
    public void run() throws IOException {
        la6 la6Var = (la6) this.b;
        na6 na6Var = la6Var.p;
        u5e u5eVar = la6Var.g;
        long jM = ((u5e) u5eVar.b).m();
        la6Var.i = jM;
        int i = 0;
        int i2 = 1;
        if (jM == 0) {
            if (la6Var.n != null && la6Var.m.compareAndSet(false, true)) {
                la6Var.n.close();
            }
            na6Var.f0(new ha6(na6Var, new fa6(na6Var, i), 0), "fireGetHeaders");
            return;
        }
        if (jM <= 0 || jM >= 8192) {
            la6Var.h = ByteBuffer.allocateDirect(8192);
        } else {
            la6Var.h = ByteBuffer.allocateDirect(((int) jM) + 1);
        }
        long j = la6Var.i;
        HttpURLConnection httpURLConnection = la6Var.l;
        if (j > 0) {
            httpURLConnection.setFixedLengthStreamingMode(j);
        } else {
            httpURLConnection.setChunkedStreamingMode(8192);
        }
        if (this.a) {
            la6Var.I(new ha6(na6Var, new da6(la6Var, i2), 0), "startRead");
        } else {
            la6Var.d.set(1);
            u5eVar.B(la6Var);
        }
    }
}
