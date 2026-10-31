package en;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class h {

    @NotNull
    public static final g Companion = new g();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f52831a;

    /* renamed from: b, reason: collision with root package name */
    public final Double f52832b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f52833c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f52834d;

    /* renamed from: e, reason: collision with root package name */
    public final Long f52835e;

    public /* synthetic */ h(int i5, Boolean bool, Double d5, Integer num, Integer num2, Long l9) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, f.f52830a.getDescriptor());
        }
        this.f52831a = bool;
        this.f52832b = d5;
        this.f52833c = num;
        this.f52834d = num2;
        this.f52835e = l9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f52831a, hVar.f52831a) && Intrinsics.b(this.f52832b, hVar.f52832b) && Intrinsics.b(this.f52833c, hVar.f52833c) && Intrinsics.b(this.f52834d, hVar.f52834d) && Intrinsics.b(this.f52835e, hVar.f52835e);
    }

    public final int hashCode() {
        Boolean bool = this.f52831a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Double d5 = this.f52832b;
        int iHashCode2 = (iHashCode + (d5 == null ? 0 : d5.hashCode())) * 31;
        Integer num = this.f52833c;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f52834d;
        int iHashCode4 = (iHashCode3 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Long l9 = this.f52835e;
        return iHashCode4 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        return "SessionConfigs(sessionsEnabled=" + this.f52831a + ", sessionSamplingRate=" + this.f52832b + ", sessionTimeoutSeconds=" + this.f52833c + ", cacheDurationSeconds=" + this.f52834d + ", cacheUpdatedTimeSeconds=" + this.f52835e + ')';
    }

    public h(Boolean bool, Double d5, Integer num, Integer num2, Long l9) {
        this.f52831a = bool;
        this.f52832b = d5;
        this.f52833c = num;
        this.f52834d = num2;
        this.f52835e = l9;
    }
}
