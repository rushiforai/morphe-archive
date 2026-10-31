package e20;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class k {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: e, reason: collision with root package name */
    public static final KSerializer[] f52038e = {new ArrayListSerializer(jx.g.f70412a), null, u10.e0.Companion.serializer(), null};

    /* renamed from: a, reason: collision with root package name */
    public final List f52039a;

    /* renamed from: b, reason: collision with root package name */
    public final String f52040b;

    /* renamed from: c, reason: collision with root package name */
    public final u10.e0 f52041c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f52042d;

    public /* synthetic */ k(int i5, List list, String str, u10.e0 e0Var, boolean z11) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, i.f52030a.getDescriptor());
        }
        this.f52039a = list;
        this.f52040b = str;
        this.f52041c = e0Var;
        if ((i5 & 8) == 0) {
            this.f52042d = true;
        } else {
            this.f52042d = z11;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f52039a, kVar.f52039a) && Intrinsics.b(this.f52040b, kVar.f52040b) && Intrinsics.b(this.f52041c, kVar.f52041c) && this.f52042d == kVar.f52042d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f52042d) + ((this.f52041c.hashCode() + b.c0.e(this.f52039a.hashCode() * 31, 31, this.f52040b)) * 31);
    }

    public final String toString() {
        return "CardRecord(conditionIds=" + this.f52039a + ", cardId=" + this.f52040b + ", card=" + this.f52041c + ", conditionsEnabled=" + this.f52042d + ")";
    }

    public k(List list, String str, u10.e0 e0Var, boolean z11) {
        this.f52039a = list;
        this.f52040b = str;
        this.f52041c = e0Var;
        this.f52042d = z11;
    }
}
