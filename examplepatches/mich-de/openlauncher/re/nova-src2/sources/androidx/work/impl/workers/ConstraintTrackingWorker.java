package androidx.work.impl.workers;

import aa.x;
import android.content.Context;
import android.os.Build;
import androidx.work.WorkerParameters;
import b8.a;
import com.google.common.util.concurrent.ListenableFuture;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o7.q;
import o7.r;
import org.jetbrains.annotations.NotNull;
import t7.c;
import t7.d;
import t7.f;
import z7.j;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Landroidx/work/impl/workers/ConstraintTrackingWorker;", "Lo7/q;", "Lt7/f;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "workerParameters", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class ConstraintTrackingWorker extends q implements f {

    /* renamed from: f, reason: collision with root package name */
    public final WorkerParameters f15352f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f15353g;

    /* renamed from: h, reason: collision with root package name */
    public volatile boolean f15354h;

    /* renamed from: i, reason: collision with root package name */
    public final j f15355i;

    /* renamed from: j, reason: collision with root package name */
    public q f15356j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConstraintTrackingWorker(@NotNull Context appContext, @NotNull WorkerParameters workerParameters) {
        super(appContext, workerParameters);
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(workerParameters, "workerParameters");
        this.f15352f = workerParameters;
        this.f15353g = new Object();
        this.f15355i = new j();
    }

    @Override // t7.f
    public final void a(x7.q qVar, d state) {
        Intrinsics.g(state, "state");
        r rVarC = r.c();
        String str = a.f17604a;
        qVar.toString();
        rVarC.getClass();
        if (state instanceof c) {
            synchronized (this.f15353g) {
                this.f15354h = true;
                Unit unit = Unit.f71706a;
            }
        }
    }

    @Override // o7.q
    public final void onStopped() {
        q qVar = this.f15356j;
        if (qVar == null || qVar.isStopped()) {
            return;
        }
        qVar.stop(Build.VERSION.SDK_INT >= 31 ? getStopReason() : 0);
    }

    @Override // o7.q
    public final ListenableFuture startWork() {
        getBackgroundExecutor().execute(new x(this, 11));
        j future = this.f15355i;
        Intrinsics.f(future, "future");
        return future;
    }
}
