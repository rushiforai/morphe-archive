package wr;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: a, reason: collision with root package name */
    public final c f94639a;

    public /* synthetic */ f(int i5, c cVar) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, d.f94638a.getDescriptor());
        }
        this.f94639a = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f94639a, ((f) obj).f94639a);
    }

    public final int hashCode() {
        return this.f94639a.hashCode();
    }

    public final String toString() {
        return "SynchronizeSessionResponse(manifest=" + this.f94639a + ")";
    }
}
