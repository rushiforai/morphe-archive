package defpackage;

import android.app.Application;
import com.medium.android.donkey.DonkeyApplication;
import com.pairip.StartupLauncher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class rm5 extends Application implements b75 {
    public boolean a = false;
    public final u60 b = new u60(new rz2(19, this));

    static {
        StartupLauncher.launch();
    }

    @Override // defpackage.a75
    public final Object c() {
        return this.b.c();
    }

    @Override // android.app.Application
    public void onCreate() {
        if (!this.a) {
            this.a = true;
            DonkeyApplication donkeyApplication = (DonkeyApplication) this;
            ko2 ko2Var = (ko2) ((ti3) this.b.c());
            donkeyApplication.c = (n32) ko2Var.q.get();
            ct2 ct2Var = new ct2(3);
            ct2Var.c("com.medium.android.data.offline.DownloadCatalogWorker", ko2Var.y);
            ct2Var.c("com.medium.android.domain.push.workers.LinkPushNotificationWorker", ko2Var.A);
            ct2Var.c("com.medium.android.donkey.push.gcm.MediumPushNotificationWorker", ko2Var.D);
            donkeyApplication.d = new im5(ct2Var.b());
            donkeyApplication.e = (pz2) ko2Var.H.get();
            donkeyApplication.f = (zk2) ko2Var.r.get();
            donkeyApplication.g = ko2Var.u();
            donkeyApplication.h = (cr0) ko2Var.I.get();
            donkeyApplication.i = (dm4) ko2Var.j.get();
            donkeyApplication.j = ko2Var.x;
            donkeyApplication.k = true;
            donkeyApplication.l = (sb2) ko2Var.d.get();
        }
        super.onCreate();
    }
}
