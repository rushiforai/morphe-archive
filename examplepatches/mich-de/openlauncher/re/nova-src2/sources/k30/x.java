package k30;

import com.amplitude.eventbridge.EventBridgeChannel;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class x {

    @NotNull
    public static final w Companion = new w();

    /* renamed from: k, reason: collision with root package name */
    public static final KSerializer[] f71081k = {null, null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.WeatherCondition", u.values()), EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.TimeOfDay", s.values()), EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.MoonPhase", d.values()), null, null, null, null, null};

    /* renamed from: l, reason: collision with root package name */
    public static final x f71082l = new x(Float.MIN_VALUE, Float.MIN_VALUE, u.f71063c, s.f71058b, d.f70924g, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0, 0);

    /* renamed from: a, reason: collision with root package name */
    public final float f71083a;

    /* renamed from: b, reason: collision with root package name */
    public final float f71084b;

    /* renamed from: c, reason: collision with root package name */
    public final u f71085c;

    /* renamed from: d, reason: collision with root package name */
    public final s f71086d;

    /* renamed from: e, reason: collision with root package name */
    public final d f71087e;

    /* renamed from: f, reason: collision with root package name */
    public final String f71088f;

    /* renamed from: g, reason: collision with root package name */
    public final long f71089g;

    /* renamed from: h, reason: collision with root package name */
    public final long f71090h;

    /* renamed from: i, reason: collision with root package name */
    public final String f71091i;

    /* renamed from: j, reason: collision with root package name */
    public final k0 f71092j;

    public /* synthetic */ x(int i5, float f11, float f12, u uVar, s sVar, d dVar, String str, long j11, long j12, String str2, k0 k0Var) {
        if (255 != (i5 & 255)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 255, v.f71080a.getDescriptor());
        }
        this.f71083a = f11;
        this.f71084b = f12;
        this.f71085c = uVar;
        this.f71086d = sVar;
        this.f71087e = dVar;
        this.f71088f = str;
        this.f71089g = j11;
        this.f71090h = j12;
        if ((i5 & 256) == 0) {
            this.f71091i = null;
        } else {
            this.f71091i = str2;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f71092j = null;
        } else {
            this.f71092j = k0Var;
        }
    }

    public final boolean a() {
        return this.f71090h > 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Float.compare(this.f71083a, xVar.f71083a) == 0 && Float.compare(this.f71084b, xVar.f71084b) == 0 && this.f71085c == xVar.f71085c && this.f71086d == xVar.f71086d && this.f71087e == xVar.f71087e && Intrinsics.b(this.f71088f, xVar.f71088f) && this.f71089g == xVar.f71089g && this.f71090h == xVar.f71090h && Intrinsics.b(this.f71091i, xVar.f71091i) && Intrinsics.b(this.f71092j, xVar.f71092j);
    }

    public final int hashCode() {
        int iD = b.c0.d(b.c0.d(b.c0.e((this.f71087e.hashCode() + ((this.f71086d.hashCode() + ((this.f71085c.hashCode() + a80.m.d(this.f71084b, Float.hashCode(this.f71083a) * 31, 31)) * 31)) * 31)) * 31, 31, this.f71088f), 31, this.f71089g), 31, this.f71090h);
        String str = this.f71091i;
        int iHashCode = (iD + (str == null ? 0 : str.hashCode())) * 31;
        k0 k0Var = this.f71092j;
        return iHashCode + (k0Var != null ? k0Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WeatherData(temp=");
        sb2.append(this.f71083a);
        sb2.append(", realFeel=");
        sb2.append(this.f71084b);
        sb2.append(", condition=");
        sb2.append(this.f71085c);
        sb2.append(", timeOfDay=");
        sb2.append(this.f71086d);
        sb2.append(", moonPhase=");
        sb2.append(this.f71087e);
        sb2.append(", location=");
        sb2.append(this.f71088f);
        sb2.append(", serverTimestampMs=");
        sb2.append(this.f71089g);
        b.c0.B(sb2, ", fetchedTimestampMs=", this.f71090h, ", url=");
        sb2.append(this.f71091i);
        sb2.append(", pending=");
        sb2.append(this.f71092j);
        sb2.append(")");
        return sb2.toString();
    }

    public /* synthetic */ x(float f11, float f12, u uVar, s sVar, d dVar, String str, long j11, long j12) {
        this(f11, f12, uVar, sVar, dVar, str, j11, j12, null, null);
    }

    public x(float f11, float f12, u uVar, s sVar, d dVar, String str, long j11, long j12, String str2, k0 k0Var) {
        this.f71083a = f11;
        this.f71084b = f12;
        this.f71085c = uVar;
        this.f71086d = sVar;
        this.f71087e = dVar;
        this.f71088f = str;
        this.f71089g = j11;
        this.f71090h = j12;
        this.f71091i = str2;
        this.f71092j = k0Var;
    }
}
