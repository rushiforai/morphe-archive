package k30;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class k0 {

    @NotNull
    public static final j0 Companion = new j0();

    /* renamed from: e, reason: collision with root package name */
    public static final KSerializer[] f71004e = {EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.WeatherCondition", u.values()), null, null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.TimeOfDay", s.values())};

    /* renamed from: a, reason: collision with root package name */
    public final u f71005a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71006b;

    /* renamed from: c, reason: collision with root package name */
    public final String f71007c;

    /* renamed from: d, reason: collision with root package name */
    public final s f71008d;

    public /* synthetic */ k0(int i5, u uVar, long j11, String str, s sVar) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, i0.f70992a.getDescriptor());
        }
        this.f71005a = uVar;
        this.f71006b = j11;
        this.f71007c = str;
        if ((i5 & 8) == 0) {
            this.f71008d = null;
        } else {
            this.f71008d = sVar;
        }
    }

    public final long a() {
        return this.f71006b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k0)) {
            return false;
        }
        k0 k0Var = (k0) obj;
        return this.f71005a == k0Var.f71005a && this.f71006b == k0Var.f71006b && Intrinsics.b(this.f71007c, k0Var.f71007c) && this.f71008d == k0Var.f71008d;
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.d(this.f71005a.hashCode() * 31, 31, this.f71006b), 31, this.f71007c);
        s sVar = this.f71008d;
        return iE + (sVar == null ? 0 : sVar.hashCode());
    }

    public final String toString() {
        return "WeatherPendingCondition(condition=" + this.f71005a + ", time=" + this.f71006b + ", url=" + this.f71007c + ", timeOfDay=" + this.f71008d + ")";
    }

    public k0(u uVar, long j11, String str, s sVar) {
        this.f71005a = uVar;
        this.f71006b = j11;
        this.f71007c = str;
        this.f71008d = sVar;
    }
}
