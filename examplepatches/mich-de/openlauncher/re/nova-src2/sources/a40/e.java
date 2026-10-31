package a40;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class e {

    @NotNull
    public static final d Companion = new d();

    /* renamed from: a, reason: collision with root package name */
    public final String f194a;

    /* renamed from: b, reason: collision with root package name */
    public final int f195b;

    /* renamed from: c, reason: collision with root package name */
    public final String f196c;

    /* renamed from: d, reason: collision with root package name */
    public final String f197d;

    public /* synthetic */ e(int i5, String str, String str2, int i11, String str3) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, c.f190a.getDescriptor());
        }
        this.f194a = str;
        this.f195b = i11;
        this.f196c = str2;
        this.f197d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f194a, eVar.f194a) && this.f195b == eVar.f195b && Intrinsics.b(this.f196c, eVar.f196c) && Intrinsics.b(this.f197d, eVar.f197d);
    }

    public final int hashCode() {
        return this.f197d.hashCode() + b.c0.e(u4.a(this.f195b, this.f194a.hashCode() * 31, 31), 31, this.f196c);
    }

    public final String toString() {
        return b.c0.s(b.c0.v("AccuWeatherAlert(Category=", this.f195b, this.f194a, ", Priority=", ", Type="), this.f196c, ", TypeID=", this.f197d, ")");
    }
}
