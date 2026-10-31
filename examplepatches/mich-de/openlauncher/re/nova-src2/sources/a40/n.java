package a40;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class n {

    @NotNull
    public static final m Companion = new m();

    /* renamed from: a, reason: collision with root package name */
    public final float f223a;

    /* renamed from: b, reason: collision with root package name */
    public final float f224b;

    public /* synthetic */ n(int i5, float f11, float f12) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, l.f219a.getDescriptor());
        }
        this.f223a = f11;
        this.f224b = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return Float.compare(this.f223a, nVar.f223a) == 0 && Float.compare(this.f224b, nVar.f224b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f224b) + (Float.hashCode(this.f223a) * 31);
    }

    public final String toString() {
        return "AccuWeatherGeoPosition(Latitude=" + this.f223a + ", Longitude=" + this.f224b + ")";
    }
}
