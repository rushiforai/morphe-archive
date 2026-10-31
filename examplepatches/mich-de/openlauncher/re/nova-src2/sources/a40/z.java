package a40;

import b.u4;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class z {

    @NotNull
    public static final y Companion = new y();

    /* renamed from: a, reason: collision with root package name */
    public final int f246a;

    /* renamed from: b, reason: collision with root package name */
    public final int f247b;

    /* renamed from: c, reason: collision with root package name */
    public final int f248c;

    public /* synthetic */ z(int i5, int i11, int i12, int i13) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, x.f245a.getDescriptor());
        }
        this.f246a = i11;
        this.f247b = i12;
        this.f248c = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return this.f246a == zVar.f246a && this.f247b == zVar.f247b && this.f248c == zVar.f248c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f248c) + u4.a(this.f247b, Integer.hashCode(this.f246a) * 31, 31);
    }

    public final String toString() {
        return b.c0.o(b.c0.t(this.f246a, "AccuWeatherMinutecastChildSummary(StartMinute=", ", EndMinute=", this.f247b, ", TypeId="), this.f248c, ")");
    }
}
