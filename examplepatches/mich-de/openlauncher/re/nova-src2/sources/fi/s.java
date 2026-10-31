package fi;

import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class s implements Executor {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ s f55157b = new s(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55158a;

    public /* synthetic */ s(int i5) {
        this.f55158a = i5;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.f55158a) {
            case 0:
                runnable.run();
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
