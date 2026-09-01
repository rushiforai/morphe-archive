package com.medium.android.donkey.push.gcm;

import android.app.Notification;
import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import com.medium.reader.R;
import defpackage.ak4;
import defpackage.ht2;
import defpackage.k05;
import defpackage.n92;
import defpackage.nq9;
import defpackage.nuc;
import defpackage.oqa;
import defpackage.rr7;
import defpackage.ti8;
import defpackage.tq7;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\u000eB7\b\u0007\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\b\u0001\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\r¨\u0006\u000f"}, d2 = {"Lcom/medium/android/donkey/push/gcm/MediumPushNotificationWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "params", "Lnq9;", "postTracker", "Loqa;", "pushNotificationTracker", "", "enableCrashlytics", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lnq9;Loqa;Z)V", "gr7", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediumPushNotificationWorker extends CoroutineWorker {
    public final Context c;
    public final WorkerParameters d;
    public final nq9 e;
    public final oqa f;
    public final boolean g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediumPushNotificationWorker(Context context, WorkerParameters workerParameters, nq9 nq9Var, oqa oqaVar, boolean z) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        nq9Var.getClass();
        oqaVar.getClass();
        this.c = context;
        this.d = workerParameters;
        this.e = nq9Var;
        this.f = oqaVar;
        this.g = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(com.medium.android.core.push.MediumPushNotification r8, defpackage.p92 r9) {
        /*
            Method dump skipped, instruction units count: 229
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.push.gcm.MediumPushNotificationWorker.a(com.medium.android.core.push.MediumPushNotification, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(com.medium.android.core.push.MediumPushNotification r70, defpackage.p92 r71) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 406
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.push.gcm.MediumPushNotificationWorker.b(com.medium.android.core.push.MediumPushNotification, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:57:0x0137, code lost:
    
        if (b(r2, r0) == r1) goto L58;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object doWork(defpackage.n92 r14) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.push.gcm.MediumPushNotificationWorker.doWork(n92):java.lang.Object");
    }

    @Override // androidx.work.CoroutineWorker
    public final Object getForegroundInfo(n92 n92Var) {
        if (this.g) {
            ak4 ak4VarA = ak4.a();
            WorkerParameters workerParameters = this.d;
            ak4VarA.b(nuc.C("\n                    |MediumPushNotificationWorker.getForegroundInfo called.\n                    | Worker id: " + workerParameters.a + ".\n                    | Run attempt count: " + workerParameters.e + ".\n                "));
        }
        String id = tq7.TODAYS_HIGHLIGHTS.getId();
        Context context = this.c;
        ti8 ti8Var = new ti8(context, id);
        rr7.D(ti8Var);
        ti8Var.o = ht2.p0(context);
        ti8Var.e = ti8.b(context.getString(R.string.notification_medium_push_notification_worker_title));
        Notification notificationA = ti8Var.a();
        notificationA.getClass();
        return new k05(R.id.medium_push_notification_worker_notification_id, notificationA, 0);
    }
}
