package ads_mobile_sdk;

import aa.x;
import android.content.Context;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.view.View;
import cl.p1;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes.dex */
public final class f32 implements b.j1, b.v1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f3134a;

    /* renamed from: b, reason: collision with root package name */
    public final ExecutorService f3135b;

    /* renamed from: c, reason: collision with root package name */
    public NetworkCapabilities f3136c = null;

    /* renamed from: d, reason: collision with root package name */
    public Network f3137d = null;

    public f32(Context context, ExecutorService executorService) {
        this.f3134a = context;
        this.f3135b = executorService;
    }

    @Override // b.j1
    public final void a(HashMap map, Context context, View view) {
    }

    @Override // b.j1
    public final void b(HashMap map) {
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0035 A[Catch: all -> 0x0019, DONT_GENERATE, TRY_LEAVE, TryCatch #1 {all -> 0x0019, blocks: (B:8:0x000a, B:10:0x000e, B:12:0x0015, B:16:0x001b, B:18:0x0024, B:20:0x0028, B:22:0x0031, B:24:0x0035), top: B:35:0x000a }] */
    @Override // b.j1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(HashMap map) {
        NetworkCapabilities networkCapabilities;
        long j11;
        synchronized (this) {
            networkCapabilities = this.f3136c;
        }
        map.put("ntc", networkCapabilities);
        synchronized (this) {
            try {
                NetworkCapabilities networkCapabilities2 = this.f3136c;
                if (networkCapabilities2 == null) {
                    j11 = -1;
                } else if (networkCapabilities2.hasTransport(4)) {
                    j11 = 2;
                } else if (this.f3136c.hasTransport(1)) {
                    j11 = 1;
                } else if (this.f3136c.hasTransport(0)) {
                    j11 = 0;
                }
            } finally {
            }
        }
        map.put("nt", Long.valueOf(j11));
    }

    @Override // b.v1
    public final ListenableFuture a() {
        p1 p1Var = new p1(Executors.callable(new x(this, 5), null));
        this.f3135b.execute(p1Var);
        return p1Var;
    }
}
