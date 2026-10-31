package m7;

import android.os.Handler;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public final /* synthetic */ class p implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Handler f76033a;

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.f76033a.post(runnable);
    }
}
