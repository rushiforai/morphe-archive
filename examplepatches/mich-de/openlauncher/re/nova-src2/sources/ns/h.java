package ns;

import b.c0;
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
    public final String f78537a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78538b;

    public /* synthetic */ h(int i5, String str, String str2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, f.f78536a.getDescriptor());
        }
        this.f78537a = str;
        this.f78538b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f78537a, hVar.f78537a) && Intrinsics.b(this.f78538b, hVar.f78538b);
    }

    public final int hashCode() {
        String str = this.f78537a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f78538b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.n("CustomerInfo(email=", this.f78537a, ", country=", this.f78538b, ")");
    }

    public h(String str, String str2) {
        this.f78537a = str;
        this.f78538b = str2;
    }
}
