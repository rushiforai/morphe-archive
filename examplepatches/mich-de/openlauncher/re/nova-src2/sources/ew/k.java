package ew;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class k {

    @NotNull
    public static final i Companion = new i();

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer[] f53053b = {new ArrayListSerializer(b.f53038a)};

    /* renamed from: a, reason: collision with root package name */
    public final List f53054a;

    public /* synthetic */ k(int i5, List list) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, h.f53048a.getDescriptor());
        }
        this.f53054a = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k) && Intrinsics.b(this.f53054a, ((k) obj).f53054a);
    }

    public final int hashCode() {
        List list = this.f53054a;
        if (list == null) {
            return 0;
        }
        return list.hashCode();
    }

    public final String toString() {
        return "Place(addressComponents=" + this.f53054a + ")";
    }

    public k(ArrayList arrayList) {
        this.f53054a = arrayList;
    }
}
