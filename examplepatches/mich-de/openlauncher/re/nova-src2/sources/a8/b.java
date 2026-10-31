package a8;

import android.os.Looper;
import cm.j;
import java.util.concurrent.Executor;
import lh.i;

/* loaded from: classes.dex */
public final class b implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f456a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f457b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f456a = i5;
        this.f457b = obj;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.f456a) {
            case 0:
                ((c) this.f457b).f460c.post(runnable);
                break;
            case 1:
                ((i) this.f457b).post(runnable);
                break;
            default:
                ((Executor) this.f457b).execute(new j(runnable, 1));
                break;
        }
    }

    public b() {
        this.f456a = 1;
        i iVar = new i(Looper.getMainLooper(), 2);
        Looper.getMainLooper();
        this.f457b = iVar;
    }
}
