package io.branch.search.internal.services.model;

import android.app.job.JobInfo;
import android.os.Build;
import android.os.PersistableBundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0018\u001au\u0010\t\u001a\u00020\n*\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0012\u001a\u00020\r2\b\b\u0002\u0010\u0013\u001a\u00020\u00142\b\b\u0002\u0010\u0015\u001a\u00020\u000f2\u0014\b\u0002\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00190\u0017H\u0002¢\u0006\u0002\u0010\u001a\u001a\f\u0010\u001b\u001a\u00020\r*\u00020\u000bH\u0002\u001a\f\u0010\u001c\u001a\u00020\r*\u00020\u0018H\u0002\u001a\f\u0010\u001d\u001a\u00020\u0014*\u00020\u0018H\u0002\u001a\f\u0010\u001e\u001a\u00020\r*\u00020\u0018H\u0002\u001a\f\u0010\u001f\u001a\u00020\r*\u00020\u0018H\u0002\u001a\f\u0010 \u001a\u00020\r*\u00020\u0018H\u0002\u001a\f\u0010!\u001a\u00020\u000f*\u00020\u0018H\u0002\u001a\n\u0010\"\u001a\u00020\u000f*\u00020\u000b\u001a\f\u0010\"\u001a\u00020\u000f*\u00020\u0018H\u0002\u001a\u0014\u0010#\u001a\u00020\u0018*\u00020\u00182\u0006\u0010$\u001a\u00020\rH\u0002\u001a\u0014\u0010%\u001a\u00020\u0018*\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u0014H\u0002\u001a\u0014\u0010&\u001a\u00020\u0018*\u00020\u00182\u0006\u0010\"\u001a\u00020\u000fH\u0002\u001a\u0014\u0010'\u001a\u00020\u0018*\u00020\u00182\u0006\u0010(\u001a\u00020\rH\u0002\u001a\u001b\u0010)\u001a\u00020\u0018*\u00020\u00182\b\u0010*\u001a\u0004\u0018\u00010\rH\u0002¢\u0006\u0002\u0010+\u001a\u0014\u0010,\u001a\u00020\u0018*\u00020\u00182\u0006\u0010-\u001a\u00020\rH\u0002\u001a\u0014\u0010.\u001a\u00020\u0018*\u00020\u00182\u0006\u0010\u0015\u001a\u00020\u000fH\u0002\u001a\u0014\u0010/\u001a\u00020\u0018*\u00020\u00182\u0006\u00100\u001a\u00020\u000fH\u0002\u001a\f\u00100\u001a\u00020\u000f*\u00020\u0018H\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\b\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u00061"}, d2 = {"BACKOFF_INIT_DELAY", b.f42142b, "BACKOFF_POLICY", "IS_DEFERRED", "PERIOD", "PERIOD_FLEX", "PREFERRED_EXECUTE_TIME", "REQUIRES_BATT_NOT_LOW", "WAS_PERIODIC", "createBuilder", "Landroid/app/job/JobInfo$Builder;", "Landroid/app/job/JobInfo;", "minLatencyMillis", b.f42142b, "periodic", b.f42142b, "periodicInterval", "periodicFlex", "backoffMilliSec", "backoffPolicy", b.f42142b, "requiresBatteryNotLow", "extras", "Lkotlin/Function1;", "Landroid/os/PersistableBundle;", b.f42142b, "(Landroid/app/job/JobInfo;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;JIZLkotlin/jvm/functions/Function1;)Landroid/app/job/JobInfo$Builder;", "flexOrNull", "getBackoffInitDelay", "getBackoffPolicy", "getPeriod", "getPeriodicFlex", "getPreferredExecutionTime", "getRequiresBatteryNotLow", "isDeferred", "setBackoffIntDelay", "backoffMinDelay", "setBackoffPolicy", "setDeferred", "setPeriod", BranchJobKt.PERIOD, "setPeriodicFlex", "flex", "(Landroid/os/PersistableBundle;Ljava/lang/Long;)Landroid/os/PersistableBundle;", "setPreferredExecutionTime", "preferredExeTime", "setRequiresBatteryNotLow", "setWasPeriodic", "wasPeriodic", "BranchSearchSDK_forPartnersRelease"}, k = 2, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class BranchJobKt {

    @NotNull
    private static final String BACKOFF_INIT_DELAY = "backoff_init_delay";

    @NotNull
    private static final String BACKOFF_POLICY = "backoff_policy";

    @NotNull
    private static final String IS_DEFERRED = "is_deferred";

    @NotNull
    private static final String PERIOD = "period";

    @NotNull
    private static final String PERIOD_FLEX = "period_flex";

    @NotNull
    private static final String PREFERRED_EXECUTE_TIME = "preferred_execute_time";

    @NotNull
    private static final String REQUIRES_BATT_NOT_LOW = "requires_batt_not_low";

    @NotNull
    private static final String WAS_PERIODIC = "was_periodic";

    /* JADX INFO: Access modifiers changed from: private */
    public static final JobInfo.Builder createBuilder(JobInfo jobInfo, Long l9, Boolean bool, Long l11, Long l12, long j11, int i5, boolean z11, Function1<? super PersistableBundle, Unit> function1) {
        JobInfo.Builder builder = new JobInfo.Builder(jobInfo.getId(), jobInfo.getService());
        builder.setPersisted(jobInfo.isPersisted());
        builder.setBackoffCriteria(j11, i5);
        builder.setRequiredNetworkType(jobInfo.getNetworkType());
        if (Build.VERSION.SDK_INT >= 28) {
            builder.setRequiredNetwork(jobInfo.getRequiredNetwork());
        }
        builder.setRequiresBatteryNotLow(z11);
        PersistableBundle extras = jobInfo.getExtras();
        PersistableBundle extras2 = jobInfo.getExtras();
        Intrinsics.f(extras2, "this.extras");
        function1.invoke(extras2);
        builder.setExtras(extras);
        if (bool != null ? bool.booleanValue() : jobInfo.isPeriodic()) {
            builder.setPeriodic(l11 != null ? l11.longValue() : jobInfo.getIntervalMillis(), l12 != null ? l12.longValue() : jobInfo.getFlexMillis());
            return builder;
        }
        builder.setMinimumLatency(l9 != null ? l9.longValue() : jobInfo.getMinLatencyMillis());
        return builder;
    }

    public static /* synthetic */ JobInfo.Builder createBuilder$default(JobInfo jobInfo, Long l9, Boolean bool, Long l11, Long l12, long j11, int i5, boolean z11, Function1 function1, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            l9 = null;
        }
        if ((i11 & 2) != 0) {
            bool = null;
        }
        if ((i11 & 4) != 0) {
            l11 = null;
        }
        if ((i11 & 8) != 0) {
            l12 = null;
        }
        if ((i11 & 16) != 0) {
            j11 = jobInfo.getInitialBackoffMillis();
        }
        if ((i11 & 32) != 0) {
            i5 = jobInfo.getBackoffPolicy();
        }
        if ((i11 & 64) != 0) {
            z11 = false;
        }
        if ((i11 & 128) != 0) {
            function1 = new Function1<PersistableBundle, Unit>() { // from class: io.branch.search.internal.services.model.BranchJobKt.createBuilder.1
                public final void invoke(@NotNull PersistableBundle it) {
                    Intrinsics.g(it, "it");
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj2) {
                    invoke((PersistableBundle) obj2);
                    return Unit.f71706a;
                }
            };
        }
        return createBuilder(jobInfo, l9, bool, l11, l12, j11, i5, z11, function1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long flexOrNull(JobInfo jobInfo) {
        return jobInfo.getFlexMillis();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long getBackoffInitDelay(PersistableBundle persistableBundle) {
        return persistableBundle.getLong(BACKOFF_INIT_DELAY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int getBackoffPolicy(PersistableBundle persistableBundle) {
        return persistableBundle.getInt(BACKOFF_POLICY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long getPeriod(PersistableBundle persistableBundle) {
        return persistableBundle.getLong(PERIOD);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long getPeriodicFlex(PersistableBundle persistableBundle) {
        return persistableBundle.getLong(PERIOD_FLEX);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long getPreferredExecutionTime(PersistableBundle persistableBundle) {
        return persistableBundle.getLong(PREFERRED_EXECUTE_TIME);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean getRequiresBatteryNotLow(PersistableBundle persistableBundle) {
        return persistableBundle.getBoolean(REQUIRES_BATT_NOT_LOW);
    }

    private static final boolean isDeferred(PersistableBundle persistableBundle) {
        return persistableBundle.getBoolean(IS_DEFERRED);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setBackoffIntDelay(PersistableBundle persistableBundle, long j11) {
        persistableBundle.putLong(BACKOFF_INIT_DELAY, j11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setBackoffPolicy(PersistableBundle persistableBundle, int i5) {
        persistableBundle.putInt(BACKOFF_POLICY, i5);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setDeferred(PersistableBundle persistableBundle, boolean z11) {
        persistableBundle.putBoolean(IS_DEFERRED, z11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setPeriod(PersistableBundle persistableBundle, long j11) {
        persistableBundle.putLong(PERIOD, j11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setPeriodicFlex(PersistableBundle persistableBundle, Long l9) {
        if (l9 != null) {
            persistableBundle.putLong(PERIOD_FLEX, l9.longValue());
        }
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setPreferredExecutionTime(PersistableBundle persistableBundle, long j11) {
        persistableBundle.putLong(PREFERRED_EXECUTE_TIME, j11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setRequiresBatteryNotLow(PersistableBundle persistableBundle, boolean z11) {
        persistableBundle.putBoolean(REQUIRES_BATT_NOT_LOW, z11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final PersistableBundle setWasPeriodic(PersistableBundle persistableBundle, boolean z11) {
        persistableBundle.putBoolean(WAS_PERIODIC, z11);
        return persistableBundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean wasPeriodic(PersistableBundle persistableBundle) {
        return persistableBundle.getBoolean(WAS_PERIODIC);
    }

    public static final boolean isDeferred(@NotNull JobInfo jobInfo) {
        Intrinsics.g(jobInfo, "<this>");
        PersistableBundle extras = jobInfo.getExtras();
        Intrinsics.f(extras, "this.extras");
        return isDeferred(extras);
    }
}
