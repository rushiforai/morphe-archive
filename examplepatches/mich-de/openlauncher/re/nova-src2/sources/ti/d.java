package ti;

import b.c0;
import b.k9;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0014\u0010\t\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\bR\u0014\u0010\u000b\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\bR\u0014\u0010\u000f\u001a\u00020\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u000eR \u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00060\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0012¨\u0006\u0014"}, d2 = {"Lti/d;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "sequenceNumber", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "I", "priorRequestCount", "c", "priorRequestInSessionCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "d", "J", "timeInSessionMilliseconds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "e", "Ljava/util/Map;", "priorRequestCountByFormat", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class d {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("seq_num")
    @JvmField
    @NotNull
    public final String sequenceNumber;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("preqs")
    @JvmField
    public final int priorRequestCount;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("preqs_in_session")
    @JvmField
    public final int priorRequestInSessionCount;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("time_in_session")
    @JvmField
    public final long timeInSessionMilliseconds;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("preqs_by_format")
    @JvmField
    @NotNull
    public final Map<String, Integer> priorRequestCountByFormat;

    public d(String sequenceNumber, int i5, int i11, long j11, Map map) {
        Intrinsics.g(sequenceNumber, "sequenceNumber");
        this.sequenceNumber = sequenceNumber;
        this.priorRequestCount = i5;
        this.priorRequestInSessionCount = i11;
        this.timeInSessionMilliseconds = j11;
        this.priorRequestCountByFormat = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.sequenceNumber, dVar.sequenceNumber) && this.priorRequestCount == dVar.priorRequestCount && this.priorRequestInSessionCount == dVar.priorRequestInSessionCount && this.timeInSessionMilliseconds == dVar.timeInSessionMilliseconds && Intrinsics.b(this.priorRequestCountByFormat, dVar.priorRequestCountByFormat);
    }

    public final int hashCode() {
        return this.priorRequestCountByFormat.hashCode() + c0.d(k9.b(this.priorRequestInSessionCount, k9.b(this.priorRequestCount, this.sequenceNumber.hashCode() * 31)), 31, this.timeInSessionMilliseconds);
    }

    public final String toString() {
        String str = this.sequenceNumber;
        int i5 = this.priorRequestCount;
        int i11 = this.priorRequestInSessionCount;
        long j11 = this.timeInSessionMilliseconds;
        Map<String, Integer> map = this.priorRequestCountByFormat;
        StringBuilder sbV = c0.v("AppStats(sequenceNumber=", i5, str, ", priorRequestCount=", ", priorRequestInSessionCount=");
        sbV.append(i11);
        sbV.append(", timeInSessionMilliseconds=");
        sbV.append(j11);
        sbV.append(", priorRequestCountByFormat=");
        sbV.append(map);
        sbV.append(")");
        return sbV.toString();
    }
}
