package r7;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.recyclerview.widget.l0;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import androidx.work.impl.background.systemalarm.ConstraintProxyUpdateReceiver;
import androidx.work.impl.background.systemalarm.SystemAlarmService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import o7.r;
import p7.m;
import x7.q;

/* loaded from: classes2.dex */
public final class c implements p7.c {

    /* renamed from: f, reason: collision with root package name */
    public static final String f85564f = r.e("CommandHandler");

    /* renamed from: a, reason: collision with root package name */
    public final Context f85565a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f85566b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final Object f85567c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public final br.a f85568d;

    /* renamed from: e, reason: collision with root package name */
    public final x7.c f85569e;

    public c(Context context, br.a aVar, x7.c cVar) {
        this.f85565a = context;
        this.f85568d = aVar;
        this.f85569e = cVar;
    }

    public static x7.i b(Intent intent) {
        return new x7.i(intent.getStringExtra("KEY_WORKSPEC_ID"), intent.getIntExtra("KEY_WORKSPEC_GENERATION", 0));
    }

    public static void d(Intent intent, x7.i iVar) {
        intent.putExtra("KEY_WORKSPEC_ID", iVar.f95141a);
        intent.putExtra("KEY_WORKSPEC_GENERATION", iVar.f95142b);
    }

    public final void a(Intent intent, int i5, i iVar) {
        List<m> listJ;
        String action = intent.getAction();
        if ("ACTION_CONSTRAINTS_CHANGED".equals(action)) {
            r rVarC = r.c();
            Objects.toString(intent);
            rVarC.getClass();
            Context context = this.f85565a;
            e eVar = new e(context, this.f85568d, i5, iVar);
            ArrayList arrayListH = iVar.f85597e.f82374c.i().h();
            int i11 = d.f85570a;
            Iterator it = arrayListH.iterator();
            boolean z11 = false;
            boolean z12 = false;
            boolean z13 = false;
            boolean z14 = false;
            while (it.hasNext()) {
                o7.f fVar = ((q) it.next()).f95180j;
                z11 |= fVar.f79656d;
                z12 |= fVar.f79654b;
                z13 |= fVar.f79657e;
                z14 |= fVar.f79653a != 1;
                if (z11 && z12 && z13 && z14) {
                    break;
                }
            }
            int i12 = ConstraintProxyUpdateReceiver.f15336a;
            Intent intent2 = new Intent("androidx.work.impl.background.systemalarm.UpdateProxies");
            intent2.setComponent(new ComponentName(context, (Class<?>) ConstraintProxyUpdateReceiver.class));
            intent2.putExtra("KEY_BATTERY_NOT_LOW_PROXY_ENABLED", z11).putExtra("KEY_BATTERY_CHARGING_PROXY_ENABLED", z12).putExtra("KEY_STORAGE_NOT_LOW_PROXY_ENABLED", z13).putExtra("KEY_NETWORK_STATE_PROXY_ENABLED", z14);
            context.sendBroadcast(intent2);
            ArrayList arrayList = new ArrayList(arrayListH.size());
            eVar.f85572b.getClass();
            long jCurrentTimeMillis = System.currentTimeMillis();
            Iterator it2 = arrayListH.iterator();
            while (it2.hasNext()) {
                q qVar = (q) it2.next();
                if (jCurrentTimeMillis >= qVar.a() && (!qVar.c() || eVar.f85574d.b(qVar))) {
                    arrayList.add(qVar);
                }
            }
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                q qVar2 = (q) it3.next();
                String str = qVar2.f95171a;
                x7.i iVarJ = w.b.j(qVar2);
                Intent intent3 = new Intent(context, (Class<?>) SystemAlarmService.class);
                intent3.setAction("ACTION_DELAY_MET");
                d(intent3, iVarJ);
                r.c().getClass();
                ((a8.c) iVar.f85594b).f461d.execute(new l0(iVar, false, intent3, eVar.f85573c, 4));
            }
            return;
        }
        if ("ACTION_RESCHEDULE".equals(action)) {
            r rVarC2 = r.c();
            Objects.toString(intent);
            rVarC2.getClass();
            iVar.f85597e.f();
            return;
        }
        Bundle extras = intent.getExtras();
        String[] strArr = {"KEY_WORKSPEC_ID"};
        if (extras == null || extras.isEmpty() || extras.get(strArr[0]) == null) {
            r.c().a(f85564f, "Invalid request for " + action + " , requires KEY_WORKSPEC_ID .");
            return;
        }
        if ("ACTION_SCHEDULE_WORK".equals(action)) {
            Context context2 = this.f85565a;
            x7.i iVarB = b(intent);
            r rVarC3 = r.c();
            String str2 = f85564f;
            iVarB.toString();
            rVarC3.getClass();
            WorkDatabase workDatabase = iVar.f85597e.f82374c;
            workDatabase.beginTransaction();
            try {
                q qVarL = workDatabase.i().l(iVarB.f95141a);
                if (qVarL == null) {
                    r.c().f(str2, "Skipping scheduling " + iVarB + " because it's no longer in the DB");
                    workDatabase.endTransaction();
                    return;
                }
                if (fq.c.a(qVarL.f95172b)) {
                    r.c().f(str2, "Skipping scheduling " + iVarB + "because it is finished.");
                    workDatabase.endTransaction();
                    return;
                }
                long jA = qVarL.a();
                if (qVarL.c()) {
                    r rVarC4 = r.c();
                    iVarB.toString();
                    rVarC4.getClass();
                    b.b(context2, workDatabase, iVarB, jA);
                    Intent intent4 = new Intent(context2, (Class<?>) SystemAlarmService.class);
                    intent4.setAction("ACTION_CONSTRAINTS_CHANGED");
                    ((a8.c) iVar.f85594b).f461d.execute(new l0(iVar, false, intent4, i5, 4));
                } else {
                    r rVarC5 = r.c();
                    iVarB.toString();
                    rVarC5.getClass();
                    b.b(context2, workDatabase, iVarB, jA);
                }
                workDatabase.setTransactionSuccessful();
                workDatabase.endTransaction();
                return;
            } catch (Throwable th2) {
                workDatabase.endTransaction();
                throw th2;
            }
        }
        if ("ACTION_DELAY_MET".equals(action)) {
            synchronized (this.f85567c) {
                try {
                    x7.i iVarB2 = b(intent);
                    r rVarC6 = r.c();
                    iVarB2.toString();
                    rVarC6.getClass();
                    if (this.f85566b.containsKey(iVarB2)) {
                        r rVarC7 = r.c();
                        iVarB2.toString();
                        rVarC7.getClass();
                    } else {
                        g gVar = new g(this.f85565a, i5, iVar, this.f85569e.l(iVarB2));
                        this.f85566b.put(iVarB2, gVar);
                        gVar.e();
                    }
                } finally {
                }
            }
            return;
        }
        if (!"ACTION_STOP_WORK".equals(action)) {
            if (!"ACTION_EXECUTION_COMPLETED".equals(action)) {
                r.c().f(f85564f, "Ignoring intent " + intent);
                return;
            }
            x7.i iVarB3 = b(intent);
            boolean z15 = intent.getExtras().getBoolean("KEY_NEEDS_RESCHEDULE");
            r rVarC8 = r.c();
            intent.toString();
            rVarC8.getClass();
            c(iVarB3, z15);
            return;
        }
        x7.c cVar = this.f85569e;
        Bundle extras2 = intent.getExtras();
        String string = extras2.getString("KEY_WORKSPEC_ID");
        if (extras2.containsKey("KEY_WORKSPEC_GENERATION")) {
            int i13 = extras2.getInt("KEY_WORKSPEC_GENERATION");
            ArrayList arrayList2 = new ArrayList(1);
            m mVarK = cVar.k(new x7.i(string, i13));
            listJ = arrayList2;
            if (mVarK != null) {
                arrayList2.add(mVarK);
                listJ = arrayList2;
            }
        } else {
            listJ = cVar.j(string);
        }
        for (m mVar : listJ) {
            r.c().getClass();
            iVar.f85602j.n(mVar);
            x7.i iVar2 = mVar.f82354a;
            Context context3 = this.f85565a;
            WorkDatabase workDatabase2 = iVar.f85597e.f82374c;
            int i14 = b.f85563a;
            x7.h hVarF = workDatabase2.f();
            x7.g gVarI = hVarF.i(iVar2);
            if (gVarI != null) {
                b.a(context3, iVar2, gVarI.f95135c);
                r rVarC9 = r.c();
                iVar2.toString();
                rVarC9.getClass();
                String str3 = iVar2.f95141a;
                int i15 = iVar2.f95142b;
                WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) hVarF.f95137b;
                workDatabase_Impl.assertNotSuspendingTransaction();
                qp.h hVar = (qp.h) hVarF.f95139d;
                d7.g gVarAcquire = hVar.acquire();
                if (str3 == null) {
                    gVarAcquire.bindNull(1);
                } else {
                    gVarAcquire.bindString(1, str3);
                }
                gVarAcquire.bindLong(2, i15);
                workDatabase_Impl.beginTransaction();
                try {
                    gVarAcquire.executeUpdateDelete();
                    workDatabase_Impl.setTransactionSuccessful();
                } finally {
                    workDatabase_Impl.endTransaction();
                    hVar.release(gVarAcquire);
                }
            }
            iVar.c(iVar2, false);
        }
    }

    @Override // p7.c
    public final void c(x7.i iVar, boolean z11) {
        synchronized (this.f85567c) {
            try {
                g gVar = (g) this.f85566b.remove(iVar);
                this.f85569e.k(iVar);
                if (gVar != null) {
                    gVar.f(z11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
