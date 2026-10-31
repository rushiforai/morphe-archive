package ns;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class l {

    @NotNull
    public static final k Companion = new k();

    /* renamed from: a, reason: collision with root package name */
    public final String f78544a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78545b;

    public /* synthetic */ l(int i5, String str, String str2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, j.f78543a.getDescriptor());
        }
        this.f78544a = str;
        this.f78545b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f78544a, lVar.f78544a) && Intrinsics.b(this.f78545b, lVar.f78545b);
    }

    public final int hashCode() {
        int iHashCode = this.f78544a.hashCode() * 31;
        String str = this.f78545b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.n("MerchantInfo(businessName=", this.f78544a, ", country=", this.f78545b, ")");
    }

    public l(String businessName, String str) {
        Intrinsics.g(businessName, "businessName");
        this.f78544a = businessName;
        this.f78545b = str;
    }
}
