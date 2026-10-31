package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class l0 {

    @NotNull
    public static final k0 Companion = new k0();

    /* renamed from: a, reason: collision with root package name */
    public final float f220a;

    /* renamed from: b, reason: collision with root package name */
    public final String f221b;

    /* renamed from: c, reason: collision with root package name */
    public final int f222c;

    public /* synthetic */ l0(int i5, int i11, String str, float f11) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, j0.f208a.getDescriptor());
        }
        this.f220a = f11;
        this.f221b = str;
        this.f222c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return Float.compare(this.f220a, l0Var.f220a) == 0 && Intrinsics.b(this.f221b, l0Var.f221b) && this.f222c == l0Var.f222c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f222c) + b.c0.e(Float.hashCode(this.f220a) * 31, 31, this.f221b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AccuWeatherTemperatureData(Value=");
        sb2.append(this.f220a);
        sb2.append(", Unit=");
        sb2.append(this.f221b);
        sb2.append(", UnitType=");
        return b.c0.o(sb2, this.f222c, ")");
    }
}
