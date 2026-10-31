package com.amplitude.core.network;

import a2.c;
import b.u4;
import b70.g;
import com.amplitude.core.network.NetworkTrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Deprecated
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0006\b\u0087\b\u0018\u0000 \u001d2\u00020\u0001:\u0002\u001c\u001dB-\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJ\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J3\u0010\u0014\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\b2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\u000e\u0010\u0019\u001a\u00020\b2\u0006\u0010\u001a\u001a\u00020\u0006J\t\u0010\u001b\u001a\u00020\u0006HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000b¨\u0006\u001e"}, d2 = {"Lcom/amplitude/core/network/NetworkTrackingOptions;", b.f42142b, "captureRules", b.f42142b, "Lcom/amplitude/core/network/NetworkTrackingOptions$CaptureRule;", "ignoreHosts", b.f42142b, "ignoreAmplitudeRequests", b.f42142b, "(Ljava/util/List;Ljava/util/List;Z)V", "getCaptureRules", "()Ljava/util/List;", "getIgnoreAmplitudeRequests", "()Z", "ignoreHostMatcher", "Lcom/amplitude/core/network/HostMatcher;", "getIgnoreHosts", "component1", "component2", "component3", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "shouldIgnore", "host", "toString", "CaptureRule", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final /* data */ class NetworkTrackingOptions {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Lazy<NetworkTrackingOptions> DEFAULT$delegate = LazyKt.a(new Function0<NetworkTrackingOptions>() { // from class: com.amplitude.core.network.NetworkTrackingOptions$Companion$DEFAULT$2
        @Override // kotlin.jvm.functions.Function0
        @NotNull
        public final NetworkTrackingOptions invoke() {
            return new NetworkTrackingOptions(ul.b.P(new NetworkTrackingOptions.CaptureRule(ul.b.P("*"), null, 2, null)), null, false, 6, null);
        }
    });

    @NotNull
    private final List<CaptureRule> captureRules;
    private final boolean ignoreAmplitudeRequests;

    @NotNull
    private final HostMatcher ignoreHostMatcher;

    @NotNull
    private final List<String> ignoreHosts;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001b\u0010\u0003\u001a\u00020\u00048FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\t"}, d2 = {"Lcom/amplitude/core/network/NetworkTrackingOptions$Companion;", b.f42142b, "()V", "DEFAULT", "Lcom/amplitude/core/network/NetworkTrackingOptions;", "getDEFAULT", "()Lcom/amplitude/core/network/NetworkTrackingOptions;", "DEFAULT$delegate", "Lkotlin/Lazy;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final NetworkTrackingOptions getDEFAULT() {
            return (NetworkTrackingOptions) NetworkTrackingOptions.DEFAULT$delegate.getValue();
        }

        private Companion() {
        }
    }

    public NetworkTrackingOptions(@NotNull List<CaptureRule> captureRules, @NotNull List<String> ignoreHosts, boolean z11) {
        Intrinsics.g(captureRules, "captureRules");
        Intrinsics.g(ignoreHosts, "ignoreHosts");
        this.captureRules = captureRules;
        this.ignoreHosts = ignoreHosts;
        this.ignoreAmplitudeRequests = z11;
        List<CaptureRule> list = captureRules;
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                if (((CaptureRule) it.next()).getHosts().isEmpty()) {
                    throw new IllegalArgumentException("Capture rules must have a non-empty host list.");
                }
            }
        }
        List<CaptureRule> list2 = this.captureRules;
        if (!(list2 instanceof Collection) || !list2.isEmpty()) {
            Iterator<T> it2 = list2.iterator();
            while (it2.hasNext()) {
                if (((CaptureRule) it2.next()).getStatusCodeRange().isEmpty()) {
                    throw new IllegalArgumentException("Capture rules must have a non-empty status code range.");
                }
            }
        }
        this.ignoreHostMatcher = new HostMatcher(this.ignoreHosts);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ NetworkTrackingOptions copy$default(NetworkTrackingOptions networkTrackingOptions, List list, List list2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = networkTrackingOptions.captureRules;
        }
        if ((i5 & 2) != 0) {
            list2 = networkTrackingOptions.ignoreHosts;
        }
        if ((i5 & 4) != 0) {
            z11 = networkTrackingOptions.ignoreAmplitudeRequests;
        }
        return networkTrackingOptions.copy(list, list2, z11);
    }

    @NotNull
    public final List<CaptureRule> component1() {
        return this.captureRules;
    }

    @NotNull
    public final List<String> component2() {
        return this.ignoreHosts;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getIgnoreAmplitudeRequests() {
        return this.ignoreAmplitudeRequests;
    }

    @NotNull
    public final NetworkTrackingOptions copy(@NotNull List<CaptureRule> captureRules, @NotNull List<String> ignoreHosts, boolean ignoreAmplitudeRequests) {
        Intrinsics.g(captureRules, "captureRules");
        Intrinsics.g(ignoreHosts, "ignoreHosts");
        return new NetworkTrackingOptions(captureRules, ignoreHosts, ignoreAmplitudeRequests);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NetworkTrackingOptions)) {
            return false;
        }
        NetworkTrackingOptions networkTrackingOptions = (NetworkTrackingOptions) other;
        return Intrinsics.b(this.captureRules, networkTrackingOptions.captureRules) && Intrinsics.b(this.ignoreHosts, networkTrackingOptions.ignoreHosts) && this.ignoreAmplitudeRequests == networkTrackingOptions.ignoreAmplitudeRequests;
    }

    @NotNull
    public final List<CaptureRule> getCaptureRules() {
        return this.captureRules;
    }

    public final boolean getIgnoreAmplitudeRequests() {
        return this.ignoreAmplitudeRequests;
    }

    @NotNull
    public final List<String> getIgnoreHosts() {
        return this.ignoreHosts;
    }

    public int hashCode() {
        return Boolean.hashCode(this.ignoreAmplitudeRequests) + u4.c(this.captureRules.hashCode() * 31, 31, this.ignoreHosts);
    }

    public final boolean shouldIgnore(@NotNull String host) {
        Intrinsics.g(host, "host");
        return this.ignoreHostMatcher.matches(host);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("NetworkTrackingOptions(captureRules=");
        sb2.append(this.captureRules);
        sb2.append(", ignoreHosts=");
        sb2.append(this.ignoreHosts);
        sb2.append(", ignoreAmplitudeRequests=");
        return c.p(sb2, this.ignoreAmplitudeRequests, ')');
    }

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\u0002\u0010\u0007J\u000f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0006HÖ\u0001J\u000e\u0010\u0014\u001a\u00020\u00112\u0006\u0010\u0015\u001a\u00020\u0004J\t\u0010\u0016\u001a\u00020\u0004HÖ\u0001R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/amplitude/core/network/NetworkTrackingOptions$CaptureRule;", b.f42142b, "hosts", b.f42142b, b.f42142b, "statusCodeRange", b.f42142b, "(Ljava/util/List;Ljava/util/List;)V", "hostMatcher", "Lcom/amplitude/core/network/HostMatcher;", "getHosts", "()Ljava/util/List;", "getStatusCodeRange", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "matches", "host", "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class CaptureRule {

        @NotNull
        private final HostMatcher hostMatcher;

        @NotNull
        private final List<String> hosts;

        @NotNull
        private final List<Integer> statusCodeRange;

        public CaptureRule(@NotNull List<String> hosts, @NotNull List<Integer> statusCodeRange) {
            Intrinsics.g(hosts, "hosts");
            Intrinsics.g(statusCodeRange, "statusCodeRange");
            this.hosts = hosts;
            this.statusCodeRange = statusCodeRange;
            this.hostMatcher = new HostMatcher(hosts);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ CaptureRule copy$default(CaptureRule captureRule, List list, List list2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                list = captureRule.hosts;
            }
            if ((i5 & 2) != 0) {
                list2 = captureRule.statusCodeRange;
            }
            return captureRule.copy(list, list2);
        }

        @NotNull
        public final List<String> component1() {
            return this.hosts;
        }

        @NotNull
        public final List<Integer> component2() {
            return this.statusCodeRange;
        }

        @NotNull
        public final CaptureRule copy(@NotNull List<String> hosts, @NotNull List<Integer> statusCodeRange) {
            Intrinsics.g(hosts, "hosts");
            Intrinsics.g(statusCodeRange, "statusCodeRange");
            return new CaptureRule(hosts, statusCodeRange);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CaptureRule)) {
                return false;
            }
            CaptureRule captureRule = (CaptureRule) other;
            return Intrinsics.b(this.hosts, captureRule.hosts) && Intrinsics.b(this.statusCodeRange, captureRule.statusCodeRange);
        }

        @NotNull
        public final List<String> getHosts() {
            return this.hosts;
        }

        @NotNull
        public final List<Integer> getStatusCodeRange() {
            return this.statusCodeRange;
        }

        public int hashCode() {
            return this.statusCodeRange.hashCode() + (this.hosts.hashCode() * 31);
        }

        public final boolean matches(@NotNull String host) {
            Intrinsics.g(host, "host");
            return this.hostMatcher.matches(host);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("CaptureRule(hosts=");
            sb2.append(this.hosts);
            sb2.append(", statusCodeRange=");
            return fq.c.e(sb2, this.statusCodeRange, ')');
        }

        public CaptureRule(List list, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(list, (i5 & 2) != 0 ? g.I1(new IntRange(500, 599, 1)) : list2);
        }
    }

    public NetworkTrackingOptions(List list, List list2, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, (i5 & 2) != 0 ? EmptyList.f71733a : list2, (i5 & 4) != 0 ? true : z11);
    }
}
