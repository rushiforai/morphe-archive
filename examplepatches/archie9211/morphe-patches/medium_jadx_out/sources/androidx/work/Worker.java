package androidx.work;

import android.content.Context;
import defpackage.d37;
import defpackage.i37;
import defpackage.k37;
import defpackage.l2f;
import defpackage.lt;
import defpackage.o7f;
import defpackage.tkc;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b&\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/work/Worker;", "Lk37;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "workerParams", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "work-runtime_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
public abstract class Worker extends k37 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Worker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
    }

    public abstract i37 b();

    @Override // defpackage.k37
    public final d37 getForegroundInfoAsync() {
        Executor backgroundExecutor = getBackgroundExecutor();
        backgroundExecutor.getClass();
        return o7f.v(new lt(backgroundExecutor, 19, new tkc(21, this)));
    }

    @Override // defpackage.k37
    public final d37 startWork() {
        Executor backgroundExecutor = getBackgroundExecutor();
        backgroundExecutor.getClass();
        return o7f.v(new lt(backgroundExecutor, 19, new l2f(4, this)));
    }
}
