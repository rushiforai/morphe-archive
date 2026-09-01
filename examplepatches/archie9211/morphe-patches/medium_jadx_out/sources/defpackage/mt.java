package defpackage;

import android.content.Intent;
import android.content.SharedPreferences;
import android.net.http.UrlResponseInfo;
import android.util.Log;
import com.google.firebase.messaging.FirebaseMessaging;
import java.nio.ByteBuffer;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import sprig.b.g;
import sprig.b.h;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mt implements pi2, o92, v5d, v0d, oa6, r41, dnb, h.b {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ mt(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0046 A[PHI: r13
      0x0046: PHI (r13v26 v77) = (r13v19 v77), (r13v20 v77), (r13v21 v77), (r13v22 v77), (r13v23 v77), (r13v24 v77) binds: [B:11:0x0044, B:14:0x004e, B:17:0x0057, B:20:0x0060, B:23:0x0069, B:26:0x0072] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.dnb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object apply(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 1080
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mt.apply(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.v5d
    public Object c() {
        s13 s13Var = (s13) this.b;
        kk0 kk0Var = (kk0) this.c;
        ij0 ij0Var = (ij0) this.d;
        fnb fnbVar = s13Var.d;
        fnbVar.getClass();
        z0a z0aVar = kk0Var.c;
        String str = ij0Var.a;
        String str2 = kk0Var.a;
        String strZ = n01.Z("SQLiteEventStore");
        if (Log.isLoggable(strZ, 3)) {
            Log.d(strZ, "Storing event with priority=" + z0aVar + ", name=" + str + " for destination " + str2);
        }
        ((Long) fnbVar.p(new mt(fnbVar, ij0Var, kk0Var, 9))).getClass();
        s13Var.a.I(kk0Var, 1, false);
        return null;
    }

    @Override // defpackage.r41
    public Object d(q41 q41Var) {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 7:
                ib2 ib2Var = (ib2) obj3;
                wb2 wb2Var = (wb2) obj2;
                b55 b55Var = (b55) obj;
                v0 v0Var = new v0(27, (va6) ib2Var.o0(cd7.g));
                af3 af3Var = af3.INSTANCE;
                dcb dcbVar = q41Var.c;
                if (dcbVar != null) {
                    dcbVar.a(v0Var, af3Var);
                }
                return vx0.c0(o7f.c(ib2Var), null, wb2Var, new mo5(b55Var, q41Var, (n92) null, 6), 1);
            default:
                Executor executor = (Executor) obj3;
                String str = (String) obj2;
                m45 m45Var = (m45) obj;
                AtomicBoolean atomicBoolean = new AtomicBoolean(false);
                e37 e37Var = new e37(atomicBoolean, 0);
                af3 af3Var2 = af3.INSTANCE;
                dcb dcbVar2 = q41Var.c;
                if (dcbVar2 != null) {
                    dcbVar2.a(e37Var, af3Var2);
                }
                executor.execute(new f37(atomicBoolean, q41Var, m45Var, 0));
                return str;
        }
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        wfd wfdVar = (wfd) this.b;
        AtomicBoolean atomicBoolean = (AtomicBoolean) this.c;
        zg7 zg7Var = (zg7) this.d;
        if (jrgVar.k()) {
            wfdVar.d(jrgVar.i());
        } else if (jrgVar.h() != null) {
            wfdVar.c(jrgVar.h());
        } else if (atomicBoolean.getAndSet(true)) {
            ((jrg) ((ujf) zg7Var.b).b).n(null);
        }
        return vp7.x(null);
    }

    @Override // defpackage.pi2, defpackage.oa6
    public void run() {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                nt ntVar = (nt) obj3;
                pt ptVarL = pt.L((UrlResponseInfo) obj2);
                ntVar.a.G(ntVar.b, ptVarL, (ByteBuffer) obj);
                break;
            case 1:
                nt ntVar2 = (nt) obj3;
                pt ptVarL2 = pt.L((UrlResponseInfo) obj2);
                ntVar2.a.H(ntVar2.b, ptVarL2, (String) obj);
                break;
            case 5:
                n0c n0cVar = (n0c) obj3;
                mq7 mq7Var = (mq7) obj2;
                ByteBuffer byteBuffer = (ByteBuffer) obj;
                na6 na6Var = (na6) n0cVar.e;
                if (na6Var.w.compareAndSet(5, 4)) {
                    ((mse) n0cVar.b).d.G(na6Var, mq7Var, byteBuffer);
                }
                break;
            default:
                n0c n0cVar2 = (n0c) obj3;
                mse mseVar = (mse) n0cVar2.b;
                na6 na6Var2 = (na6) n0cVar2.e;
                mseVar.d.H(na6Var2, (i7e) obj2, (String) obj);
                break;
        }
    }

    @Override // sprig.b.h.b
    public void shouldDismissOnPageChange(boolean z) {
        g.a((AtomicBoolean) this.b, (fhf) this.c, (x45) this.d, z);
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        FirebaseMessaging firebaseMessaging = (FirebaseMessaging) this.b;
        String str = (String) this.c;
        f33 f33Var = (f33) this.d;
        String str2 = (String) obj;
        dsc dscVarC = FirebaseMessaging.c(firebaseMessaging.b);
        String strD = firebaseMessaging.d();
        String strB = firebaseMessaging.h.b();
        synchronized (dscVarC) {
            String strB2 = f33.b(str2, strB, System.currentTimeMillis());
            if (strB2 != null) {
                SharedPreferences.Editor editorEdit = dscVarC.a.edit();
                editorEdit.putString(dsc.a(strD, str), strB2);
                editorEdit.commit();
            }
        }
        if (f33Var == null || !str2.equals((String) f33Var.b)) {
            xj4 xj4Var = firebaseMessaging.a;
            xj4Var.a();
            if ("[DEFAULT]".equals(xj4Var.b)) {
                if (Log.isLoggable("FirebaseMessaging", 3)) {
                    StringBuilder sb = new StringBuilder("Invoking onNewToken for app: ");
                    xj4Var.a();
                    sb.append(xj4Var.b);
                    Log.d("FirebaseMessaging", sb.toString());
                }
                Intent intent = new Intent("com.google.firebase.messaging.NEW_TOKEN");
                intent.putExtra("token", str2);
                new lig(firebaseMessaging.b, 1).k0(intent);
            }
        }
        return vp7.x(str2);
    }
}
