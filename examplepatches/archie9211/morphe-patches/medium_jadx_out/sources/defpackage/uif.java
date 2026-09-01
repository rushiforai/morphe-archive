package defpackage;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.util.SparseIntArray;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.UnsupportedApiCallException;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uif implements ce5, de5 {
    public final wd5 f;
    public final gz g;
    public final pif h;
    public final int k;
    public final bjf l;
    public boolean m;
    public final /* synthetic */ ee5 q;
    public final LinkedList e = new LinkedList();
    public final HashSet i = new HashSet();
    public final HashMap j = new HashMap();
    public final ArrayList n = new ArrayList();
    public h42 o = null;
    public int p = 0;

    public uif(ee5 ee5Var, zd5 zd5Var) {
        this.q = ee5Var;
        Looper looper = ee5Var.m.getLooper();
        m50 m50VarA = zd5Var.a();
        uz5 uz5Var = new uz5((String) m50VarA.c, (String) m50VarA.d, (d80) m50VarA.b);
        wd5 wd5VarS = ((f49) zd5Var.d.b).s(zd5Var.a, looper, uz5Var, zd5Var.e, this, this);
        md5 md5Var = zd5Var.c;
        if (md5Var == null || !(wd5VarS instanceof mn0)) {
            String str = zd5Var.b;
            if (str != null && (wd5VarS instanceof mn0)) {
                wd5VarS.r = str;
            }
        } else {
            wd5VarS.s = md5Var;
        }
        this.f = wd5VarS;
        this.g = zd5Var.f;
        this.h = new pif();
        this.k = zd5Var.h;
        if (!wd5VarS.n()) {
            this.l = null;
            return;
        }
        Context context = ee5Var.e;
        tjf tjfVar = ee5Var.m;
        m50 m50VarA2 = zd5Var.a();
        this.l = new bjf(context, tjfVar, new uz5((String) m50VarA2.c, (String) m50VarA2.d, (d80) m50VarA2.b));
    }

    @Override // defpackage.de5
    public final void a(h42 h42Var) {
        n(h42Var, null);
    }

    public final void b() {
        ee5 ee5Var = this.q;
        vp7.m(ee5Var.m);
        this.o = null;
        l(h42.f);
        if (this.m) {
            tjf tjfVar = ee5Var.m;
            gz gzVar = this.g;
            tjfVar.removeMessages(11, gzVar);
            ee5Var.m.removeMessages(9, gzVar);
            this.m = false;
        }
        Iterator it2 = this.j.values().iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
        g();
        k();
    }

    @Override // defpackage.ce5
    public final void c(int i) {
        ee5 ee5Var = this.q;
        if (Looper.myLooper() == ee5Var.m.getLooper()) {
            e(i);
        } else {
            ee5Var.m.post(new u41(i, 2, this));
        }
    }

    @Override // defpackage.ce5
    public final void d() {
        ee5 ee5Var = this.q;
        if (Looper.myLooper() == ee5Var.m.getLooper()) {
            b();
        } else {
            ee5Var.m.post(new jn(19, this));
        }
    }

    public final void e(int i) {
        vp7.m(this.q.m);
        this.o = null;
        this.m = true;
        String str = this.f.a;
        pif pifVar = this.h;
        pifVar.getClass();
        StringBuilder sb = new StringBuilder("The connection to Google Play services was lost");
        if (i == 1) {
            sb.append(" due to service disconnection.");
        } else if (i == 3) {
            sb.append(" due to dead object exception.");
        }
        if (str != null) {
            sb.append(" Last reason for disconnect: ");
            sb.append(str);
        }
        pifVar.a(true, new Status(20, sb.toString(), null, null));
        gz gzVar = this.g;
        ee5 ee5Var = this.q;
        tjf tjfVar = ee5Var.m;
        tjfVar.sendMessageDelayed(Message.obtain(tjfVar, 9, gzVar), 5000L);
        tjf tjfVar2 = ee5Var.m;
        tjfVar2.sendMessageDelayed(Message.obtain(tjfVar2, 11, gzVar), 120000L);
        SparseIntArray sparseIntArray = (SparseIntArray) ee5Var.g.b;
        synchronized (sparseIntArray) {
            sparseIntArray.clear();
        }
        Iterator it2 = this.j.values().iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
    }

    public final boolean f(h42 h42Var) {
        synchronized (ee5.q) {
            this.q.getClass();
        }
        return false;
    }

    public final void g() {
        LinkedList linkedList = this.e;
        ArrayList arrayList = new ArrayList(linkedList);
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            njf njfVar = (njf) arrayList.get(i);
            if (!this.f.l()) {
                return;
            }
            if (h(njfVar)) {
                linkedList.remove(njfVar);
            }
        }
    }

    public final boolean h(njf njfVar) {
        if (!(njfVar instanceof yif)) {
            pif pifVar = this.h;
            wd5 wd5Var = this.f;
            njfVar.c(pifVar, wd5Var.n());
            try {
                njfVar.d(this);
                return true;
            } catch (DeadObjectException unused) {
                c(1);
                wd5Var.c("DeadObjectException thrown while running ApiCallRunner.");
                return true;
            }
        }
        yif yifVar = (yif) njfVar;
        da4[] da4VarArrF = yifVar.f(this);
        da4 da4Var = null;
        if (da4VarArrF != null && da4VarArrF.length != 0) {
            fag fagVar = this.f.v;
            da4[] da4VarArr = fagVar == null ? null : fagVar.b;
            if (da4VarArr == null) {
                da4VarArr = new da4[0];
            }
            y70 y70Var = new y70(da4VarArr.length);
            for (da4 da4Var2 : da4VarArr) {
                y70Var.put(da4Var2.a, Long.valueOf(da4Var2.d()));
            }
            for (da4 da4Var3 : da4VarArrF) {
                Long l = (Long) y70Var.get(da4Var3.a);
                if (l == null || l.longValue() < da4Var3.d()) {
                    da4Var = da4Var3;
                    break;
                }
            }
        }
        if (da4Var == null) {
            pif pifVar2 = this.h;
            wd5 wd5Var2 = this.f;
            njfVar.c(pifVar2, wd5Var2.n());
            try {
                njfVar.d(this);
                return true;
            } catch (DeadObjectException unused2) {
                c(1);
                wd5Var2.c("DeadObjectException thrown while running ApiCallRunner.");
                return true;
            }
        }
        String name = this.f.getClass().getName();
        String str = da4Var.a;
        long jD = da4Var.d();
        StringBuilder sb = new StringBuilder(name.length() + 53 + String.valueOf(str).length() + 2 + String.valueOf(jD).length() + 2);
        ka1.C(sb, name, " could not execute call because it requires feature (", str, ", ");
        sb.append(jD);
        sb.append(").");
        Log.w("GoogleApiManager", sb.toString());
        ee5 ee5Var = this.q;
        if (!ee5Var.n || !yifVar.g(this)) {
            yifVar.b(new UnsupportedApiCallException(da4Var));
            return true;
        }
        int iH = yifVar.h(this);
        vif vifVar = new vif(this.g, da4Var);
        ArrayList arrayList = this.n;
        int iIndexOf = arrayList.indexOf(vifVar);
        if (iIndexOf >= 0) {
            vif vifVar2 = (vif) arrayList.get(iIndexOf);
            ee5Var.m.removeMessages(15, vifVar2);
            ee5Var.m.sendMessageDelayed(Message.obtain(ee5Var.m, 15, vifVar2), 5000L);
            return false;
        }
        arrayList.add(vifVar);
        ee5Var.m.sendMessageDelayed(Message.obtain(ee5Var.m, 15, vifVar), 5000L);
        ee5Var.m.sendMessageDelayed(Message.obtain(ee5Var.m, 16, vifVar), 120000L);
        h42 h42Var = new h42(1, 2, null, null, Integer.valueOf(iH));
        if (f(h42Var)) {
            String str2 = da4Var.a;
            long jD2 = da4Var.d();
            StringBuilder sb2 = new StringBuilder(String.valueOf(str2).length() + 61 + String.valueOf(jD2).length());
            sb2.append("A dialog should be displayed for missing feature: ");
            sb2.append(str2);
            sb2.append(", version: ");
            sb2.append(jD2);
            Log.w("GoogleApiManager", sb2.toString());
            return false;
        }
        if (ee5Var.f(h42Var, this.k)) {
            String str3 = da4Var.a;
            long jD3 = da4Var.d();
            StringBuilder sb3 = new StringBuilder(String.valueOf(str3).length() + 55 + String.valueOf(jD3).length());
            sb3.append("Notification displayed for missing feature: ");
            sb3.append(str3);
            sb3.append(", version: ");
            sb3.append(jD3);
            Log.w("GoogleApiManager", sb3.toString());
        }
        return false;
    }

    public final void i(Status status, Exception exc, boolean z) {
        vp7.m(this.q.m);
        if ((status == null) == (exc == null)) {
            ay0.e("Status XOR exception should be null");
            return;
        }
        Iterator it2 = this.e.iterator();
        while (it2.hasNext()) {
            njf njfVar = (njf) it2.next();
            if (!z || njfVar.a == 2) {
                if (status != null) {
                    njfVar.a(status);
                } else {
                    njfVar.b(exc);
                }
                it2.remove();
            }
        }
    }

    public final void j(Status status) {
        vp7.m(this.q.m);
        i(status, null, false);
    }

    public final void k() {
        ee5 ee5Var = this.q;
        tjf tjfVar = ee5Var.m;
        gz gzVar = this.g;
        tjfVar.removeMessages(12, gzVar);
        tjf tjfVar2 = ee5Var.m;
        tjfVar2.sendMessageDelayed(tjfVar2.obtainMessage(12, gzVar), ee5Var.a);
    }

    public final void l(h42 h42Var) {
        HashSet hashSet = this.i;
        Iterator it2 = hashSet.iterator();
        if (!it2.hasNext()) {
            hashSet.clear();
            return;
        }
        if (it2.next() != null) {
            rd6.m();
            return;
        }
        if (en7.u(h42Var, h42.f)) {
            wd5 wd5Var = this.f;
            if (!wd5Var.l() || wd5Var.b == null) {
                ygf.i("Failed to connect when checking package");
                return;
            }
        }
        throw null;
    }

    public final void m(h42 h42Var) {
        vp7.m(this.q.m);
        wd5 wd5Var = this.f;
        String name = wd5Var.getClass().getName();
        String strValueOf = String.valueOf(h42Var);
        wd5 wd5Var2 = wd5Var;
        wd5Var2.c(km4.C(new StringBuilder(name.length() + 25 + strValueOf.length()), "onSignInFailed for ", name, " with ", strValueOf));
        n(h42Var, null);
    }

    public final void n(h42 h42Var, RuntimeException runtimeException) {
        t9c t9cVar;
        ee5 ee5Var = this.q;
        vp7.m(ee5Var.m);
        bjf bjfVar = this.l;
        if (bjfVar != null && (t9cVar = bjfVar.k) != null) {
            t9cVar.b();
        }
        vp7.m(this.q.m);
        this.o = null;
        SparseIntArray sparseIntArray = (SparseIntArray) ee5Var.g.b;
        synchronized (sparseIntArray) {
            sparseIntArray.clear();
        }
        l(h42Var);
        if ((this.f instanceof wjf) && h42Var.b != 24) {
            ee5Var.b = true;
            tjf tjfVar = ee5Var.m;
            tjfVar.sendMessageDelayed(tjfVar.obtainMessage(19), 300000L);
        }
        int i = h42Var.b;
        if (i == 4) {
            j(ee5.p);
            return;
        }
        if (i == 25) {
            j(ee5.c(this.g, h42Var));
            return;
        }
        LinkedList linkedList = this.e;
        if (linkedList.isEmpty()) {
            this.o = h42Var;
            return;
        }
        if (runtimeException != null) {
            vp7.m(ee5Var.m);
            i(null, runtimeException, false);
            return;
        }
        boolean z = ee5Var.n;
        gz gzVar = this.g;
        if (!z) {
            j(ee5.c(gzVar, h42Var));
            return;
        }
        i(ee5.c(gzVar, h42Var), null, true);
        if (linkedList.isEmpty() || f(h42Var) || ee5Var.f(h42Var, this.k)) {
            return;
        }
        if (h42Var.b == 18) {
            this.m = true;
        }
        if (!this.m) {
            j(ee5.c(gzVar, h42Var));
        } else {
            tjf tjfVar2 = ee5Var.m;
            tjfVar2.sendMessageDelayed(Message.obtain(tjfVar2, 9, gzVar), 5000L);
        }
    }

    public final void o(njf njfVar) {
        vp7.m(this.q.m);
        boolean zL = this.f.l();
        LinkedList linkedList = this.e;
        if (zL) {
            if (h(njfVar)) {
                k();
                return;
            } else {
                linkedList.add(njfVar);
                return;
            }
        }
        linkedList.add(njfVar);
        h42 h42Var = this.o;
        if (h42Var == null || h42Var.b == 0 || h42Var.c == null) {
            q();
        } else {
            n(h42Var, null);
        }
    }

    public final void p() {
        ee5 ee5Var = this.q;
        vp7.m(ee5Var.m);
        Status status = ee5.o;
        j(status);
        this.h.a(false, status);
        for (l37 l37Var : (l37[]) this.j.keySet().toArray(new l37[0])) {
            o(new ljf(new wfd()));
        }
        l(new h42(4, null, null));
        if (this.f.l()) {
            ee5Var.m.post(new jn(20, new qlb(this)));
        }
    }

    public final void q() {
        ee5 ee5Var = this.q;
        vp7.m(ee5Var.m);
        wd5 wd5Var = this.f;
        if (wd5Var.l()) {
            return;
        }
        wd5 wd5Var2 = wd5Var;
        if (wd5Var2.m()) {
            return;
        }
        try {
            int iJ = ee5Var.g.j(ee5Var.e, wd5Var);
            if (iJ != 0) {
                h42 h42Var = new h42(iJ, null, null);
                String name = wd5Var.getClass().getName();
                String string = h42Var.toString();
                StringBuilder sb = new StringBuilder(name.length() + 35 + string.length());
                sb.append("The service for ");
                sb.append(name);
                sb.append(" is not available: ");
                sb.append(string);
                Log.w("GoogleApiManager", sb.toString());
                n(h42Var, null);
                return;
            }
            ft2 ft2Var = new ft2();
            Objects.requireNonNull(ee5Var);
            ft2Var.f = ee5Var;
            ft2Var.d = null;
            ft2Var.e = null;
            ft2Var.a = false;
            ft2Var.c = wd5Var;
            ft2Var.b = this.g;
            if (wd5Var.n()) {
                bjf bjfVar = this.l;
                vp7.p(bjfVar);
                t9c t9cVar = bjfVar.k;
                if (t9cVar != null) {
                    t9cVar.b();
                }
                uz5 uz5Var = bjfVar.j;
                uz5Var.f = Integer.valueOf(System.identityHashCode(bjfVar));
                z56 z56Var = bjfVar.h;
                Context context = bjfVar.f;
                Handler handler = bjfVar.g;
                bjfVar.k = (t9c) z56Var.s(context, handler.getLooper(), uz5Var, (x9c) uz5Var.e, bjfVar, bjfVar);
                bjfVar.l = ft2Var;
                Set set = bjfVar.i;
                if (set == null || set.isEmpty()) {
                    handler.post(new jn(bjfVar));
                } else {
                    t9c t9cVar2 = bjfVar.k;
                    t9cVar2.getClass();
                    t9cVar2.i = new olb(t9cVar2);
                    t9cVar2.r(2, null);
                }
            }
            try {
                wd5Var2.i = ft2Var;
                wd5Var2.r(2, null);
            } catch (SecurityException e) {
                n(new h42(10, null, null), e);
            }
        } catch (IllegalStateException e2) {
            n(new h42(10, null, null), e2);
        }
    }
}
