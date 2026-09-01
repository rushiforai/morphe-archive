package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.os.Build;
import android.os.Trace;
import androidx.work.impl.WorkDatabase;
import com.medium.android.donkey.DonkeyApplication;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m7f {
    public static m7f k;
    public static m7f l;
    public static final Object m;
    public final Context a;
    public final r32 b;
    public final WorkDatabase c;
    public final xfd d;
    public final List e;
    public final i2a f;
    public final my6 g;
    public boolean h = false;
    public BroadcastReceiver.PendingResult i;
    public final sqd j;

    static {
        d87.k("WorkManagerImpl");
        k = null;
        l = null;
        m = new Object();
    }

    public m7f(Context context, final r32 r32Var, xfd xfdVar, final WorkDatabase workDatabase, final List list, i2a i2aVar, sqd sqdVar) {
        int i = 0;
        Context applicationContext = context.getApplicationContext();
        n92 n92Var = null;
        if (Build.VERSION.SDK_INT >= 24 && o6.m(applicationContext)) {
            ygf.f("Cannot initialize WorkManager in direct boot mode");
            throw null;
        }
        d87 d87Var = new d87(4, 0);
        synchronized (d87.c) {
            try {
                if (d87.d == null) {
                    d87.d = d87Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        this.a = applicationContext;
        this.d = xfdVar;
        this.c = workDatabase;
        this.f = i2aVar;
        this.j = sqdVar;
        this.b = r32Var;
        this.e = list;
        q7f q7fVar = (q7f) xfdVar;
        kb2 kb2Var = q7fVar.b;
        kb2Var.getClass();
        k92 k92VarC = o7f.c(kb2Var);
        this.g = new my6(workDatabase);
        final s10 s10Var = q7fVar.a;
        String str = zqb.a;
        i2aVar.a(new t44() { // from class: sqb
            @Override // defpackage.t44
            public final void b(h7f h7fVar, boolean z) {
                s10Var.execute(new q13(list, h7fVar, r32Var, workDatabase, 3));
            }
        });
        q7fVar.a(new j05(applicationContext, this));
        String str2 = f0e.a;
        if (h2a.a(applicationContext, r32Var)) {
            vx0.c0(k92VarC, null, null, new m1(new to4(m40.J(w2g.m(new pc1(r40.B(workDatabase.x().a, new String[]{"workspec"}, new f8f(i)), 9, new e0e(4, null)), -1)), new lp0(applicationContext, n92Var, 2), 3), n92Var, 15), 3);
        }
    }

    public static m7f e() {
        synchronized (m) {
            try {
                m7f m7fVar = k;
                if (m7fVar != null) {
                    return m7fVar;
                }
                return l;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static m7f f(Context context) {
        m7f m7fVarE;
        synchronized (m) {
            try {
                m7fVarE = e();
                if (m7fVarE == null) {
                    Context applicationContext = context.getApplicationContext();
                    if (!(applicationContext instanceof p32)) {
                        throw new IllegalStateException("WorkManager is not initialized properly.  You have explicitly disabled WorkManagerInitializer in your manifest, have not manually called WorkManager#initialize at this point, and your Application does not implement Configuration.Provider.");
                    }
                    DonkeyApplication donkeyApplication = (DonkeyApplication) ((p32) applicationContext);
                    donkeyApplication.getClass();
                    pkf pkfVar = new pkf();
                    im5 im5Var = donkeyApplication.d;
                    if (im5Var == null) {
                        g76.g0("workerFactory");
                        throw null;
                    }
                    pkfVar.a = im5Var;
                    h(applicationContext, new r32(pkfVar));
                    m7fVarE = f(applicationContext);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return m7fVarE;
    }

    public static void h(Context context, r32 r32Var) {
        synchronized (m) {
            try {
                m7f m7fVar = k;
                if (m7fVar != null && l != null) {
                    throw new IllegalStateException("WorkManager is already initialized.  Did you try to initialize it manually without disabling WorkManagerInitializer? See WorkManager#initialize(Context, Configuration) or the class level Javadoc for more information.");
                }
                if (m7fVar == null) {
                    Context applicationContext = context.getApplicationContext();
                    m7f m7fVarT = l;
                    if (m7fVarT == null) {
                        m7fVarT = o7f.t(applicationContext, r32Var);
                        l = m7fVarT;
                    }
                    k = m7fVarT;
                }
            } finally {
            }
        }
    }

    public final md5 a(String str) {
        z46 z46Var = this.b.h;
        String strConcat = "CancelWorkByTag_".concat(str);
        s10 s10Var = ((q7f) this.d).a;
        s10Var.getClass();
        return tp7.x(z46Var, strConcat, s10Var, new v51(this, str));
    }

    public final md5 b(String str) {
        z46 z46Var = this.b.h;
        String strConcat = "CancelWorkByName_".concat(str);
        s10 s10Var = ((q7f) this.d).a;
        s10Var.getClass();
        return tp7.x(z46Var, strConcat, s10Var, new v51(str, this));
    }

    public final void c(wt8 wt8Var) {
        wt8Var.getClass();
        List listQ = d46.Q(wt8Var);
        if (listQ.isEmpty()) {
            ay0.e("enqueue needs at least one WorkRequest.");
        } else {
            new b7f(this, null, j54.KEEP, listQ, 0).a();
        }
    }

    public final md5 d(String str, j54 j54Var, wt8 wt8Var) {
        j54Var.getClass();
        wt8Var.getClass();
        return new b7f(this, str, j54Var, d46.Q(wt8Var), 0).a();
    }

    public final hn7 g(UUID uuid) {
        Object obj;
        g8f g8fVarX = this.c.x();
        List listSingletonList = Collections.singletonList(uuid.toString());
        g8fVarX.getClass();
        listSingletonList.getClass();
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (");
        wo7.f(listSingletonList.size(), sb);
        sb.append(")");
        String string = sb.toString();
        v76 v76VarF = g8fVarX.a.f();
        String[] strArr = {"WorkTag", "WorkProgress", "workspec"};
        pi9 pi9Var = new pi9(string, (Object) listSingletonList, (Object) g8fVarX, 27);
        v76VarF.b.i(strArr);
        hx4 hx4Var = v76VarF.g;
        hx4Var.getClass();
        glb glbVar = new glb((elb) hx4Var.b, hx4Var, strArr, pi9Var);
        y3b y3bVar = new y3b(25);
        Object obj2 = new Object();
        hn7 hn7Var = new hn7();
        pnb pnbVar = new pnb();
        hn7Var.l = pnbVar;
        h57 h57Var = new h57(this.d, obj2, y3bVar, hn7Var);
        gn7 gn7Var = new gn7(glbVar, h57Var);
        mnb mnbVarD = pnbVar.d(glbVar);
        if (mnbVarD != null) {
            obj = mnbVarD.b;
        } else {
            mnb mnbVar = new mnb(glbVar, gn7Var);
            pnbVar.d++;
            mnb mnbVar2 = pnbVar.b;
            if (mnbVar2 == null) {
                pnbVar.a = mnbVar;
                pnbVar.b = mnbVar;
            } else {
                mnbVar2.c = mnbVar;
                mnbVar.d = mnbVar2;
                pnbVar.b = mnbVar;
            }
            obj = null;
        }
        gn7 gn7Var2 = (gn7) obj;
        if (gn7Var2 != null && gn7Var2.b != h57Var) {
            ay0.e("This source was already added with the different observer");
            return null;
        }
        if (gn7Var2 == null && hn7Var.c > 0) {
            glbVar.e(gn7Var);
        }
        return hn7Var;
    }

    public final void i() {
        synchronized (m) {
            try {
                this.h = true;
                BroadcastReceiver.PendingResult pendingResult = this.i;
                if (pendingResult != null) {
                    pendingResult.finish();
                    this.i = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void j() {
        z46 z46Var = this.b.h;
        l2f l2fVar = new l2f(3, this);
        boolean zE = gq7.E();
        if (zE) {
            try {
                Trace.beginSection(gq7.X("ReschedulingWork"));
            } finally {
                if (zE) {
                    Trace.endSection();
                }
            }
        }
        l2fVar.invoke();
    }
}
