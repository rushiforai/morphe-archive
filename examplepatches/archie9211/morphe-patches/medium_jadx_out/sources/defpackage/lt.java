package defpackage;

import android.animation.Animator;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.http.UrlResponseInfo;
import android.os.Build;
import android.os.CancellationSignal;
import android.os.Trace;
import android.util.Log;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.google.firebase.FirebaseCommonRegistrar;
import com.google.firebase.messaging.FirebaseMessagingService;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class lt implements pi2, dz1, br8, z51, xq8, oa6, jg4, m33, m8c, o92, dnb, v5d, r41 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ lt(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        ((FirebaseMessagingService) this.b).a((Intent) this.c);
    }

    @Override // defpackage.m8c
    public boolean a() {
        az9 az9Var = (az9) this.b;
        il0 il0Var = (il0) this.c;
        boolean z = az9Var.q;
        if (z) {
            return z;
        }
        az9Var.h();
        long jA = il0.a(az9Var.o, il0Var.a);
        il0Var.a = jA;
        boolean z2 = !az9Var.g(az9Var.n, jA + il0Var.b);
        az9Var.q = z2;
        return z2;
    }

    @Override // defpackage.dnb
    public Object apply(Object obj) {
        fnb fnbVar = (fnb) this.b;
        kk0 kk0Var = (kk0) this.c;
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        jj0 jj0Var = fnbVar.d;
        ArrayList arrayListB = fnbVar.B(sQLiteDatabase, kk0Var, jj0Var.b);
        for (z0a z0aVar : z0a.values()) {
            if (z0aVar != kk0Var.c) {
                int size = jj0Var.b - arrayListB.size();
                if (size <= 0) {
                    break;
                }
                arrayListB.addAll(fnbVar.B(sQLiteDatabase, kk0Var.b(z0aVar), size));
            }
        }
        HashMap map = new HashMap();
        StringBuilder sb = new StringBuilder("event_id IN (");
        for (int i = 0; i < arrayListB.size(); i++) {
            sb.append(((xj0) arrayListB.get(i)).a);
            if (i < arrayListB.size() - 1) {
                sb.append(',');
            }
        }
        sb.append(')');
        Cursor cursorQuery = sQLiteDatabase.query("event_metadata", new String[]{"event_id", "name", "value"}, sb.toString(), null, null, null, null);
        while (cursorQuery.moveToNext()) {
            try {
                long j = cursorQuery.getLong(0);
                Set hashSet = (Set) map.get(Long.valueOf(j));
                if (hashSet == null) {
                    hashSet = new HashSet();
                    map.put(Long.valueOf(j), hashSet);
                }
                hashSet.add(new enb(cursorQuery.getString(1), cursorQuery.getString(2)));
            } catch (Throwable th) {
                cursorQuery.close();
                throw th;
            }
        }
        cursorQuery.close();
        ListIterator listIterator = arrayListB.listIterator();
        while (listIterator.hasNext()) {
            xj0 xj0Var = (xj0) listIterator.next();
            long j2 = xj0Var.a;
            if (map.containsKey(Long.valueOf(j2))) {
                hj0 hj0VarC = xj0Var.c.c();
                for (enb enbVar : (Set) map.get(Long.valueOf(j2))) {
                    hj0VarC.a(enbVar.a, enbVar.b);
                }
                listIterator.set(new xj0(j2, xj0Var.b, hj0VarC.b()));
            }
        }
        return arrayListB;
    }

    @Override // defpackage.jg4
    public void b(File file) {
        i28 i28Var = (i28) this.b;
        i28Var.g = (f28) this.c;
        i28Var.f = file;
        Runnable runnable = i28Var.h;
        if (runnable != null) {
            runnable.run();
        }
    }

    @Override // defpackage.v5d
    public Object c() {
        int i = this.a;
        Object obj = this.c;
        sj0 sj0Var = (sj0) this.b;
        switch (i) {
            case 17:
                Iterable iterable = (Iterable) obj;
                fnb fnbVar = (fnb) sj0Var.c;
                fnbVar.getClass();
                if (iterable.iterator().hasNext()) {
                    fnbVar.f().compileStatement("DELETE FROM events WHERE _id in ".concat(fnb.L(iterable))).execute();
                }
                break;
            default:
                Iterator it2 = ((HashMap) obj).entrySet().iterator();
                while (it2.hasNext()) {
                    ((fnb) sj0Var.i).D(((Integer) r2.getValue()).intValue(), v77.INVALID_PAYLOD, (String) ((Map.Entry) it2.next()).getKey());
                }
                break;
        }
        return null;
    }

    @Override // defpackage.r41
    public Object d(q41 q41Var) {
        Executor executor = (Executor) this.b;
        m45 m45Var = (m45) this.c;
        AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        e37 e37Var = new e37(atomicBoolean, 1);
        af3 af3Var = af3.INSTANCE;
        dcb dcbVar = q41Var.c;
        if (dcbVar != null) {
            dcbVar.a(e37Var, af3Var);
        }
        executor.execute(new f37(atomicBoolean, q41Var, m45Var, 1));
        return c1e.a;
    }

    @Override // defpackage.m33
    public void e(h8a h8aVar) {
        m33 m33Var = (m33) this.b;
        m33 m33Var2 = (m33) this.c;
        m33Var.e(h8aVar);
        m33Var2.e(h8aVar);
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        int i = this.a;
        Object obj = this.c;
        String str = (String) this.b;
        switch (i) {
            case 3:
                iy1 iy1Var = (iy1) obj;
                try {
                    Trace.beginSection(str);
                    return iy1Var.f.f(iq1Var);
                } finally {
                    Trace.endSection();
                }
            default:
                Context context = (Context) iq1Var.c(Context.class);
                int i2 = ((fm3) obj).a;
                String strValueOf = "";
                switch (i2) {
                    case 25:
                        ApplicationInfo applicationInfo = context.getApplicationInfo();
                        if (applicationInfo != null) {
                            strValueOf = String.valueOf(applicationInfo.targetSdkVersion);
                        }
                        break;
                    case 26:
                        strValueOf = FirebaseCommonRegistrar.a(context);
                        break;
                    case 27:
                        if (context.getPackageManager().hasSystemFeature("android.hardware.type.television")) {
                            strValueOf = "tv";
                        } else if (context.getPackageManager().hasSystemFeature("android.hardware.type.watch")) {
                            strValueOf = "watch";
                        } else if (context.getPackageManager().hasSystemFeature("android.hardware.type.automotive")) {
                            strValueOf = "auto";
                        } else if (Build.VERSION.SDK_INT >= 26 && context.getPackageManager().hasSystemFeature("android.hardware.type.embedded")) {
                            strValueOf = "embedded";
                        }
                        break;
                    default:
                        String installerPackageName = context.getPackageManager().getInstallerPackageName(context.getPackageName());
                        if (installerPackageName != null) {
                            strValueOf = FirebaseCommonRegistrar.b(installerPackageName);
                        }
                        break;
                }
                return new rj0(str, strValueOf);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void g() {
        /*
            r6 = this;
            java.lang.Object r0 = r6.b
            xe4 r0 = (defpackage.xe4) r0
            java.lang.Object r6 = r6.c
            java.lang.String r6 = (java.lang.String) r6
            java.util.Set r1 = defpackage.ec2.a
            java.lang.Class<fq1> r2 = defpackage.fq1.class
            boolean r3 = r1.contains(r2)
            if (r3 == 0) goto L13
            goto L6a
        L13:
            r3 = 1
            r4 = 0
            if (r0 == 0) goto L1f
            boolean r0 = r0.g     // Catch: java.lang.Throwable -> L1d
            if (r0 == 0) goto L1f
            r0 = r3
            goto L20
        L1d:
            r6 = move-exception
            goto L67
        L1f:
            r0 = r4
        L20:
            f94 r5 = defpackage.f94.a     // Catch: java.lang.Throwable -> L1d
            mme r5 = defpackage.mme.a     // Catch: java.lang.Throwable -> L1d
            java.lang.Class<mme> r5 = defpackage.mme.class
            boolean r1 = r1.contains(r5)     // Catch: java.lang.Throwable -> L1d
            if (r1 == 0) goto L2e
        L2c:
            r1 = r4
            goto L3f
        L2e:
            mme r1 = defpackage.mme.a     // Catch: java.lang.Throwable -> L3a
            r1.e()     // Catch: java.lang.Throwable -> L3a
            tp4 r1 = defpackage.mme.g     // Catch: java.lang.Throwable -> L3a
            boolean r1 = r1.a()     // Catch: java.lang.Throwable -> L3a
            goto L3f
        L3a:
            r1 = move-exception
            defpackage.ec2.a(r5, r1)     // Catch: java.lang.Throwable -> L1d
            goto L2c
        L3f:
            if (r0 == 0) goto L6a
            if (r1 == 0) goto L6a
            fq1 r0 = defpackage.fq1.a     // Catch: java.lang.Throwable -> L1d
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L1d
            boolean r1 = r1.contains(r0)     // Catch: java.lang.Throwable -> L1d
            if (r1 == 0) goto L4e
            goto L6a
        L4e:
            boolean r1 = defpackage.fq1.h     // Catch: java.lang.Throwable -> L62
            if (r1 == 0) goto L53
            goto L6a
        L53:
            defpackage.fq1.h = r3     // Catch: java.lang.Throwable -> L62
            java.util.concurrent.Executor r1 = defpackage.f94.c()     // Catch: java.lang.Throwable -> L62
            eq1 r3 = new eq1     // Catch: java.lang.Throwable -> L62
            r3.<init>(r6, r4)     // Catch: java.lang.Throwable -> L62
            r1.execute(r3)     // Catch: java.lang.Throwable -> L62
            goto L6a
        L62:
            r6 = move-exception
            defpackage.ec2.a(r0, r6)     // Catch: java.lang.Throwable -> L1d
            goto L6a
        L67:
            defpackage.ec2.a(r2, r6)
        L6a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lt.g():void");
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        mya myaVar = (mya) this.b;
        String str = (String) this.c;
        synchronized (myaVar) {
            ((y70) myaVar.c).remove(str);
        }
        return jrgVar;
    }

    @Override // defpackage.z51
    public void onCancel() {
        Animator animator = (Animator) this.b;
        blc blcVar = (blc) this.c;
        animator.end();
        if (f25.I(2)) {
            Log.v("FragmentManager", "Animator from operation " + blcVar + " has been canceled.");
        }
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 4:
                CredentialProviderBeginSignInController.invokePlayServices$lambda$2((CredentialProviderBeginSignInController) obj2, (CancellationSignal) obj, exc);
                break;
            default:
                CredentialProviderGetSignInIntentController.invokePlayServices$lambda$3((CredentialProviderGetSignInIntentController) obj2, (CancellationSignal) obj, exc);
                break;
        }
    }

    @Override // defpackage.pi2, defpackage.oa6
    public void run() throws IOException {
        int i;
        int i2 = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i2) {
            case 0:
                nt ntVar = (nt) obj2;
                ntVar.a.I(ntVar.b, pt.L((UrlResponseInfo) obj));
                break;
            default:
                na6 na6Var = (na6) obj2;
                ByteBuffer byteBuffer = (ByteBuffer) obj;
                ReadableByteChannel readableByteChannel = na6Var.C;
                if (readableByteChannel != null) {
                    na6Var.L++;
                    i = readableByteChannel.read(byteBuffer);
                } else {
                    i = -1;
                }
                n0c n0cVar = na6Var.r;
                int i3 = 5;
                if (i == -1) {
                    ReadableByteChannel readableByteChannel2 = na6Var.C;
                    if (readableByteChannel2 != null) {
                        readableByteChannel2.close();
                    }
                    if (na6Var.w.compareAndSet(5, 7)) {
                        na6Var.f0(new ga6(na6Var, 2), PqkdNGCEoxOKZk.RJQRsxbf);
                        i7e i7eVar = na6Var.D;
                        n0cVar.getClass();
                        n0cVar.B(new fi2(n0cVar, 15, i7eVar), "onSucceeded");
                    }
                } else {
                    i7e i7eVar2 = na6Var.D;
                    n0cVar.getClass();
                    n0cVar.A(new mt(n0cVar, i7eVar2, byteBuffer, i3), "onReadCompleted");
                }
                break;
        }
    }
}
