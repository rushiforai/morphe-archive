package com.medium.android.domain.push.workers;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import defpackage.l07;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B%\b\u0007\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/medium/android/domain/push/workers/LinkPushNotificationWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "params", "Ll07;", "linkPushNotificationTokenUseCase", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;Ll07;)V", "domain_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LinkPushNotificationWorker extends CoroutineWorker {
    public final WorkerParameters c;
    public final l07 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LinkPushNotificationWorker(Context context, WorkerParameters workerParameters, l07 l07Var) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        l07Var.getClass();
        this.c = workerParameters;
        this.d = l07Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object doWork(defpackage.n92 r5) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.m07
            if (r0 == 0) goto L13
            r0 = r5
            m07 r0 = (defpackage.m07) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            m07 r0 = new m07
            p92 r5 = (defpackage.p92) r5
            r0.<init>(r4, r5)
        L1a:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L54
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r5)
            androidx.work.WorkerParameters r5 = r4.c
            dt2 r5 = r5.b
            java.lang.String r2 = "token"
            java.lang.String r5 = r5.a(r2)
            if (r5 != 0) goto L49
            g37 r4 = new g37
            r4.<init>()
            return r4
        L49:
            r0.d = r3
            l07 r4 = r4.d
            java.lang.Object r4 = r4.a(r5, r0)
            if (r4 != r1) goto L54
            return r1
        L54:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L61
            c1e r4 = (defpackage.c1e) r4
            i37 r4 = defpackage.j37.a()
            return r4
        L61:
            g37 r4 = new g37
            r4.<init>()
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.domain.push.workers.LinkPushNotificationWorker.doWork(n92):java.lang.Object");
    }
}
