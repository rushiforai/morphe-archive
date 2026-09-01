package defpackage;

import android.content.Context;
import androidx.work.WorkerParameters;
import com.drew.imaging.avi.hzjl.bPUi;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class k8f {
    public abstract k37 a(Context context, String str, WorkerParameters workerParameters);

    public final k37 b(Context context, String str, WorkerParameters workerParameters) {
        str.getClass();
        workerParameters.getClass();
        k37 k37VarA = a(context, str, workerParameters);
        if (k37VarA == null) {
            try {
                Class<? extends U> clsAsSubclass = Class.forName(str).asSubclass(k37.class);
                clsAsSubclass.getClass();
                try {
                    Object objNewInstance = clsAsSubclass.getDeclaredConstructor(Context.class, WorkerParameters.class).newInstance(context, workerParameters);
                    objNewInstance.getClass();
                    k37VarA = (k37) objNewInstance;
                } catch (Throwable th) {
                    d87.h().g(l8f.a, "Could not instantiate ".concat(str), th);
                    throw th;
                }
            } catch (Throwable th2) {
                d87.h().g(l8f.a, "Invalid class: ".concat(str), th2);
                throw th2;
            }
        }
        if (!k37VarA.isUsed()) {
            return k37VarA;
        }
        throw new IllegalStateException(bPUi.YjhHWRj + getClass().getName() + ") returned an instance of a ListenableWorker (" + str + ") which has already been invoked. createWorker() must always return a new instance of a ListenableWorker.");
    }
}
