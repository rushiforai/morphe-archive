package u10;

import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
/* loaded from: classes.dex */
public final class m0 {

    @NotNull
    public static final l0 Companion = new l0();

    /* renamed from: a, reason: collision with root package name */
    public final String f90398a;

    public static String a(String str) {
        return b.c0.l("IntentString(string=", str, ")");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof m0) {
            return Intrinsics.b(this.f90398a, ((m0) obj).f90398a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f90398a.hashCode();
    }

    public final String toString() {
        return a(this.f90398a);
    }
}
