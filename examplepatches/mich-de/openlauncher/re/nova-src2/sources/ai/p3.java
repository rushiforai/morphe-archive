package ai;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader$ParseException;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class p3 extends z {

    /* renamed from: c, reason: collision with root package name */
    public final o3 f13229c;

    /* renamed from: d, reason: collision with root package name */
    public a0 f13230d;

    /* renamed from: e, reason: collision with root package name */
    public volatile Boolean f13231e;

    /* renamed from: f, reason: collision with root package name */
    public final l3 f13232f;

    /* renamed from: g, reason: collision with root package name */
    public ScheduledExecutorService f13233g;

    /* renamed from: h, reason: collision with root package name */
    public final k0 f13234h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f13235i;

    /* renamed from: j, reason: collision with root package name */
    public final l3 f13236j;

    public p3(m1 m1Var) {
        super(m1Var);
        this.f13235i = new ArrayList();
        this.f13234h = new k0(m1Var.f13143k);
        this.f13229c = new o3(this);
        this.f13232f = new l3(this, m1Var, 0);
        this.f13236j = new l3(this, m1Var, 1);
    }

    @Override // ai.z
    public final boolean G() {
        return false;
    }

    public final void H(AtomicReference atomicReference) {
        D();
        E();
        R(new ab.y(this, atomicReference, T(false)));
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void I(Bundle bundle) {
        boolean z11;
        boolean zK;
        D();
        E();
        zzbf zzbfVar = new zzbf(bundle);
        P();
        m1 m1Var = (m1) this.f13368a;
        if (m1Var.f13136d.O(null, x.W0)) {
            h0 h0VarN = m1Var.n();
            m1 m1Var2 = (m1) h0VarN.f13368a;
            p4 p4Var = m1Var2.f13141i;
            o0 o0Var = m1Var2.f13138f;
            m1.j(p4Var);
            byte[] bArrM0 = p4.m0(zzbfVar);
            if (bArrM0 == null) {
                m1.l(o0Var);
                o0Var.f13191g.a("Null default event parameters; not writing to database");
            } else if (bArrM0.length > 131072) {
                m1.l(o0Var);
                o0Var.f13191g.a("Default event parameters too long for local database. Sending directly to service");
            } else {
                zK = h0VarN.K(4, bArrM0);
                z11 = !zK;
            }
            zK = false;
            if (!zK) {
            }
        }
        R(new j2(this, T(false), z11, zzbfVar, bundle));
    }

    public final void J() {
        D();
        E();
        if (U()) {
            return;
        }
        if (K()) {
            o3 o3Var = this.f13229c;
            p3 p3Var = o3Var.f13208c;
            p3Var.D();
            Context context = ((m1) p3Var.f13368a).f13133a;
            synchronized (o3Var) {
                try {
                    if (o3Var.f13206a) {
                        o0 o0Var = ((m1) o3Var.f13208c.f13368a).f13138f;
                        m1.l(o0Var);
                        o0Var.n.a("Connection attempt already in progress");
                        return;
                    } else {
                        if (o3Var.f13207b != null && (o3Var.f13207b.isConnecting() || o3Var.f13207b.isConnected())) {
                            o0 o0Var2 = ((m1) o3Var.f13208c.f13368a).f13138f;
                            m1.l(o0Var2);
                            o0Var2.n.a("Already awaiting connection attempt");
                            return;
                        }
                        o3Var.f13207b = new j0(context, Looper.getMainLooper(), 93, o3Var, o3Var, 0);
                        o0 o0Var3 = ((m1) o3Var.f13208c.f13368a).f13138f;
                        m1.l(o0Var3);
                        o0Var3.n.a("Connecting to remote service");
                        o3Var.f13206a = true;
                        sg.w.h(o3Var.f13207b);
                        o3Var.f13207b.checkAvailabilityAndConnect();
                        return;
                    }
                } finally {
                }
            }
        }
        m1 m1Var = (m1) this.f13368a;
        if (m1Var.f13136d.G()) {
            return;
        }
        List<ResolveInfo> listQueryIntentServices = m1Var.f13133a.getPackageManager().queryIntentServices(new Intent().setClassName(m1Var.f13133a, "com.google.android.gms.measurement.AppMeasurementService"), SQLiteDatabase.OPEN_FULLMUTEX);
        if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
            o0 o0Var4 = m1Var.f13138f;
            m1.l(o0Var4);
            o0Var4.f13190f.a("Unable to use remote or local measurement implementation. Please register the AppMeasurementService service in the app manifest");
            return;
        }
        Intent intent = new Intent("com.google.android.gms.measurement.START");
        intent.setComponent(new ComponentName(m1Var.f13133a, "com.google.android.gms.measurement.AppMeasurementService"));
        o3 o3Var2 = this.f13229c;
        p3 p3Var2 = o3Var2.f13208c;
        p3Var2.D();
        Context context2 = ((m1) p3Var2.f13368a).f13133a;
        wg.a aVarB = wg.a.b();
        synchronized (o3Var2) {
            try {
                if (o3Var2.f13206a) {
                    o0 o0Var5 = ((m1) o3Var2.f13208c.f13368a).f13138f;
                    m1.l(o0Var5);
                    o0Var5.n.a("Connection attempt already in progress");
                } else {
                    p3 p3Var3 = o3Var2.f13208c;
                    o0 o0Var6 = ((m1) p3Var3.f13368a).f13138f;
                    m1.l(o0Var6);
                    o0Var6.n.a("Using local app measurement service");
                    o3Var2.f13206a = true;
                    aVarB.a(context2, intent, p3Var3.f13229c, Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
                }
            } finally {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0116  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean K() {
        D();
        E();
        if (this.f13231e == null) {
            D();
            E();
            m1 m1Var = (m1) this.f13368a;
            z0 z0Var = m1Var.f13137e;
            m1.j(z0Var);
            z0Var.D();
            boolean z11 = false;
            Boolean boolValueOf = !z0Var.H().contains("use_service") ? null : Boolean.valueOf(z0Var.H().getBoolean("use_service", false));
            if (boolValueOf == null || !boolValueOf.booleanValue()) {
                f0 f0VarQ = ((m1) this.f13368a).q();
                f0VarQ.E();
                if (f0VarQ.n == 1) {
                    z11 = true;
                    if (!z11 && m1Var.f13136d.G()) {
                        o0 o0Var = m1Var.f13138f;
                        m1.l(o0Var);
                        o0Var.f13190f.a("No way to upload. Consider using the full version of Analytics");
                    } else if (z) {
                        z0 z0Var2 = m1Var.f13137e;
                        m1.j(z0Var2);
                        z0Var2.D();
                        SharedPreferences.Editor editorEdit = z0Var2.H().edit();
                        editorEdit.putBoolean("use_service", z11);
                        editorEdit.apply();
                    }
                    z = z11;
                } else {
                    o0 o0Var2 = m1Var.f13138f;
                    m1.l(o0Var2);
                    o0Var2.n.a("Checking service availability");
                    p4 p4Var = m1Var.f13141i;
                    m1.j(p4Var);
                    int iB = pg.c.f82562b.b(((m1) p4Var.f13368a).f13133a, 12451000);
                    if (iB != 0) {
                        if (iB == 1) {
                            o0 o0Var3 = m1Var.f13138f;
                            m1.l(o0Var3);
                            o0Var3.n.a("Service missing");
                        } else if (iB != 2) {
                            if (iB == 3) {
                                o0 o0Var4 = m1Var.f13138f;
                                m1.l(o0Var4);
                                o0Var4.f13193i.a("Service disabled");
                            } else if (iB == 9) {
                                o0 o0Var5 = m1Var.f13138f;
                                m1.l(o0Var5);
                                o0Var5.f13193i.a("Service invalid");
                            } else if (iB != 18) {
                                o0 o0Var6 = m1Var.f13138f;
                                m1.l(o0Var6);
                                o0Var6.f13193i.b(Integer.valueOf(iB), "Unexpected service status");
                            } else {
                                o0 o0Var7 = m1Var.f13138f;
                                m1.l(o0Var7);
                                o0Var7.f13193i.a("Service updating");
                            }
                            z = false;
                        } else {
                            o0 o0Var8 = m1Var.f13138f;
                            m1.l(o0Var8);
                            o0Var8.f13197m.a("Service container out of date");
                            p4 p4Var2 = m1Var.f13141i;
                            m1.j(p4Var2);
                            if (p4Var2.o0() >= 17443) {
                                z11 = boolValueOf == null;
                                z = false;
                            }
                        }
                        if (!z11) {
                            if (z) {
                            }
                            z = z11;
                        }
                    } else {
                        o0 o0Var9 = m1Var.f13138f;
                        m1.l(o0Var9);
                        o0Var9.n.a("Service available");
                    }
                    z11 = true;
                    if (!z11) {
                    }
                }
            }
            this.f13231e = Boolean.valueOf(z);
        }
        return this.f13231e.booleanValue();
    }

    public final void L() {
        D();
        E();
        o3 o3Var = this.f13229c;
        if (o3Var.f13207b != null && (o3Var.f13207b.isConnected() || o3Var.f13207b.isConnecting())) {
            o3Var.f13207b.disconnect();
        }
        o3Var.f13207b = null;
        try {
            wg.a.b().c(((m1) this.f13368a).f13133a, o3Var);
        } catch (IllegalArgumentException | IllegalStateException unused) {
        }
        this.f13230d = null;
    }

    public final boolean M() {
        D();
        E();
        if (!K()) {
            return true;
        }
        p4 p4Var = ((m1) this.f13368a).f13141i;
        m1.j(p4Var);
        return p4Var.o0() >= ((Integer) x.J0.a(null)).intValue();
    }

    public final boolean N() {
        D();
        E();
        if (!K()) {
            return true;
        }
        p4 p4Var = ((m1) this.f13368a).f13141i;
        m1.j(p4Var);
        return p4Var.o0() >= 241200;
    }

    public final void O(ComponentName componentName) {
        D();
        if (this.f13230d != null) {
            this.f13230d = null;
            o0 o0Var = ((m1) this.f13368a).f13138f;
            m1.l(o0Var);
            o0Var.n.b(componentName, "Disconnected from device MeasurementService");
            D();
            J();
        }
    }

    public final void P() {
        ((m1) this.f13368a).getClass();
    }

    public final void Q() {
        D();
        k0 k0Var = this.f13234h;
        ((xg.a) k0Var.f13067c).getClass();
        k0Var.f13066b = SystemClock.elapsedRealtime();
        ((m1) this.f13368a).getClass();
        this.f13232f.b(((Long) x.Y.a(null)).longValue());
    }

    public final void R(Runnable runnable) {
        D();
        if (U()) {
            runnable.run();
            return;
        }
        ArrayList arrayList = this.f13235i;
        long size = arrayList.size();
        m1 m1Var = (m1) this.f13368a;
        m1Var.getClass();
        if (size >= 1000) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Discarding data. Max runnable queue size reached");
        } else {
            arrayList.add(runnable);
            this.f13236j.b(60000L);
            J();
        }
    }

    public final void S() {
        D();
        m1 m1Var = (m1) this.f13368a;
        o0 o0Var = m1Var.f13138f;
        m1.l(o0Var);
        m0 m0Var = o0Var.n;
        ArrayList arrayList = this.f13235i;
        m0Var.b(Integer.valueOf(arrayList.size()), "Processing queued up service tasks");
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            try {
                ((Runnable) it.next()).run();
            } catch (RuntimeException e3) {
                o0 o0Var2 = m1Var.f13138f;
                m1.l(o0Var2);
                o0Var2.f13190f.b(e3, "Task exception while flushing queue");
            }
        }
        arrayList.clear();
        this.f13236j.c();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final zzr T(boolean z11) {
        long jAbs;
        Pair pair;
        m1 m1Var = (m1) this.f13368a;
        m1Var.getClass();
        f0 f0VarQ = m1Var.q();
        String strR = null;
        if (z11) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            m1 m1Var2 = (m1) o0Var.f13368a;
            z0 z0Var = m1Var2.f13137e;
            m1.j(z0Var);
            if (z0Var.f13488e != null) {
                z0 z0Var2 = m1Var2.f13137e;
                m1.j(z0Var2);
                x0 x0Var = z0Var2.f13488e;
                z0 z0Var3 = (z0) x0Var.f13461e;
                z0Var3.D();
                z0Var3.D();
                long j11 = ((z0) x0Var.f13461e).H().getLong((String) x0Var.f13458b, 0L);
                if (j11 == 0) {
                    x0Var.d();
                    jAbs = 0;
                } else {
                    ((m1) z0Var3.f13368a).f13143k.getClass();
                    jAbs = Math.abs(j11 - System.currentTimeMillis());
                }
                long j12 = x0Var.f13457a;
                if (jAbs < j12) {
                    pair = null;
                    if (pair != null) {
                    }
                } else if (jAbs > j12 + j12) {
                    x0Var.d();
                    pair = null;
                    if (pair != null && pair != z0.f13485z) {
                        String strValueOf = String.valueOf(pair.second);
                        String str = (String) pair.first;
                        strR = b.c0.r(new StringBuilder(strValueOf.length() + 1 + String.valueOf(str).length()), strValueOf, ":", str);
                    }
                } else {
                    String string = z0Var3.H().getString((String) x0Var.f13460d, null);
                    long j13 = z0Var3.H().getLong((String) x0Var.f13459c, 0L);
                    x0Var.d();
                    pair = (string == null || j13 <= 0) ? z0.f13485z : new Pair(string, Long.valueOf(j13));
                    if (pair != null) {
                        String strValueOf2 = String.valueOf(pair.second);
                        String str2 = (String) pair.first;
                        strR = b.c0.r(new StringBuilder(strValueOf2.length() + 1 + String.valueOf(str2).length()), strValueOf2, ":", str2);
                    }
                }
            }
        }
        return f0VarQ.H(strR);
    }

    public final boolean U() {
        D();
        E();
        return this.f13230d != null;
    }

    /* JADX WARN: Removed duplicated region for block: B:170:0x02da A[Catch: all -> 0x0202, SQLiteException -> 0x02b4, SQLiteDatabaseLockedException -> 0x02b9, SQLiteFullException -> 0x02bd, TryCatch #58 {all -> 0x0202, blocks: (B:102:0x01dd, B:104:0x01f1, B:106:0x01f6, B:119:0x021a, B:120:0x021d, B:118:0x0216, B:123:0x0223, B:125:0x0237, B:132:0x024f, B:133:0x0258, B:134:0x025b, B:130:0x0249, B:137:0x025f, B:139:0x0273, B:146:0x028b, B:147:0x0295, B:148:0x0298, B:144:0x0285, B:151:0x029c, B:155:0x02b0, B:170:0x02da, B:171:0x02e4, B:172:0x02e7, B:168:0x02d4, B:180:0x02f4, B:181:0x0301, B:206:0x0366), top: B:401:0x01dd }] */
    /* JADX WARN: Removed duplicated region for block: B:259:0x0444 A[Catch: all -> 0x0480, TRY_ENTER, TryCatch #55 {all -> 0x0480, blocks: (B:269:0x0470, B:259:0x0444, B:261:0x044a, B:262:0x044d, B:279:0x0491, B:208:0x037b, B:210:0x0385, B:215:0x0396), top: B:399:0x0470 }] */
    /* JADX WARN: Removed duplicated region for block: B:264:0x045c  */
    /* JADX WARN: Removed duplicated region for block: B:272:0x0477  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x047c A[PHI: r5 r7 r24 r25 r27 r37 r38
      0x047c: PHI (r5v15 android.database.sqlite.SQLiteDatabase) = 
      (r5v12 android.database.sqlite.SQLiteDatabase)
      (r5v13 android.database.sqlite.SQLiteDatabase)
      (r5v16 android.database.sqlite.SQLiteDatabase)
     binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r7v5 int) = (r7v3 int), (r7v3 int), (r7v6 int) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r24v9 int) = (r24v6 int), (r24v7 int), (r24v10 int) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r25v9 java.lang.String) = (r25v6 java.lang.String), (r25v7 java.lang.String), (r25v10 java.lang.String) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r27v9 java.lang.String) = (r27v6 java.lang.String), (r27v7 java.lang.String), (r27v10 java.lang.String) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r37v9 int) = (r37v6 int), (r37v7 int), (r37v10 int) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]
      0x047c: PHI (r38v9 java.lang.String) = (r38v6 java.lang.String), (r38v7 java.lang.String), (r38v10 java.lang.String) binds: [B:265:0x045f, B:282:0x04a3, B:273:0x047a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:281:0x04a0  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x04b4  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x04b9  */
    /* JADX WARN: Removed duplicated region for block: B:293:0x04d3  */
    /* JADX WARN: Removed duplicated region for block: B:294:0x04dc  */
    /* JADX WARN: Removed duplicated region for block: B:301:0x04f6  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x0597  */
    /* JADX WARN: Removed duplicated region for block: B:338:0x062c  */
    /* JADX WARN: Removed duplicated region for block: B:456:0x04a6 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:457:0x04a6 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:459:0x04a6 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void V(a0 a0Var, AbstractSafeParcelable abstractSafeParcelable, zzr zzrVar) throws Throwable {
        ArrayList arrayList;
        m1 m1Var;
        Context context;
        o0 o0Var;
        int i5;
        android.database.sqlite.SQLiteDatabase sQLiteDatabase;
        String str;
        int i11;
        String str2;
        String str3;
        int i12;
        Cursor cursor;
        Cursor cursor2;
        Cursor cursorQuery;
        long j11;
        String str4;
        String[] strArr;
        int i13;
        int i14;
        int i15;
        long j12;
        String string;
        w wVar;
        Parcel parcelObtain;
        zzbf zzbfVarCreateFromParcel;
        int i16;
        zzah zzahVarCreateFromParcel;
        zzpl zzplVarCreateFromParcel;
        int size;
        int size2;
        int i17;
        int i18;
        m1 m1Var2;
        Context context2;
        o0 o0Var2;
        long jElapsedRealtime;
        long j13;
        D();
        E();
        P();
        m1 m1Var3 = (m1) this.f13368a;
        m1Var3.getClass();
        Context context3 = m1Var3.f13133a;
        e eVar = m1Var3.f13136d;
        o0 o0Var3 = m1Var3.f13138f;
        xg.a aVar = m1Var3.f13143k;
        int i19 = 100;
        zzr zzrVar2 = zzrVar;
        int i21 = 0;
        for (int i22 = 100; i21 < 1001 && i22 == i19; i22 = size) {
            ArrayList arrayList2 = new ArrayList();
            h0 h0VarN = m1Var3.n();
            int i23 = i19;
            String str5 = "entry";
            String str6 = TTConst.TRACK_TYPE;
            String str7 = "rowid";
            xg.a aVar2 = aVar;
            m1 m1Var4 = (m1) h0VarN.f13368a;
            h0VarN.D();
            int i24 = i21;
            if (h0VarN.f12991d) {
                m1Var = m1Var3;
                context = context3;
                o0Var = o0Var3;
            } else {
                arrayList = new ArrayList();
                m1Var = m1Var3;
                if (((m1) h0VarN.f13368a).f13133a.getDatabasePath("google_app_measurement_local.db").exists()) {
                    int i25 = 5;
                    context = context3;
                    o0Var = o0Var3;
                    int i26 = 0;
                    int i27 = 5;
                    while (i26 < i25) {
                        try {
                            android.database.sqlite.SQLiteDatabase sQLiteDatabaseJ = h0VarN.J();
                            if (sQLiteDatabaseJ == null) {
                                try {
                                    try {
                                        h0VarN.f12991d = true;
                                    } catch (Throwable th2) {
                                        th = th2;
                                        sQLiteDatabase = sQLiteDatabaseJ;
                                        cursor = null;
                                        if (cursor != null) {
                                        }
                                        if (sQLiteDatabase != null) {
                                        }
                                        throw th;
                                    }
                                } catch (SQLiteDatabaseLockedException unused) {
                                    str = str7;
                                    i11 = i26;
                                    str3 = str5;
                                    sQLiteDatabase = sQLiteDatabaseJ;
                                    i12 = 5;
                                    str2 = str6;
                                    cursor2 = null;
                                    try {
                                        SystemClock.sleep(i27);
                                        i27 += 20;
                                        if (cursor2 != null) {
                                        }
                                        if (sQLiteDatabase == null) {
                                        }
                                        i26 = i11 + 1;
                                        i25 = i12;
                                        str6 = str2;
                                        str5 = str3;
                                        str7 = str;
                                    } catch (Throwable th3) {
                                        th = th3;
                                        cursor = cursor2;
                                        if (cursor != null) {
                                            cursor.close();
                                        }
                                        if (sQLiteDatabase != null) {
                                            sQLiteDatabase.close();
                                        }
                                        throw th;
                                    }
                                } catch (SQLiteFullException e3) {
                                    e = e3;
                                    str = str7;
                                    i11 = i26;
                                    str3 = str5;
                                    sQLiteDatabase = sQLiteDatabaseJ;
                                    i12 = 5;
                                    str2 = str6;
                                    cursor2 = null;
                                    o0 o0Var4 = m1Var4.f13138f;
                                    m1.l(o0Var4);
                                    o0Var4.f13190f.b(e, "Error reading entries from local database");
                                    h0VarN.f12991d = true;
                                    if (cursor2 != null) {
                                    }
                                    if (sQLiteDatabase != null) {
                                    }
                                    i26 = i11 + 1;
                                    i25 = i12;
                                    str6 = str2;
                                    str5 = str3;
                                    str7 = str;
                                } catch (SQLiteException e11) {
                                    e = e11;
                                    str = str7;
                                    i11 = i26;
                                    str3 = str5;
                                    sQLiteDatabase = sQLiteDatabaseJ;
                                    i12 = 5;
                                    str2 = str6;
                                    cursor2 = null;
                                    if (sQLiteDatabase != null) {
                                    }
                                    o0 o0Var5 = m1Var4.f13138f;
                                    m1.l(o0Var5);
                                    o0Var5.f13190f.b(e, "Error reading entries from local database");
                                    h0VarN.f12991d = true;
                                    if (cursor2 != null) {
                                    }
                                    if (sQLiteDatabase != null) {
                                    }
                                    i26 = i11 + 1;
                                    i25 = i12;
                                    str6 = str2;
                                    str5 = str3;
                                    str7 = str;
                                }
                            } else {
                                sQLiteDatabaseJ.beginTransaction();
                                try {
                                    cursorQuery = sQLiteDatabaseJ.query("messages", new String[]{str7}, "type=?", new String[]{"3"}, null, null, "rowid desc", "1");
                                    try {
                                        long j14 = -1;
                                        if (cursorQuery.moveToFirst()) {
                                            i11 = i26;
                                            try {
                                                j11 = cursorQuery.getLong(0);
                                                try {
                                                    cursorQuery.close();
                                                } catch (SQLiteDatabaseLockedException unused2) {
                                                    str = str7;
                                                    str3 = str5;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                    i12 = 5;
                                                    str2 = str6;
                                                    cursor2 = null;
                                                    SystemClock.sleep(i27);
                                                    i27 += 20;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase == null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                } catch (SQLiteFullException e12) {
                                                    e = e12;
                                                    str = str7;
                                                    str3 = str5;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                    i12 = 5;
                                                    str2 = str6;
                                                    cursor2 = null;
                                                    o0 o0Var42 = m1Var4.f13138f;
                                                    m1.l(o0Var42);
                                                    o0Var42.f13190f.b(e, "Error reading entries from local database");
                                                    h0VarN.f12991d = true;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase != null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                } catch (SQLiteException e13) {
                                                    e = e13;
                                                    str = str7;
                                                    str3 = str5;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                    i12 = 5;
                                                    str2 = str6;
                                                    cursor2 = null;
                                                    if (sQLiteDatabase != null) {
                                                    }
                                                    o0 o0Var52 = m1Var4.f13138f;
                                                    m1.l(o0Var52);
                                                    o0Var52.f13190f.b(e, "Error reading entries from local database");
                                                    h0VarN.f12991d = true;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase != null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                }
                                            } catch (Throwable th4) {
                                                th = th4;
                                                str = str7;
                                                str3 = str5;
                                                sQLiteDatabase = sQLiteDatabaseJ;
                                                i12 = 5;
                                                str2 = str6;
                                                if (cursorQuery != null) {
                                                    try {
                                                        cursorQuery.close();
                                                    } catch (SQLiteDatabaseLockedException unused3) {
                                                        cursor2 = null;
                                                        SystemClock.sleep(i27);
                                                        i27 += 20;
                                                        if (cursor2 != null) {
                                                        }
                                                        if (sQLiteDatabase == null) {
                                                        }
                                                        i26 = i11 + 1;
                                                        i25 = i12;
                                                        str6 = str2;
                                                        str5 = str3;
                                                        str7 = str;
                                                    } catch (SQLiteFullException e14) {
                                                        e = e14;
                                                        cursor2 = null;
                                                        o0 o0Var422 = m1Var4.f13138f;
                                                        m1.l(o0Var422);
                                                        o0Var422.f13190f.b(e, "Error reading entries from local database");
                                                        h0VarN.f12991d = true;
                                                        if (cursor2 != null) {
                                                        }
                                                        if (sQLiteDatabase != null) {
                                                        }
                                                        i26 = i11 + 1;
                                                        i25 = i12;
                                                        str6 = str2;
                                                        str5 = str3;
                                                        str7 = str;
                                                    } catch (SQLiteException e15) {
                                                        e = e15;
                                                        cursor2 = null;
                                                        if (sQLiteDatabase != null) {
                                                        }
                                                        o0 o0Var522 = m1Var4.f13138f;
                                                        m1.l(o0Var522);
                                                        o0Var522.f13190f.b(e, "Error reading entries from local database");
                                                        h0VarN.f12991d = true;
                                                        if (cursor2 != null) {
                                                        }
                                                        if (sQLiteDatabase != null) {
                                                        }
                                                        i26 = i11 + 1;
                                                        i25 = i12;
                                                        str6 = str2;
                                                        str5 = str3;
                                                        str7 = str;
                                                    } catch (Throwable th5) {
                                                        th = th5;
                                                        cursor = null;
                                                        if (cursor != null) {
                                                        }
                                                        if (sQLiteDatabase != null) {
                                                        }
                                                        throw th;
                                                    }
                                                }
                                                throw th;
                                            }
                                        } else {
                                            i11 = i26;
                                            cursorQuery.close();
                                            j11 = -1;
                                        }
                                        if (j11 != -1) {
                                            str4 = "rowid<?";
                                            strArr = new String[]{String.valueOf(j11)};
                                        } else {
                                            str4 = null;
                                            strArr = null;
                                        }
                                        try {
                                            String[] strArr2 = {str7, str6, str5};
                                            e eVar2 = m1Var4.f13136d;
                                            w wVar2 = x.W0;
                                            str = str7;
                                            try {
                                                try {
                                                    i13 = 4;
                                                    i14 = 3;
                                                    if (eVar2.O(null, wVar2)) {
                                                        i15 = 5;
                                                        try {
                                                            strArr2 = new String[]{str, str6, str5, "app_version", "app_version_int"};
                                                        } catch (SQLiteDatabaseLockedException unused4) {
                                                            i12 = 5;
                                                            str3 = str5;
                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                            str2 = str6;
                                                            cursor2 = null;
                                                            SystemClock.sleep(i27);
                                                            i27 += 20;
                                                            if (cursor2 != null) {
                                                            }
                                                            if (sQLiteDatabase == null) {
                                                            }
                                                            i26 = i11 + 1;
                                                            i25 = i12;
                                                            str6 = str2;
                                                            str5 = str3;
                                                            str7 = str;
                                                        } catch (SQLiteFullException e16) {
                                                            e = e16;
                                                            i12 = 5;
                                                            str3 = str5;
                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                            str2 = str6;
                                                            cursor2 = null;
                                                            o0 o0Var4222 = m1Var4.f13138f;
                                                            m1.l(o0Var4222);
                                                            o0Var4222.f13190f.b(e, "Error reading entries from local database");
                                                            h0VarN.f12991d = true;
                                                            if (cursor2 != null) {
                                                            }
                                                            if (sQLiteDatabase != null) {
                                                            }
                                                            i26 = i11 + 1;
                                                            i25 = i12;
                                                            str6 = str2;
                                                            str5 = str3;
                                                            str7 = str;
                                                        } catch (SQLiteException e17) {
                                                            e = e17;
                                                            i12 = 5;
                                                            str3 = str5;
                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                            str2 = str6;
                                                            cursor2 = null;
                                                            if (sQLiteDatabase != null) {
                                                            }
                                                            o0 o0Var5222 = m1Var4.f13138f;
                                                            m1.l(o0Var5222);
                                                            o0Var5222.f13190f.b(e, "Error reading entries from local database");
                                                            h0VarN.f12991d = true;
                                                            if (cursor2 != null) {
                                                            }
                                                            if (sQLiteDatabase != null) {
                                                            }
                                                            i26 = i11 + 1;
                                                            i25 = i12;
                                                            str6 = str2;
                                                            str5 = str3;
                                                            str7 = str;
                                                        }
                                                    } else {
                                                        i15 = 5;
                                                    }
                                                } catch (SQLiteDatabaseLockedException unused5) {
                                                    str3 = str5;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                    str2 = str6;
                                                    i12 = 5;
                                                    cursor2 = null;
                                                    SystemClock.sleep(i27);
                                                    i27 += 20;
                                                    if (cursor2 != null) {
                                                        cursor2.close();
                                                    }
                                                    if (sQLiteDatabase == null) {
                                                        sQLiteDatabase.close();
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                }
                                                try {
                                                    Cursor cursorQuery2 = sQLiteDatabaseJ.query("messages", strArr2, str4, strArr, null, null, "rowid asc", Integer.toString(i23));
                                                    while (cursorQuery2.moveToNext()) {
                                                        try {
                                                            try {
                                                                try {
                                                                    j14 = cursorQuery2.getLong(0);
                                                                    try {
                                                                        int i28 = cursorQuery2.getInt(1);
                                                                        str2 = str6;
                                                                        try {
                                                                            byte[] blob = cursorQuery2.getBlob(2);
                                                                            str3 = str5;
                                                                            try {
                                                                                if (m1Var4.f13136d.O(null, wVar2)) {
                                                                                    try {
                                                                                        string = cursorQuery2.getString(i14);
                                                                                        cursor2 = cursorQuery2;
                                                                                        j12 = cursorQuery2.getLong(i13);
                                                                                    } catch (SQLiteDatabaseLockedException unused6) {
                                                                                        cursor2 = cursorQuery2;
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        SystemClock.sleep(i27);
                                                                                        i27 += 20;
                                                                                        if (cursor2 != null) {
                                                                                        }
                                                                                        if (sQLiteDatabase == null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    } catch (SQLiteFullException e18) {
                                                                                        e = e18;
                                                                                        cursor2 = cursorQuery2;
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        o0 o0Var42222 = m1Var4.f13138f;
                                                                                        m1.l(o0Var42222);
                                                                                        o0Var42222.f13190f.b(e, "Error reading entries from local database");
                                                                                        h0VarN.f12991d = true;
                                                                                        if (cursor2 != null) {
                                                                                        }
                                                                                        if (sQLiteDatabase != null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    } catch (SQLiteException e19) {
                                                                                        e = e19;
                                                                                        cursor2 = cursorQuery2;
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        if (sQLiteDatabase != null) {
                                                                                        }
                                                                                        o0 o0Var52222 = m1Var4.f13138f;
                                                                                        m1.l(o0Var52222);
                                                                                        o0Var52222.f13190f.b(e, "Error reading entries from local database");
                                                                                        h0VarN.f12991d = true;
                                                                                        if (cursor2 != null) {
                                                                                        }
                                                                                        if (sQLiteDatabase != null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    }
                                                                                } else {
                                                                                    cursor2 = cursorQuery2;
                                                                                    j12 = 0;
                                                                                    string = null;
                                                                                }
                                                                                if (i28 == 0) {
                                                                                    wVar = wVar2;
                                                                                    try {
                                                                                        try {
                                                                                            parcelObtain = Parcel.obtain();
                                                                                            try {
                                                                                                try {
                                                                                                    parcelObtain.unmarshall(blob, 0, blob.length);
                                                                                                    parcelObtain.setDataPosition(0);
                                                                                                    zzbh zzbhVarCreateFromParcel = zzbh.CREATOR.createFromParcel(parcelObtain);
                                                                                                    if (zzbhVarCreateFromParcel != null) {
                                                                                                        arrayList.add(new g0(zzbhVarCreateFromParcel, string, j12));
                                                                                                    }
                                                                                                } catch (SafeParcelReader$ParseException unused7) {
                                                                                                    o0 o0Var6 = m1Var4.f13138f;
                                                                                                    m1.l(o0Var6);
                                                                                                    o0Var6.f13190f.a("Failed to load event from local database");
                                                                                                    parcelObtain.recycle();
                                                                                                }
                                                                                            } finally {
                                                                                            }
                                                                                        } catch (Throwable th6) {
                                                                                            th = th6;
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            cursor = cursor2;
                                                                                            if (cursor != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            throw th;
                                                                                        }
                                                                                    } catch (SQLiteDatabaseLockedException unused8) {
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        SystemClock.sleep(i27);
                                                                                        i27 += 20;
                                                                                        if (cursor2 != null) {
                                                                                        }
                                                                                        if (sQLiteDatabase == null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    } catch (SQLiteFullException e21) {
                                                                                        e = e21;
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        o0 o0Var422222 = m1Var4.f13138f;
                                                                                        m1.l(o0Var422222);
                                                                                        o0Var422222.f13190f.b(e, "Error reading entries from local database");
                                                                                        h0VarN.f12991d = true;
                                                                                        if (cursor2 != null) {
                                                                                            cursor2.close();
                                                                                        }
                                                                                        if (sQLiteDatabase != null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    } catch (SQLiteException e22) {
                                                                                        e = e22;
                                                                                        sQLiteDatabase = sQLiteDatabaseJ;
                                                                                        i12 = 5;
                                                                                        if (sQLiteDatabase != null && sQLiteDatabase.inTransaction()) {
                                                                                            sQLiteDatabase.endTransaction();
                                                                                        }
                                                                                        o0 o0Var522222 = m1Var4.f13138f;
                                                                                        m1.l(o0Var522222);
                                                                                        o0Var522222.f13190f.b(e, "Error reading entries from local database");
                                                                                        h0VarN.f12991d = true;
                                                                                        if (cursor2 != null) {
                                                                                            cursor2.close();
                                                                                        }
                                                                                        if (sQLiteDatabase != null) {
                                                                                        }
                                                                                        i26 = i11 + 1;
                                                                                        i25 = i12;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        str7 = str;
                                                                                    }
                                                                                } else {
                                                                                    wVar = wVar2;
                                                                                    if (i28 == 1) {
                                                                                        parcelObtain = Parcel.obtain();
                                                                                        try {
                                                                                            try {
                                                                                                parcelObtain.unmarshall(blob, 0, blob.length);
                                                                                                parcelObtain.setDataPosition(0);
                                                                                                zzplVarCreateFromParcel = zzpl.CREATOR.createFromParcel(parcelObtain);
                                                                                            } finally {
                                                                                            }
                                                                                        } catch (SafeParcelReader$ParseException unused9) {
                                                                                            o0 o0Var7 = m1Var4.f13138f;
                                                                                            m1.l(o0Var7);
                                                                                            o0Var7.f13190f.a("Failed to load user property from local database");
                                                                                            parcelObtain.recycle();
                                                                                            zzplVarCreateFromParcel = null;
                                                                                        }
                                                                                        if (zzplVarCreateFromParcel != null) {
                                                                                            arrayList.add(new g0(zzplVarCreateFromParcel, string, j12));
                                                                                        }
                                                                                    } else if (i28 == 2) {
                                                                                        parcelObtain = Parcel.obtain();
                                                                                        try {
                                                                                            try {
                                                                                                parcelObtain.unmarshall(blob, 0, blob.length);
                                                                                                parcelObtain.setDataPosition(0);
                                                                                                zzahVarCreateFromParcel = zzah.CREATOR.createFromParcel(parcelObtain);
                                                                                            } catch (SafeParcelReader$ParseException unused10) {
                                                                                                o0 o0Var8 = m1Var4.f13138f;
                                                                                                m1.l(o0Var8);
                                                                                                o0Var8.f13190f.a("Failed to load conditional user property from local database");
                                                                                                parcelObtain.recycle();
                                                                                                zzahVarCreateFromParcel = null;
                                                                                            }
                                                                                            if (zzahVarCreateFromParcel != null) {
                                                                                                arrayList.add(new g0(zzahVarCreateFromParcel, string, j12));
                                                                                            }
                                                                                        } finally {
                                                                                        }
                                                                                    } else if (i28 == 4) {
                                                                                        try {
                                                                                            parcelObtain = Parcel.obtain();
                                                                                            try {
                                                                                                try {
                                                                                                    try {
                                                                                                        parcelObtain.unmarshall(blob, 0, blob.length);
                                                                                                        parcelObtain.setDataPosition(0);
                                                                                                        zzbfVarCreateFromParcel = zzbf.CREATOR.createFromParcel(parcelObtain);
                                                                                                    } catch (Throwable th7) {
                                                                                                        th = th7;
                                                                                                        throw th;
                                                                                                    }
                                                                                                } catch (SafeParcelReader$ParseException unused11) {
                                                                                                    o0 o0Var9 = m1Var4.f13138f;
                                                                                                    m1.l(o0Var9);
                                                                                                    o0Var9.f13190f.a("Failed to load default event parameters from local database");
                                                                                                    parcelObtain.recycle();
                                                                                                    zzbfVarCreateFromParcel = null;
                                                                                                    if (zzbfVarCreateFromParcel != null) {
                                                                                                    }
                                                                                                    i16 = 3;
                                                                                                    i14 = i16;
                                                                                                    str6 = str2;
                                                                                                    str5 = str3;
                                                                                                    cursorQuery2 = cursor2;
                                                                                                    wVar2 = wVar;
                                                                                                    i13 = 4;
                                                                                                }
                                                                                            } catch (SafeParcelReader$ParseException unused12) {
                                                                                            } catch (Throwable th8) {
                                                                                                th = th8;
                                                                                            }
                                                                                        } catch (SQLiteDatabaseLockedException unused13) {
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            SystemClock.sleep(i27);
                                                                                            i27 += 20;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase == null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        } catch (SQLiteFullException e23) {
                                                                                            e = e23;
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            o0 o0Var4222222 = m1Var4.f13138f;
                                                                                            m1.l(o0Var4222222);
                                                                                            o0Var4222222.f13190f.b(e, "Error reading entries from local database");
                                                                                            h0VarN.f12991d = true;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        } catch (SQLiteException e24) {
                                                                                            e = e24;
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            o0 o0Var5222222 = m1Var4.f13138f;
                                                                                            m1.l(o0Var5222222);
                                                                                            o0Var5222222.f13190f.b(e, "Error reading entries from local database");
                                                                                            h0VarN.f12991d = true;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        }
                                                                                        try {
                                                                                            if (zzbfVarCreateFromParcel != null) {
                                                                                                arrayList.add(new g0(zzbfVarCreateFromParcel, string, j12));
                                                                                            }
                                                                                            i16 = 3;
                                                                                            i14 = i16;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            cursorQuery2 = cursor2;
                                                                                            wVar2 = wVar;
                                                                                            i13 = 4;
                                                                                        } catch (SQLiteDatabaseLockedException unused14) {
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            SystemClock.sleep(i27);
                                                                                            i27 += 20;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase == null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        } catch (SQLiteFullException e25) {
                                                                                            e = e25;
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            o0 o0Var42222222 = m1Var4.f13138f;
                                                                                            m1.l(o0Var42222222);
                                                                                            o0Var42222222.f13190f.b(e, "Error reading entries from local database");
                                                                                            h0VarN.f12991d = true;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        } catch (SQLiteException e26) {
                                                                                            e = e26;
                                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                                            i12 = 5;
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            o0 o0Var52222222 = m1Var4.f13138f;
                                                                                            m1.l(o0Var52222222);
                                                                                            o0Var52222222.f13190f.b(e, "Error reading entries from local database");
                                                                                            h0VarN.f12991d = true;
                                                                                            if (cursor2 != null) {
                                                                                            }
                                                                                            if (sQLiteDatabase != null) {
                                                                                            }
                                                                                            i26 = i11 + 1;
                                                                                            i25 = i12;
                                                                                            str6 = str2;
                                                                                            str5 = str3;
                                                                                            str7 = str;
                                                                                        }
                                                                                    } else {
                                                                                        i16 = 3;
                                                                                        if (i28 == 3) {
                                                                                            o0 o0Var10 = m1Var4.f13138f;
                                                                                            m1.l(o0Var10);
                                                                                            o0Var10.n.a("Skipping app launch break");
                                                                                        } else {
                                                                                            o0 o0Var11 = m1Var4.f13138f;
                                                                                            m1.l(o0Var11);
                                                                                            o0Var11.f13190f.a("Unknown record type in local database");
                                                                                        }
                                                                                        i14 = i16;
                                                                                        str6 = str2;
                                                                                        str5 = str3;
                                                                                        cursorQuery2 = cursor2;
                                                                                        wVar2 = wVar;
                                                                                        i13 = 4;
                                                                                    }
                                                                                }
                                                                                i16 = 3;
                                                                                i14 = i16;
                                                                                str6 = str2;
                                                                                str5 = str3;
                                                                                cursorQuery2 = cursor2;
                                                                                wVar2 = wVar;
                                                                                i13 = 4;
                                                                            } catch (SQLiteDatabaseLockedException unused15) {
                                                                                cursor2 = cursorQuery2;
                                                                            } catch (SQLiteFullException e27) {
                                                                                e = e27;
                                                                                cursor2 = cursorQuery2;
                                                                            } catch (SQLiteException e28) {
                                                                                e = e28;
                                                                                cursor2 = cursorQuery2;
                                                                            }
                                                                        } catch (SQLiteDatabaseLockedException unused16) {
                                                                            cursor2 = cursorQuery2;
                                                                            str3 = str5;
                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                            i12 = 5;
                                                                            SystemClock.sleep(i27);
                                                                            i27 += 20;
                                                                            if (cursor2 != null) {
                                                                            }
                                                                            if (sQLiteDatabase == null) {
                                                                            }
                                                                            i26 = i11 + 1;
                                                                            i25 = i12;
                                                                            str6 = str2;
                                                                            str5 = str3;
                                                                            str7 = str;
                                                                        } catch (SQLiteFullException e29) {
                                                                            e = e29;
                                                                            cursor2 = cursorQuery2;
                                                                            str3 = str5;
                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                            i12 = 5;
                                                                            o0 o0Var422222222 = m1Var4.f13138f;
                                                                            m1.l(o0Var422222222);
                                                                            o0Var422222222.f13190f.b(e, "Error reading entries from local database");
                                                                            h0VarN.f12991d = true;
                                                                            if (cursor2 != null) {
                                                                            }
                                                                            if (sQLiteDatabase != null) {
                                                                            }
                                                                            i26 = i11 + 1;
                                                                            i25 = i12;
                                                                            str6 = str2;
                                                                            str5 = str3;
                                                                            str7 = str;
                                                                        } catch (SQLiteException e31) {
                                                                            e = e31;
                                                                            cursor2 = cursorQuery2;
                                                                            str3 = str5;
                                                                            sQLiteDatabase = sQLiteDatabaseJ;
                                                                            i12 = 5;
                                                                            if (sQLiteDatabase != null) {
                                                                            }
                                                                            o0 o0Var522222222 = m1Var4.f13138f;
                                                                            m1.l(o0Var522222222);
                                                                            o0Var522222222.f13190f.b(e, "Error reading entries from local database");
                                                                            h0VarN.f12991d = true;
                                                                            if (cursor2 != null) {
                                                                            }
                                                                            if (sQLiteDatabase != null) {
                                                                            }
                                                                            i26 = i11 + 1;
                                                                            i25 = i12;
                                                                            str6 = str2;
                                                                            str5 = str3;
                                                                            str7 = str;
                                                                        }
                                                                    } catch (SQLiteDatabaseLockedException unused17) {
                                                                        cursor2 = cursorQuery2;
                                                                        str2 = str6;
                                                                    } catch (SQLiteFullException e32) {
                                                                        e = e32;
                                                                        cursor2 = cursorQuery2;
                                                                        str2 = str6;
                                                                    } catch (SQLiteException e33) {
                                                                        e = e33;
                                                                        cursor2 = cursorQuery2;
                                                                        str2 = str6;
                                                                    }
                                                                } catch (SQLiteDatabaseLockedException unused18) {
                                                                    cursor2 = cursorQuery2;
                                                                    str2 = str6;
                                                                    str3 = str5;
                                                                } catch (SQLiteFullException e34) {
                                                                    e = e34;
                                                                    cursor2 = cursorQuery2;
                                                                    str2 = str6;
                                                                    str3 = str5;
                                                                } catch (SQLiteException e35) {
                                                                    e = e35;
                                                                    cursor2 = cursorQuery2;
                                                                    str2 = str6;
                                                                    str3 = str5;
                                                                }
                                                            } catch (Throwable th9) {
                                                                th = th9;
                                                                cursor2 = cursorQuery2;
                                                            }
                                                        } catch (SQLiteDatabaseLockedException unused19) {
                                                            cursor2 = cursorQuery2;
                                                            str2 = str6;
                                                            str3 = str5;
                                                        } catch (SQLiteFullException e36) {
                                                            e = e36;
                                                            cursor2 = cursorQuery2;
                                                            str2 = str6;
                                                            str3 = str5;
                                                        } catch (SQLiteException e37) {
                                                            e = e37;
                                                            cursor2 = cursorQuery2;
                                                            str2 = str6;
                                                            str3 = str5;
                                                        }
                                                    }
                                                    cursor2 = cursorQuery2;
                                                    str2 = str6;
                                                    str3 = str5;
                                                    i5 = 0;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                } catch (SQLiteDatabaseLockedException unused20) {
                                                    str3 = str5;
                                                    sQLiteDatabase = sQLiteDatabaseJ;
                                                    str2 = str6;
                                                    i12 = i15;
                                                    cursor2 = null;
                                                    SystemClock.sleep(i27);
                                                    i27 += 20;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase == null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                }
                                                try {
                                                    if (sQLiteDatabase.delete("messages", "rowid <= ?", new String[]{Long.toString(j14)}) < arrayList.size()) {
                                                        o0 o0Var12 = m1Var4.f13138f;
                                                        m1.l(o0Var12);
                                                        o0Var12.f13190f.a("Fewer entries removed from local database than expected");
                                                    }
                                                    sQLiteDatabase.setTransactionSuccessful();
                                                    sQLiteDatabase.endTransaction();
                                                    cursor2.close();
                                                    sQLiteDatabase.close();
                                                } catch (SQLiteDatabaseLockedException unused21) {
                                                    i12 = 5;
                                                    SystemClock.sleep(i27);
                                                    i27 += 20;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase == null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                } catch (SQLiteFullException e38) {
                                                    e = e38;
                                                    i12 = 5;
                                                    o0 o0Var4222222222 = m1Var4.f13138f;
                                                    m1.l(o0Var4222222222);
                                                    o0Var4222222222.f13190f.b(e, "Error reading entries from local database");
                                                    h0VarN.f12991d = true;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase != null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                } catch (SQLiteException e39) {
                                                    e = e39;
                                                    i12 = 5;
                                                    if (sQLiteDatabase != null) {
                                                        sQLiteDatabase.endTransaction();
                                                    }
                                                    o0 o0Var5222222222 = m1Var4.f13138f;
                                                    m1.l(o0Var5222222222);
                                                    o0Var5222222222.f13190f.b(e, "Error reading entries from local database");
                                                    h0VarN.f12991d = true;
                                                    if (cursor2 != null) {
                                                    }
                                                    if (sQLiteDatabase != null) {
                                                    }
                                                    i26 = i11 + 1;
                                                    i25 = i12;
                                                    str6 = str2;
                                                    str5 = str3;
                                                    str7 = str;
                                                }
                                            } catch (SQLiteFullException e40) {
                                                e = e40;
                                                str3 = str5;
                                                sQLiteDatabase = sQLiteDatabaseJ;
                                                str2 = str6;
                                                i12 = 5;
                                                cursor2 = null;
                                                o0 o0Var42222222222 = m1Var4.f13138f;
                                                m1.l(o0Var42222222222);
                                                o0Var42222222222.f13190f.b(e, "Error reading entries from local database");
                                                h0VarN.f12991d = true;
                                                if (cursor2 != null) {
                                                }
                                                if (sQLiteDatabase != null) {
                                                }
                                                i26 = i11 + 1;
                                                i25 = i12;
                                                str6 = str2;
                                                str5 = str3;
                                                str7 = str;
                                            } catch (SQLiteException e41) {
                                                e = e41;
                                                str3 = str5;
                                                sQLiteDatabase = sQLiteDatabaseJ;
                                                str2 = str6;
                                                i12 = 5;
                                                cursor2 = null;
                                                if (sQLiteDatabase != null) {
                                                }
                                                o0 o0Var52222222222 = m1Var4.f13138f;
                                                m1.l(o0Var52222222222);
                                                o0Var52222222222.f13190f.b(e, "Error reading entries from local database");
                                                h0VarN.f12991d = true;
                                                if (cursor2 != null) {
                                                }
                                                if (sQLiteDatabase != null) {
                                                }
                                                i26 = i11 + 1;
                                                i25 = i12;
                                                str6 = str2;
                                                str5 = str3;
                                                str7 = str;
                                            }
                                        } catch (SQLiteDatabaseLockedException unused22) {
                                            str = str7;
                                        } catch (SQLiteFullException e42) {
                                            e = e42;
                                            str = str7;
                                        } catch (SQLiteException e43) {
                                            e = e43;
                                            str = str7;
                                        }
                                    } catch (Throwable th10) {
                                        th = th10;
                                        i11 = i26;
                                    }
                                } catch (Throwable th11) {
                                    th = th11;
                                    str = str7;
                                    i11 = i26;
                                    str3 = str5;
                                    sQLiteDatabase = sQLiteDatabaseJ;
                                    i12 = 5;
                                    str2 = str6;
                                    cursorQuery = null;
                                }
                            }
                        } catch (SQLiteDatabaseLockedException unused23) {
                            str = str7;
                            i11 = i26;
                            str2 = str6;
                            str3 = str5;
                            i12 = 5;
                            sQLiteDatabase = null;
                        } catch (SQLiteFullException e44) {
                            e = e44;
                            str = str7;
                            i11 = i26;
                            str2 = str6;
                            str3 = str5;
                            i12 = 5;
                            sQLiteDatabase = null;
                        } catch (SQLiteException e45) {
                            e = e45;
                            str = str7;
                            i11 = i26;
                            str2 = str6;
                            str3 = str5;
                            i12 = 5;
                            sQLiteDatabase = null;
                        } catch (Throwable th12) {
                            th = th12;
                            sQLiteDatabase = null;
                        }
                    }
                    i5 = 0;
                    o0 o0Var13 = m1Var4.f13138f;
                    m1.l(o0Var13);
                    o0Var13.f13193i.a("Failed to read events from database in reasonable time");
                    arrayList = null;
                } else {
                    context = context3;
                    o0Var = o0Var3;
                    i5 = 0;
                }
                if (arrayList == null) {
                    arrayList2.addAll(arrayList);
                    size = arrayList.size();
                } else {
                    size = i5;
                }
                if (abstractSafeParcelable != null && size < i23) {
                    arrayList2.add(new g0(abstractSafeParcelable, zzrVar2.f33794h, zzrVar2.o));
                }
                i17 = i5;
                for (size2 = arrayList2.size(); i17 < size2; size2 = i18) {
                    g0 g0Var = (g0) arrayList2.get(i17);
                    AbstractSafeParcelable abstractSafeParcelable2 = g0Var.f12964a;
                    w wVar3 = x.W0;
                    if (eVar.O(null, wVar3)) {
                        String str8 = g0Var.f12965b;
                        if (TextUtils.isEmpty(str8)) {
                            i18 = size2;
                        } else {
                            i18 = size2;
                            zzrVar2 = new zzr(zzrVar2.f33792f, zzrVar2.f33793g, str8, g0Var.f12966c, zzrVar2.f33795i, zzrVar2.f33796j, zzrVar2.f33797k, zzrVar2.f33798l, zzrVar2.f33799m, zzrVar2.n, zzrVar2.f33800p, zzrVar2.f33801q, zzrVar2.f33802r, zzrVar2.f33803s, zzrVar2.f33804t, zzrVar2.f33805u, zzrVar2.f33806v, zzrVar2.f33807w, zzrVar2.f33808x, zzrVar2.f33809y, zzrVar2.f33810z, zzrVar2.A, zzrVar2.B, zzrVar2.C, zzrVar2.D, zzrVar2.E, zzrVar2.F, zzrVar2.G, zzrVar2.H, zzrVar2.I, zzrVar2.J, zzrVar2.K);
                        }
                    }
                    if (abstractSafeParcelable2 instanceof zzbh) {
                        try {
                            aVar2.getClass();
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            try {
                                aVar2.getClass();
                                jElapsedRealtime = SystemClock.elapsedRealtime();
                                try {
                                    try {
                                        a0Var.O((zzbh) abstractSafeParcelable2, zzrVar2);
                                        m1.l(o0Var);
                                        o0Var2 = o0Var;
                                        try {
                                            o0Var2.n.a("Logging telemetry for logEvent from database");
                                            if (mg.l.f76306f == null) {
                                                m1Var2 = m1Var;
                                                context2 = context;
                                                try {
                                                    mg.l.f76306f = new mg.l(context2, m1Var2);
                                                } catch (RemoteException e46) {
                                                    e = e46;
                                                    j13 = jCurrentTimeMillis;
                                                    m1.l(o0Var2);
                                                    o0Var2.f13190f.b(e, "Failed to send event to the service");
                                                    if (j13 != 0) {
                                                        if (mg.l.f76306f == null) {
                                                            mg.l.f76306f = new mg.l(context2, m1Var2);
                                                        }
                                                        mg.l lVar = mg.l.f76306f;
                                                        aVar2.getClass();
                                                        long jCurrentTimeMillis2 = System.currentTimeMillis();
                                                        aVar2.getClass();
                                                        lVar.D(j13, jCurrentTimeMillis2, 13, (int) (SystemClock.elapsedRealtime() - jElapsedRealtime));
                                                    }
                                                    i17++;
                                                    o0Var = o0Var2;
                                                    m1Var = m1Var2;
                                                    context = context2;
                                                }
                                            } else {
                                                m1Var2 = m1Var;
                                                context2 = context;
                                            }
                                            mg.l lVar2 = mg.l.f76306f;
                                            aVar2.getClass();
                                            long jCurrentTimeMillis3 = System.currentTimeMillis();
                                            aVar2.getClass();
                                            lVar2.D(jCurrentTimeMillis, jCurrentTimeMillis3, 0, (int) (SystemClock.elapsedRealtime() - jElapsedRealtime));
                                        } catch (RemoteException e47) {
                                            e = e47;
                                            m1Var2 = m1Var;
                                            context2 = context;
                                        }
                                    } catch (RemoteException e48) {
                                        e = e48;
                                        m1Var2 = m1Var;
                                        context2 = context;
                                        o0Var2 = o0Var;
                                        j13 = jCurrentTimeMillis;
                                        m1.l(o0Var2);
                                        o0Var2.f13190f.b(e, "Failed to send event to the service");
                                        if (j13 != 0) {
                                        }
                                        i17++;
                                        o0Var = o0Var2;
                                        m1Var = m1Var2;
                                        context = context2;
                                    }
                                } catch (RemoteException e49) {
                                    e = e49;
                                }
                            } catch (RemoteException e51) {
                                e = e51;
                                m1Var2 = m1Var;
                                context2 = context;
                                o0Var2 = o0Var;
                                jElapsedRealtime = 0;
                            }
                        } catch (RemoteException e52) {
                            e = e52;
                            m1Var2 = m1Var;
                            context2 = context;
                            o0Var2 = o0Var;
                            jElapsedRealtime = 0;
                            j13 = 0;
                        }
                    } else {
                        m1Var2 = m1Var;
                        context2 = context;
                        o0Var2 = o0Var;
                        if (abstractSafeParcelable2 instanceof zzpl) {
                            try {
                                a0Var.l((zzpl) abstractSafeParcelable2, zzrVar2);
                            } catch (RemoteException e53) {
                                m1.l(o0Var2);
                                o0Var2.f13190f.b(e53, "Failed to send user property to the service");
                            }
                        } else if (abstractSafeParcelable2 instanceof zzah) {
                            try {
                                a0Var.c((zzah) abstractSafeParcelable2, zzrVar2);
                            } catch (RemoteException e54) {
                                m1.l(o0Var2);
                                o0Var2.f13190f.b(e54, "Failed to send conditional user property to the service");
                            }
                        } else {
                            if (eVar.O(null, wVar3) && (abstractSafeParcelable2 instanceof zzbf)) {
                                try {
                                    a0Var.E(((zzbf) abstractSafeParcelable2).p(), zzrVar2);
                                } catch (RemoteException e55) {
                                    m1.l(o0Var2);
                                    o0Var2.f13190f.b(e55, "Failed to send default event parameters to the service");
                                }
                            } else {
                                m1.l(o0Var2);
                                o0Var2.f13190f.a("Discarding data. Unrecognized parcel type.");
                            }
                            i17++;
                            o0Var = o0Var2;
                            m1Var = m1Var2;
                            context = context2;
                        }
                    }
                    i17++;
                    o0Var = o0Var2;
                    m1Var = m1Var2;
                    context = context2;
                }
                o0Var3 = o0Var;
                m1Var3 = m1Var;
                context3 = context;
                aVar = aVar2;
                i19 = 100;
                i21 = i24 + 1;
            }
            i5 = 0;
            arrayList = null;
            if (arrayList == null) {
            }
            if (abstractSafeParcelable != null) {
                arrayList2.add(new g0(abstractSafeParcelable, zzrVar2.f33794h, zzrVar2.o));
            }
            i17 = i5;
            while (i17 < size2) {
            }
            o0Var3 = o0Var;
            m1Var3 = m1Var;
            context3 = context;
            aVar = aVar2;
            i19 = 100;
            i21 = i24 + 1;
        }
    }

    public final void W(zzah zzahVar) {
        boolean zK;
        D();
        E();
        m1 m1Var = (m1) this.f13368a;
        m1Var.getClass();
        h0 h0VarN = m1Var.n();
        m1 m1Var2 = (m1) h0VarN.f13368a;
        m1.j(m1Var2.f13141i);
        byte[] bArrM0 = p4.m0(zzahVar);
        if (bArrM0.length > 131072) {
            o0 o0Var = m1Var2.f13138f;
            m1.l(o0Var);
            o0Var.f13191g.a("Conditional user property too long for local database. Sending directly to service");
            zK = false;
        } else {
            zK = h0VarN.K(2, bArrM0);
        }
        R(new j3(this, T(true), zK, new zzah(zzahVar)));
    }
}
