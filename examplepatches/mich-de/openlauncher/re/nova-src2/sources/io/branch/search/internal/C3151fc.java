package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.fc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3151fc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ArrayList f64490a = new ArrayList();

    public final boolean a(@NotNull Context application, int i5) {
        Object next;
        Intrinsics.g(application, "application");
        synchronized (this) {
            try {
                if (!this.f64490a.contains(Integer.valueOf(i5))) {
                    return false;
                }
                List<JobInfo> allPendingJobs = ((JobScheduler) application.getSystemService(JobScheduler.class)).getAllPendingJobs();
                Intrinsics.f(allPendingJobs, "application.getSystemSer…lass.java).allPendingJobs");
                Iterator<T> it = allPendingJobs.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (((JobInfo) next).getId() == i5) {
                        break;
                    }
                }
                if (((JobInfo) next) != null) {
                    return true;
                }
                this.f64490a.remove(Integer.valueOf(i5));
                return false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a(@NotNull Cd params) {
        Intrinsics.g(params, "params");
        synchronized (this) {
            this.f64490a.remove(Integer.valueOf(params.b()));
        }
    }
}
