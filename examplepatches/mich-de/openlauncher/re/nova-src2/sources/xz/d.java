package xz;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class d {

    @NotNull
    public static final c Companion = new c();

    /* renamed from: a, reason: collision with root package name */
    public final String f96484a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f96485b;

    public /* synthetic */ d(int i5, String str, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, b.f96483a.getDescriptor());
        }
        this.f96484a = str;
        this.f96485b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f96484a, dVar.f96484a) && this.f96485b == dVar.f96485b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f96485b) + (this.f96484a.hashCode() * 31);
    }

    public final String toString() {
        return "MediaLiteDismissedState(packageName=" + this.f96484a + ", isPlaying=" + this.f96485b + ")";
    }

    public d(String str, boolean z11) {
        this.f96484a = str;
        this.f96485b = z11;
    }
}
