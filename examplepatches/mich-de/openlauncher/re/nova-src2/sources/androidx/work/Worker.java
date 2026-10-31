package androidx.work;

import android.content.Context;
import com.google.common.util.concurrent.ListenableFuture;
import mk.w;
import o7.g0;
import o7.p;
import o7.q;
import z7.j;

/* loaded from: classes2.dex */
public abstract class Worker extends q {

    /* renamed from: f, reason: collision with root package name */
    public j f15318f;

    public Worker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
    }

    public abstract p b();

    @Override // o7.q
    public final ListenableFuture getForegroundInfoAsync() {
        j jVar = new j();
        getBackgroundExecutor().execute(new w((Object) this, (Object) jVar, false, 5));
        return jVar;
    }

    @Override // o7.q
    public final ListenableFuture startWork() {
        this.f15318f = new j();
        getBackgroundExecutor().execute(new g0(this, 0));
        return this.f15318f;
    }
}
