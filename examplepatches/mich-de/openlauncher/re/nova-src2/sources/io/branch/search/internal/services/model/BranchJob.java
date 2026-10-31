package io.branch.search.internal.services.model;

import a2.c;
import android.app.job.JobInfo;
import android.content.ComponentName;
import android.content.Context;
import android.os.PersistableBundle;
import b.c0;
import b70.g;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.A9;
import io.branch.search.internal.AbstractC3393u1;
import io.branch.search.internal.AbstractC3491ze;
import io.branch.search.internal.C3282n8;
import io.branch.search.internal.D;
import io.branch.search.internal.F4;
import io.branch.search.internal.P1;
import io.branch.search.internal.Z1;
import io.branch.search.internal.services.model.BranchJobType;
import io.branch.search.internal.services.stub.android.AndroidBundleUpdateService;
import io.branch.search.internal.services.stub.android.AndroidCacheUpdateService;
import io.branch.search.internal.services.stub.android.AndroidPingService;
import io.branch.search.internal.services.stub.android.AndroidScheduledQueryService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 \u001c2\u00020\u0001:\u0006\u0019\u001a\u001b\u001c\u001d\u001eB'\b\u0014\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bB'\b\u0004\u0012\u0006\u0010\u0002\u001a\u00020\t\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\nJ\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0012H$J\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017J\u000e\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017R\u0011\u0010\u0002\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0019\u0010\u0004\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010\u0082\u0001\u0005\u001f !\"#¨\u0006$"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob;", b.f42142b, "ID", "Lio/branch/search/internal/services/model/JobId;", "cls", "Ljava/lang/Class;", "classId", b.f42142b, "(Lio/branch/search/internal/services/model/JobId;Ljava/lang/Class;Ljava/lang/String;)V", b.f42142b, "(ILjava/lang/Class;Ljava/lang/String;)V", "getID", "()I", "getClassId", "()Ljava/lang/String;", "getCls", "()Ljava/lang/Class;", "buildJobInfo", "Landroid/app/job/JobInfo$Builder;", "builder", "getDeferrableJobInfo", "Landroid/app/job/JobInfo;", "context", "Landroid/content/Context;", "getJobInfo", "AggregateAnalyticsPing", "BundleUpdate", "CacheUpdateJob", k.O, "ErrorPing", "ScheduledQueries", "Lio/branch/search/internal/services/model/BranchJob$AggregateAnalyticsPing;", "Lio/branch/search/internal/services/model/BranchJob$BundleUpdate;", "Lio/branch/search/internal/services/model/BranchJob$CacheUpdateJob;", "Lio/branch/search/internal/services/model/BranchJob$ErrorPing;", "Lio/branch/search/internal/services/model/BranchJob$ScheduledQueries;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public abstract class BranchJob {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final long MINIMAL_PERIODIC_INTERVAL = 3600000;
    private final int ID;

    @NotNull
    private final String classId;

    @NotNull
    private final Class<? extends Object> cls;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bH\u0014J\b\u0010\n\u001a\u00020\u000bH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$BundleUpdate;", "Lio/branch/search/internal/services/model/BranchJob;", "branchJobType", "Lio/branch/search/internal/services/model/BranchJobType;", "holdWakeLocks", b.f42142b, "(Lio/branch/search/internal/services/model/BranchJobType;Z)V", "buildJobInfo", "Landroid/app/job/JobInfo$Builder;", "builder", "toString", b.f42142b, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class BundleUpdate extends BranchJob {

        @NotNull
        private final BranchJobType branchJobType;
        private final boolean holdWakeLocks;

        public /* synthetic */ BundleUpdate(BranchJobType branchJobType, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(branchJobType, (i5 & 2) != 0 ? true : z11);
        }

        @Override // io.branch.search.internal.services.model.BranchJob
        @NotNull
        public JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder) {
            Intrinsics.g(builder, "builder");
            BranchJobType branchJobType = this.branchJobType;
            if (branchJobType instanceof BranchJobType.Delayed) {
                builder.setMinimumLatency(branchJobType.getTime());
            } else if (branchJobType instanceof BranchJobType.Periodic) {
                long time = branchJobType.getTime();
                if (time < 3600000) {
                    time = 3600000;
                }
                builder.setPeriodic(time, time / 5);
            }
            builder.setPersisted(true);
            builder.setRequiredNetworkType(1);
            builder.setRequiresBatteryNotLow(true);
            builder.setBackoffCriteria(this.branchJobType.getTime(), 0);
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putBoolean("WAKE_LOCKS", this.holdWakeLocks);
            builder.setExtras(persistableBundle);
            return builder;
        }

        @NotNull
        public String toString() {
            return "{ type = " + this.branchJobType.getClass().getSimpleName() + ", time = " + this.branchJobType.getTime() + AbstractJsonLexerKt.END_OBJ;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleUpdate(@NotNull BranchJobType branchJobType, boolean z11) {
            super(JobId.BUNDLE_UPDATE, AndroidBundleUpdateService.class, "bundle_update_service", (DefaultConstructorMarker) null);
            Intrinsics.g(branchJobType, "branchJobType");
            this.branchJobType = branchJobType;
            this.holdWakeLocks = z11;
        }
    }

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bH\u0014J\u000e\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\fJ\b\u0010\r\u001a\u00020\u000eH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$CacheUpdateJob;", "Lio/branch/search/internal/services/model/BranchJob;", "interval", b.f42142b, "holdWakeLocks", b.f42142b, "(JZ)V", "buildJobInfo", "Landroid/app/job/JobInfo$Builder;", "builder", "compareWithJobInfo", "jobInfo", "Landroid/app/job/JobInfo;", "toString", b.f42142b, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class CacheUpdateJob extends BranchJob {
        private final boolean holdWakeLocks;
        private final long interval;

        public /* synthetic */ CacheUpdateJob(long j11, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(j11, (i5 & 2) != 0 ? true : z11);
        }

        @Override // io.branch.search.internal.services.model.BranchJob
        @NotNull
        public JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder) {
            Intrinsics.g(builder, "builder");
            long j11 = this.interval;
            if (j11 < 3600000) {
                j11 = 3600000;
            }
            builder.setPeriodic(j11, j11 / 5);
            builder.setPersisted(true);
            builder.setBackoffCriteria(30000L, 1);
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putBoolean("WAKE_LOCKS", this.holdWakeLocks);
            builder.setExtras(persistableBundle);
            return builder;
        }

        public final boolean compareWithJobInfo(@NotNull JobInfo jobInfo) {
            Intrinsics.g(jobInfo, "jobInfo");
            return jobInfo.getIntervalMillis() == this.interval && jobInfo.getExtras().getBoolean("WAKE_LOCKS") == this.holdWakeLocks;
        }

        @NotNull
        public String toString() {
            return c.i(this.interval, " }", new StringBuilder("{ interval = "));
        }

        public CacheUpdateJob(long j11, boolean z11) {
            super(JobId.CACHE_UPDATE.getId(), AndroidCacheUpdateService.class, "cache_update_service", (DefaultConstructorMarker) null);
            this.interval = j11;
            this.holdWakeLocks = z11;
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u0015\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u001d\u0010\t\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\f\u0010\r¨\u0006\u0010"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$Companion;", b.f42142b, "Landroid/app/job/JobInfo;", "job", b.f42142b, "wasPeriodic", "(Landroid/app/job/JobInfo;)Z", "Lio/branch/search/internal/ze;", "status", "buildDeferrableJobInfo", "(Landroid/app/job/JobInfo;Lio/branch/search/internal/ze;)Landroid/app/job/JobInfo;", b.f42142b, "MINIMAL_PERIODIC_INTERVAL", "J", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final JobInfo buildDeferrableJobInfo(@NotNull JobInfo job, @NotNull AbstractC3491ze status) {
            Intrinsics.g(job, "job");
            Intrinsics.g(status, "status");
            if (status instanceof AbstractC3491ze.a) {
                AbstractC3491ze.a aVar = (AbstractC3491ze.a) status;
                int id2 = job.getId();
                JobId jobId = JobId.BUNDLE_UPDATE;
                Long lValueOf = Long.valueOf(id2 == jobId.getId() ? aVar.f66375b : id2 == JobId.SCHEDULED_QUERIES.getId() ? aVar.f66376c : aVar.f66374a);
                Boolean bool = Boolean.FALSE;
                int id3 = job.getId();
                long jLongValue = Long.valueOf(id3 == jobId.getId() ? aVar.f66375b : id3 == JobId.SCHEDULED_QUERIES.getId() ? aVar.f66376c : aVar.f66374a).longValue();
                if (job.getId() != jobId.getId()) {
                    JobId.SCHEDULED_QUERIES.getId();
                }
                JobInfo jobInfoBuild = BranchJobKt.createBuilder$default(job, lValueOf, bool, null, null, jLongValue, Integer.valueOf(aVar.f66377d).intValue(), false, new Function1<PersistableBundle, Unit>() { // from class: io.branch.search.internal.services.model.BranchJob$Companion$buildDeferrableJobInfo$1
                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                        invoke((PersistableBundle) obj);
                        return Unit.f71706a;
                    }

                    public final void invoke(@NotNull PersistableBundle extras) {
                        Intrinsics.g(extras, "extras");
                        BranchJobKt.setDeferred(extras, true);
                    }
                }, 76, null).build();
                Intrinsics.f(jobInfoBuild, "{\n                job.cr…) }.build()\n            }");
                return jobInfoBuild;
            }
            PersistableBundle extras = job.getExtras();
            Intrinsics.f(extras, "job.extras");
            long preferredExecutionTime = BranchJobKt.getPreferredExecutionTime(extras) - System.currentTimeMillis();
            if (preferredExecutionTime < 0) {
                preferredExecutionTime = 0;
            }
            PersistableBundle extras2 = job.getExtras();
            Intrinsics.f(extras2, "job.extras");
            boolean zWasPeriodic = BranchJobKt.wasPeriodic(extras2);
            PersistableBundle extras3 = job.getExtras();
            Intrinsics.f(extras3, "job.extras");
            long period = BranchJobKt.getPeriod(extras3);
            PersistableBundle extras4 = job.getExtras();
            Intrinsics.f(extras4, "job.extras");
            long periodicFlex = BranchJobKt.getPeriodicFlex(extras4);
            PersistableBundle extras5 = job.getExtras();
            Intrinsics.f(extras5, "job.extras");
            int backoffPolicy = BranchJobKt.getBackoffPolicy(extras5);
            PersistableBundle extras6 = job.getExtras();
            Intrinsics.f(extras6, "job.extras");
            long backoffInitDelay = BranchJobKt.getBackoffInitDelay(extras6);
            PersistableBundle extras7 = job.getExtras();
            Intrinsics.f(extras7, "job.extras");
            JobInfo jobInfoBuild2 = BranchJobKt.createBuilder(job, Long.valueOf(preferredExecutionTime), Boolean.valueOf(zWasPeriodic), Long.valueOf(period), Long.valueOf(periodicFlex), backoffInitDelay, backoffPolicy, BranchJobKt.getRequiresBatteryNotLow(extras7), new Function1<PersistableBundle, Unit>() { // from class: io.branch.search.internal.services.model.BranchJob$Companion$buildDeferrableJobInfo$2
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                    invoke((PersistableBundle) obj);
                    return Unit.f71706a;
                }

                public final void invoke(@NotNull PersistableBundle extras8) {
                    Intrinsics.g(extras8, "extras");
                    BranchJobKt.setDeferred(extras8, false);
                }
            }).build();
            Intrinsics.f(jobInfoBuild2, "{\n                val mi…) }.build()\n            }");
            return jobInfoBuild2;
        }

        public final boolean wasPeriodic(@NotNull JobInfo job) {
            Intrinsics.g(job, "job");
            PersistableBundle extras = job.getExtras();
            Intrinsics.f(extras, "job.extras");
            return BranchJobKt.wasPeriodic(extras);
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bH\u0014J\b\u0010\n\u001a\u00020\u000bH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$ScheduledQueries;", "Lio/branch/search/internal/services/model/BranchJob;", "interval", b.f42142b, "holdWakeLocks", b.f42142b, "(JZ)V", "buildJobInfo", "Landroid/app/job/JobInfo$Builder;", "builder", "toString", b.f42142b, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class ScheduledQueries extends BranchJob {
        private final boolean holdWakeLocks;
        private final long interval;

        public /* synthetic */ ScheduledQueries(long j11, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(j11, (i5 & 2) != 0 ? true : z11);
        }

        @Override // io.branch.search.internal.services.model.BranchJob
        @NotNull
        public JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder) {
            Intrinsics.g(builder, "builder");
            if (this.holdWakeLocks) {
                builder.setMinimumLatency(this.interval);
            } else {
                long j11 = this.interval;
                if (j11 < 3600000) {
                    j11 = 3600000;
                }
                builder.setPeriodic(j11, j11 / 5);
            }
            builder.setPersisted(true);
            builder.setBackoffCriteria(30000L, 1);
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putBoolean("WAKE_LOCKS", this.holdWakeLocks);
            builder.setExtras(persistableBundle);
            return builder;
        }

        @NotNull
        public String toString() {
            return c.i(this.interval, " }", new StringBuilder("{ interval = "));
        }

        public ScheduledQueries(long j11, boolean z11) {
            super(JobId.SCHEDULED_QUERIES.getId(), AndroidScheduledQueryService.class, "scheduled_queries_service", (DefaultConstructorMarker) null);
            this.interval = j11;
            this.holdWakeLocks = z11;
        }
    }

    public /* synthetic */ BranchJob(int i5, Class cls, String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, (Class<? extends Object>) cls, str);
    }

    @NotNull
    public abstract JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder);

    @NotNull
    public final String getClassId() {
        return this.classId;
    }

    @NotNull
    public final Class<? extends Object> getCls() {
        return this.cls;
    }

    @NotNull
    public final JobInfo getDeferrableJobInfo(@NotNull Context context) {
        Intrinsics.g(context, "context");
        JobInfo jobInfoBuild = buildJobInfo(new JobInfo.Builder(this.ID, new ComponentName(context, this.cls))).build();
        PersistableBundle extras = jobInfoBuild.getExtras();
        Intrinsics.f(extras, "");
        BranchJobKt.setPreferredExecutionTime(extras, jobInfoBuild.getMinLatencyMillis() + System.currentTimeMillis());
        BranchJobKt.setWasPeriodic(extras, jobInfoBuild.isPeriodic());
        BranchJobKt.setPeriod(extras, jobInfoBuild.getIntervalMillis());
        BranchJobKt.setPeriodicFlex(extras, Long.valueOf(BranchJobKt.flexOrNull(jobInfoBuild)));
        BranchJobKt.setBackoffPolicy(extras, jobInfoBuild.getBackoffPolicy());
        BranchJobKt.setBackoffIntDelay(extras, jobInfoBuild.getInitialBackoffMillis());
        BranchJobKt.setRequiresBatteryNotLow(extras, jobInfoBuild.isRequireBatteryNotLow());
        return jobInfoBuild;
    }

    public final int getID() {
        return this.ID;
    }

    @NotNull
    public final JobInfo getJobInfo(@NotNull Context context) {
        Intrinsics.g(context, "context");
        JobInfo jobInfoBuild = buildJobInfo(new JobInfo.Builder(this.ID, new ComponentName(context, this.cls))).build();
        Intrinsics.f(jobInfoBuild, "buildJobInfo(builder).build()");
        return jobInfoBuild;
    }

    public /* synthetic */ BranchJob(JobId jobId, Class cls, String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(jobId, (Class<? extends Object>) cls, str);
    }

    private BranchJob(int i5, Class<? extends Object> cls, String str) {
        this.ID = i5;
        this.cls = cls;
        this.classId = str;
    }

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0005\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B!\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H\u0014¢\u0006\u0004\b\u0007\u0010\bR\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u000bR\u0014\u0010\r\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u000e¨\u0006\u0014"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$AggregateAnalyticsPing;", "Lio/branch/search/internal/services/model/BranchJob;", b.f42142b, "toString", "()Ljava/lang/String;", "Landroid/app/job/JobInfo$Builder;", "builder", "buildJobInfo", "(Landroid/app/job/JobInfo$Builder;)Landroid/app/job/JobInfo$Builder;", "Lio/branch/search/internal/D;", "aggregateAnalyticsQueryResult", "Lio/branch/search/internal/D;", b.f42142b, "holdWakeLocks", "Z", b.f42142b, "id", "<init>", "(ILio/branch/search/internal/D;Z)V", k.O, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class AggregateAnalyticsPing extends BranchJob {

        @NotNull
        public static final String EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP = "AA_PING_SCHEDULING_TIMESTAMP";

        @NotNull
        private final D aggregateAnalyticsQueryResult;
        private final boolean holdWakeLocks;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AggregateAnalyticsPing(int i5, @NotNull D aggregateAnalyticsQueryResult, boolean z11) {
            super(i5, AndroidPingService.class, "ping_service", (DefaultConstructorMarker) null);
            Intrinsics.g(aggregateAnalyticsQueryResult, "aggregateAnalyticsQueryResult");
            this.aggregateAnalyticsQueryResult = aggregateAnalyticsQueryResult;
            this.holdWakeLocks = z11;
        }

        @Override // io.branch.search.internal.services.model.BranchJob
        @NotNull
        public JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder) {
            Intrinsics.g(builder, "builder");
            builder.setMinimumLatency(this.aggregateAnalyticsQueryResult.f62319d);
            builder.setOverrideDeadline(this.aggregateAnalyticsQueryResult.f62320e);
            builder.setPersisted(true);
            Boolean bool = this.aggregateAnalyticsQueryResult.f62326k;
            if (bool != null) {
                builder.setRequiresCharging(bool.booleanValue());
            }
            Boolean bool2 = this.aggregateAnalyticsQueryResult.f62328m;
            if (bool2 != null) {
                builder.setRequiresDeviceIdle(bool2.booleanValue());
            }
            D d5 = this.aggregateAnalyticsQueryResult;
            Long l9 = d5.f62321f;
            if (l9 != null && d5.f62322g != null) {
                builder.setBackoffCriteria(l9.longValue(), this.aggregateAnalyticsQueryResult.f62322g.intValue());
            }
            Boolean bool3 = this.aggregateAnalyticsQueryResult.f62324i;
            if (bool3 != null) {
                builder.setRequiresBatteryNotLow(bool3.booleanValue());
            }
            Boolean bool4 = this.aggregateAnalyticsQueryResult.f62327l;
            if (bool4 != null) {
                builder.setRequiresStorageNotLow(bool4.booleanValue());
            }
            Boolean bool5 = this.aggregateAnalyticsQueryResult.f62323h;
            Boolean bool6 = Boolean.TRUE;
            if (Intrinsics.b(bool5, bool6)) {
                builder.setRequiredNetworkType(2);
            }
            if (Intrinsics.b(this.aggregateAnalyticsQueryResult.f62325j, bool6)) {
                builder.setRequiredNetworkType(1);
            }
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putString("PING_PARAMS", this.aggregateAnalyticsQueryResult.f62316a);
            persistableBundle.putString("QUERY_ID", String.valueOf(this.aggregateAnalyticsQueryResult.f62317b));
            persistableBundle.putLong(EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP, System.currentTimeMillis());
            persistableBundle.putBoolean("WAKE_LOCKS", this.holdWakeLocks);
            builder.setExtras(persistableBundle);
            return builder;
        }

        @NotNull
        public String toString() {
            return "{ aggregateAnalyticsQueryResult = " + this.aggregateAnalyticsQueryResult + AbstractJsonLexerKt.END_OBJ;
        }

        public /* synthetic */ AggregateAnalyticsPing(int i5, D d5, boolean z11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this(i5, d5, (i11 & 4) != 0 ? true : z11);
        }
    }

    private BranchJob(JobId jobId, Class<? extends Object> cls, String str) {
        this(jobId.getId(), cls, str, (DefaultConstructorMarker) null);
    }

    @Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B_\u0012\u0006\u0010'\u001a\u00020&\u0012\u0006\u0010)\u001a\u00020(\u0012\u0006\u0010+\u001a\u00020*\u0012\u0006\u0010-\u001a\u00020,\u0012\u0006\u0010/\u001a\u00020.\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0018\u001a\u00020\u0017\u0012\n\u0010\u001c\u001a\u00060\u001aj\u0002`\u001b\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\"\u001a\u00020!¢\u0006\u0004\b0\u00101J%\u0010\u0007\u001a\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00022\u0006\u0010\u0006\u001a\u00020\u0005H\u0002¢\u0006\u0004\b\u0007\u0010\bJ%\u0010\n\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00052\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002H\u0002¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0014¢\u0006\u0004\b\u0010\u0010\u0011R\u0017\u0010\u0013\u001a\u00020\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0018\u001a\u00020\u00178\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010\u0019R\u001b\u0010\u001c\u001a\u00060\u001aj\u0002`\u001b8\u0006¢\u0006\f\n\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0014\u0010\"\u001a\u00020!8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\"\u0010#R\u001a\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b$\u0010%¨\u00062"}, d2 = {"Lio/branch/search/internal/services/model/BranchJob$ErrorPing;", "Lio/branch/search/internal/services/model/BranchJob;", b.f42142b, b.f42142b, "errorPingRules", "Lio/branch/search/internal/u1;", "bind", "buildErrorMessage", "(Ljava/util/List;Lio/branch/search/internal/u1;)Ljava/lang/String;", "rules", "createExtraErrorMessage", "(Lio/branch/search/internal/u1;Ljava/util/List;)Ljava/lang/String;", "toString", "()Ljava/lang/String;", "Landroid/app/job/JobInfo$Builder;", "builder", "buildJobInfo", "(Landroid/app/job/JobInfo$Builder;)Landroid/app/job/JobInfo$Builder;", b.f42142b, "queryId", "I", "getQueryId", "()I", b.f42142b, "timestamp", "J", "Ljava/lang/Exception;", "Lkotlin/Exception;", "exception", "Ljava/lang/Exception;", "getException", "()Ljava/lang/Exception;", "Lio/branch/search/internal/u1;", b.f42142b, "holdWakeLocks", "Z", "errorPingParamRule", "Ljava/util/List;", "Lio/branch/search/internal/F4;", "contextDelegate", "Lio/branch/search/internal/Z1;", "branchDeviceInfo", "Lio/branch/search/internal/P1;", "branchConfiguration", "Lio/branch/search/internal/n8;", "branchRemoteConfiguration", "Lio/branch/search/internal/A9;", "networkRepository", "<init>", "(Lio/branch/search/internal/F4;Lio/branch/search/internal/Z1;Lio/branch/search/internal/P1;Lio/branch/search/internal/n8;Lio/branch/search/internal/A9;IJLjava/lang/Exception;Lio/branch/search/internal/u1;Z)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class ErrorPing extends BranchJob {

        @NotNull
        private final AbstractC3393u1 bind;

        @NotNull
        private final List<String> errorPingParamRule;

        @NotNull
        private final Exception exception;
        private final boolean holdWakeLocks;
        private final int queryId;
        private final long timestamp;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ErrorPing(@NotNull F4 contextDelegate, @NotNull Z1 branchDeviceInfo, @NotNull P1 branchConfiguration, @NotNull C3282n8 branchRemoteConfiguration, @NotNull A9 networkRepository, int i5, long j11, @NotNull Exception exception, @NotNull AbstractC3393u1 bind, boolean z11) {
            super(JobId.ERROR_PING, AndroidPingService.class, "ping_service", (DefaultConstructorMarker) null);
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
            Intrinsics.g(branchConfiguration, "branchConfiguration");
            Intrinsics.g(branchRemoteConfiguration, "branchRemoteConfiguration");
            Intrinsics.g(networkRepository, "networkRepository");
            Intrinsics.g(exception, "exception");
            Intrinsics.g(bind, "bind");
            this.queryId = i5;
            this.timestamp = j11;
            this.exception = exception;
            this.bind = bind;
            this.holdWakeLocks = z11;
            this.errorPingParamRule = branchRemoteConfiguration.b();
        }

        private final String buildErrorMessage(List<String> errorPingRules, AbstractC3393u1 bind) {
            String strCreateExtraErrorMessage = createExtraErrorMessage(bind, errorPingRules);
            String str = "type=error&id=" + this.queryId + "&timestamp=" + this.timestamp + "&error=" + this.exception.getClass().getSimpleName();
            return !r70.k.U0(strCreateExtraErrorMessage) ? c.g('&', str, strCreateExtraErrorMessage) : str;
        }

        private final String createExtraErrorMessage(AbstractC3393u1 bind, List<String> rules) {
            String[] strArrB;
            ArrayList arrayList = new ArrayList(b70.c.u0(rules, 10));
            for (String str : rules) {
                String str2 = null;
                try {
                    strArrB = bind.b(str);
                } catch (Throwable unused) {
                    strArrB = null;
                }
                if (strArrB != null) {
                    str2 = (String) kotlin.collections.c.E0(0, strArrB);
                }
                arrayList.add(new Pair(str, str2));
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (((Pair) next).f71684b != null) {
                    arrayList2.add(next);
                }
            }
            return g.f1(arrayList2, "&", null, null, 0, new Function1<Pair<? extends String, ? extends String>, CharSequence>() { // from class: io.branch.search.internal.services.model.BranchJob$ErrorPing$createExtraErrorMessage$3
                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final CharSequence invoke(@NotNull Pair<String, String> rule) {
                    Intrinsics.g(rule, "rule");
                    return ((String) rule.f71683a) + '=' + ((String) rule.f71684b);
                }
            }, 30);
        }

        @Override // io.branch.search.internal.services.model.BranchJob
        @NotNull
        public JobInfo.Builder buildJobInfo(@NotNull JobInfo.Builder builder) {
            Intrinsics.g(builder, "builder");
            builder.setMinimumLatency(0L);
            builder.setOverrideDeadline(0L);
            builder.setRequiredNetworkType(1);
            builder.setBackoffCriteria(30000L, 1);
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putString("PING_PARAMS", buildErrorMessage(this.errorPingParamRule, this.bind));
            persistableBundle.putString("QUERY_ID", String.valueOf(this.queryId));
            persistableBundle.putBoolean("WAKE_LOCKS", this.holdWakeLocks);
            builder.setExtras(persistableBundle);
            return builder;
        }

        @NotNull
        public final Exception getException() {
            return this.exception;
        }

        public final int getQueryId() {
            return this.queryId;
        }

        @NotNull
        public String toString() {
            return c0.q(new StringBuilder("{ message = "), buildErrorMessage(this.errorPingParamRule, this.bind), " }");
        }

        public /* synthetic */ ErrorPing(F4 f42, Z1 z12, P1 p12, C3282n8 c3282n8, A9 a92, int i5, long j11, Exception exc, AbstractC3393u1 abstractC3393u1, boolean z11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this(f42, z12, p12, c3282n8, a92, i5, j11, exc, (i11 & 256) != 0 ? new AbstractC3393u1.c(f42, p12, c3282n8, z12, a92) : abstractC3393u1, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? true : z11);
        }
    }
}
