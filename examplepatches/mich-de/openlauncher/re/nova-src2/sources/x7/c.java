package x7;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Looper;
import android.os.Trace;
import android.util.Log;
import androidx.work.impl.WorkDatabase_Impl;
import b.c0;
import b.u4;
import coil.memory.MemoryCache$Key;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import n0.b0;
import ya.z;
import z.h0;
import z.k0;
import z2.x1;
import z2.y1;

/* loaded from: classes.dex */
public final class c implements mk.a, y1, v8.f {

    /* renamed from: c, reason: collision with root package name */
    public static c f95125c;

    /* renamed from: a, reason: collision with root package name */
    public Object f95126a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95127b;

    public /* synthetic */ c(Object obj, Object obj2) {
        this.f95126a = obj;
        this.f95127b = obj2;
    }

    public void a(Object obj, String str) {
        boolean zCommit;
        String str2 = (String) this.f95126a;
        SharedPreferences sharedPreferences = (SharedPreferences) this.f95127b;
        if (obj instanceof String) {
            zCommit = sharedPreferences.edit().putString(str, (String) obj).commit();
        } else if (obj instanceof Long) {
            zCommit = sharedPreferences.edit().putLong(str, ((Long) obj).longValue()).commit();
        } else if (obj instanceof Boolean) {
            zCommit = sharedPreferences.edit().putBoolean(str, ((Boolean) obj).booleanValue()).commit();
        } else {
            if (!(obj instanceof Integer)) {
                Log.e("GpidLifecycleSPHandler", "Unexpected object class " + obj.getClass() + " for app " + str2);
                throw new IOException(c0.m("Failed to store ", str, " for app ", str2));
            }
            zCommit = sharedPreferences.edit().putInt(str, ((Integer) obj).intValue()).commit();
        }
        if (zCommit) {
            return;
        }
        throw new IOException(c0.m("Failed to store ", str, " for app ", str2));
    }

    @Override // v8.f
    public void b(MemoryCache$Key memoryCache$Key, Bitmap bitmap, Map map) {
        int i5;
        int iH = u90.b.H(bitmap);
        v8.d dVar = (v8.d) this.f95127b;
        synchronized (dVar.f97859c) {
            i5 = dVar.f97857a;
        }
        if (iH <= i5) {
            ((v8.d) this.f95127b).d(memoryCache$Key, new v8.c(bitmap, map, iH));
        } else {
            ((v8.d) this.f95127b).e(memoryCache$Key);
            ((fa.t) this.f95126a).o(memoryCache$Key, bitmap, map, iH);
        }
    }

    @Override // z2.y1
    public void c(x1 x1Var) {
        h0 h0Var = (h0) this.f95127b;
        h0Var.c();
        k0 k0Var = x1Var.f98177a;
        Object[] objArr = k0Var.f97851b;
        long[] jArr = k0Var.f97852c;
        int i5 = k0Var.f97854e;
        while (i5 != Integer.MAX_VALUE) {
            int i11 = (int) ((jArr[i5] >> 31) & 2147483647L);
            Object obj = objArr[i5];
            Object objB = ((b0) this.f95126a).b(obj);
            int iA = h0Var.a(objB);
            int i12 = iA >= 0 ? h0Var.f97831c[iA] : 0;
            if (i12 == 7) {
                x1Var.remove(obj);
            } else {
                h0Var.h(i12 + 1, objB);
            }
            i5 = i11;
        }
    }

    @Override // v8.f
    public void d(int i5) {
        int i11;
        v8.d dVar = (v8.d) this.f95127b;
        if (i5 >= 40) {
            dVar.i(-1);
            return;
        }
        if (10 > i5 || i5 >= 20) {
            return;
        }
        synchronized (dVar.f97859c) {
            i11 = dVar.f97860d;
        }
        dVar.i(i11 / 2);
    }

    @Override // z2.y1
    public boolean e(Object obj, Object obj2) {
        b0 b0Var = (b0) this.f95126a;
        return Intrinsics.b(b0Var.b(obj), b0Var.b(obj2));
    }

    @Override // v8.f
    public v8.a f(MemoryCache$Key memoryCache$Key) {
        v8.c cVar = (v8.c) ((v8.d) this.f95127b).c(memoryCache$Key);
        if (cVar != null) {
            return new v8.a(cVar.f92207a, cVar.f92208b);
        }
        return null;
    }

    public boolean g(i iVar) {
        boolean zContainsKey;
        synchronized (this.f95126a) {
            zContainsKey = ((LinkedHashMap) this.f95127b).containsKey(iVar);
        }
        return zContainsKey;
    }

    public Object h(Context context) {
        Context applicationContext = context.getApplicationContext() == null ? context : context.getApplicationContext();
        if (this.f95127b == null) {
            if (Looper.myLooper() != Looper.getMainLooper()) {
                try {
                    return ya.j.f97147b.submit(new wm.a(2, this, context)).get();
                } catch (InterruptedException | ExecutionException e3) {
                    throw new RuntimeException(e3);
                }
            }
            Trace.beginSection("main.thread.object");
            try {
                Object objG = ((z) this.f95126a).g(applicationContext);
                Trace.endSection();
                this.f95127b = objG;
            } catch (Throwable th2) {
                Trace.endSection();
                throw th2;
            }
        }
        return this.f95127b;
    }

    public ArrayList i(String str) throws IOException {
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95126a;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT work_spec_id FROM dependency WHERE prerequisite_id=?");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
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

    public List j(String workSpecId) {
        List listI1;
        Intrinsics.g(workSpecId, "workSpecId");
        synchronized (this.f95126a) {
            try {
                LinkedHashMap linkedHashMap = (LinkedHashMap) this.f95127b;
                LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                for (Map.Entry entry : linkedHashMap.entrySet()) {
                    if (Intrinsics.b(((i) entry.getKey()).f95141a, workSpecId)) {
                        linkedHashMap2.put(entry.getKey(), entry.getValue());
                    }
                }
                Iterator it = linkedHashMap2.keySet().iterator();
                while (it.hasNext()) {
                    ((LinkedHashMap) this.f95127b).remove((i) it.next());
                }
                listI1 = b70.g.I1(linkedHashMap2.values());
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return listI1;
    }

    public p7.m k(i iVar) {
        p7.m mVar;
        synchronized (this.f95126a) {
            mVar = (p7.m) ((LinkedHashMap) this.f95127b).remove(iVar);
        }
        return mVar;
    }

    public p7.m l(i iVar) {
        p7.m mVar;
        synchronized (this.f95126a) {
            try {
                LinkedHashMap linkedHashMap = (LinkedHashMap) this.f95127b;
                Object mVar2 = linkedHashMap.get(iVar);
                if (mVar2 == null) {
                    mVar2 = new p7.m(iVar);
                    linkedHashMap.put(iVar, mVar2);
                }
                mVar = (p7.m) mVar2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return mVar;
    }

    public com.google.android.gms.internal.consent_sdk.z m(Activity activity, o2.f fVar) {
        fVar.getClass();
        return tm.o.K0(new tm.o(this, activity, new og.i((Context) this.f95126a).d(), fVar, 10));
    }

    @Override // mk.a
    public void onDismissed(Bundle bundle) {
        t70.m mVar = (t70.m) this.f95126a;
        if (mVar.b() && ((AtomicBoolean) this.f95127b).compareAndSet(false, true)) {
            int i5 = Result.f71687b;
            mVar.resumeWith(Unit.f71706a);
        }
    }

    @Override // mk.a
    public void onError(Bundle bundle) {
        t70.m mVar = (t70.m) this.f95126a;
        if (mVar.b() && ((AtomicBoolean) this.f95127b).compareAndSet(false, true)) {
            int i5 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(new Exception("HSDP open failed: " + bundle)));
        }
    }

    @Override // mk.a
    public void onShown(Bundle bundle) {
        t70.m mVar = (t70.m) this.f95126a;
        if (mVar.b() && ((AtomicBoolean) this.f95127b).compareAndSet(false, true)) {
            int i5 = Result.f71687b;
            mVar.resumeWith(Unit.f71706a);
        }
    }

    public c(Context context) {
        this.f95126a = context.getPackageName();
        this.f95127b = context.getSharedPreferences("paid_storage_sp", 0);
    }

    public c(z zVar) {
        this.f95126a = zVar;
    }

    public c(int i5) {
        switch (i5) {
            case 6:
                this.f95126a = new Object();
                this.f95127b = new LinkedHashMap();
                break;
            default:
                this.f95126a = new LinkedHashMap();
                this.f95127b = new LinkedHashMap();
                break;
        }
    }

    public void a(String str) throws IOException {
        if (((SharedPreferences) this.f95127b).edit().remove(str).commit()) {
            return;
        }
        StringBuilder sbK = u4.k("Failed to remove ", str, " for app ");
        sbK.append((String) this.f95126a);
        throw new IOException(sbK.toString());
    }
}
