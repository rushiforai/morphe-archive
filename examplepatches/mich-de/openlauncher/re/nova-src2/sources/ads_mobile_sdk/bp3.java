package ads_mobile_sdk;

import aa.x;
import android.content.Context;
import android.os.Build;
import android.view.View;
import b.o2;
import cl.p1;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes2.dex */
public final class bp3 implements b.j1, b.v1 {

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f1480h = {"android:establish_vpn_service", "android:establish_vpn_manager"};

    /* renamed from: a, reason: collision with root package name */
    public final o2 f1481a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f1482b;

    /* renamed from: c, reason: collision with root package name */
    public final ExecutorService f1483c;

    /* renamed from: d, reason: collision with root package name */
    public long f1484d = 0;

    /* renamed from: e, reason: collision with root package name */
    public long f1485e = 0;

    /* renamed from: f, reason: collision with root package name */
    public long f1486f = -1;

    /* renamed from: g, reason: collision with root package name */
    public boolean f1487g = false;

    public bp3(Context context, o2 o2Var, ExecutorService executorService) {
        this.f1481a = o2Var;
        this.f1482b = context;
        this.f1483c = executorService;
    }

    @Override // b.j1
    public final void a(HashMap map) {
        long j11;
        long j12;
        c();
        synchronized (this) {
            try {
                j11 = this.f1487g ? this.f1485e - this.f1484d : -1L;
            } finally {
            }
        }
        map.put("vs", Long.valueOf(j11));
        synchronized (this) {
            j12 = this.f1486f;
            this.f1486f = -1L;
        }
        map.put("vf", Long.valueOf(j12));
    }

    @Override // b.j1
    public final void b(HashMap map) {
        c();
    }

    public final void c() {
        synchronized (this) {
            try {
                if (this.f1487g) {
                    this.f1481a.getClass();
                    this.f1485e = System.currentTimeMillis();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // b.j1
    public final void a(HashMap map, Context context, View view) {
        c();
    }

    @Override // b.v1
    public final ListenableFuture a() {
        if (Build.VERSION.SDK_INT < 30) {
            return cl.z0.f20092b;
        }
        p1 p1Var = new p1(Executors.callable(new x(this, 3), null));
        this.f1483c.execute(p1Var);
        return p1Var;
    }
}
