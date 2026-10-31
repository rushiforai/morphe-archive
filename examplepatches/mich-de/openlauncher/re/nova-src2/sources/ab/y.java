package ab;

import ads_mobile_sdk.d62;
import ai.b2;
import ai.g1;
import ai.i4;
import ai.j4;
import ai.l4;
import ai.m1;
import ai.m4;
import ai.o0;
import ai.p3;
import ai.p4;
import ai.r1;
import ai.s3;
import ai.t1;
import ai.t2;
import ai.z0;
import ai.z1;
import android.app.Application;
import android.app.Service;
import android.app.job.JobParameters;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.widget.OverScroller;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.work.impl.WorkDatabase_Impl;
import androidx.work.impl.background.systemalarm.ConstraintProxy$BatteryChargingProxy;
import androidx.work.impl.background.systemalarm.ConstraintProxy$BatteryNotLowProxy;
import androidx.work.impl.background.systemalarm.ConstraintProxy$NetworkStateProxy;
import androidx.work.impl.background.systemalarm.ConstraintProxy$StorageNotLowProxy;
import androidx.work.impl.background.systemalarm.ConstraintProxyUpdateReceiver;
import cl.w0;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.volley.VolleyError;
import com.google.android.gms.cloudmessaging.CloudMessage;
import com.google.android.gms.internal.consent_sdk.j0;
import com.google.android.gms.internal.measurement.bg;
import com.google.android.gms.internal.measurement.f7;
import com.google.android.gms.internal.measurement.w6;
import com.google.android.gms.internal.measurement.zzd;
import com.google.android.gms.measurement.internal.zzaf;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import com.google.android.gms.tasks.Tasks;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.play.core.hsdp.protocol.PrewarmRequest;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;
import org.chromium.net.InlineExecutionProhibitedException;
import org.json.JSONException;
import org.json.JSONObject;
import sp.m0;

/* loaded from: classes2.dex */
public final class y implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f773a;

    /* renamed from: b, reason: collision with root package name */
    public Object f774b;

    /* renamed from: c, reason: collision with root package name */
    public Object f775c;

    /* renamed from: d, reason: collision with root package name */
    public Object f776d;

    public /* synthetic */ y() {
        this.f773a = 23;
    }

    public static y a(p7.s sVar, UUID uuid) {
        return new y(sVar, uuid);
    }

    private final void c() {
        mk.f fVar = (mk.f) this.f774b;
        List<mk.p> list = (List) this.f775c;
        x7.e eVar = (x7.e) this.f776d;
        try {
            lk.f fVar2 = (lk.f) ((IInterface) fVar.f76431b.f76470k);
            if (fVar2 == null) {
                return;
            }
            String packageName = fVar.f76430a.getPackageName();
            ArrayList arrayList = new ArrayList();
            for (mk.p pVar : list) {
                String str = pVar.f76471a;
                arrayList.add(new PrewarmRequest(str, ex.i.U(str, pVar.f76472b, pVar.f76473c).toString(), pVar.f76474d));
            }
            mk.c cVar = new mk.c(fVar, eVar);
            lk.d dVar = (lk.d) fVar2;
            Parcel parcelX = dVar.X();
            parcelX.writeString(packageName);
            parcelX.writeTypedList(arrayList);
            parcelX.writeStrongBinder(cVar);
            dVar.Y(parcelX, 1);
        } catch (DeadObjectException e3) {
            Log.e("HsdpClientImpl", "hsdpService is dead", e3);
        } catch (RemoteException e11) {
            Log.e("HsdpClientImpl", "Failed to call hsdpService.prewarm", e11);
        }
    }

    private final void d() {
        int i5;
        fi.t tVarF;
        CloudMessage cloudMessage = (CloudMessage) this.f775c;
        Intent intent = cloudMessage.f31768f;
        String stringExtra = intent.getStringExtra("google.message_id");
        if (stringExtra == null) {
            stringExtra = intent.getStringExtra("message_id");
        }
        if (TextUtils.isEmpty(stringExtra)) {
            tVarF = Tasks.d(null);
        } else {
            Bundle bundle = new Bundle();
            Intent intent2 = cloudMessage.f31768f;
            String stringExtra2 = intent2.getStringExtra("google.message_id");
            if (stringExtra2 == null) {
                stringExtra2 = intent2.getStringExtra("message_id");
            }
            bundle.putString("google.message_id", stringExtra2);
            Intent intent3 = cloudMessage.f31768f;
            Integer numValueOf = intent3.hasExtra("google.product_id") ? Integer.valueOf(intent3.getIntExtra("google.product_id", 0)) : null;
            if (numValueOf != null) {
                bundle.putInt("google.product_id", numValueOf.intValue());
            }
            Context context = (Context) this.f774b;
            bundle.putBoolean("supports_message_handled", true);
            og.g gVarE = og.g.e(context);
            synchronized (gVarE) {
                i5 = gVarE.f80406a;
                gVarE.f80406a = i5 + 1;
            }
            tVarF = gVarE.f(new og.f(i5, 2, bundle, 0));
        }
        tVarF.c(m.r.f75331c, new fi.l((CountDownLatch) this.f776d));
    }

    private final void e() {
        BroadcastReceiver.PendingResult pendingResult = (BroadcastReceiver.PendingResult) this.f776d;
        Context context = (Context) this.f775c;
        Intent intent = (Intent) this.f774b;
        try {
            boolean booleanExtra = intent.getBooleanExtra("KEY_BATTERY_NOT_LOW_PROXY_ENABLED", false);
            boolean booleanExtra2 = intent.getBooleanExtra("KEY_BATTERY_CHARGING_PROXY_ENABLED", false);
            boolean booleanExtra3 = intent.getBooleanExtra("KEY_STORAGE_NOT_LOW_PROXY_ENABLED", false);
            boolean booleanExtra4 = intent.getBooleanExtra("KEY_NETWORK_STATE_PROXY_ENABLED", false);
            o7.r rVarC = o7.r.c();
            int i5 = ConstraintProxyUpdateReceiver.f15336a;
            rVarC.getClass();
            y7.l.a(context, ConstraintProxy$BatteryNotLowProxy.class, booleanExtra);
            y7.l.a(context, ConstraintProxy$BatteryChargingProxy.class, booleanExtra2);
            y7.l.a(context, ConstraintProxy$StorageNotLowProxy.class, booleanExtra3);
            y7.l.a(context, ConstraintProxy$NetworkStateProxy.class, booleanExtra4);
        } finally {
            pendingResult.finish();
        }
    }

    private final void f() {
        Object objCall;
        try {
            objCall = ((x4.d) this.f774b).call();
        } catch (Exception unused) {
            objCall = null;
        }
        ((Handler) this.f776d).post(new x4.j(0, (x4.e) this.f775c, objCall));
    }

    public z7.j b() {
        return (z7.j) this.f774b;
    }

    public o7.c0 g() {
        x7.p pVar;
        o7.g gVar;
        o7.b0 b0Var;
        int i5;
        long j11;
        long jB;
        x7.s sVarI = ((p7.s) this.f775c).f82374c.i();
        String string = ((UUID) this.f776d).toString();
        WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, requires_charging,requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id=?");
        if (string == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, string);
        }
        workDatabase_Impl.assertNotSuspendingTransaction();
        workDatabase_Impl.beginTransaction();
        try {
            Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, true);
            try {
                HashMap map = new HashMap();
                HashMap map2 = new HashMap();
                while (cursorL.moveToNext()) {
                    String string2 = cursorL.getString(0);
                    if (((ArrayList) map.get(string2)) == null) {
                        map.put(string2, new ArrayList());
                    }
                    String string3 = cursorL.getString(0);
                    if (((ArrayList) map2.get(string3)) == null) {
                        map2.put(string3, new ArrayList());
                    }
                }
                cursorL.moveToPosition(-1);
                sVarI.b(map);
                sVarI.a(map2);
                if (cursorL.moveToFirst()) {
                    String string4 = cursorL.isNull(0) ? null : cursorL.getString(0);
                    int iO = w20.e.o(cursorL.getInt(1));
                    o7.g gVarA = o7.g.a(cursorL.isNull(2) ? null : cursorL.getBlob(2));
                    int i11 = cursorL.getInt(3);
                    int i12 = cursorL.getInt(4);
                    long j12 = cursorL.getLong(13);
                    long j13 = cursorL.getLong(14);
                    long j14 = cursorL.getLong(15);
                    int iL = w20.e.l(cursorL.getInt(16));
                    long j15 = cursorL.getLong(17);
                    long j16 = cursorL.getLong(18);
                    int i13 = cursorL.getInt(19);
                    long j17 = cursorL.getLong(20);
                    int i14 = cursorL.getInt(21);
                    o7.f fVar = new o7.f(w20.e.m(cursorL.getInt(5)), cursorL.getInt(6) != 0, cursorL.getInt(7) != 0, cursorL.getInt(8) != 0, cursorL.getInt(9) != 0, cursorL.getLong(10), cursorL.getLong(11), w20.e.b(cursorL.isNull(12) ? null : cursorL.getBlob(12)));
                    ArrayList arrayList = (ArrayList) map.get(cursorL.getString(0));
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    ArrayList arrayList2 = (ArrayList) map2.get(cursorL.getString(0));
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList();
                    }
                    pVar = new x7.p(string4, iO, gVarA, j12, j13, j14, fVar, i11, iL, j15, j16, i13, i12, j17, i14, arrayList, arrayList2);
                } else {
                    pVar = null;
                }
                workDatabase_Impl.setTransactionSuccessful();
                cursorL.close();
                tVarC.d();
                if (pVar == null) {
                    return null;
                }
                ArrayList arrayList3 = pVar.f95169q;
                o7.g progress = !arrayList3.isEmpty() ? (o7.g) arrayList3.get(0) : o7.g.f79665c;
                UUID uuidFromString = UUID.fromString(pVar.f95155a);
                Intrinsics.f(uuidFromString, "fromString(id)");
                int i15 = pVar.f95156b;
                HashSet hashSet = new HashSet(pVar.f95168p);
                o7.g gVar2 = pVar.f95157c;
                Intrinsics.f(progress, "progress");
                int i16 = pVar.f95162h;
                int i17 = pVar.f95167m;
                o7.f fVar2 = pVar.f95161g;
                long j18 = pVar.f95158d;
                long j19 = pVar.f95159e;
                if (j19 != 0) {
                    gVar = progress;
                    b0Var = new o7.b0(j19, pVar.f95160f);
                } else {
                    gVar = progress;
                    b0Var = null;
                }
                int i18 = pVar.f95156b;
                if (i18 == 1) {
                    String str = x7.q.f95170x;
                    i5 = i16;
                    jB = vm.d.b(i18 == 1 && i16 > 0, i5, pVar.f95163i, pVar.f95164j, pVar.f95165k, pVar.f95166l, j19 != 0, j18, pVar.f95160f, j19, pVar.n);
                    j11 = j18;
                } else {
                    i5 = i16;
                    j11 = j18;
                    jB = Long.MAX_VALUE;
                }
                return new o7.c0(uuidFromString, i15, hashSet, gVar2, gVar, i5, i17, fVar2, j11, b0Var, jB, pVar.o);
            } catch (Throwable th2) {
                cursorL.close();
                tVarC.d();
                throw th2;
            }
        } finally {
            workDatabase_Impl.endTransaction();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:197:0x0475  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x047b  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x048c  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x0596  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws Throwable {
        zzbf zzbfVar;
        Cursor cursorQuery;
        int i5;
        long j11;
        l4 l4Var;
        AtomicReference atomicReference;
        p3 p3Var;
        m1 m1Var;
        z0 z0Var;
        p4 p4Var;
        m1 m1Var2;
        z0 z0Var2;
        o0 o0Var;
        JSONObject jSONObject;
        OverScroller overScroller;
        int i11 = 3;
        String strO = null;
        switch (this.f773a) {
            case 0:
                a0 a0Var = (a0) this.f776d;
                NovaLauncher novaLauncher = a0Var.f676c;
                a0Var.f680g = novaLauncher.S.allocateAppWidgetId();
                AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(novaLauncher);
                int i12 = a0Var.f680g;
                LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo = (LauncherAppWidgetProviderInfo) this.f774b;
                if (i12 > -100 ? appWidgetManager.bindAppWidgetIdIfAllowed(i12, launcherAppWidgetProviderInfo.getProfile(), ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider, (Bundle) this.f775c) : true) {
                    a0Var.f677d.post(a0Var.f674a);
                    return;
                }
                return;
            case 1:
                d62 d62Var = (d62) this.f776d;
                WebView webView = (WebView) this.f774b;
                String str = (String) this.f775c;
                d62Var.getClass();
                d62.a(webView, str);
                return;
            case 2:
                zzr zzrVar = (zzr) this.f775c;
                j4 j4Var = ((t1) this.f776d).f13334a;
                j4Var.V();
                zzah zzahVar = (zzah) this.f774b;
                if (zzahVar.f33759h.zza() == null) {
                    j4Var.a0(zzahVar, zzrVar);
                    return;
                } else {
                    j4Var.Z(zzahVar, zzrVar);
                    return;
                }
            case 3:
                zzbh zzbhVar = (zzbh) this.f774b;
                zzr zzrVar2 = (zzr) this.f775c;
                t1 t1Var = (t1) this.f776d;
                t1Var.getClass();
                j4 j4Var2 = t1Var.f13334a;
                if ("_cmp".equals(zzbhVar.f33768f) && (zzbfVar = zzbhVar.f33769g) != null) {
                    Bundle bundle = zzbfVar.f33767f;
                    if (bundle.size() != 0) {
                        String string = bundle.getString("_cis");
                        if ("referrer broadcast".equals(string) || "referrer API".equals(string)) {
                            j4Var2.b().f13196l.b(zzbhVar.toString(), "Event has been filtered ");
                            zzbhVar = new zzbh("_cmpx", zzbfVar, zzbhVar.f33770h, zzbhVar.f33771i, zzbhVar.f33772j);
                        }
                    }
                }
                String str2 = zzbhVar.f33768f;
                g1 g1Var = j4Var2.f13039a;
                m4 m4Var = j4Var2.f13045g;
                j4.T(g1Var);
                String str3 = zzrVar2.f33792f;
                w6 w6Var = TextUtils.isEmpty(str3) ? null : (w6) g1Var.f12974k.c(str3);
                if (w6Var == null) {
                    j4Var2.b().n.b(zzrVar2.f33792f, "EES not loaded for");
                    j4Var2.V();
                    j4Var2.j(zzbhVar, zzrVar2);
                    return;
                }
                try {
                    mg.l lVar = w6Var.f33185c;
                    j4.T(m4Var);
                    HashMap mapR0 = m4.r0(true, zzbhVar.f33769g.p());
                    String strI = b2.i(str2, b2.f12859f, b2.f12854a);
                    if (strI == null) {
                        strI = str2;
                    }
                    if (w6Var.a(new com.google.android.gms.internal.measurement.b(strI, zzbhVar.f33771i, mapR0))) {
                        if (((com.google.android.gms.internal.measurement.b) lVar.f76310c).equals((com.google.android.gms.internal.measurement.b) lVar.f76309b)) {
                            j4Var2.V();
                            j4Var2.j(zzbhVar, zzrVar2);
                        } else {
                            j4Var2.b().n.b(str2, "EES edited event");
                            j4.T(m4Var);
                            zzbh zzbhVarH = m4.H((com.google.android.gms.internal.measurement.b) lVar.f76310c);
                            j4Var2.V();
                            j4Var2.j(zzbhVarH, zzrVar2);
                        }
                        if (((ArrayList) lVar.f76311d).isEmpty()) {
                            return;
                        }
                        Iterator it = ((ArrayList) lVar.f76311d).iterator();
                        while (it.hasNext()) {
                            com.google.android.gms.internal.measurement.b bVar = (com.google.android.gms.internal.measurement.b) it.next();
                            j4Var2.b().n.b(bVar.f32394a, "EES logging created event");
                            j4.T(m4Var);
                            zzbh zzbhVarH2 = m4.H(bVar);
                            j4Var2.V();
                            j4Var2.j(zzbhVarH2, zzrVar2);
                        }
                        return;
                    }
                } catch (zzd unused) {
                    j4Var2.b().f13190f.c(zzrVar2.f33793g, "EES error. appId, eventName", str2);
                }
                j4Var2.b().n.b(str2, "EES was not applied to event");
                j4Var2.V();
                j4Var2.j(zzbhVar, zzrVar2);
                return;
            case 4:
                t1 t1Var2 = (t1) this.f776d;
                t1Var2.f13334a.V();
                t1Var2.f13334a.h((zzbh) this.f774b, (String) this.f775c);
                return;
            case 5:
                zzr zzrVar3 = (zzr) this.f775c;
                j4 j4Var3 = ((t1) this.f776d).f13334a;
                j4Var3.V();
                zzpl zzplVar = (zzpl) this.f774b;
                if (zzplVar.zza() == null) {
                    j4Var3.X(zzplVar.f33786g, zzrVar3);
                    return;
                } else {
                    j4Var3.W(zzplVar, zzrVar3);
                    return;
                }
            case 6:
                t1 t1Var3 = (t1) this.f774b;
                zzr zzrVar4 = (zzr) this.f775c;
                zzaf zzafVar = (zzaf) this.f776d;
                j4 j4Var4 = t1Var3.f13334a;
                j4Var4.V();
                String str4 = zzrVar4.f33792f;
                sg.w.h(str4);
                HashMap map = j4Var4.E;
                j4Var4.c().D();
                j4Var4.l0();
                ai.l lVar2 = j4Var4.f13041c;
                j4.T(lVar2);
                long j12 = zzafVar.f33754f;
                long j13 = zzafVar.f33756h;
                lVar2.D();
                lVar2.E();
                try {
                    cursorQuery = lVar2.u0().query("upload_queue", new String[]{"rowId", "app_id", "measurement_batch", "upload_uri", "upload_headers", "upload_type", "retry_count", "creation_timestamp", "associated_row_id", "last_upload_timestamp"}, "rowId=?", new String[]{String.valueOf(j12)}, null, null, null, "1");
                    try {
                        try {
                        } catch (Throwable th2) {
                            th = th2;
                            if (cursorQuery != null) {
                                cursorQuery.close();
                            }
                            throw th;
                        }
                    } catch (SQLiteException e3) {
                        e = e3;
                        i5 = 4;
                        j11 = j13;
                    }
                } catch (SQLiteException e11) {
                    e = e11;
                    i5 = 4;
                    j11 = j13;
                    cursorQuery = null;
                } catch (Throwable th3) {
                    th = th3;
                    cursorQuery = null;
                    if (cursorQuery != null) {
                    }
                    throw th;
                }
                if (!cursorQuery.moveToFirst()) {
                    i5 = 4;
                    j11 = j13;
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    l4Var = null;
                    if (l4Var == null) {
                        j4Var4.b().f13193i.c(str4, "[sgtm] Queued batch doesn't exist. appId, rowId", Long.valueOf(j12));
                        return;
                    }
                    String str5 = l4Var.f13118c;
                    int i13 = zzafVar.f33755g;
                    if (i13 != 1) {
                        if (i13 == 3) {
                            i4 i4Var = (i4) map.get(str5);
                            if (i4Var == null) {
                                i4Var = new i4(j4Var4);
                                map.put(str5, i4Var);
                            } else {
                                i4Var.f13017b++;
                                i4Var.f13018c = i4Var.a();
                            }
                            j4Var4.e().getClass();
                            j4Var4.b().n.d("[sgtm] Putting sGTM server in backoff mode. appId, destination, nextRetryInSeconds", str4, str5, Long.valueOf((i4Var.f13018c - System.currentTimeMillis()) / 1000));
                        }
                        ai.l lVar3 = j4Var4.f13041c;
                        j4.T(lVar3);
                        Long lValueOf = Long.valueOf(zzafVar.f33754f);
                        lVar3.P(lValueOf);
                        j4Var4.b().n.c(str4, "[sgtm] increased batch retry count after failed client upload. appId, rowId", lValueOf);
                        return;
                    }
                    if (map.containsKey(str5)) {
                        map.remove(str5);
                    }
                    ai.l lVar4 = j4Var4.f13041c;
                    j4.T(lVar4);
                    Long lValueOf2 = Long.valueOf(j12);
                    lVar4.K(lValueOf2);
                    j4Var4.b().n.c(str4, "[sgtm] queued batch deleted after successful client upload. appId, rowId", lValueOf2);
                    if (j11 > 0) {
                        ai.l lVar5 = j4Var4.f13041c;
                        j4.T(lVar5);
                        m1 m1Var3 = (m1) lVar5.f13368a;
                        lVar5.D();
                        lVar5.E();
                        Long lValueOf3 = Long.valueOf(j11);
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("upload_type", (Integer) 1);
                        xg.a aVar = m1Var3.f13143k;
                        o0 o0Var2 = m1Var3.f13138f;
                        aVar.getClass();
                        contentValues.put("creation_timestamp", Long.valueOf(System.currentTimeMillis()));
                        try {
                            if (lVar5.u0().update("upload_queue", contentValues, "rowid=? AND app_id=? AND upload_type=?", new String[]{String.valueOf(j11), str4, String.valueOf(i5)}) != 1) {
                                m1.l(o0Var2);
                                o0Var2.f13193i.c(str4, "Google Signal pending batch not updated. appId, rowId", lValueOf3);
                            }
                            j4Var4.b().n.c(str4, "[sgtm] queued Google Signal batch updated. appId, signalRowId", Long.valueOf(j11));
                            j4Var4.t(str4);
                            return;
                        } catch (SQLiteException e12) {
                            m1.l(o0Var2);
                            o0Var2.f13190f.d("Failed to update google Signal pending batch. appid, rowId", str4, Long.valueOf(j11), e12);
                            throw e12;
                        }
                    }
                    return;
                }
                String string2 = cursorQuery.getString(1);
                sg.w.h(string2);
                try {
                    try {
                        try {
                            j11 = j13;
                            i5 = 4;
                            try {
                                l4 l4VarG0 = lVar2.g0(string2, j12, cursorQuery.getBlob(2), cursorQuery.getString(3), cursorQuery.getString(4), cursorQuery.getInt(5), cursorQuery.getInt(6), cursorQuery.getLong(7), cursorQuery.getLong(8), cursorQuery.getLong(9));
                                cursorQuery.close();
                                l4Var = l4VarG0;
                            } catch (SQLiteException e13) {
                                e = e13;
                                o0 o0Var3 = ((m1) lVar2.f13368a).f13138f;
                                m1.l(o0Var3);
                                o0Var3.f13190f.c(Long.valueOf(j12), "Error to querying MeasurementBatch from upload_queue. rowId", e);
                                if (cursorQuery != null) {
                                }
                                l4Var = null;
                                if (l4Var == null) {
                                }
                            }
                        } catch (SQLiteException e14) {
                            e = e14;
                            j11 = j13;
                            i5 = 4;
                        }
                    } catch (SQLiteException e15) {
                        e = e15;
                        i5 = 4;
                        j11 = j13;
                    }
                } catch (SQLiteException e16) {
                    e = e16;
                    i5 = 4;
                    j11 = j13;
                }
                if (l4Var == null) {
                }
            case 7:
                AtomicReference atomicReference2 = (AtomicReference) this.f774b;
                synchronized (atomicReference2) {
                    try {
                        try {
                            p3Var = (p3) this.f776d;
                            m1Var = (m1) p3Var.f13368a;
                            z0Var = m1Var.f13137e;
                            m1.j(z0Var);
                        } catch (RemoteException e17) {
                            o0 o0Var4 = ((m1) ((p3) this.f776d).f13368a).f13138f;
                            m1.l(o0Var4);
                            o0Var4.f13190f.b(e17, "Failed to get app instance id");
                            atomicReference = (AtomicReference) this.f774b;
                        }
                        if (z0Var.K().i(z1.ANALYTICS_STORAGE)) {
                            ai.a0 a0Var2 = p3Var.f13230d;
                            if (a0Var2 != null) {
                                atomicReference2.set(a0Var2.o((zzr) this.f775c));
                                String str6 = (String) atomicReference2.get();
                                if (str6 != null) {
                                    t2 t2Var = ((m1) p3Var.f13368a).f13145m;
                                    m1.k(t2Var);
                                    t2Var.f13341g.set(str6);
                                    z0 z0Var3 = m1Var.f13137e;
                                    m1.j(z0Var3);
                                    z0Var3.f13490g.S(str6);
                                }
                                p3Var.Q();
                                atomicReference = (AtomicReference) this.f774b;
                                atomicReference.notify();
                                return;
                            }
                            o0 o0Var5 = m1Var.f13138f;
                            m1.l(o0Var5);
                            o0Var5.f13190f.a("Failed to get app instance id");
                        } else {
                            o0 o0Var6 = m1Var.f13138f;
                            m1.l(o0Var6);
                            o0Var6.f13195k.a("Analytics storage consent denied; will not get app instance id");
                            t2 t2Var2 = ((m1) p3Var.f13368a).f13145m;
                            m1.k(t2Var2);
                            t2Var2.f13341g.set(null);
                            z0 z0Var4 = m1Var.f13137e;
                            m1.j(z0Var4);
                            z0Var4.f13490g.S(null);
                            atomicReference2.set(null);
                        }
                        atomicReference2.notify();
                        return;
                    } catch (Throwable th4) {
                        ((AtomicReference) this.f774b).notify();
                        throw th4;
                    }
                }
            case 8:
                f7 f7Var = (f7) this.f775c;
                p3 p3Var2 = (p3) this.f776d;
                try {
                    try {
                        m1Var2 = (m1) p3Var2.f13368a;
                        z0Var2 = m1Var2.f13137e;
                        o0Var = m1Var2.f13138f;
                        m1.j(z0Var2);
                    } catch (Throwable th5) {
                        p4 p4Var2 = ((m1) p3Var2.f13368a).f13141i;
                        m1.j(p4Var2);
                        p4Var2.q0(null, f7Var);
                        throw th5;
                    }
                } catch (RemoteException e18) {
                    o0 o0Var7 = ((m1) p3Var2.f13368a).f13138f;
                    m1.l(o0Var7);
                    o0Var7.f13190f.b(e18, "Failed to get app instance id");
                }
                if (z0Var2.K().i(z1.ANALYTICS_STORAGE)) {
                    ai.a0 a0Var3 = p3Var2.f13230d;
                    if (a0Var3 != null) {
                        strO = a0Var3.o((zzr) this.f774b);
                        if (strO != null) {
                            t2 t2Var3 = m1Var2.f13145m;
                            m1.k(t2Var3);
                            t2Var3.f13341g.set(strO);
                            m1.j(z0Var2);
                            z0Var2.f13490g.S(strO);
                        }
                        p3Var2.Q();
                        p4Var = ((m1) p3Var2.f13368a).f13141i;
                        m1.j(p4Var);
                        p4Var.q0(strO, f7Var);
                        return;
                    }
                    m1.l(o0Var);
                    o0Var.f13190f.a("Failed to get app instance id");
                } else {
                    m1.l(o0Var);
                    o0Var.f13195k.a("Analytics storage consent denied; will not get app instance id");
                    t2 t2Var4 = m1Var2.f13145m;
                    m1.k(t2Var4);
                    t2Var4.f13341g.set(null);
                    m1.j(z0Var2);
                    z0Var2.f13490g.S(null);
                }
                p4Var = m1Var2.f13141i;
                m1.j(p4Var);
                p4Var.q0(strO, f7Var);
                return;
            case 9:
                p3 p3Var3 = (p3) this.f774b;
                zzr zzrVar5 = (zzr) this.f775c;
                zzaf zzafVar2 = (zzaf) this.f776d;
                m1 m1Var4 = (m1) p3Var3.f13368a;
                ai.a0 a0Var4 = p3Var3.f13230d;
                if (a0Var4 == null) {
                    o0 o0Var8 = m1Var4.f13138f;
                    m1.l(o0Var8);
                    o0Var8.f13190f.a("[sgtm] Discarding data. Failed to update batch upload status.");
                    return;
                }
                try {
                    a0Var4.A(zzrVar5, zzafVar2);
                    p3Var3.Q();
                    return;
                } catch (RemoteException e19) {
                    o0 o0Var9 = m1Var4.f13138f;
                    m1.l(o0Var9);
                    o0Var9.f13190f.c(Long.valueOf(zzafVar2.f33754f), "[sgtm] Failed to update batch upload status, rowId, exception", e19);
                    return;
                }
            case 10:
                a5.d dVar = (a5.d) this.f774b;
                o0 o0Var10 = (o0) this.f775c;
                JobParameters jobParameters = (JobParameters) this.f776d;
                o0Var10.n.a("AppMeasurementJobService processed last upload request.");
                ((s3) ((Service) dVar.f267b)).b(jobParameters);
                return;
            case 11:
                String str7 = (String) this.f774b;
                if (TextUtils.isEmpty(str7)) {
                    return;
                }
                String str8 = (String) this.f775c;
                String lowerCase = str7.toLowerCase();
                if (TextUtils.isEmpty(str8)) {
                    jSONObject = new JSONObject();
                } else {
                    try {
                        jSONObject = new JSONObject(str8);
                    } catch (JSONException unused2) {
                        return;
                    }
                }
                JSONObject jSONObject2 = jSONObject;
                j0[] j0VarArr = (j0[]) this.f776d;
                jSONObject2.toString();
                for (j0 j0Var : j0VarArr) {
                    FutureTask futureTask = new FutureTask(new r1(j0Var, lowerCase, jSONObject2));
                    j0Var.zza().execute(futureTask);
                    try {
                    } catch (InterruptedException unused3) {
                    } catch (ExecutionException e21) {
                        e21.getCause();
                    }
                    if (((Boolean) futureTask.get()).booleanValue()) {
                        return;
                    }
                }
                return;
            case 12:
                com.google.android.gms.internal.consent_sdk.d dVar2 = (com.google.android.gms.internal.consent_sdk.d) this.f774b;
                uk.b bVar2 = (uk.b) this.f775c;
                com.google.android.gms.internal.consent_sdk.a aVar2 = (com.google.android.gms.internal.consent_sdk.a) this.f776d;
                ((Handler) dVar2.f32027b).post(new com.google.android.gms.internal.consent_sdk.j(bVar2, i11));
                if (aVar2.f31985c != 2) {
                    ((com.google.android.gms.internal.consent_sdk.p) dVar2.f32030e).a();
                    return;
                }
                return;
            case 13:
                bn.i iVar = (bn.i) this.f774b;
                cl.m1 m1Var5 = (cl.m1) this.f775c;
                bg bgVar = (bg) this.f776d;
                try {
                    Object objA = w0.a(m1Var5);
                    cl.m1 m1Var6 = (cl.m1) iVar.f18214f;
                    m1Var6.n(objA);
                    bgVar.p(m1Var6);
                    return;
                } catch (Throwable unused4) {
                    bgVar.p(m1Var5);
                    return;
                }
            case 14:
                CoordinatorLayout coordinatorLayout = (CoordinatorLayout) this.f774b;
                dj.e eVar = (dj.e) this.f776d;
                View view = (View) this.f775c;
                if (view == null || (overScroller = eVar.f49249d) == null) {
                    return;
                }
                if (overScroller.computeScrollOffset()) {
                    eVar.A(coordinatorLayout, view, eVar.f49249d.getCurrY());
                    view.postOnAnimation(this);
                    return;
                }
                AppBarLayout appBarLayout = (AppBarLayout) view;
                ((AppBarLayout.BaseBehavior) eVar).G(coordinatorLayout, appBarLayout);
                if (appBarLayout.f34014k) {
                    appBarLayout.k(appBarLayout.l(AppBarLayout.BaseBehavior.D(coordinatorLayout)));
                    return;
                }
                return;
            case 15:
                jb.m mVar = (jb.m) this.f775c;
                jb.i iVar2 = (jb.i) this.f774b;
                if (iVar2.isCanceled()) {
                    iVar2.finish("canceled-at-delivery");
                    return;
                }
                VolleyError volleyError = mVar.f69416c;
                if (volleyError == null) {
                    iVar2.deliverResponse(mVar.f69414a);
                } else {
                    iVar2.deliverError(volleyError);
                }
                if (mVar.f69417d) {
                    iVar2.addMarker("intermediate-response");
                } else {
                    iVar2.finish("done");
                }
                Runnable runnable = (Runnable) this.f776d;
                if (runnable != null) {
                    runnable.run();
                    return;
                }
                return;
            case 16:
                ((lc.b) this.f776d).c((ComponentName) this.f774b, (IBinder) this.f775c);
                return;
            case 17:
                Bundle bundle2 = (Bundle) this.f775c;
                mk.t tVar = (mk.t) this.f774b;
                mk.s sVar = (mk.s) this.f776d;
                try {
                    mk.o oVar = tVar.f76486a;
                    if (oVar == null) {
                        throw null;
                    }
                    lk.c cVar = (lk.c) ((IInterface) oVar.f76470k);
                    if (cVar == null) {
                        return;
                    }
                    lk.a aVar3 = (lk.a) cVar;
                    Parcel parcelX = aVar3.X();
                    parcelX.writeInt(1);
                    bundle2.writeToParcel(parcelX, 0);
                    parcelX.writeStrongBinder(sVar);
                    aVar3.Y(parcelX, 1);
                    return;
                } catch (RemoteException e22) {
                    Log.e("HpoaClientImpl", "Failed to call hpoaService.startSession", e22);
                    return;
                }
            case 18:
                c();
                return;
            case 19:
                d();
                return;
            case 20:
                e();
                return;
            case 21:
                if (Thread.currentThread() == ((Thread) this.f775c)) {
                    this.f776d = new InlineExecutionProhibitedException();
                    return;
                } else {
                    ((Runnable) this.f774b).run();
                    return;
                }
            case 22:
                ((sp.j) ((q.c) this.f776d).f83189b).f87596b++;
                Application application = ((m0) this.f774b).f87616a;
                q.c cVar2 = new q.c(this, 24);
                int i14 = sp.a0.f87563a;
                try {
                    new sp.b0(application, cVar2).l();
                    return;
                } catch (Throwable unused5) {
                    int i15 = sp.a0.f87563a;
                    return;
                }
            case 23:
                f();
                return;
            default:
                z7.j jVar = (z7.j) this.f774b;
                try {
                    jVar.j(g());
                    return;
                } catch (Throwable th6) {
                    jVar.k(th6);
                    return;
                }
        }
    }

    public /* synthetic */ y(int i5, Object obj, Object obj2, Object obj3) {
        this.f773a = i5;
        this.f776d = obj;
        this.f774b = obj2;
        this.f775c = obj3;
    }

    public /* synthetic */ y(int i5, Object obj, Object obj2, Object obj3, boolean z11) {
        this.f773a = i5;
        this.f774b = obj;
        this.f775c = obj2;
        this.f776d = obj3;
    }

    public y(p3 p3Var, AtomicReference atomicReference, zzr zzrVar) {
        this.f773a = 7;
        this.f774b = atomicReference;
        this.f775c = zzrVar;
        Objects.requireNonNull(p3Var);
        this.f776d = p3Var;
    }

    public y(p7.s sVar, UUID uuid) {
        this.f773a = 24;
        this.f775c = sVar;
        this.f776d = uuid;
        this.f774b = new z7.j();
    }

    public y(Thread thread, Runnable runnable) {
        this.f773a = 21;
        this.f774b = runnable;
        this.f775c = thread;
    }
}
