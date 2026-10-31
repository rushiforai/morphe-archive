package e20;

import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
/* loaded from: classes.dex */
public final class h {

    @NotNull
    public static final g Companion = new g();

    /* renamed from: a, reason: collision with root package name */
    public final String f52026a;

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return Intrinsics.b(this.f52026a, ((h) obj).f52026a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f52026a.hashCode();
    }

    public final String toString() {
        return this.f52026a;
    }
}
