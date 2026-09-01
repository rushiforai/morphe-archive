package androidx.work.impl.workers;

import android.content.Context;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
import androidx.work.impl.WorkDatabase;
import defpackage.ab3;
import defpackage.d87;
import defpackage.elb;
import defpackage.f8f;
import defpackage.g8f;
import defpackage.i37;
import defpackage.i8f;
import defpackage.j37;
import defpackage.m7f;
import defpackage.n01;
import defpackage.q6d;
import defpackage.ro;
import defpackage.rz5;
import defpackage.s7f;
import defpackage.sqe;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/work/impl/workers/DiagnosticsWorker;", "Landroidx/work/Worker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "parameters", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "work-runtime_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class DiagnosticsWorker extends Worker {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DiagnosticsWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
    }

    @Override // androidx.work.Worker
    public final i37 b() {
        m7f m7fVarF = m7f.f(getApplicationContext());
        m7fVarF.getClass();
        WorkDatabase workDatabase = m7fVarF.c;
        workDatabase.getClass();
        g8f g8fVarX = workDatabase.x();
        s7f s7fVarV = workDatabase.v();
        i8f i8fVarY = workDatabase.y();
        q6d q6dVarU = workDatabase.u();
        rz5 rz5Var = m7fVarF.b.d;
        List list = (List) n01.c0(g8fVarX.a, true, false, new ro(9, System.currentTimeMillis() - 86400000));
        elb elbVar = g8fVarX.a;
        List list2 = (List) n01.c0(elbVar, true, false, new sqe(27));
        List list3 = (List) n01.c0(elbVar, true, false, new f8f(1));
        if (!list.isEmpty()) {
            d87 d87VarH = d87.h();
            String str = ab3.a;
            d87VarH.j(str, "Recently completed work:\n\n");
            d87.h().j(str, ab3.a(s7fVarV, i8fVarY, q6dVarU, list));
        }
        if (!list2.isEmpty()) {
            d87 d87VarH2 = d87.h();
            String str2 = ab3.a;
            d87VarH2.j(str2, "Running work:\n\n");
            d87.h().j(str2, ab3.a(s7fVarV, i8fVarY, q6dVarU, list2));
        }
        if (!list3.isEmpty()) {
            d87 d87VarH3 = d87.h();
            String str3 = ab3.a;
            d87VarH3.j(str3, "Enqueued work:\n\n");
            d87.h().j(str3, ab3.a(s7fVarV, i8fVarY, q6dVarU, list3));
        }
        return j37.a();
    }
}
