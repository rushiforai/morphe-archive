package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class h {

    @NotNull
    public static final g Companion = new g();

    /* renamed from: a, reason: collision with root package name */
    public final String f202a;

    /* renamed from: b, reason: collision with root package name */
    public final String f203b;

    /* renamed from: c, reason: collision with root package name */
    public final String f204c;

    public /* synthetic */ h(int i5, String str, String str2, String str3) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, f.f198a.getDescriptor());
        }
        this.f202a = str;
        this.f203b = str2;
        if ((i5 & 4) == 0) {
            this.f204c = null;
        } else {
            this.f204c = str3;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f202a, hVar.f202a) && Intrinsics.b(this.f203b, hVar.f203b) && Intrinsics.b(this.f204c, hVar.f204c);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f202a.hashCode() * 31, 31, this.f203b);
        String str = this.f204c;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return b.c0.q(b.c0.w("AccuWeatherArea(ID=", this.f202a, ", LocalizedName=", this.f203b, ", EnglishName="), this.f204c, ")");
    }
}
