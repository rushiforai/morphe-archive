package m;

import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public final class r implements Executor {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ r f75330b = new r(1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ r f75331c = new r(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75332a;

    public /* synthetic */ r(int i5) {
        this.f75332a = i5;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.f75332a) {
            case 0:
                new Thread(runnable).start();
                break;
            case 1:
                runnable.run();
                break;
            default:
                runnable.run();
                break;
        }
    }
}
