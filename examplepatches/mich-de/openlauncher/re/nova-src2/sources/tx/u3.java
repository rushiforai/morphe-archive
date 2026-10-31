package tx;

import com.google.android.gms.tasks.Task;
import kotlin.Result;
import kotlin.ResultKt;

/* loaded from: classes4.dex */
public final class u3 implements fi.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f90027a;

    public u3(t70.m mVar) {
        this.f90027a = mVar;
    }

    @Override // fi.e
    public final void onComplete(Task task) {
        boolean zQ = task.q();
        t70.m mVar = this.f90027a;
        if (zQ) {
            int i5 = Result.f71687b;
            mVar.resumeWith(task.m());
            return;
        }
        int i11 = Result.f71687b;
        Exception excL = task.l();
        if (excL == null) {
            excL = new Exception("Task failed");
        }
        mVar.resumeWith(ResultKt.a(excL));
    }
}
