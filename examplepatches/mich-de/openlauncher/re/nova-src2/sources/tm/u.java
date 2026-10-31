package tm;

import android.content.Context;
import android.util.Log;
import bn.s0;
import com.google.firebase.messaging.FirebaseMessaging;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import o9.d4;

/* loaded from: classes3.dex */
public final class u {

    /* renamed from: h, reason: collision with root package name */
    public static final long f89517h = TimeUnit.HOURS.toSeconds(8);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ int f89518i = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Context f89519a;

    /* renamed from: b, reason: collision with root package name */
    public final ja.d f89520b;

    /* renamed from: c, reason: collision with root package name */
    public final mh.c f89521c;

    /* renamed from: e, reason: collision with root package name */
    public final ScheduledThreadPoolExecutor f89523e;

    /* renamed from: g, reason: collision with root package name */
    public final s f89525g;

    /* renamed from: d, reason: collision with root package name */
    public final z.e f89522d = new z.e(0);

    /* renamed from: f, reason: collision with root package name */
    public boolean f89524f = false;

    public u(ja.d dVar, s sVar, mh.c cVar, Context context, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        this.f89520b = dVar;
        this.f89525g = sVar;
        this.f89521c = cVar;
        this.f89519a = context;
        this.f89523e = scheduledThreadPoolExecutor;
    }

    public final synchronized void a(boolean z11) {
        this.f89524f = z11;
    }

    public final boolean b() throws IOException {
        r rVarA;
        while (true) {
            synchronized (this) {
                try {
                    rVarA = this.f89525g.a();
                    if (rVarA == null) {
                        return true;
                    }
                } finally {
                }
            }
            mh.c cVar = this.f89521c;
            try {
                String str = rVarA.f89507b;
                String str2 = rVarA.f89506a;
                int iHashCode = str.hashCode();
                if (iHashCode != 83) {
                    if (iHashCode == 85 && str.equals("U")) {
                        om.d dVar = (om.d) ((om.e) cVar.f76323b);
                        String str3 = ((om.b) mh.c.v(dVar.e())).f80504a;
                        ((FirebaseMessaging) cVar.f76325d).a();
                        cVar.I(str2, str3, (String) mh.c.v(dVar.c()), "unsubscribe");
                    }
                } else if (str.equals("S")) {
                    om.d dVar2 = (om.d) ((om.e) cVar.f76323b);
                    String str4 = ((om.b) mh.c.v(dVar2.e())).f80504a;
                    ((FirebaseMessaging) cVar.f76325d).a();
                    cVar.I(str2, str4, (String) mh.c.v(dVar2.c()), "subscribe");
                }
                s sVar = this.f89525g;
                synchronized (sVar) {
                    s0 s0Var = sVar.f89510a;
                    String str5 = rVarA.f89508c;
                    synchronized (((ArrayDeque) s0Var.f18282e)) {
                        if (((ArrayDeque) s0Var.f18282e).remove(str5)) {
                            ((ScheduledThreadPoolExecutor) s0Var.f18283f).execute(new d4(s0Var, 9));
                        }
                    }
                }
                synchronized (this.f89522d) {
                    try {
                        String str6 = rVarA.f89508c;
                        if (this.f89522d.containsKey(str6)) {
                            ArrayDeque arrayDeque = (ArrayDeque) this.f89522d.get(str6);
                            fi.j jVar = (fi.j) arrayDeque.poll();
                            if (jVar != null) {
                                jVar.a(null);
                            }
                            if (arrayDeque.isEmpty()) {
                                this.f89522d.remove(str6);
                            }
                        }
                    } finally {
                    }
                }
            } catch (IOException e3) {
                if (!"SERVICE_NOT_AVAILABLE".equals(e3.getMessage()) && !"INTERNAL_SERVER_ERROR".equals(e3.getMessage())) {
                    if (e3.getMessage() != null) {
                        throw e3;
                    }
                    Log.e("FirebaseMessaging", "Topic operation failed without exception message. Will retry Topic operation.");
                    return false;
                }
                Log.e("FirebaseMessaging", "Topic operation failed: " + e3.getMessage() + ". Will retry Topic operation.");
                return false;
            }
        }
    }

    public final void c(long j11) {
        this.f89523e.schedule(new w(this, this.f89519a, this.f89520b, Math.min(Math.max(30L, 2 * j11), f89517h)), j11, TimeUnit.SECONDS);
        a(true);
    }
}
