package xw;

import as.d0;
import com.google.android.gms.tasks.Task;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m;

/* loaded from: classes4.dex */
public abstract class h {
    public static Object a(Task task, ContinuationImpl continuationImpl) {
        if (task.p()) {
            return task;
        }
        m mVar = new m(1, IntrinsicsKt.b(continuationImpl));
        mVar.t();
        task.c(b.f96454a, new d0(9, mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static final Object b(Task task) {
        Intrinsics.g(task, "<this>");
        if (task.q()) {
            int i5 = Result.f71687b;
            return task.m();
        }
        if (task.o()) {
            int i11 = Result.f71687b;
            return ResultKt.a(new CancellationException("Task was canceled"));
        }
        int i12 = Result.f71687b;
        Exception excL = task.l();
        if (excL == null) {
            excL = new Exception("Unknown error occurred");
        }
        return ResultKt.a(excL);
    }
}
