package o6;

import ai.e1;
import android.util.Log;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public final class b extends FutureTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ a f79615a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(a aVar, e1 e1Var) {
        super(e1Var);
        this.f79615a = aVar;
    }

    @Override // java.util.concurrent.FutureTask
    public final void done() {
        a aVar = this.f79615a;
        AtomicBoolean atomicBoolean = aVar.f79613d;
        try {
            Object obj = get();
            if (atomicBoolean.get()) {
                return;
            }
            aVar.a(obj);
        } catch (InterruptedException e3) {
            Log.w("AsyncTask", e3);
        } catch (CancellationException unused) {
            if (atomicBoolean.get()) {
                return;
            }
            aVar.a(null);
        } catch (ExecutionException e11) {
            throw new RuntimeException("An error occurred while executing doInBackground()", e11.getCause());
        } catch (Throwable th2) {
            throw new RuntimeException("An error occurred while executing doInBackground()", th2);
        }
    }
}
