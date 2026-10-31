package io.branch.search.internal.services.storage;

import android.app.job.JobInfo;
import android.content.Context;
import android.os.Build;
import android.os.PersistableBundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3231k8;
import io.branch.search.internal.C3248l8;
import io.branch.search.internal.InterfaceC3244l4;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.storage.ExtraValue;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/storage/JobInfoRaw;", b.f42142b, k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class JobInfoRaw {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion();

    /* renamed from: k, reason: collision with root package name */
    public static final DateTimeFormatter f65786k = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").withZone(ZoneId.systemDefault());

    /* renamed from: a, reason: collision with root package name */
    public final int f65787a;

    /* renamed from: b, reason: collision with root package name */
    public final long f65788b;

    /* renamed from: c, reason: collision with root package name */
    public final long f65789c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f65790d;

    /* renamed from: e, reason: collision with root package name */
    public final long f65791e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f65792f;

    /* renamed from: g, reason: collision with root package name */
    public final long f65793g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f65794h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f65795i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final List<ExtraValue> f65796j;

    @Deprecated
    public /* synthetic */ JobInfoRaw(int i5, int i11, long j11, long j12, boolean z11, long j13, boolean z12, long j14, String str, boolean z13, List list) {
        if (1023 != (i5 & 1023)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1023, JobInfoRaw$$serializer.INSTANCE.getDescriptor());
        }
        this.f65787a = i11;
        this.f65788b = j11;
        this.f65789c = j12;
        this.f65790d = z11;
        this.f65791e = j13;
        this.f65792f = z12;
        this.f65793g = j14;
        this.f65794h = str;
        this.f65795i = z13;
        this.f65796j = list;
    }

    public static JobInfoRaw a(JobInfoRaw jobInfoRaw, long j11, long j12, int i5) {
        int i11 = jobInfoRaw.f65787a;
        long j13 = (i5 & 4) != 0 ? jobInfoRaw.f65789c : j12;
        boolean z11 = jobInfoRaw.f65790d;
        long j14 = jobInfoRaw.f65791e;
        boolean z12 = jobInfoRaw.f65792f;
        long j15 = jobInfoRaw.f65793g;
        String serviceName = jobInfoRaw.f65794h;
        boolean z13 = jobInfoRaw.f65795i;
        List<ExtraValue> extras = jobInfoRaw.f65796j;
        Intrinsics.g(serviceName, "serviceName");
        Intrinsics.g(extras, "extras");
        return new JobInfoRaw(i11, j11, j13, z11, j14, z12, j15, serviceName, z13, extras);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof JobInfoRaw)) {
            return false;
        }
        JobInfoRaw jobInfoRaw = (JobInfoRaw) obj;
        return this.f65787a == jobInfoRaw.f65787a && this.f65788b == jobInfoRaw.f65788b && this.f65789c == jobInfoRaw.f65789c && this.f65790d == jobInfoRaw.f65790d && this.f65791e == jobInfoRaw.f65791e && this.f65792f == jobInfoRaw.f65792f && this.f65793g == jobInfoRaw.f65793g && Intrinsics.b(this.f65794h, jobInfoRaw.f65794h) && this.f65795i == jobInfoRaw.f65795i && Intrinsics.b(this.f65796j, jobInfoRaw.f65796j);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3231k8.a(this.f65789c, C3231k8.a(this.f65788b, Integer.hashCode(this.f65787a) * 31, 31), 31);
        boolean z11 = this.f65790d;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA2 = C3231k8.a(this.f65791e, (iA + i5) * 31, 31);
        boolean z12 = this.f65792f;
        int i11 = z12;
        if (z12 != 0) {
            i11 = 1;
        }
        int iA3 = C3248l8.a(this.f65794h, C3231k8.a(this.f65793g, (iA2 + i11) * 31, 31), 31);
        boolean z13 = this.f65795i;
        return this.f65796j.hashCode() + ((iA3 + (z13 ? 1 : z13 ? 1 : 0)) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("JobInfoRaw(id=");
        sb2.append(this.f65787a);
        sb2.append(", nextRuntime=");
        Companion companion = INSTANCE;
        long j11 = this.f65788b;
        companion.getClass();
        sb2.append(Companion.b(j11));
        sb2.append(", minimumLatency=");
        sb2.append(Companion.a(this.f65789c));
        sb2.append(", periodic=");
        sb2.append(this.f65790d);
        sb2.append(", persisted=");
        sb2.append(this.f65792f);
        sb2.append(", initialBackoff=");
        sb2.append(Companion.a(this.f65793g));
        sb2.append(", serviceName=");
        sb2.append(this.f65794h);
        sb2.append(", extras=");
        sb2.append(this.f65796j);
        sb2.append(")");
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        return string;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JobInfoRaw(int i5, long j11, long j12, boolean z11, long j13, boolean z12, long j14, @NotNull String serviceName, boolean z13, @NotNull List<? extends ExtraValue> extras) {
        Intrinsics.g(serviceName, "serviceName");
        Intrinsics.g(extras, "extras");
        this.f65787a = i5;
        this.f65788b = j11;
        this.f65789c = j12;
        this.f65790d = z11;
        this.f65791e = j13;
        this.f65792f = z12;
        this.f65793g = j14;
        this.f65794h = serviceName;
        this.f65795i = z13;
        this.f65796j = extras;
    }

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\n\u0010\u000bJ\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u0004\u0010\u0005R\u001c\u0010\b\u001a\n \u0007*\u0004\u0018\u00010\u00060\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\t¨\u0006\f"}, d2 = {"Lio/branch/search/internal/services/storage/JobInfoRaw$Companion;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/JobInfoRaw;", "serializer", "()Lkotlinx/serialization/KSerializer;", "Ljava/time/format/DateTimeFormatter;", "kotlin.jvm.PlatformType", "DATE_FORMATTER", "Ljava/time/format/DateTimeFormatter;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        @Nullable
        public static JobInfoRaw a(@NotNull Context context, @NotNull BranchJob branchJob, @NotNull InterfaceC3244l4 clock) {
            int i5;
            long j11;
            ExtraValue stringValue;
            Intrinsics.g(context, "context");
            Intrinsics.g(branchJob, "branchJob");
            Intrinsics.g(clock, "clock");
            String classId = branchJob.getClassId();
            JobInfo deferrableJobInfo = branchJob.getDeferrableJobInfo(context);
            PersistableBundle extras = deferrableJobInfo.getExtras();
            Intrinsics.f(extras, "job.extras");
            int id2 = branchJob.getID();
            long currentTimeMillis = clock.getCurrentTimeMillis() + (deferrableJobInfo.isPeriodic() ? deferrableJobInfo.getIntervalMillis() : deferrableJobInfo.getMinLatencyMillis());
            long intervalMillis = deferrableJobInfo.isPeriodic() ? deferrableJobInfo.getIntervalMillis() : deferrableJobInfo.getMinLatencyMillis();
            boolean zIsPersisted = deferrableJobInfo.isPersisted();
            long flexMillis = deferrableJobInfo.getFlexMillis();
            boolean zIsPeriodic = deferrableJobInfo.isPeriodic();
            long initialBackoffMillis = deferrableJobInfo.getInitialBackoffMillis();
            boolean z11 = Build.VERSION.SDK_INT < 28 ? deferrableJobInfo.getNetworkType() != 0 : !(deferrableJobInfo.getRequiredNetwork() == null && deferrableJobInfo.getNetworkType() == 0);
            Set<String> setKeySet = extras.keySet();
            Intrinsics.f(setKeySet, "extras.keySet()");
            ArrayList arrayList = new ArrayList();
            Iterator it = setKeySet.iterator();
            while (it.hasNext()) {
                String it2 = (String) it.next();
                Iterator it3 = it;
                Object obj = extras.get(it2);
                PersistableBundle persistableBundle = extras;
                if (obj instanceof Integer) {
                    i5 = id2;
                    Intrinsics.f(it2, "it");
                    stringValue = new ExtraValue.IntValue(it2, ((Number) obj).intValue());
                    j11 = currentTimeMillis;
                } else {
                    i5 = id2;
                    if (obj instanceof Long) {
                        Intrinsics.f(it2, "it");
                        j11 = currentTimeMillis;
                        stringValue = new ExtraValue.LongValue(it2, ((Number) obj).longValue());
                    } else {
                        j11 = currentTimeMillis;
                        if (obj instanceof Boolean) {
                            Intrinsics.f(it2, "it");
                            stringValue = new ExtraValue.BooleanValue(it2, ((Boolean) obj).booleanValue());
                        } else if (obj instanceof String) {
                            Intrinsics.f(it2, "it");
                            stringValue = new ExtraValue.StringValue(it2, (String) obj);
                        } else {
                            stringValue = null;
                        }
                    }
                }
                if (stringValue != null) {
                    arrayList.add(stringValue);
                }
                it = it3;
                id2 = i5;
                extras = persistableBundle;
                currentTimeMillis = j11;
            }
            return new JobInfoRaw(id2, currentTimeMillis, intervalMillis, zIsPeriodic, flexMillis, zIsPersisted, initialBackoffMillis, classId, z11, arrayList);
        }

        @NotNull
        public static String b(long j11) {
            String str = JobInfoRaw.f65786k.format(Instant.ofEpochMilli(j11));
            Intrinsics.f(str, "DATE_FORMATTER.format(Instant.ofEpochMilli(this))");
            return str;
        }

        @NotNull
        public final KSerializer<JobInfoRaw> serializer() {
            return JobInfoRaw$$serializer.INSTANCE;
        }

        @NotNull
        public static String a(long j11) {
            if (j11 <= 0) {
                return "0s";
            }
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            long hours = timeUnit.toHours(j11);
            long j12 = 60;
            long minutes = timeUnit.toMinutes(j11) % j12;
            long seconds = timeUnit.toSeconds(j11) % j12;
            StringBuilder sb2 = new StringBuilder();
            if (hours > 0) {
                sb2.append(hours + "h ");
            }
            if (minutes > 0 || hours > 0) {
                sb2.append(minutes + "m ");
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append(seconds);
            sb3.append('s');
            sb2.append(sb3.toString());
            String string = sb2.toString();
            Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
            return r70.k.u1(string).toString();
        }
    }
}
