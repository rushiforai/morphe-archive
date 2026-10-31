package bn;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes3.dex */
public final class z {

    @NotNull
    public static final y Companion = new y();

    /* renamed from: a, reason: collision with root package name */
    public final int f18316a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18317b;

    public /* synthetic */ z(int i5, int i11, String str) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, x.f18307a.getDescriptor());
        }
        this.f18316a = i11;
        this.f18317b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return this.f18316a == zVar.f18316a && Intrinsics.b(this.f18317b, zVar.f18317b);
    }

    public final int hashCode() {
        return this.f18317b.hashCode() + (Integer.hashCode(this.f18316a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ProcessData(pid=");
        sb2.append(this.f18316a);
        sb2.append(", uuid=");
        return h6.c1.t(sb2, this.f18317b, ')');
    }

    public z(int i5, String uuid) {
        Intrinsics.g(uuid, "uuid");
        this.f18316a = i5;
        this.f18317b = uuid;
    }
}
