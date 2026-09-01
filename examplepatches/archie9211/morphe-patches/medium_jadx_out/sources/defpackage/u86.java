package defpackage;

import android.content.Context;
import android.os.Trace;
import android.util.Log;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.impl.ImplVersion;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u86 extends mi2 {
    public final Context B;
    public final String v;
    public final ThreadPoolExecutor w;
    public final int x;
    public final dm2 y;
    public final AtomicInteger z = new AtomicInteger();
    public long A = -1;

    public u86(v86 v86Var) {
        grb.f("JavaCronetEngine#JavaCronetEngine");
        try {
            Context context = v86Var.u;
            this.B = context;
            int iHashCode = hashCode();
            this.x = iHashCode;
            this.v = v86Var.w;
            this.w = new ThreadPoolExecutor(10, 10, 50L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new kjc(1));
            ti2 ti2Var = ti2.CRONET_SOURCE_FALLBACK;
            dm2 dm2VarK = yi2.K(context, ti2Var);
            this.y = dm2VarK;
            try {
                dm2VarK.O(iHashCode, v86Var.l0(), h0(), ti2Var);
            } catch (RuntimeException e) {
                Log.e("u86", "Error while trying to log JavaCronetEngine creation: ", e);
            }
            Log.w("u86", "using the fallback Cronet Engine implementation. Performance will suffer and many HTTP client features, including caching, will not work.");
            Trace.endSection();
        } finally {
        }
    }

    public static xi2 h0() {
        return new xi2(("CronetHttpURLConnection/" + ImplVersion.getCronetVersionWithLastChange()).split("/")[1].split("@")[0]);
    }

    @Override // defpackage.gx1
    public final h7e S(String str, ceg cegVar, Executor executor) {
        return new h7e(str, cegVar, executor, this);
    }

    @Override // defpackage.mi2
    public final sgg g0(String str, ceg cegVar, Executor executor, int i, boolean z, int i2, long j, String str2, ArrayList arrayList, u5e u5eVar, Executor executor2) {
        if (j != -1) {
            this.A = j;
        }
        return new na6(this, cegVar, this.w, executor, str, this.v, z, i2, this.A, str2, arrayList, u5eVar, executor2);
    }
}
