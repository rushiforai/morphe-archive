package hh;

import ab.z;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.google.android.gms.appset.AppSetIdClient;
import com.google.android.gms.internal.measurement.v6;
import com.google.android.gms.tasks.Task;
import fi.j;
import fi.k;
import fi.t;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class d implements AppSetIdClient {

    /* renamed from: d, reason: collision with root package name */
    public static d f59856d;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59857a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f59858b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f59859c;

    public d(Context context, int i5) {
        d dVar;
        this.f59857a = i5;
        switch (i5) {
            case 1:
                this.f59858b = new g(context, pg.c.f82562b);
                synchronized (d.class) {
                    try {
                        if (f59856d == null) {
                            f59856d = new d(context.getApplicationContext(), 0);
                        }
                        dVar = f59856d;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                this.f59859c = dVar;
                return;
            default:
                ScheduledExecutorService scheduledExecutorServiceNewSingleThreadScheduledExecutor = Executors.newSingleThreadScheduledExecutor();
                this.f59859c = Executors.newSingleThreadExecutor();
                this.f59858b = context;
                scheduledExecutorServiceNewSingleThreadScheduledExecutor.scheduleAtFixedRate(new a90.d(this, 2), 0L, 86400L, TimeUnit.SECONDS);
                return;
        }
    }

    public static final SharedPreferences a(Context context) {
        return context.getSharedPreferences("app_set_id_storage", 0);
    }

    public static final void b(Context context) {
        if (a(context).edit().putLong("app_set_id_last_used_time", System.currentTimeMillis()).commit()) {
            return;
        }
        String strValueOf = String.valueOf(context.getPackageName());
        Log.e("AppSet", strValueOf.length() != 0 ? "Failed to store app set ID last used time for App ".concat(strValueOf) : new String("Failed to store app set ID last used time for App "));
        throw new c("Failed to store the app set ID last used time.");
    }

    @Override // com.google.android.gms.appset.AppSetIdClient
    public final Task getAppSetIdInfo() {
        switch (this.f59857a) {
            case 0:
                j jVar = new j();
                ((ExecutorService) this.f59859c).execute(new z(this, jVar, false, 22));
                return jVar.f55135a;
            default:
                Task appSetIdInfo = ((g) this.f59858b).getAppSetIdInfo();
                v6 v6Var = new v6(this, 11);
                t tVar = (t) appSetIdInfo;
                tVar.getClass();
                return tVar.k(k.f55136a, v6Var);
        }
    }
}
