package androidx.work.impl.workers;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import defpackage.bgf;
import defpackage.m1;
import defpackage.n92;
import defpackage.vx0;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Landroidx/work/impl/workers/ConstraintTrackingWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "workerParameters", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "s62", "work-runtime_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ConstraintTrackingWorker extends CoroutineWorker {
    public final WorkerParameters c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConstraintTrackingWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        this.c = workerParameters;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.k37 r10, defpackage.ru r11, defpackage.c8f r12, defpackage.p92 r13) {
        /*
            r9 = this;
            boolean r0 = r13 instanceof defpackage.t62
            if (r0 == 0) goto L13
            r0 = r13
            t62 r0 = (defpackage.t62) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            t62 r0 = new t62
            r0.<init>(r9, r13)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r13 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.d
            r2 = 1
            if (r1 == 0) goto L2e
            if (r1 != r2) goto L27
            defpackage.br7.v(r9)
            goto L44
        L27:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            r9 = 0
            return r9
        L2e:
            defpackage.br7.v(r9)
            yu r3 = new yu
            r7 = 0
            r8 = 4
            r4 = r10
            r5 = r11
            r6 = r12
            r3.<init>(r4, r5, r6, r7, r8)
            r0.d = r2
            java.lang.Object r9 = defpackage.o7f.s(r3, r0)
            if (r9 != r13) goto L44
            return r13
        L44:
            r9.getClass()
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.work.impl.workers.ConstraintTrackingWorker.a(k37, ru, c8f, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x016c  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0196  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 448
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.work.impl.workers.ConstraintTrackingWorker.b(p92):java.lang.Object");
    }

    @Override // androidx.work.CoroutineWorker
    public final Object doWork(n92 n92Var) {
        Executor backgroundExecutor = getBackgroundExecutor();
        backgroundExecutor.getClass();
        return vx0.m0(bgf.y(backgroundExecutor), new m1(this, null, 6), n92Var);
    }
}
