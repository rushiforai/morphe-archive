package o7;

import android.content.Context;
import androidx.work.WorkerParameters;

/* loaded from: classes.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final String f79674a = r.e("WorkerFactory");

    public final q a(Context context, String str, WorkerParameters workerParameters) {
        Class clsAsSubclass;
        String str2 = f79674a;
        q qVar = null;
        try {
            clsAsSubclass = Class.forName(str).asSubclass(q.class);
        } catch (Throwable th2) {
            r.c().b(str2, "Invalid class: " + str, th2);
            clsAsSubclass = null;
        }
        if (clsAsSubclass != null) {
            try {
                qVar = (q) clsAsSubclass.getDeclaredConstructor(Context.class, WorkerParameters.class).newInstance(context, workerParameters);
            } catch (Throwable th3) {
                r.c().b(str2, "Could not instantiate " + str, th3);
            }
        }
        if (qVar == null || !qVar.isUsed()) {
            return qVar;
        }
        throw new IllegalStateException(b.c0.n("WorkerFactory (", getClass().getName(), ") returned an instance of a ListenableWorker (", str, ") which has already been invoked. createWorker() must always return a new instance of a ListenableWorker."));
    }
}
