package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.stub.android.AndroidPingService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ed implements Dd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f62421a;

    /* renamed from: b, reason: collision with root package name */
    public final JobScheduler f62422b;

    public Ed(@NotNull Context context, @NotNull ReentrantLock lock) {
        Intrinsics.g(context, "context");
        Intrinsics.g(lock, "lock");
        this.f62421a = lock;
        this.f62422b = (JobScheduler) context.getSystemService(JobScheduler.class);
    }

    @Override // io.branch.search.internal.Dd
    @NotNull
    public final ArrayList a() {
        this.f62421a.lock();
        try {
            ReentrantLock reentrantLock = this.f62421a;
            reentrantLock.lock();
            try {
                JobScheduler scheduler = this.f62422b;
                Intrinsics.f(scheduler, "scheduler");
                List<JobInfo> listA = Sa.a(scheduler);
                reentrantLock.unlock();
                ArrayList arrayList = new ArrayList();
                for (Object obj : listA) {
                    if (Intrinsics.b(((JobInfo) obj).getService().getClassName(), AndroidPingService.class.getName())) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Object next = it.next();
                    if (!((JobInfo) next).getExtras().containsKey(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP)) {
                        arrayList2.add(next);
                    }
                }
                return arrayList2;
            } finally {
                reentrantLock.unlock();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x003e, code lost:
    
        r1 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x004c, code lost:
    
        throw r1;
     */
    @Override // io.branch.search.internal.Dd
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ArrayList b() {
        this.f62421a.lock();
        try {
            ReentrantLock reentrantLock = this.f62421a;
            reentrantLock.lock();
            JobScheduler scheduler = this.f62422b;
            Intrinsics.f(scheduler, "scheduler");
            List<JobInfo> listA = Sa.a(scheduler);
            reentrantLock.unlock();
            ArrayList arrayList = new ArrayList();
            for (Object obj : listA) {
                if (((JobInfo) obj).getExtras().containsKey(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP)) {
                    arrayList.add(obj);
                }
            }
            return arrayList;
        } finally {
        }
    }

    @Override // io.branch.search.internal.Dd
    @Nullable
    public final JobInfo a(int i5) {
        ReentrantLock reentrantLock = this.f62421a;
        reentrantLock.lock();
        try {
            return this.f62422b.getPendingJob(i5);
        } finally {
            reentrantLock.unlock();
        }
    }
}
