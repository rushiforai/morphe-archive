package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class o {

    @NotNull
    public static final n Companion = new n();

    /* renamed from: a, reason: collision with root package name */
    public final String f47102a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47103b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f47104c;

    public /* synthetic */ o(int i5, String str, String str2, Integer num) {
        if ((i5 & 1) == 0) {
            this.f47102a = null;
        } else {
            this.f47102a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47103b = null;
        } else {
            this.f47103b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f47104c = null;
        } else {
            this.f47104c = num;
        }
    }

    public static final void a(o self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47102a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47102a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47103b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47103b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47104c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, IntSerializer.INSTANCE, self.f47104c);
    }

    public final String b() {
        return this.f47103b;
    }

    public final String c() {
        return this.f47102a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.f47102a, oVar.f47102a) && Intrinsics.b(this.f47103b, oVar.f47103b) && Intrinsics.b(this.f47104c, oVar.f47104c);
    }

    public final int hashCode() {
        String str = this.f47102a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f47103b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.f47104c;
        return iHashCode2 + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("CacheableReplacement(url=");
        sbA.append(this.f47102a);
        sbA.append(", extension=");
        sbA.append(this.f47103b);
        sbA.append(", downloadPercent=");
        return a2.c.o(sbA, this.f47104c, ')');
    }

    public final Integer a() {
        return this.f47104c;
    }
}
