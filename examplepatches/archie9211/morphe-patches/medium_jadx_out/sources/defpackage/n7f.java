package defpackage;

import android.content.Context;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.background.systemjob.SystemJobService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n7f extends x55 implements f55 {
    public static final n7f a = new n7f(6, o7f.class, "createSchedulers", "createSchedulers(Landroid/content/Context;Landroidx/work/Configuration;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/constraints/trackers/Trackers;Landroidx/work/impl/Processor;)Ljava/util/List;", 1);

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        Context context = (Context) obj;
        r32 r32Var = (r32) obj2;
        xfd xfdVar = (xfd) obj3;
        WorkDatabase workDatabase = (WorkDatabase) obj4;
        sqd sqdVar = (sqd) obj5;
        i2a i2aVar = (i2a) obj6;
        context.getClass();
        r32Var.getClass();
        xfdVar.getClass();
        workDatabase.getClass();
        sqdVar.getClass();
        String str = zqb.a;
        z6d z6dVar = new z6d(context, workDatabase, r32Var);
        ay8.a(context, SystemJobService.class, true);
        d87.h().d(zqb.a, "Created SystemJobScheduler and enabled SystemJobService");
        return d46.R(z6dVar, new zf5(context, r32Var, sqdVar, i2aVar, new mya(i2aVar, xfdVar), xfdVar));
    }
}
