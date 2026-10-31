package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f0 {

    @NotNull
    public static final e0 Companion = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final String f199a;

    /* renamed from: b, reason: collision with root package name */
    public final String f200b;

    public /* synthetic */ f0(int i5, String str, String str2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, d0.f193a.getDescriptor());
        }
        this.f199a = str;
        this.f200b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0)) {
            return false;
        }
        f0 f0Var = (f0) obj;
        return Intrinsics.b(this.f199a, f0Var.f199a) && Intrinsics.b(this.f200b, f0Var.f200b);
    }

    public final int hashCode() {
        int iHashCode = this.f199a.hashCode() * 31;
        String str = this.f200b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return b.c0.n("AccuWeatherParentCity(LocalizedName=", this.f199a, ", EnglishName=", this.f200b, ")");
    }
}
