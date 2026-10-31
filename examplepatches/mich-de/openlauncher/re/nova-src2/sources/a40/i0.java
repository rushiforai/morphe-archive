package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class i0 {

    @NotNull
    public static final h0 Companion = new h0();

    /* renamed from: a, reason: collision with root package name */
    public final l0 f206a;

    /* renamed from: b, reason: collision with root package name */
    public final l0 f207b;

    public /* synthetic */ i0(int i5, l0 l0Var, l0 l0Var2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, g0.f201a.getDescriptor());
        }
        this.f206a = l0Var;
        this.f207b = l0Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i0)) {
            return false;
        }
        i0 i0Var = (i0) obj;
        return Intrinsics.b(this.f206a, i0Var.f206a) && Intrinsics.b(this.f207b, i0Var.f207b);
    }

    public final int hashCode() {
        return this.f207b.hashCode() + (this.f206a.hashCode() * 31);
    }

    public final String toString() {
        return "AccuWeatherTemperature(Metric=" + this.f206a + ", Imperial=" + this.f207b + ")";
    }
}
