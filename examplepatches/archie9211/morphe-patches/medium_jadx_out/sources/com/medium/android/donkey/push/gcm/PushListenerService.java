package com.medium.android.donkey.push.gcm;

import android.os.Build;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.medium.android.domain.push.workers.LinkPushNotificationWorker;
import com.medium.android.donkey.DonkeyApplication;
import defpackage.ak4;
import defpackage.b75;
import defpackage.bu1;
import defpackage.ct2;
import defpackage.dq1;
import defpackage.e72;
import defpackage.e87;
import defpackage.ei7;
import defpackage.f09;
import defpackage.fy3;
import defpackage.g76;
import defpackage.go2;
import defpackage.hy2;
import defpackage.i03;
import defpackage.k0c;
import defpackage.km4;
import defpackage.ko2;
import defpackage.le8;
import defpackage.m7f;
import defpackage.n1b;
import defpackage.ny3;
import defpackage.ppa;
import defpackage.te8;
import defpackage.tj2;
import defpackage.tm0;
import defpackage.vt8;
import defpackage.wld;
import defpackage.wt8;
import defpackage.zk2;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.concurrent.TimeUnit;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class PushListenerService extends FirebaseMessagingService implements b75 {
    public volatile k0c h;
    public dq1 k;
    public zk2 l;
    public boolean m;
    public hy2 o;
    public final Object i = new Object();
    public boolean j = false;
    public boolean n = true;

    @Override // defpackage.a75
    public final Object c() {
        if (this.h == null) {
            synchronized (this.i) {
                try {
                    if (this.h == null) {
                        this.h = new k0c(this);
                    }
                } finally {
                }
            }
        }
        return this.h.c();
    }

    /* JADX WARN: Removed duplicated region for block: B:86:0x01b3  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01e9  */
    @Override // com.google.firebase.messaging.FirebaseMessagingService
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(defpackage.t3b r22) {
        /*
            Method dump skipped, instruction units count: 570
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.push.gcm.PushListenerService.d(t3b):void");
    }

    @Override // com.google.firebase.messaging.FirebaseMessagingService
    public final void e(String str) {
        str.getClass();
        zk2 zk2Var = this.l;
        if (zk2Var == null) {
            g76.g0("currentUserRepo");
            throw null;
        }
        String strM = zk2Var.m();
        if (!tj2.a(strM)) {
            strM = null;
        }
        if (strM == null) {
            wld.a.m("Ignoring received new token for non-logged in user", new Object[0]);
            hy2 hy2Var = this.o;
            if (hy2Var == null) {
                g76.g0("datadogLogger");
                throw null;
            }
            LinkedHashMap linkedHashMapS = ei7.S(fy3.a, hy2Var.c());
            e87 e87Var = (e87) hy2Var.d.getValue();
            e87Var.getClass();
            e87.b(e87Var, 5, "Ignoring received new token for non-logged in user", null, linkedHashMapS);
            return;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        te8 te8Var = te8.CONNECTED;
        te8Var.getClass();
        e72 e72Var = new e72(new le8(null), te8Var, false, false, false, false, -1L, -1L, Build.VERSION.SDK_INT >= 24 ? bu1.q1(linkedHashSet) : ny3.a);
        vt8 vt8Var = new vt8(LinkPushNotificationWorker.class);
        vt8Var.c.j = e72Var;
        vt8 vt8Var2 = (vt8) vt8Var.d(tm0.EXPONENTIAL, TimeUnit.SECONDS);
        f09[] f09VarArr = {new f09("token", str)};
        ct2 ct2Var = new ct2(0, false);
        f09 f09Var = f09VarArr[0];
        ct2Var.d((String) f09Var.a, f09Var.b);
        vt8Var2.c.e = ct2Var.a();
        wt8 wt8Var = (wt8) vt8Var2.a();
        m7f m7fVarF = m7f.f(this);
        m7fVarF.getClass();
        m7fVarF.c(wt8Var);
    }

    public final void f() {
        if (!this.j) {
            this.j = true;
            go2 go2Var = (go2) ((ppa) c());
            i03 i03Var = i03.a;
            this.k = new dq1(22);
            ko2 ko2Var = go2Var.a;
            this.l = (zk2) ko2Var.r.get();
            this.m = true;
            this.o = (hy2) ko2Var.K.get();
        }
        super.onCreate();
    }

    @Override // android.app.Service
    public final void onCreate() {
        if (!(getApplicationContext() instanceof DonkeyApplication)) {
            wld.a.c(km4.y(n1b.a.b(PushListenerService.class).j(), AEVqIoD.qSxXNqGALvBLdA), new Object[0]);
            this.n = false;
            return;
        }
        f();
        String strY = km4.y(n1b.a.b(PushListenerService.class).j(), " onCreate");
        wld.a.j(strY, new Object[0]);
        if (this.m) {
            ak4.a().b(strY);
        }
    }
}
