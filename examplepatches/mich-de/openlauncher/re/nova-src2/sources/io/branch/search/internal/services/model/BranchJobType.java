package io.branch.search.internal.services.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0002\u0006\u0007R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005\u0082\u0001\u0002\b\t¨\u0006\n"}, d2 = {"Lio/branch/search/internal/services/model/BranchJobType;", b.f42142b, "time", b.f42142b, "getTime", "()J", "Delayed", "Periodic", "Lio/branch/search/internal/services/model/BranchJobType$Delayed;", "Lio/branch/search/internal/services/model/BranchJobType$Periodic;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface BranchJobType {

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lio/branch/search/internal/services/model/BranchJobType$Delayed;", "Lio/branch/search/internal/services/model/BranchJobType;", "time", b.f42142b, "(J)V", "getTime", "()J", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final /* data */ class Delayed implements BranchJobType {
        private final long time;

        public Delayed(long j11) {
            this.time = j11;
        }

        public static /* synthetic */ Delayed copy$default(Delayed delayed, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = delayed.getTime();
            }
            return delayed.copy(j11);
        }

        public final long component1() {
            return getTime();
        }

        @NotNull
        public final Delayed copy(long time) {
            return new Delayed(time);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Delayed) && getTime() == ((Delayed) other).getTime();
        }

        @Override // io.branch.search.internal.services.model.BranchJobType
        public long getTime() {
            return this.time;
        }

        public int hashCode() {
            return Long.hashCode(getTime());
        }

        @NotNull
        public String toString() {
            return "Delayed(time=" + getTime() + ')';
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lio/branch/search/internal/services/model/BranchJobType$Periodic;", "Lio/branch/search/internal/services/model/BranchJobType;", "time", b.f42142b, "(J)V", "getTime", "()J", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final /* data */ class Periodic implements BranchJobType {
        private final long time;

        public Periodic(long j11) {
            this.time = j11;
        }

        public static /* synthetic */ Periodic copy$default(Periodic periodic, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = periodic.getTime();
            }
            return periodic.copy(j11);
        }

        public final long component1() {
            return getTime();
        }

        @NotNull
        public final Periodic copy(long time) {
            return new Periodic(time);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Periodic) && getTime() == ((Periodic) other).getTime();
        }

        @Override // io.branch.search.internal.services.model.BranchJobType
        public long getTime() {
            return this.time;
        }

        public int hashCode() {
            return Long.hashCode(getTime());
        }

        @NotNull
        public String toString() {
            return "Periodic(time=" + getTime() + ')';
        }
    }

    long getTime();
}
