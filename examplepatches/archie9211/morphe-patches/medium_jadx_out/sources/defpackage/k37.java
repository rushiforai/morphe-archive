package defpackage;

import android.content.Context;
import android.net.Network;
import android.net.Uri;
import androidx.work.WorkerParameters;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class k37 {
    private Context mAppContext;
    private final AtomicInteger mStopReason = new AtomicInteger(-256);
    private boolean mUsed;
    private WorkerParameters mWorkerParams;

    public k37(Context context, WorkerParameters workerParameters) {
        this.mAppContext = context;
        this.mWorkerParams = workerParameters;
    }

    public final Context getApplicationContext() {
        return this.mAppContext;
    }

    public Executor getBackgroundExecutor() {
        return this.mWorkerParams.f;
    }

    public abstract d37 getForegroundInfoAsync();

    public final UUID getId() {
        return this.mWorkerParams.a;
    }

    public final dt2 getInputData() {
        return this.mWorkerParams.b;
    }

    public final Network getNetwork() {
        return (Network) this.mWorkerParams.d.d;
    }

    public final int getRunAttemptCount() {
        return this.mWorkerParams.e;
    }

    public final int getStopReason() {
        return this.mStopReason.get();
    }

    public final Set<String> getTags() {
        return this.mWorkerParams.c;
    }

    public xfd getTaskExecutor() {
        return this.mWorkerParams.h;
    }

    public final List<String> getTriggeredContentAuthorities() {
        return (List) this.mWorkerParams.d.b;
    }

    public final List<Uri> getTriggeredContentUris() {
        return (List) this.mWorkerParams.d.c;
    }

    public k8f getWorkerFactory() {
        return this.mWorkerParams.i;
    }

    public final boolean isStopped() {
        return this.mStopReason.get() != -256;
    }

    public final boolean isUsed() {
        return this.mUsed;
    }

    public final d37 setForegroundAsync(k05 k05Var) {
        g7f g7fVar = this.mWorkerParams.k;
        Context applicationContext = getApplicationContext();
        UUID id = getId();
        s10 s10Var = g7fVar.a.a;
        hu0 hu0Var = new hu0(g7fVar, id, k05Var, applicationContext, 11);
        s10Var.getClass();
        return o7f.v(new mt(s10Var, "setForegroundAsync", hu0Var, 8));
    }

    public d37 setProgressAsync(dt2 dt2Var) {
        v7f v7fVar = this.mWorkerParams.j;
        getApplicationContext();
        UUID id = getId();
        s10 s10Var = v7fVar.b.a;
        ukd ukdVar = new ukd(v7fVar, id, dt2Var, 3);
        s10Var.getClass();
        return o7f.v(new mt(s10Var, "updateProgress", ukdVar, 8));
    }

    public final void setUsed() {
        this.mUsed = true;
    }

    public abstract d37 startWork();

    public final void stop(int i) {
        if (this.mStopReason.compareAndSet(-256, i)) {
            onStopped();
        }
    }

    public void onStopped() {
    }
}
