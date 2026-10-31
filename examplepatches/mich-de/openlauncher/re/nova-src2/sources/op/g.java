package op;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class g {

    @NotNull
    public static final f Companion = new f();

    /* renamed from: a, reason: collision with root package name */
    public int f80554a;

    /* renamed from: b, reason: collision with root package name */
    public int f80555b;

    public /* synthetic */ g(int i5, int i11, int i12) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, e.f80553a.getDescriptor());
        }
        this.f80554a = i11;
        this.f80555b = i12;
    }

    public static final /* synthetic */ void d(g gVar, CompositeEncoder compositeEncoder, SerialDescriptor serialDescriptor) {
        compositeEncoder.encodeIntElement(serialDescriptor, 0, gVar.f80554a);
        compositeEncoder.encodeIntElement(serialDescriptor, 1, gVar.f80555b);
    }

    public final void a(g update) {
        Intrinsics.g(update, "update");
        this.f80554a += update.f80554a;
        this.f80555b += update.f80555b;
    }

    public final int b() {
        return this.f80554a;
    }

    public final int c() {
        return this.f80555b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f80554a == gVar.f80554a && this.f80555b == gVar.f80555b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f80555b) + (Integer.hashCode(this.f80554a) * 31);
    }

    public final String toString() {
        return c1.n(this.f80554a, "FolderEdits(added=", ", deleted=", this.f80555b, ")");
    }

    public g(int i5, int i11) {
        this.f80554a = i5;
        this.f80555b = i11;
    }
}
