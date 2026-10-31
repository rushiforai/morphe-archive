package io.branch.search.internal;

import io.branch.search.internal.C4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Gd {

    /* renamed from: a, reason: collision with root package name */
    public final long f62532a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62533b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f62534c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f62535d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f62536e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f62537f;

    /* renamed from: g, reason: collision with root package name */
    public final int f62538g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f62539h;

    /* renamed from: i, reason: collision with root package name */
    public final long f62540i;

    /* renamed from: j, reason: collision with root package name */
    public final long f62541j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final List<Ke<? extends Object, ? extends Object>> f62542k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final Ke<? extends Object, ? extends Object> f62543l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final C4.i.d f62544m;

    /* JADX WARN: Multi-variable type inference failed */
    public Gd(long j11, @NotNull String branchKey, boolean z11, @NotNull String clientType, @NotNull String callerId, @NotNull String sessionId, int i5, @Nullable String str, long j12, long j13, @NotNull List<? extends Ke<? extends Object, ? extends Object>> customValues, @NotNull Ke<? extends Object, ? extends Object> trackedApiClick, @NotNull C4.i.d sessionImpressions) {
        Intrinsics.g(branchKey, "branchKey");
        Intrinsics.g(clientType, "clientType");
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(customValues, "customValues");
        Intrinsics.g(trackedApiClick, "trackedApiClick");
        Intrinsics.g(sessionImpressions, "sessionImpressions");
        this.f62532a = j11;
        this.f62533b = branchKey;
        this.f62534c = z11;
        this.f62535d = clientType;
        this.f62536e = callerId;
        this.f62537f = sessionId;
        this.f62538g = i5;
        this.f62539h = str;
        this.f62540i = j12;
        this.f62541j = j13;
        this.f62542k = customValues;
        this.f62543l = trackedApiClick;
        this.f62544m = sessionImpressions;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Gd)) {
            return false;
        }
        Gd gd2 = (Gd) obj;
        return this.f62532a == gd2.f62532a && Intrinsics.b(this.f62533b, gd2.f62533b) && this.f62534c == gd2.f62534c && Intrinsics.b(this.f62535d, gd2.f62535d) && Intrinsics.b(this.f62536e, gd2.f62536e) && Intrinsics.b(this.f62537f, gd2.f62537f) && this.f62538g == gd2.f62538g && Intrinsics.b(this.f62539h, gd2.f62539h) && this.f62540i == gd2.f62540i && this.f62541j == gd2.f62541j && Intrinsics.b(this.f62542k, gd2.f62542k) && Intrinsics.b(this.f62543l, gd2.f62543l) && Intrinsics.b(this.f62544m, gd2.f62544m);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f62533b, Long.hashCode(this.f62532a) * 31, 31);
        boolean z11 = this.f62534c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA2 = C3214j8.a(this.f62538g, C3248l8.a(this.f62537f, C3248l8.a(this.f62536e, C3248l8.a(this.f62535d, (iA + i5) * 31, 31), 31), 31), 31);
        String str = this.f62539h;
        return this.f62544m.hashCode() + ((this.f62543l.hashCode() + C3265m8.a(this.f62542k, C3231k8.a(this.f62541j, C3231k8.a(this.f62540i, (iA2 + (str == null ? 0 : str.hashCode())) * 31, 31), 31), 31)) * 31);
    }

    @NotNull
    public final String toString() {
        return "SessionData(timeStamp=" + this.f62532a + ", branchKey=" + this.f62533b + ", detailedAnalytics=" + this.f62534c + ", clientType=" + this.f62535d + ", callerId=" + this.f62536e + ", sessionId=" + this.f62537f + ", emptySessionCount=" + this.f62538g + ", previousAnalyticsWindowId=" + this.f62539h + ", sdkFirstSeenTimestamp=" + this.f62540i + ", appFirstSeenTimestamp=" + this.f62541j + ", customValues=" + this.f62542k + ", trackedApiClick=" + this.f62543l + ", sessionImpressions=" + this.f62544m + ')';
    }
}
