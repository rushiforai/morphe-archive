package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.common.api.Status;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ee5 implements Handler.Callback {
    public static final Status o = new Status(4, "Sign-out occurred while this API call was in progress.", null, null);
    public static final Status p = new Status(4, "The user must be signed in to make this API call.", null, null);
    public static final Object q = new Object();
    public static ee5 r;
    public long a;
    public boolean b;
    public egd c;
    public b66 d;
    public final Context e;
    public final ae5 f;
    public final wjc g;
    public final AtomicInteger h;
    public final AtomicInteger i;
    public final ConcurrentHashMap j;
    public final d80 k;
    public final d80 l;
    public final tjf m;
    public volatile boolean n;

    public ee5(Context context, Looper looper) {
        ae5 ae5Var = ae5.e;
        this.a = 10000L;
        this.b = false;
        this.h = new AtomicInteger(1);
        this.i = new AtomicInteger(0);
        this.j = new ConcurrentHashMap(5, 0.75f, 1);
        this.k = new d80(0);
        this.l = new d80(0);
        this.n = true;
        this.e = context;
        tjf tjfVar = new tjf(looper, this);
        Looper.getMainLooper();
        this.m = tjfVar;
        this.f = ae5Var;
        this.g = new wjc(7);
        PackageManager packageManager = context.getPackageManager();
        Boolean boolValueOf = r40.o;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(gq7.D() && packageManager.hasSystemFeature("android.hardware.type.automotive"));
            r40.o = boolValueOf;
        }
        if (boolValueOf.booleanValue()) {
            this.n = false;
        }
        tjfVar.sendMessage(tjfVar.obtainMessage(6));
    }

    public static void a() {
        synchronized (q) {
            try {
                ee5 ee5Var = r;
                if (ee5Var != null) {
                    ee5Var.i.incrementAndGet();
                    tjf tjfVar = ee5Var.m;
                    tjfVar.sendMessageAtFrontOfQueue(tjfVar.obtainMessage(10));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static Status c(gz gzVar, h42 h42Var) {
        String str = (String) gzVar.b.c;
        String strValueOf = String.valueOf(h42Var);
        return new Status(17, km4.C(new StringBuilder(str.length() + 63 + strValueOf.length()), "API: ", str, " is not available on this device. Connection failed with: ", strValueOf), h42Var.c, h42Var);
    }

    public static ee5 d(Context context) {
        ee5 ee5Var;
        synchronized (q) {
            try {
                ee5Var = r;
                if (ee5Var == null) {
                    Looper looper = rig.a().getLooper();
                    Context applicationContext = context.getApplicationContext();
                    Object obj = ae5.d;
                    ee5 ee5Var2 = new ee5(applicationContext, looper);
                    r = ee5Var2;
                    ee5Var = ee5Var2;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return ee5Var;
    }

    public final uif b(zd5 zd5Var) {
        gz gzVar = zd5Var.f;
        ConcurrentHashMap concurrentHashMap = this.j;
        uif uifVar = (uif) concurrentHashMap.get(gzVar);
        if (uifVar == null) {
            uifVar = new uif(this, zd5Var);
            concurrentHashMap.put(gzVar, uifVar);
        }
        if (uifVar.f.n()) {
            this.l.add(gzVar);
        }
        uifVar.q();
        return uifVar;
    }

    public final boolean e() {
        if (this.b) {
            return false;
        }
        plb plbVar = (plb) olb.k().b;
        if (plbVar != null && !plbVar.b) {
            return false;
        }
        int iK = this.g.k(203400000);
        return iK == -1 || iK == 0;
    }

    public final boolean f(h42 h42Var, int i) {
        ae5 ae5Var = this.f;
        ae5Var.getClass();
        Context context = this.e;
        if (!u36.o(context)) {
            int i2 = h42Var.b;
            PendingIntent activity = h42Var.c;
            if (!((i2 == 0 || activity == null) ? false : true)) {
                activity = null;
                Intent intentA = ae5Var.a(i2, context, null);
                if (intentA != null) {
                    activity = PendingIntent.getActivity(context, 0, intentA, 201326592);
                }
            }
            if (activity != null) {
                int i3 = GoogleApiActivity.b;
                Intent intent = new Intent(context, (Class<?>) GoogleApiActivity.class);
                intent.putExtra("pending_intent", activity);
                intent.putExtra("failing_client_id", i);
                intent.putExtra("notify_manager", true);
                ae5Var.g(context, i2, PendingIntent.getActivity(context, 0, intent, rjf.a | 134217728));
                Integer num = h42Var.e;
                rif rifVar = new rif(num == null ? -1 : num.intValue(), context.getPackageName(), System.currentTimeMillis(), h42Var.b, false);
                b66 b66Var = ae5Var.c;
                if (b66Var == null) {
                    b66Var = new b66(context, b66.n, sy.T, yd5.c);
                    ae5Var.c = b66Var;
                }
                wv0 wv0VarB = wv0.b();
                wv0VarB.e = new da4[]{wgf.A};
                wv0VarB.c = false;
                wv0VarB.d = new ujf(0, rifVar);
                b66Var.b(2, wv0VarB.a());
                return true;
            }
        }
        return false;
    }

    public final void g(h42 h42Var, int i) {
        if (f(h42Var, i)) {
            return;
        }
        tjf tjfVar = this.m;
        tjfVar.sendMessage(tjfVar.obtainMessage(5, i, 0, h42Var));
    }

    /* JADX WARN: Removed duplicated region for block: B:151:0x0342  */
    @Override // android.os.Handler.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean handleMessage(android.os.Message r19) {
        /*
            Method dump skipped, instruction units count: 1174
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ee5.handleMessage(android.os.Message):boolean");
    }
}
