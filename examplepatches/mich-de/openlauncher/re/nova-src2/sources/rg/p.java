package rg;

import ai.y0;
import android.content.Context;
import android.os.DeadObjectException;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.UnsupportedApiCallException;
import com.google.android.gms.internal.measurement.z6;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import o7.g0;

/* loaded from: classes.dex */
public final class p implements qg.g, qg.h {

    /* renamed from: b, reason: collision with root package name */
    public final qg.c f85904b;

    /* renamed from: c, reason: collision with root package name */
    public final a f85905c;

    /* renamed from: d, reason: collision with root package name */
    public final og.i f85906d;

    /* renamed from: g, reason: collision with root package name */
    public final int f85909g;

    /* renamed from: h, reason: collision with root package name */
    public final x f85910h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f85911i;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ e f85915m;

    /* renamed from: a, reason: collision with root package name */
    public final LinkedList f85903a = new LinkedList();

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f85907e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public final HashMap f85908f = new HashMap();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f85912j = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    public ConnectionResult f85913k = null;

    /* renamed from: l, reason: collision with root package name */
    public int f85914l = 0;

    /* JADX WARN: Multi-variable type inference failed */
    public p(e eVar, qg.f fVar) {
        this.f85915m = eVar;
        z6 z6Var = eVar.n;
        Looper looper = z6Var.getLooper();
        x7.u uVarA = fVar.a();
        bm.t tVar = new bm.t((String) uVarA.f95209b, (String) uVarA.f95210c, (z.f) uVarA.f95208a);
        ul.b bVar = (ul.b) fVar.f84055d.f691b;
        sg.w.h(bVar);
        qg.c cVarN = bVar.n(fVar.f84052a, looper, tVar, fVar.f84056e, this, this);
        y90.f fVar2 = fVar.f84054c;
        if (fVar2 == null || !(cVarN instanceof sg.e)) {
            String str = fVar.f84053b;
            if (str != null && (cVarN instanceof sg.e)) {
                ((sg.e) cVarN).setAttributionTag(str);
            }
        } else {
            ((sg.e) cVarN).setAttributionSourceWrapper(fVar2);
        }
        this.f85904b = cVarN;
        this.f85905c = fVar.f84057f;
        this.f85906d = new og.i(7, (byte) 0);
        this.f85909g = fVar.f84059h;
        if (!cVarN.requiresSignIn()) {
            this.f85910h = null;
            return;
        }
        Context context = eVar.f85878e;
        x7.u uVarA2 = fVar.a();
        this.f85910h = new x(context, z6Var, new bm.t((String) uVarA2.f95209b, (String) uVarA2.f95210c, (z.f) uVarA2.f95208a));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a() {
        qg.c cVar = this.f85904b;
        e eVar = this.f85915m;
        sg.w.d(eVar.n);
        this.f85913k = null;
        i(ConnectionResult.f31777k);
        if (this.f85911i) {
            z6 z6Var = eVar.n;
            a aVar = this.f85905c;
            z6Var.removeMessages(11, aVar);
            eVar.n.removeMessages(9, aVar);
            this.f85911i = false;
        }
        Iterator it = this.f85908f.values().iterator();
        while (it.hasNext()) {
            y0 y0Var = ((w) it.next()).f85931a;
            if (j(y0Var.u()) != null) {
                it.remove();
            } else {
                try {
                    y0Var.P(cVar, new fi.j());
                } catch (DeadObjectException unused) {
                    onConnectionSuspended(3);
                    ((sg.e) cVar).disconnect("DeadObjectException thrown while calling register listener method.");
                } catch (RemoteException e3) {
                    e = e3;
                    Log.e("GoogleApiManager", "Failed to register listener on re-connection.", e);
                    it.remove();
                } catch (RuntimeException e11) {
                    e = e11;
                    Log.e("GoogleApiManager", "Failed to register listener on re-connection.", e);
                    it.remove();
                }
            }
        }
        d();
        h();
    }

    public final void b(int i5) {
        e eVar = this.f85915m;
        sg.w.d(eVar.n);
        this.f85913k = null;
        this.f85911i = true;
        this.f85906d.w(i5, ((sg.e) this.f85904b).getLastDisconnectMessage());
        z6 z6Var = eVar.n;
        a aVar = this.f85905c;
        z6Var.sendMessageDelayed(Message.obtain(z6Var, 9, aVar), 5000L);
        z6 z6Var2 = eVar.n;
        z6Var2.sendMessageDelayed(Message.obtain(z6Var2, 11, aVar), 120000L);
        eVar.f85880g.v();
        Iterator it = this.f85908f.values().iterator();
        while (it.hasNext()) {
            ((w) it.next()).getClass();
        }
    }

    public final boolean c(ConnectionResult connectionResult) {
        synchronized (e.f85872r) {
            try {
                e eVar = this.f85915m;
                if (eVar.f85884k == null || !eVar.f85885l.contains(this.f85905c)) {
                    return false;
                }
                eVar.f85884k.g(connectionResult, this.f85909g);
                eVar.f85879f.h(eVar.f85878e, connectionResult, true);
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void d() {
        LinkedList linkedList = this.f85903a;
        ArrayList arrayList = new ArrayList(linkedList);
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            c0 c0Var = (c0) arrayList.get(i5);
            if (!((sg.e) this.f85904b).isConnected()) {
                return;
            }
            if (e(c0Var)) {
                linkedList.remove(c0Var);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean e(c0 c0Var) {
        if (!(c0Var instanceof u)) {
            og.i iVar = this.f85906d;
            qg.c cVar = this.f85904b;
            c0Var.c(iVar, cVar.requiresSignIn());
            try {
                c0Var.d(this);
                return true;
            } catch (DeadObjectException unused) {
                onConnectionSuspended(1);
                ((sg.e) cVar).disconnect("DeadObjectException thrown while running ApiCallRunner.");
                return true;
            }
        }
        u uVar = (u) c0Var;
        Feature featureJ = j(uVar.f(this));
        if (featureJ == null) {
            og.i iVar2 = this.f85906d;
            qg.c cVar2 = this.f85904b;
            c0Var.c(iVar2, cVar2.requiresSignIn());
            try {
                c0Var.d(this);
                return true;
            } catch (DeadObjectException unused2) {
                onConnectionSuspended(1);
                ((sg.e) cVar2).disconnect("DeadObjectException thrown while running ApiCallRunner.");
                return true;
            }
        }
        String name = this.f85904b.getClass().getName();
        String str = featureJ.f31786f;
        long jD = featureJ.d();
        int length = name.length();
        StringBuilder sb2 = new StringBuilder(length + 53 + String.valueOf(str).length() + 2 + String.valueOf(jD).length() + 2);
        b.c0.D(sb2, name, " could not execute call because it requires feature (", str, ", ");
        sb2.append(jD);
        sb2.append(").");
        Log.w("GoogleApiManager", sb2.toString());
        e eVar = this.f85915m;
        if (!eVar.o || !uVar.g(this)) {
            uVar.b(new UnsupportedApiCallException(featureJ));
            return true;
        }
        int iH = uVar.h(this);
        q qVar = new q(this.f85905c, featureJ);
        ArrayList arrayList = this.f85912j;
        int iIndexOf = arrayList.indexOf(qVar);
        if (iIndexOf >= 0) {
            q qVar2 = (q) arrayList.get(iIndexOf);
            eVar.n.removeMessages(15, qVar2);
            eVar.n.sendMessageDelayed(Message.obtain(eVar.n, 15, qVar2), 5000L);
            return false;
        }
        arrayList.add(qVar);
        eVar.n.sendMessageDelayed(Message.obtain(eVar.n, 15, qVar), 5000L);
        eVar.n.sendMessageDelayed(Message.obtain(eVar.n, 16, qVar), 120000L);
        ConnectionResult connectionResult = new ConnectionResult(1, 2, null, null, Integer.valueOf(iH));
        if (c(connectionResult)) {
            String str2 = featureJ.f31786f;
            long jD2 = featureJ.d();
            StringBuilder sb3 = new StringBuilder(String.valueOf(str2).length() + 61 + String.valueOf(jD2).length());
            b.c0.C(sb3, "A dialog should be displayed for missing feature: ", str2, ", version: ");
            sb3.append(jD2);
            Log.w("GoogleApiManager", sb3.toString());
            return false;
        }
        if (!eVar.g(connectionResult, this.f85909g)) {
            return false;
        }
        String str3 = featureJ.f31786f;
        long jD3 = featureJ.d();
        StringBuilder sb4 = new StringBuilder(String.valueOf(str3).length() + 55 + String.valueOf(jD3).length());
        b.c0.C(sb4, "Notification displayed for missing feature: ", str3, ", version: ");
        sb4.append(jD3);
        Log.w("GoogleApiManager", sb4.toString());
        return false;
    }

    public final void f(Status status, Exception exc, boolean z11) {
        sg.w.d(this.f85915m.n);
        if ((status == null) == (exc == null)) {
            throw new IllegalArgumentException("Status XOR exception should be null");
        }
        Iterator it = this.f85903a.iterator();
        while (it.hasNext()) {
            c0 c0Var = (c0) it.next();
            if (!z11 || c0Var.f85867a == 2) {
                if (status != null) {
                    c0Var.a(status);
                } else {
                    c0Var.b(exc);
                }
                it.remove();
            }
        }
    }

    public final void g(Status status) {
        sg.w.d(this.f85915m.n);
        f(status, null, false);
    }

    public final void h() {
        e eVar = this.f85915m;
        z6 z6Var = eVar.n;
        a aVar = this.f85905c;
        z6Var.removeMessages(12, aVar);
        z6 z6Var2 = eVar.n;
        z6Var2.sendMessageDelayed(z6Var2.obtainMessage(12, aVar), eVar.f85874a);
    }

    public final void i(ConnectionResult connectionResult) {
        HashSet hashSet = this.f85907e;
        Iterator it = hashSet.iterator();
        if (!it.hasNext()) {
            hashSet.clear();
            return;
        }
        b.c0.y(it.next());
        if (sg.w.k(connectionResult, ConnectionResult.f31777k)) {
            ((sg.e) this.f85904b).getEndpointPackageName();
        }
        throw null;
    }

    public final Feature j(Feature[] featureArr) {
        if (featureArr != null && featureArr.length != 0) {
            Feature[] availableFeatures = ((sg.e) this.f85904b).getAvailableFeatures();
            if (availableFeatures == null) {
                availableFeatures = new Feature[0];
            }
            z.e eVar = new z.e(availableFeatures.length);
            for (Feature feature : availableFeatures) {
                eVar.put(feature.f31786f, Long.valueOf(feature.d()));
            }
            for (Feature feature2 : featureArr) {
                Long l9 = (Long) eVar.get(feature2.f31786f);
                if (l9 == null || l9.longValue() < feature2.d()) {
                    return feature2;
                }
            }
        }
        return null;
    }

    public final void k(ConnectionResult connectionResult) {
        sg.w.d(this.f85915m.n);
        Object obj = this.f85904b;
        String name = obj.getClass().getName();
        String strValueOf = String.valueOf(connectionResult);
        sg.e eVar = (sg.e) obj;
        eVar.disconnect(b.c0.s(new StringBuilder(name.length() + 25 + strValueOf.length()), "onSignInFailed for ", name, " with ", strValueOf));
        l(connectionResult, null);
    }

    public final void l(ConnectionResult connectionResult, RuntimeException runtimeException) {
        e eVar = this.f85915m;
        sg.w.d(eVar.n);
        x xVar = this.f85910h;
        if (xVar != null) {
            xVar.Z();
        }
        sg.w.d(this.f85915m.n);
        this.f85913k = null;
        eVar.f85880g.v();
        i(connectionResult);
        if ((this.f85904b instanceof ug.e) && connectionResult.f31779g != 24) {
            eVar.f85875b = true;
            z6 z6Var = eVar.n;
            z6Var.sendMessageDelayed(z6Var.obtainMessage(19), 300000L);
        }
        int i5 = connectionResult.f31779g;
        if (i5 == 4) {
            g(e.f85871q);
            return;
        }
        if (i5 == 25) {
            g(e.c(this.f85905c, connectionResult));
            return;
        }
        LinkedList linkedList = this.f85903a;
        if (linkedList.isEmpty()) {
            this.f85913k = connectionResult;
            return;
        }
        if (runtimeException != null) {
            sg.w.d(eVar.n);
            f(null, runtimeException, false);
            return;
        }
        if (!eVar.o) {
            g(e.c(this.f85905c, connectionResult));
            return;
        }
        a aVar = this.f85905c;
        f(e.c(aVar, connectionResult), null, true);
        if (linkedList.isEmpty() || c(connectionResult) || eVar.g(connectionResult, this.f85909g)) {
            return;
        }
        if (connectionResult.f31779g == 18) {
            this.f85911i = true;
        }
        if (!this.f85911i) {
            g(e.c(aVar, connectionResult));
        } else {
            z6 z6Var2 = eVar.n;
            z6Var2.sendMessageDelayed(Message.obtain(z6Var2, 9, aVar), 5000L);
        }
    }

    public final void m(c0 c0Var) {
        sg.w.d(this.f85915m.n);
        boolean zIsConnected = ((sg.e) this.f85904b).isConnected();
        LinkedList linkedList = this.f85903a;
        if (zIsConnected) {
            if (e(c0Var)) {
                h();
                return;
            } else {
                linkedList.add(c0Var);
                return;
            }
        }
        linkedList.add(c0Var);
        ConnectionResult connectionResult = this.f85913k;
        if (connectionResult == null || connectionResult.f31779g == 0 || connectionResult.f31780h == null) {
            o();
        } else {
            l(connectionResult, null);
        }
    }

    public final void n() {
        sg.w.d(this.f85915m.n);
        g(e.f85870p);
        this.f85906d.v();
        for (i iVar : (i[]) this.f85908f.keySet().toArray(new i[0])) {
            m(new a0(iVar, new fi.j()));
        }
        i(new ConnectionResult(4, null, null));
        if (((sg.e) this.f85904b).isConnected()) {
            new q.c(this, 17).y();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void o() {
        e eVar = this.f85915m;
        sg.w.d(eVar.n);
        qg.c cVar = this.f85904b;
        sg.e eVar2 = (sg.e) cVar;
        if (eVar2.isConnected() || eVar2.isConnecting()) {
            return;
        }
        try {
            int iR = eVar.f85880g.r(eVar.f85878e, cVar);
            if (iR == 0) {
                ox.q qVar = new ox.q(eVar, cVar, this.f85905c);
                if (cVar.requiresSignIn()) {
                    x xVar = this.f85910h;
                    sg.w.h(xVar);
                    xVar.Y(qVar);
                }
                try {
                    eVar2.connect(qVar);
                    return;
                } catch (SecurityException e3) {
                    l(new ConnectionResult(10, null, null), e3);
                    return;
                }
            }
            ConnectionResult connectionResult = new ConnectionResult(iR, null, null);
            String name = cVar.getClass().getName();
            String string = connectionResult.toString();
            StringBuilder sb2 = new StringBuilder(name.length() + 35 + string.length());
            sb2.append("The service for ");
            sb2.append(name);
            sb2.append(" is not available: ");
            sb2.append(string);
            Log.w("GoogleApiManager", sb2.toString());
            l(connectionResult, null);
        } catch (IllegalStateException e11) {
            l(new ConnectionResult(10, null, null), e11);
        }
    }

    @Override // qg.g
    public final void onConnected() {
        e eVar = this.f85915m;
        if (Looper.myLooper() == eVar.n.getLooper()) {
            a();
        } else {
            eVar.n.post(new g0(this, 14));
        }
    }

    @Override // qg.h
    public final void onConnectionFailed(ConnectionResult connectionResult) {
        l(connectionResult, null);
    }

    @Override // qg.g
    public final void onConnectionSuspended(int i5) {
        e eVar = this.f85915m;
        if (Looper.myLooper() == eVar.n.getLooper()) {
            b(i5);
        } else {
            eVar.n.post(new com.google.android.material.datepicker.g(this, i5, 3));
        }
    }
}
