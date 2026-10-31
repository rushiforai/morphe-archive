package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class c0 {

    @NotNull
    public static final b0 Companion = new b0();

    /* renamed from: a, reason: collision with root package name */
    public final String f191a;

    /* renamed from: b, reason: collision with root package name */
    public final int f192b;

    public /* synthetic */ c0(int i5, String str, int i11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, a0.f188a.getDescriptor());
        }
        this.f191a = str;
        this.f192b = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return Intrinsics.b(this.f191a, c0Var.f191a) && this.f192b == c0Var.f192b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f192b) + (this.f191a.hashCode() * 31);
    }

    public final String toString() {
        return "AccuWeatherMinutecastSummary(Phrase=" + this.f191a + ", TypeId=" + this.f192b + ")";
    }

    public c0() {
        this.f191a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f192b = 0;
    }
}
