package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import io.branch.search.internal.AbstractC3491ze;
import io.branch.search.internal.U2;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.model.BranchJobKt;
import java.text.DateFormat;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class V2 extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ U2 f63467a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AbstractC3491ze.a f63468b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V2(U2 u22, AbstractC3491ze.a aVar) {
        super(0);
        this.f63467a = u22;
        this.f63468b = aVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        JobScheduler scheduler = this.f63467a.f63415e;
        Intrinsics.f(scheduler, "scheduler");
        List<JobInfo> listA = Sa.a(scheduler);
        AbstractC3491ze.a aVar = this.f63468b;
        U2 u22 = this.f63467a;
        for (JobInfo jobInfo : listA) {
            if (!BranchJobKt.isDeferred(jobInfo) || aVar.f66378e) {
                if (jobInfo.isPeriodic() || !u22.f63414d.a(u22.f63411a, jobInfo.getId())) {
                    u22.f63415e.cancel(jobInfo.getId());
                    JobInfo jobInfoBuildDeferrableJobInfo = BranchJob.INSTANCE.buildDeferrableJobInfo(jobInfo, aVar);
                    jobInfoBuildDeferrableJobInfo.getService().getShortClassName();
                    U2.a aVar2 = U2.Companion;
                    long minLatencyMillis = jobInfoBuildDeferrableJobInfo.getMinLatencyMillis() + System.currentTimeMillis();
                    aVar2.getClass();
                    Intrinsics.f(DateFormat.getDateTimeInstance().format(Long.valueOf(minLatencyMillis)), "getDateTimeInstance().format(milliSec)");
                    u22.f63415e.schedule(jobInfoBuildDeferrableJobInfo);
                }
            }
        }
        return Unit.f71706a;
    }
}
