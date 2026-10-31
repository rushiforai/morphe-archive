package f5;

import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54306a;

    public /* synthetic */ c(int i5) {
        this.f54306a = i5;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.f54306a) {
            case 0:
                runnable.run();
                break;
            default:
                s.a.b0().f86500b.f86502c.execute(runnable);
                break;
        }
    }
}
