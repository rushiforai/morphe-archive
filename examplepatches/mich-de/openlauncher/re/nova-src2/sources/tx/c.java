package tx;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final String f89670a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89671b;

    public /* synthetic */ c(int i5, String str, String str2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, a.f89642a.getDescriptor());
        }
        this.f89670a = str;
        this.f89671b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f89670a, cVar.f89670a) && Intrinsics.b(this.f89671b, cVar.f89671b);
    }

    public final int hashCode() {
        return this.f89671b.hashCode() + (this.f89670a.hashCode() * 31);
    }

    public final String toString() {
        return b.c0.n("ClientSignInRequest(socialProvider=", this.f89670a, ", socialToken=", this.f89671b, ")");
    }

    public c(String str) {
        this.f89670a = "google";
        this.f89671b = str;
    }
}
