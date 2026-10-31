package ns;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class d {

    @NotNull
    public static final c Companion = new c();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f78533c = {null, new ArrayListSerializer(StringSerializer.INSTANCE)};

    /* renamed from: a, reason: collision with root package name */
    public final boolean f78534a;

    /* renamed from: b, reason: collision with root package name */
    public final List f78535b;

    public /* synthetic */ d(int i5, List list, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, b.f78532a.getDescriptor());
        }
        this.f78534a = z11;
        this.f78535b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f78534a == dVar.f78534a && Intrinsics.b(this.f78535b, dVar.f78535b);
    }

    public final int hashCode() {
        return this.f78535b.hashCode() + (Boolean.hashCode(this.f78534a) * 31);
    }

    public final String toString() {
        return "CardBrandChoice(eligible=" + this.f78534a + ", preferredNetworks=" + this.f78535b + ")";
    }

    public d(List preferredNetworks, boolean z11) {
        Intrinsics.g(preferredNetworks, "preferredNetworks");
        this.f78534a = z11;
        this.f78535b = preferredNetworks;
    }
}
