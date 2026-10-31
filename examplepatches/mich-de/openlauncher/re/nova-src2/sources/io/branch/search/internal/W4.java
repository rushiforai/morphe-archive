package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class W4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63560a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f63561b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f63562c;

    /* renamed from: d, reason: collision with root package name */
    public final long f63563d;

    public W4(@NotNull String date, @NotNull String channel, @NotNull String connectionType, long j11) {
        Intrinsics.g(date, "date");
        Intrinsics.g(channel, "channel");
        Intrinsics.g(connectionType, "connectionType");
        this.f63560a = date;
        this.f63561b = channel;
        this.f63562c = connectionType;
        this.f63563d = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof W4)) {
            return false;
        }
        W4 w42 = (W4) obj;
        return Intrinsics.b(this.f63560a, w42.f63560a) && Intrinsics.b(this.f63561b, w42.f63561b) && Intrinsics.b(this.f63562c, w42.f63562c) && this.f63563d == w42.f63563d;
    }

    public final int hashCode() {
        return Long.hashCode(this.f63563d) + C3248l8.a(this.f63562c, C3248l8.a(this.f63561b, this.f63560a.hashCode() * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DataUsage(date=");
        sb2.append(this.f63560a);
        sb2.append(", channel=");
        sb2.append(this.f63561b);
        sb2.append(", connectionType=");
        sb2.append(this.f63562c);
        sb2.append(", usage=");
        return C3380t5.a(sb2, this.f63563d, ')');
    }
}
