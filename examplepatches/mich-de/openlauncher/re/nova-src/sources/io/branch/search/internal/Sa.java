package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Sa {
    @JvmStatic
    @NotNull
    public static final List<JobInfo> a(@NotNull JobScheduler scheduler) {
        Intrinsics.g(scheduler, "scheduler");
        if (scheduler.getAllPendingJobs() == null) {
            return EmptyList.f71733a;
        }
        List<JobInfo> allPendingJobs = scheduler.getAllPendingJobs();
        Intrinsics.f(allPendingJobs, "scheduler.allPendingJobs");
        return allPendingJobs;
    }
}
