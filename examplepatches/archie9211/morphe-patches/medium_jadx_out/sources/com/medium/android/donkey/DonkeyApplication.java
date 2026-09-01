package com.medium.android.donkey;

import android.app.NotificationChannel;
import android.app.NotificationChannelGroup;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import com.drew.imaging.tiff.DJ.QntrFMZg;
import defpackage.cr0;
import defpackage.cu1;
import defpackage.dm4;
import defpackage.f8a;
import defpackage.g04;
import defpackage.g76;
import defpackage.gx5;
import defpackage.im5;
import defpackage.km4;
import defpackage.l2c;
import defpackage.n32;
import defpackage.p32;
import defpackage.pz2;
import defpackage.rm5;
import defpackage.sb2;
import defpackage.tq7;
import defpackage.vq7;
import defpackage.wld;
import defpackage.xec;
import defpackage.xx2;
import defpackage.zk2;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class DonkeyApplication extends rm5 implements p32, xec {
    public static final /* synthetic */ int m = 0;
    public n32 c;
    public im5 d;
    public pz2 e;
    public zk2 f;
    public l2c g;
    public cr0 h;
    public dm4 i;
    public f8a j;
    public boolean k;
    public sb2 l;

    @Override // defpackage.xec
    public final gx5 a(Context context) {
        context.getClass();
        f8a f8aVar = this.j;
        if (f8aVar == null) {
            g76.g0("imageLoaderProvider");
            throw null;
        }
        Object obj = f8aVar.get();
        obj.getClass();
        return (gx5) obj;
    }

    public final void b() {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }
        Object systemService = getSystemService("notification");
        systemService.getClass();
        NotificationManager notificationManager = (NotificationManager) systemService;
        tq7.Companion.getClass();
        Iterator it2 = tq7.f.iterator();
        while (it2.hasNext()) {
            notificationManager.deleteNotificationChannel((String) it2.next());
        }
        tq7.Companion.getClass();
        g04<tq7> entries = tq7.getEntries();
        ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
        for (tq7 tq7Var : entries) {
            tq7Var.getClass();
            NotificationChannel notificationChannel = new NotificationChannel(tq7Var.getId(), getString(tq7Var.getNameResId()), tq7Var.getImportance());
            if (tq7Var.getDescriptionResId() != null) {
                notificationChannel.setDescription(getString(tq7Var.getDescriptionResId().intValue()));
            }
            if (tq7Var.getMediumNotificationGroup() != null) {
                notificationChannel.setGroup(tq7Var.getMediumNotificationGroup().getId());
            }
            arrayList.add(notificationChannel);
        }
        notificationManager.createNotificationChannels(arrayList);
    }

    public final void d() {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }
        Object systemService = getSystemService("notification");
        systemService.getClass();
        NotificationManager notificationManager = (NotificationManager) systemService;
        try {
            vq7.Companion.getClass();
            Iterator it2 = vq7.c.iterator();
            while (it2.hasNext()) {
                notificationManager.deleteNotificationChannelGroup((String) it2.next());
            }
        } catch (NullPointerException unused) {
        }
        g04<vq7> entries = vq7.getEntries();
        ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
        for (vq7 vq7Var : entries) {
            vq7Var.getClass();
            arrayList.add(new NotificationChannelGroup(vq7Var.getId(), getString(vq7Var.getNameResId())));
        }
        notificationManager.createNotificationChannelGroups(arrayList);
    }

    @Override // defpackage.rm5, android.app.Application
    public final void onCreate() throws IllegalAccessException, InvocationTargetException {
        QntrFMZg.UBox.invoke(null, this);
    }

    @Override // android.app.Application
    public final void onTerminate() {
        cr0 cr0Var = this.h;
        if (cr0Var == null) {
            g76.g0("billingManager");
            throw null;
        }
        xx2 xx2Var = (xx2) cr0Var;
        km4.I(wld.a, null, "Destroy", new Object[0], "Destroy");
        if (xx2Var.c().isReady()) {
            xx2Var.c().endConnection();
        }
        super.onTerminate();
    }
}
