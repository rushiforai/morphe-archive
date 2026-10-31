package fa;

import android.view.Choreographer;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54408a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54409b;

    public /* synthetic */ g(Object obj, int i5) {
        this.f54408a = i5;
        this.f54409b = obj;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(final Runnable runnable) {
        switch (this.f54408a) {
            case 0:
                ((aa.h) this.f54409b).h(runnable);
                break;
            default:
                ((Choreographer) this.f54409b).postFrameCallback(new Choreographer.FrameCallback() { // from class: r3.d0
                    @Override // android.view.Choreographer.FrameCallback
                    public final void doFrame(long j11) {
                        runnable.run();
                    }
                });
                break;
        }
    }
}
