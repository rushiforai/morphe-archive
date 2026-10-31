package k30;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: h, reason: collision with root package name */
    public static final c f70909h = new c("AUTO", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0.0f, 0.0f, false);

    /* renamed from: a, reason: collision with root package name */
    public final String f70910a;

    /* renamed from: b, reason: collision with root package name */
    public final String f70911b;

    /* renamed from: c, reason: collision with root package name */
    public final String f70912c;

    /* renamed from: d, reason: collision with root package name */
    public final String f70913d;

    /* renamed from: e, reason: collision with root package name */
    public final float f70914e;

    /* renamed from: f, reason: collision with root package name */
    public final float f70915f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f70916g;

    public /* synthetic */ c(int i5, String str, String str2, String str3, String str4, float f11, float f12, boolean z11) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, a.f70903a.getDescriptor());
        }
        this.f70910a = str;
        this.f70911b = str2;
        this.f70912c = str3;
        this.f70913d = str4;
        if ((i5 & 16) == 0) {
            this.f70914e = 0.0f;
        } else {
            this.f70914e = f11;
        }
        if ((i5 & 32) == 0) {
            this.f70915f = 0.0f;
        } else {
            this.f70915f = f12;
        }
        if ((i5 & 64) == 0) {
            this.f70916g = false;
        } else {
            this.f70916g = z11;
        }
    }

    public final String a() {
        String str = this.f70911b;
        String str2 = this.f70912c;
        boolean zB = Intrinsics.b(str, str2);
        String str3 = this.f70913d;
        if (zB) {
            return u4.m(str, ", ", str3);
        }
        return str + ", " + str2 + ", " + str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f70910a, cVar.f70910a) && Intrinsics.b(this.f70911b, cVar.f70911b) && Intrinsics.b(this.f70912c, cVar.f70912c) && Intrinsics.b(this.f70913d, cVar.f70913d) && Float.compare(this.f70914e, cVar.f70914e) == 0 && Float.compare(this.f70915f, cVar.f70915f) == 0 && this.f70916g == cVar.f70916g;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f70916g) + a80.m.d(this.f70915f, a80.m.d(this.f70914e, b.c0.e(b.c0.e(b.c0.e(this.f70910a.hashCode() * 31, 31, this.f70911b), 31, this.f70912c), 31, this.f70913d), 31), 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("LocationForWeather(key=", this.f70910a, ", cityName=", this.f70911b, ", state=");
        b.c0.D(sbW, this.f70912c, ", countryId=", this.f70913d, ", latitude=");
        sbW.append(this.f70914e);
        sbW.append(", longitude=");
        sbW.append(this.f70915f);
        sbW.append(", canMinutecast=");
        return a80.m.k(sbW, this.f70916g, ")");
    }

    public /* synthetic */ c(String str, String str2, String str3, String str4) {
        this(str, str2, str3, str4, 0.0f, 0.0f, false);
    }

    public c(String str, String str2, String str3, String str4, float f11, float f12, boolean z11) {
        this.f70910a = str;
        this.f70911b = str2;
        this.f70912c = str3;
        this.f70913d = str4;
        this.f70914e = f11;
        this.f70915f = f12;
        this.f70916g = z11;
    }
}
