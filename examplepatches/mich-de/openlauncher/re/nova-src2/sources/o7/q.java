package o7;

import a5.n1;
import ai.s1;
import android.content.Context;
import android.net.Network;
import android.net.Uri;
import androidx.work.WorkerParameters;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class q {
    private Context mAppContext;
    private volatile int mStopReason = -256;
    private boolean mUsed;
    private WorkerParameters mWorkerParams;

    public q(Context context, WorkerParameters workerParameters) {
        if (context == null) {
            throw new IllegalArgumentException("Application Context is null");
        }
        if (workerParameters == null) {
            throw new IllegalArgumentException("WorkerParameters is null");
        }
        this.mAppContext = context;
        this.mWorkerParams = workerParameters;
    }

    public final Context getApplicationContext() {
        return this.mAppContext;
    }

    public Executor getBackgroundExecutor() {
        return this.mWorkerParams.f15324f;
    }

    public ListenableFuture getForegroundInfoAsync() {
        z7.j jVar = new z7.j();
        jVar.k(new IllegalStateException("Expedited WorkRequests require a ListenableWorker to provide an implementation for `getForegroundInfoAsync()`"));
        return jVar;
    }

    public final UUID getId() {
        return this.mWorkerParams.f15319a;
    }

    public final g getInputData() {
        return this.mWorkerParams.f15320b;
    }

    public final Network getNetwork() {
        return (Network) this.mWorkerParams.f15322d.f95210c;
    }

    public final int getRunAttemptCount() {
        return this.mWorkerParams.f15323e;
    }

    public final int getStopReason() {
        return this.mStopReason;
    }

    public final Set<String> getTags() {
        return this.mWorkerParams.f15321c;
    }

    public a8.a getTaskExecutor() {
        return this.mWorkerParams.f15325g;
    }

    public final List<String> getTriggeredContentAuthorities() {
        return (List) this.mWorkerParams.f15322d.f95208a;
    }

    public final List<Uri> getTriggeredContentUris() {
        return (List) this.mWorkerParams.f15322d.f95209b;
    }

    public i0 getWorkerFactory() {
        return this.mWorkerParams.f15326h;
    }

    public final boolean isStopped() {
        return this.mStopReason != -256;
    }

    public final boolean isUsed() {
        return this.mUsed;
    }

    public void onStopped() {
    }

    public final ListenableFuture setForegroundAsync(i iVar) {
        y7.s sVar = this.mWorkerParams.f15328j;
        Context applicationContext = getApplicationContext();
        UUID id2 = getId();
        sVar.getClass();
        z7.j jVar = new z7.j();
        sVar.f96770a.a(new s1(sVar, jVar, id2, iVar, applicationContext));
        return jVar;
    }

    public ListenableFuture setProgressAsync(g gVar) {
        y7.t tVar = this.mWorkerParams.f15327i;
        getApplicationContext();
        UUID id2 = getId();
        tVar.getClass();
        z7.j jVar = new z7.j();
        tVar.f96775b.a(new n1(tVar, id2, gVar, jVar, 15, false));
        return jVar;
    }

    public final void setUsed() {
        this.mUsed = true;
    }

    public abstract ListenableFuture startWork();

    public final void stop(int i5) {
        this.mStopReason = i5;
        onStopped();
    }
}
