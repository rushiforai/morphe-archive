package androidx.recyclerview.widget;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* loaded from: classes2.dex */
public final class e implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14930a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f14931b;

    public /* synthetic */ e(Handler handler, int i5) {
        this.f14930a = i5;
        this.f14931b = handler;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.f14930a) {
            case 0:
                this.f14931b.post(runnable);
                return;
            case 1:
                this.f14931b.post(runnable);
                return;
            case 2:
                this.f14931b.post(runnable);
                return;
            case 3:
                this.f14931b.post(runnable);
                return;
            default:
                runnable.getClass();
                Handler handler = this.f14931b;
                if (handler.post(runnable)) {
                    return;
                }
                throw new RejectedExecutionException(handler + " is shutting down");
        }
    }

    public e(int i5) {
        this.f14930a = i5;
        switch (i5) {
            case 1:
                this.f14931b = new Handler(Looper.getMainLooper());
                break;
            default:
                this.f14931b = new Handler(Looper.getMainLooper());
                break;
        }
    }
}
