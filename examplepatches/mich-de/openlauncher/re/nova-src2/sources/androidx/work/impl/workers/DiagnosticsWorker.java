package androidx.work.impl.workers;

import android.content.Context;
import android.database.Cursor;
import androidx.room.t;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import b8.b;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import o7.f;
import o7.g;
import o7.p;
import o7.r;
import org.jetbrains.annotations.NotNull;
import p7.s;
import v70.o;
import vm.d;
import w20.e;
import x7.h;
import x7.l;
import x7.q;
import x7.u;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/work/impl/workers/DiagnosticsWorker;", "Landroidx/work/Worker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "parameters", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class DiagnosticsWorker extends Worker {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DiagnosticsWorker(@NotNull Context context, @NotNull WorkerParameters parameters) {
        super(context, parameters);
        Intrinsics.g(context, "context");
        Intrinsics.g(parameters, "parameters");
    }

    @Override // androidx.work.Worker
    public final p b() throws Throwable {
        t tVar;
        h hVar;
        l lVar;
        u uVar;
        s sVarC = s.c(getApplicationContext());
        Intrinsics.f(sVarC, "getInstance(applicationContext)");
        WorkDatabase workDatabase = sVarC.f82374c;
        Intrinsics.f(workDatabase, "workManager.workDatabase");
        x7.s sVarI = workDatabase.i();
        l lVarG = workDatabase.g();
        u uVarJ = workDatabase.j();
        h hVarF = workDatabase.f();
        sVarC.f82373b.f79624c.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis() - TimeUnit.DAYS.toMillis(1L);
        sVarI.getClass();
        t tVarC = t.c(1, "SELECT * FROM workspec WHERE last_enqueue_time >= ? AND state IN (2, 3, 5) ORDER BY last_enqueue_time DESC");
        tVarC.bindLong(1, jCurrentTimeMillis);
        WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = o.f(cursorL, "id");
            int iF2 = o.f(cursorL, "state");
            int iF3 = o.f(cursorL, "worker_class_name");
            int iF4 = o.f(cursorL, "input_merger_class_name");
            int iF5 = o.f(cursorL, "input");
            int iF6 = o.f(cursorL, "output");
            int iF7 = o.f(cursorL, "initial_delay");
            int iF8 = o.f(cursorL, "interval_duration");
            int iF9 = o.f(cursorL, "flex_duration");
            int iF10 = o.f(cursorL, "run_attempt_count");
            int iF11 = o.f(cursorL, "backoff_policy");
            tVar = tVarC;
            try {
                int iF12 = o.f(cursorL, "backoff_delay_duration");
                int iF13 = o.f(cursorL, "last_enqueue_time");
                int iF14 = o.f(cursorL, "minimum_retention_duration");
                int iF15 = o.f(cursorL, "schedule_requested_at");
                int iF16 = o.f(cursorL, "run_in_foreground");
                int iF17 = o.f(cursorL, "out_of_quota_policy");
                int iF18 = o.f(cursorL, "period_count");
                int iF19 = o.f(cursorL, "generation");
                int iF20 = o.f(cursorL, "next_schedule_time_override");
                int iF21 = o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = o.f(cursorL, "stop_reason");
                int iF23 = o.f(cursorL, "required_network_type");
                int iF24 = o.f(cursorL, "requires_charging");
                int iF25 = o.f(cursorL, "requires_device_idle");
                int iF26 = o.f(cursorL, "requires_battery_not_low");
                int iF27 = o.f(cursorL, "requires_storage_not_low");
                int iF28 = o.f(cursorL, "trigger_content_update_delay");
                int iF29 = o.f(cursorL, "trigger_max_content_delay");
                int iF30 = o.f(cursorL, "content_uri_triggers");
                int i5 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    g gVarA = g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    g gVarA2 = g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i11 = cursorL.getInt(iF10);
                    int iL = e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i12 = i5;
                    long j16 = cursorL.getLong(i12);
                    int i13 = iF9;
                    int i14 = iF15;
                    long j17 = cursorL.getLong(i14);
                    iF15 = i14;
                    int i15 = iF16;
                    boolean z11 = cursorL.getInt(i15) != 0;
                    iF16 = i15;
                    int i16 = iF17;
                    int iN = e.n(cursorL.getInt(i16));
                    iF17 = i16;
                    int i17 = iF18;
                    int i18 = cursorL.getInt(i17);
                    iF18 = i17;
                    int i19 = iF19;
                    int i21 = cursorL.getInt(i19);
                    iF19 = i19;
                    int i22 = iF20;
                    long j18 = cursorL.getLong(i22);
                    iF20 = i22;
                    int i23 = iF21;
                    int i24 = cursorL.getInt(i23);
                    iF21 = i23;
                    int i25 = iF22;
                    int i26 = cursorL.getInt(i25);
                    iF22 = i25;
                    int i27 = iF23;
                    int iM = e.m(cursorL.getInt(i27));
                    iF23 = i27;
                    int i28 = iF24;
                    boolean z12 = cursorL.getInt(i28) != 0;
                    iF24 = i28;
                    int i29 = iF25;
                    boolean z13 = cursorL.getInt(i29) != 0;
                    iF25 = i29;
                    int i31 = iF26;
                    boolean z14 = cursorL.getInt(i31) != 0;
                    iF26 = i31;
                    int i32 = iF27;
                    boolean z15 = cursorL.getInt(i32) != 0;
                    iF27 = i32;
                    int i33 = iF28;
                    long j19 = cursorL.getLong(i33);
                    iF28 = i33;
                    int i34 = iF29;
                    long j21 = cursorL.getLong(i34);
                    iF29 = i34;
                    int i35 = iF30;
                    if (!cursorL.isNull(i35)) {
                        blob = cursorL.getBlob(i35);
                    }
                    iF30 = i35;
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new f(iM, z12, z13, z14, z15, j19, j21, e.b(blob)), i11, iL, j14, j15, j16, j17, z11, iN, i18, i21, j18, i24, i26));
                    iF9 = i13;
                    i5 = i12;
                }
                cursorL.close();
                tVar.d();
                ArrayList arrayListG = sVarI.g();
                ArrayList arrayListD = sVarI.d();
                if (arrayList.isEmpty()) {
                    hVar = hVarF;
                    lVar = lVarG;
                    uVar = uVarJ;
                } else {
                    r rVarC = r.c();
                    String str = b.f17605a;
                    rVarC.d(str, "Recently completed work:\n\n");
                    hVar = hVarF;
                    lVar = lVarG;
                    uVar = uVarJ;
                    r.c().d(str, b.a(lVar, uVar, hVar, arrayList));
                }
                if (!arrayListG.isEmpty()) {
                    r rVarC2 = r.c();
                    String str2 = b.f17605a;
                    rVarC2.d(str2, "Running work:\n\n");
                    r.c().d(str2, b.a(lVar, uVar, hVar, arrayListG));
                }
                if (!arrayListD.isEmpty()) {
                    r rVarC3 = r.c();
                    String str3 = b.f17605a;
                    rVarC3.d(str3, "Enqueued work:\n\n");
                    r.c().d(str3, b.a(lVar, uVar, hVar, arrayListD));
                }
                return p.a();
            } catch (Throwable th2) {
                th = th2;
                cursorL.close();
                tVar.d();
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            tVar = tVarC;
        }
    }
}
