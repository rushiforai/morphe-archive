package com.vungle.ads.internal.model;

import b.c9;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class v {

    @NotNull
    public static final u Companion = new u();

    /* renamed from: a, reason: collision with root package name */
    public final Map f47164a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f47165b;

    public /* synthetic */ v(int i5, Map map, Map map2) {
        if ((i5 & 1) == 0) {
            this.f47164a = null;
        } else {
            this.f47164a = map;
        }
        if ((i5 & 2) == 0) {
            this.f47165b = null;
        } else {
            this.f47165b = map2;
        }
    }

    public static final void a(v self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47164a != null) {
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            output.encodeNullableSerializableElement(serialDesc, 0, new LinkedHashMapSerializer(stringSerializer, stringSerializer), self.f47164a);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.f47165b == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, new LinkedHashMapSerializer(StringSerializer.INSTANCE, m.f47087a), self.f47165b);
    }

    public final Map b() {
        return this.f47164a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return Intrinsics.b(this.f47164a, vVar.f47164a) && Intrinsics.b(this.f47165b, vVar.f47165b);
    }

    public final int hashCode() {
        Map map = this.f47164a;
        int iHashCode = (map == null ? 0 : map.hashCode()) * 31;
        Map map2 = this.f47165b;
        return iHashCode + (map2 != null ? map2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("TemplateSettings(normalReplacements=");
        sbA.append(this.f47164a);
        sbA.append(", cacheableReplacements=");
        return c9.l(sbA, this.f47165b, ')');
    }

    public final Map a() {
        return this.f47165b;
    }
}
