package com.medium.android.data.offline;

import android.app.Notification;
import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import com.medium.reader.R;
import defpackage.ht2;
import defpackage.jzb;
import defpackage.k05;
import defpackage.mp;
import defpackage.n92;
import defpackage.rq7;
import defpackage.rr7;
import defpackage.ti8;
import defpackage.tq7;
import defpackage.yo8;
import defpackage.zk2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\u000eB5\b\u0007\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\r¨\u0006\u000f"}, d2 = {"Lcom/medium/android/data/offline/DownloadCatalogWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "params", "Lyo8;", "offlineManager", "Lzk2;", "currentUserRepo", "Lrq7;", "mediumNotificationBuilder", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lyo8;Lzk2;Lrq7;)V", "jzb", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DownloadCatalogWorker extends CoroutineWorker {
    public static final jzb g = new jzb();
    public final Context c;
    public final yo8 d;
    public final zk2 e;
    public final rq7 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DownloadCatalogWorker(Context context, WorkerParameters workerParameters, yo8 yo8Var, zk2 zk2Var, rq7 rq7Var) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        yo8Var.getClass();
        zk2Var.getClass();
        rq7Var.getClass();
        this.c = context;
        this.d = yo8Var;
        this.e = zk2Var;
        this.f = rq7Var;
    }

    @Override // androidx.work.CoroutineWorker
    public final Object getForegroundInfo(n92 n92Var) {
        rq7 rq7Var = this.f;
        rq7Var.getClass();
        Context context = ((mp) rq7Var).a;
        ti8 ti8Var = new ti8(context, tq7.OFFLINE_READING.getId());
        rr7.D(ti8Var);
        ti8Var.o = ht2.p0(context);
        ti8Var.e = ti8.b(context.getString(R.string.notification_offline_reading_title));
        ti8Var.f = ti8.b(context.getString(R.string.notification_offline_reading_description));
        Notification notificationA = ti8Var.a();
        notificationA.getClass();
        return new k05(R.id.offline_service_notification_id, notificationA, 0);
    }

    /* JADX WARN: Code restructure failed: missing block: B:54:0x0100, code lost:
    
        if (r8.d(r0) != r1) goto L56;
     */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object doWork(defpackage.n92 r11) {
        /*
            Method dump skipped, instruction units count: 305
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.data.offline.DownloadCatalogWorker.doWork(n92):java.lang.Object");
    }
}
