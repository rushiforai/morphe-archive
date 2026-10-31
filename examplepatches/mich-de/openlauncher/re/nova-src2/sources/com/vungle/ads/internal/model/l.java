package com.vungle.ads.internal.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class l {

    @NotNull
    public static final k Companion = new k();

    /* renamed from: a, reason: collision with root package name */
    public final Double f47076a;

    /* renamed from: b, reason: collision with root package name */
    public final List f47077b;

    /* renamed from: c, reason: collision with root package name */
    public final List f47078c;

    public /* synthetic */ l(int i5, Double d5, List list, List list2) {
        if ((i5 & 1) == 0) {
            this.f47076a = null;
        } else {
            this.f47076a = d5;
        }
        if ((i5 & 2) == 0) {
            this.f47077b = null;
        } else {
            this.f47077b = list;
        }
        if ((i5 & 4) == 0) {
            this.f47078c = null;
        } else {
            this.f47078c = list2;
        }
    }

    public static final void a(l self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47076a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, DoubleSerializer.INSTANCE, self.f47076a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47077b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47077b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47078c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47078c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f47076a, lVar.f47076a) && Intrinsics.b(this.f47077b, lVar.f47077b) && Intrinsics.b(this.f47078c, lVar.f47078c);
    }

    public final int hashCode() {
        Double d5 = this.f47076a;
        int iHashCode = (d5 == null ? 0 : d5.hashCode()) * 31;
        List list = this.f47077b;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        List list2 = this.f47078c;
        return iHashCode2 + (list2 != null ? list2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("CSBResponse(price=");
        sbA.append(this.f47076a);
        sbA.append(", nurls=");
        sbA.append(this.f47077b);
        sbA.append(", lurls=");
        return fq.c.e(sbA, this.f47078c, ')');
    }
}
