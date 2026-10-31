package x7;

import android.database.Cursor;
import androidx.work.impl.WorkDatabase_Impl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import ps.e0;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final WorkDatabase_Impl f95193a;

    /* renamed from: b, reason: collision with root package name */
    public final b f95194b;

    /* renamed from: c, reason: collision with root package name */
    public final qp.f f95195c;

    /* renamed from: d, reason: collision with root package name */
    public final qp.h f95196d;

    /* renamed from: e, reason: collision with root package name */
    public final qp.h f95197e;

    /* renamed from: f, reason: collision with root package name */
    public final qp.h f95198f;

    /* renamed from: g, reason: collision with root package name */
    public final qp.h f95199g;

    /* renamed from: h, reason: collision with root package name */
    public final qp.h f95200h;

    /* renamed from: i, reason: collision with root package name */
    public final qp.h f95201i;

    /* renamed from: j, reason: collision with root package name */
    public final qp.h f95202j;

    /* renamed from: k, reason: collision with root package name */
    public final qp.h f95203k;

    /* renamed from: l, reason: collision with root package name */
    public final qp.h f95204l;

    /* renamed from: m, reason: collision with root package name */
    public final qp.h f95205m;
    public final r n;
    public final r o;

    public s(WorkDatabase_Impl workDatabase_Impl) {
        this.f95193a = workDatabase_Impl;
        this.f95194b = new b(workDatabase_Impl, 4);
        this.f95195c = new qp.f(workDatabase_Impl, 1);
        this.f95196d = new qp.h(workDatabase_Impl, 10);
        this.f95197e = new qp.h(workDatabase_Impl, 11);
        this.f95198f = new qp.h(workDatabase_Impl, 12);
        this.f95199g = new qp.h(workDatabase_Impl, 13);
        this.f95200h = new qp.h(workDatabase_Impl, 14);
        this.f95201i = new qp.h(workDatabase_Impl, 15);
        this.f95202j = new qp.h(workDatabase_Impl, 16);
        this.f95203k = new qp.h(workDatabase_Impl, 6);
        new qp.h(workDatabase_Impl, 7);
        this.f95204l = new qp.h(workDatabase_Impl, 8);
        this.f95205m = new qp.h(workDatabase_Impl, 9);
        this.n = new r(workDatabase_Impl, 0);
        new r(workDatabase_Impl, 1);
        new r(workDatabase_Impl, 2);
        this.o = new r(workDatabase_Impl, 3);
    }

    public final void a(HashMap map) throws IOException {
        int i5;
        Set<String> setKeySet = map.keySet();
        if (setKeySet.isEmpty()) {
            return;
        }
        if (map.size() > 999) {
            HashMap map2 = new HashMap(androidx.room.o.MAX_BIND_PARAMETER_CNT);
            loop0: while (true) {
                i5 = 0;
                for (String str : setKeySet) {
                    map2.put(str, (ArrayList) map.get(str));
                    i5++;
                    if (i5 == 999) {
                        break;
                    }
                }
                a(map2);
                map2 = new HashMap(androidx.room.o.MAX_BIND_PARAMETER_CNT);
            }
            if (i5 > 0) {
                a(map2);
                return;
            }
            return;
        }
        StringBuilder sbT = e0.t();
        sbT.append("SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN (");
        int size = setKeySet.size();
        e0.f(size, sbT);
        sbT.append(")");
        androidx.room.t tVarC = androidx.room.t.c(size, sbT.toString());
        int i11 = 1;
        for (String str2 : setKeySet) {
            if (str2 == null) {
                tVarC.bindNull(i11);
            } else {
                tVarC.bindString(i11, str2);
            }
            i11++;
        }
        Cursor cursorL = vm.d.l(this.f95193a, tVarC, false);
        try {
            int iE = v70.o.e(cursorL, "work_spec_id");
            if (iE == -1) {
                return;
            }
            while (cursorL.moveToNext()) {
                ArrayList arrayList = (ArrayList) map.get(cursorL.getString(iE));
                if (arrayList != null) {
                    arrayList.add(o7.g.a(cursorL.isNull(0) ? null : cursorL.getBlob(0)));
                }
            }
        } finally {
            cursorL.close();
        }
    }

    public final void b(HashMap map) throws IOException {
        int i5;
        Set<String> setKeySet = map.keySet();
        if (setKeySet.isEmpty()) {
            return;
        }
        if (map.size() > 999) {
            HashMap map2 = new HashMap(androidx.room.o.MAX_BIND_PARAMETER_CNT);
            loop0: while (true) {
                i5 = 0;
                for (String str : setKeySet) {
                    map2.put(str, (ArrayList) map.get(str));
                    i5++;
                    if (i5 == 999) {
                        break;
                    }
                }
                b(map2);
                map2 = new HashMap(androidx.room.o.MAX_BIND_PARAMETER_CNT);
            }
            if (i5 > 0) {
                b(map2);
                return;
            }
            return;
        }
        StringBuilder sbT = e0.t();
        sbT.append("SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN (");
        int size = setKeySet.size();
        e0.f(size, sbT);
        sbT.append(")");
        androidx.room.t tVarC = androidx.room.t.c(size, sbT.toString());
        int i11 = 1;
        for (String str2 : setKeySet) {
            if (str2 == null) {
                tVarC.bindNull(i11);
            } else {
                tVarC.bindString(i11, str2);
            }
            i11++;
        }
        Cursor cursorL = vm.d.l(this.f95193a, tVarC, false);
        try {
            int iE = v70.o.e(cursorL, "work_spec_id");
            if (iE == -1) {
                return;
            }
            while (cursorL.moveToNext()) {
                ArrayList arrayList = (ArrayList) map.get(cursorL.getString(iE));
                if (arrayList != null) {
                    arrayList.add(cursorL.isNull(0) ? null : cursorL.getString(0));
                }
            }
        } finally {
            cursorL.close();
        }
    }

    public final void c(String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95196d;
        d7.g gVarAcquire = hVar.acquire();
        if (str == null) {
            gVarAcquire.bindNull(1);
        } else {
            gVarAcquire.bindString(1, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final ArrayList d() throws Throwable {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT * FROM workspec WHERE state=0 ORDER BY last_enqueue_time LIMIT ?");
        tVarC.bindLong(1, 200);
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                int i5 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i11 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i12 = i5;
                    long j16 = cursorL.getLong(i12);
                    int i13 = iF12;
                    int i14 = iF15;
                    long j17 = cursorL.getLong(i14);
                    iF15 = i14;
                    int i15 = iF16;
                    boolean z11 = cursorL.getInt(i15) != 0;
                    iF16 = i15;
                    int i16 = iF17;
                    int iN = w20.e.n(cursorL.getInt(i16));
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
                    int iM = w20.e.m(cursorL.getInt(i27));
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
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i11, iL, j14, j15, j16, j17, z11, iN, i18, i21, j18, i24, i26));
                    iF12 = i13;
                    i5 = i12;
                }
                cursorL.close();
                tVar.d();
                return arrayList;
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

    public final ArrayList e(int i5) throws Throwable {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 ORDER BY last_enqueue_time LIMIT (SELECT MAX(?-COUNT(*), 0) FROM workspec WHERE schedule_requested_at<>-1 AND LENGTH(content_uri_triggers)=0 AND state NOT IN (2, 3, 5))");
        tVarC.bindLong(1, i5);
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                int i11 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i12 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i13 = i11;
                    long j16 = cursorL.getLong(i13);
                    int i14 = iF12;
                    int i15 = iF15;
                    long j17 = cursorL.getLong(i15);
                    iF15 = i15;
                    int i16 = iF16;
                    boolean z11 = cursorL.getInt(i16) != 0;
                    iF16 = i16;
                    int i17 = iF17;
                    int iN = w20.e.n(cursorL.getInt(i17));
                    iF17 = i17;
                    int i18 = iF18;
                    int i19 = cursorL.getInt(i18);
                    iF18 = i18;
                    int i21 = iF19;
                    int i22 = cursorL.getInt(i21);
                    iF19 = i21;
                    int i23 = iF20;
                    long j18 = cursorL.getLong(i23);
                    iF20 = i23;
                    int i24 = iF21;
                    int i25 = cursorL.getInt(i24);
                    iF21 = i24;
                    int i26 = iF22;
                    int i27 = cursorL.getInt(i26);
                    iF22 = i26;
                    int i28 = iF23;
                    int iM = w20.e.m(cursorL.getInt(i28));
                    iF23 = i28;
                    int i29 = iF24;
                    boolean z12 = cursorL.getInt(i29) != 0;
                    iF24 = i29;
                    int i31 = iF25;
                    boolean z13 = cursorL.getInt(i31) != 0;
                    iF25 = i31;
                    int i32 = iF26;
                    boolean z14 = cursorL.getInt(i32) != 0;
                    iF26 = i32;
                    int i33 = iF27;
                    boolean z15 = cursorL.getInt(i33) != 0;
                    iF27 = i33;
                    int i34 = iF28;
                    long j19 = cursorL.getLong(i34);
                    iF28 = i34;
                    int i35 = iF29;
                    long j21 = cursorL.getLong(i35);
                    iF29 = i35;
                    int i36 = iF30;
                    if (!cursorL.isNull(i36)) {
                        blob = cursorL.getBlob(i36);
                    }
                    iF30 = i36;
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i12, iL, j14, j15, j16, j17, z11, iN, i19, i22, j18, i25, i27));
                    iF12 = i14;
                    i11 = i13;
                }
                cursorL.close();
                tVar.d();
                return arrayList;
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

    public final ArrayList f() throws Throwable {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(0, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time");
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                int i5 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i11 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i12 = i5;
                    long j16 = cursorL.getLong(i12);
                    int i13 = iF13;
                    int i14 = iF15;
                    long j17 = cursorL.getLong(i14);
                    iF15 = i14;
                    int i15 = iF16;
                    boolean z11 = cursorL.getInt(i15) != 0;
                    iF16 = i15;
                    int i16 = iF17;
                    int iN = w20.e.n(cursorL.getInt(i16));
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
                    int iM = w20.e.m(cursorL.getInt(i27));
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
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i11, iL, j14, j15, j16, j17, z11, iN, i18, i21, j18, i24, i26));
                    iF13 = i13;
                    i5 = i12;
                }
                cursorL.close();
                tVar.d();
                return arrayList;
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

    public final ArrayList g() throws Throwable {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(0, "SELECT * FROM workspec WHERE state=1");
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                int i5 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i11 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i12 = i5;
                    long j16 = cursorL.getLong(i12);
                    int i13 = iF13;
                    int i14 = iF15;
                    long j17 = cursorL.getLong(i14);
                    iF15 = i14;
                    int i15 = iF16;
                    boolean z11 = cursorL.getInt(i15) != 0;
                    iF16 = i15;
                    int i16 = iF17;
                    int iN = w20.e.n(cursorL.getInt(i16));
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
                    int iM = w20.e.m(cursorL.getInt(i27));
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
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i11, iL, j14, j15, j16, j17, z11, iN, i18, i21, j18, i24, i26));
                    iF13 = i13;
                    i5 = i12;
                }
                cursorL.close();
                tVar.d();
                return arrayList;
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

    public final ArrayList h() {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(0, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at<>-1");
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                int i5 = iF14;
                ArrayList arrayList = new ArrayList(cursorL.getCount());
                while (cursorL.moveToNext()) {
                    byte[] blob = null;
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i11 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    int i12 = i5;
                    long j16 = cursorL.getLong(i12);
                    int i13 = iF13;
                    int i14 = iF15;
                    long j17 = cursorL.getLong(i14);
                    iF15 = i14;
                    int i15 = iF16;
                    boolean z11 = cursorL.getInt(i15) != 0;
                    iF16 = i15;
                    int i16 = iF17;
                    int iN = w20.e.n(cursorL.getInt(i16));
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
                    int iM = w20.e.m(cursorL.getInt(i27));
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
                    arrayList.add(new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i11, iL, j14, j15, j16, j17, z11, iN, i18, i21, j18, i24, i26));
                    iF13 = i13;
                    i5 = i12;
                }
                cursorL.close();
                tVar.d();
                return arrayList;
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

    public final int i(String str) throws IOException {
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT state FROM workspec WHERE id=?");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        int iO = 0;
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            if (cursorL.moveToFirst()) {
                Integer numValueOf = cursorL.isNull(0) ? null : Integer.valueOf(cursorL.getInt(0));
                if (numValueOf != null) {
                    iO = w20.e.o(numValueOf.intValue());
                }
            }
            return iO;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public final ArrayList j(String str) throws IOException {
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM workname WHERE name=?)");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            ArrayList arrayList = new ArrayList(cursorL.getCount());
            while (cursorL.moveToNext()) {
                arrayList.add(cursorL.isNull(0) ? null : cursorL.getString(0));
            }
            return arrayList;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public final ArrayList k(String str) throws IOException {
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM worktag WHERE tag=?)");
        tVarC.bindString(1, str);
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            ArrayList arrayList = new ArrayList(cursorL.getCount());
            while (cursorL.moveToNext()) {
                arrayList.add(cursorL.isNull(0) ? null : cursorL.getString(0));
            }
            return arrayList;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public final q l(String str) {
        androidx.room.t tVar;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT * FROM workspec WHERE id=?");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int iF = v70.o.f(cursorL, "id");
            int iF2 = v70.o.f(cursorL, "state");
            int iF3 = v70.o.f(cursorL, "worker_class_name");
            int iF4 = v70.o.f(cursorL, "input_merger_class_name");
            int iF5 = v70.o.f(cursorL, "input");
            int iF6 = v70.o.f(cursorL, "output");
            int iF7 = v70.o.f(cursorL, "initial_delay");
            int iF8 = v70.o.f(cursorL, "interval_duration");
            int iF9 = v70.o.f(cursorL, "flex_duration");
            int iF10 = v70.o.f(cursorL, "run_attempt_count");
            int iF11 = v70.o.f(cursorL, "backoff_policy");
            int iF12 = v70.o.f(cursorL, "backoff_delay_duration");
            int iF13 = v70.o.f(cursorL, "last_enqueue_time");
            tVar = tVarC;
            try {
                int iF14 = v70.o.f(cursorL, "minimum_retention_duration");
                int iF15 = v70.o.f(cursorL, "schedule_requested_at");
                int iF16 = v70.o.f(cursorL, "run_in_foreground");
                int iF17 = v70.o.f(cursorL, "out_of_quota_policy");
                int iF18 = v70.o.f(cursorL, "period_count");
                int iF19 = v70.o.f(cursorL, "generation");
                int iF20 = v70.o.f(cursorL, "next_schedule_time_override");
                int iF21 = v70.o.f(cursorL, "next_schedule_time_override_generation");
                int iF22 = v70.o.f(cursorL, "stop_reason");
                int iF23 = v70.o.f(cursorL, "required_network_type");
                int iF24 = v70.o.f(cursorL, "requires_charging");
                int iF25 = v70.o.f(cursorL, "requires_device_idle");
                int iF26 = v70.o.f(cursorL, "requires_battery_not_low");
                int iF27 = v70.o.f(cursorL, "requires_storage_not_low");
                int iF28 = v70.o.f(cursorL, "trigger_content_update_delay");
                int iF29 = v70.o.f(cursorL, "trigger_max_content_delay");
                int iF30 = v70.o.f(cursorL, "content_uri_triggers");
                q qVar = null;
                byte[] blob = null;
                if (cursorL.moveToFirst()) {
                    String string = cursorL.isNull(iF) ? null : cursorL.getString(iF);
                    int iO = w20.e.o(cursorL.getInt(iF2));
                    String string2 = cursorL.isNull(iF3) ? null : cursorL.getString(iF3);
                    String string3 = cursorL.isNull(iF4) ? null : cursorL.getString(iF4);
                    o7.g gVarA = o7.g.a(cursorL.isNull(iF5) ? null : cursorL.getBlob(iF5));
                    o7.g gVarA2 = o7.g.a(cursorL.isNull(iF6) ? null : cursorL.getBlob(iF6));
                    long j11 = cursorL.getLong(iF7);
                    long j12 = cursorL.getLong(iF8);
                    long j13 = cursorL.getLong(iF9);
                    int i5 = cursorL.getInt(iF10);
                    int iL = w20.e.l(cursorL.getInt(iF11));
                    long j14 = cursorL.getLong(iF12);
                    long j15 = cursorL.getLong(iF13);
                    long j16 = cursorL.getLong(iF14);
                    long j17 = cursorL.getLong(iF15);
                    boolean z11 = cursorL.getInt(iF16) != 0;
                    int iN = w20.e.n(cursorL.getInt(iF17));
                    int i11 = cursorL.getInt(iF18);
                    int i12 = cursorL.getInt(iF19);
                    long j18 = cursorL.getLong(iF20);
                    int i13 = cursorL.getInt(iF21);
                    int i14 = cursorL.getInt(iF22);
                    int iM = w20.e.m(cursorL.getInt(iF23));
                    boolean z12 = cursorL.getInt(iF24) != 0;
                    boolean z13 = cursorL.getInt(iF25) != 0;
                    boolean z14 = cursorL.getInt(iF26) != 0;
                    boolean z15 = cursorL.getInt(iF27) != 0;
                    long j19 = cursorL.getLong(iF28);
                    long j21 = cursorL.getLong(iF29);
                    if (!cursorL.isNull(iF30)) {
                        blob = cursorL.getBlob(iF30);
                    }
                    qVar = new q(string, iO, string2, string3, gVarA, gVarA2, j11, j12, j13, new o7.f(iM, z12, z13, z14, z15, j19, j21, w20.e.b(blob)), i5, iL, j14, j15, j16, j17, z11, iN, i11, i12, j18, i13, i14);
                }
                cursorL.close();
                tVar.d();
                return qVar;
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

    public final ArrayList m(String str) throws IOException {
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT id, state FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            ArrayList arrayList = new ArrayList(cursorL.getCount());
            while (cursorL.moveToNext()) {
                String id2 = cursorL.isNull(0) ? null : cursorL.getString(0);
                int iO = w20.e.o(cursorL.getInt(1));
                Intrinsics.g(id2, "id");
                o oVar = new o();
                oVar.f95153a = id2;
                oVar.f95154b = iO;
                arrayList.add(oVar);
            }
            return arrayList;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public final void n(long j11, String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95205m;
        d7.g gVarAcquire = hVar.acquire();
        gVarAcquire.bindLong(1, j11);
        if (str == null) {
            gVarAcquire.bindNull(2);
        } else {
            gVarAcquire.bindString(2, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final void o(int i5, String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95204l;
        d7.g gVarAcquire = hVar.acquire();
        if (str == null) {
            gVarAcquire.bindNull(1);
        } else {
            gVarAcquire.bindString(1, str);
        }
        gVarAcquire.bindLong(2, i5);
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final void p(long j11, String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95201i;
        d7.g gVarAcquire = hVar.acquire();
        gVarAcquire.bindLong(1, j11);
        if (str == null) {
            gVarAcquire.bindNull(2);
        } else {
            gVarAcquire.bindString(2, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final void q(String str, o7.g gVar) throws Throwable {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95200h;
        d7.g gVarAcquire = hVar.acquire();
        byte[] bArrC = o7.g.c(gVar);
        if (bArrC == null) {
            gVarAcquire.bindNull(1);
        } else {
            gVarAcquire.bindBlob(1, bArrC);
        }
        if (str == null) {
            gVarAcquire.bindNull(2);
        } else {
            gVarAcquire.bindString(2, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final void r(int i5, String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = this.f95197e;
        d7.g gVarAcquire = hVar.acquire();
        gVarAcquire.bindLong(1, w20.e.s(i5));
        if (str == null) {
            gVarAcquire.bindNull(2);
        } else {
            gVarAcquire.bindString(2, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    public final void s(int i5, String str) {
        WorkDatabase_Impl workDatabase_Impl = this.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        r rVar = this.o;
        d7.g gVarAcquire = rVar.acquire();
        gVarAcquire.bindLong(1, i5);
        if (str == null) {
            gVarAcquire.bindNull(2);
        } else {
            gVarAcquire.bindString(2, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            rVar.release(gVarAcquire);
        }
    }
}
