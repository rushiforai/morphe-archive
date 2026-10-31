package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class s {

    @NotNull
    public static final r Companion = new r();

    /* renamed from: a, reason: collision with root package name */
    public final String f47139a;

    /* renamed from: b, reason: collision with root package name */
    public final i f47140b;

    /* renamed from: c, reason: collision with root package name */
    public final l f47141c;

    public /* synthetic */ s(int i5, String str, i iVar, l lVar) {
        if ((i5 & 1) == 0) {
            this.f47139a = null;
        } else {
            this.f47139a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47140b = null;
        } else {
            this.f47140b = iVar;
        }
        if ((i5 & 4) == 0) {
            this.f47141c = null;
        } else {
            this.f47141c = lVar;
        }
    }

    public static final void a(s self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47139a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47139a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47140b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, g.f47007a, self.f47140b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47141c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, j.f47062a, self.f47141c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Intrinsics.b(this.f47139a, sVar.f47139a) && Intrinsics.b(this.f47140b, sVar.f47140b) && Intrinsics.b(this.f47141c, sVar.f47141c);
    }

    public final int hashCode() {
        String str = this.f47139a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        i iVar = this.f47140b;
        int iHashCode2 = (iHashCode + (iVar == null ? 0 : iVar.hashCode())) * 31;
        l lVar = this.f47141c;
        return iHashCode2 + (lVar != null ? lVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("PlacementAdUnit(placementReferenceId=");
        sbA.append(this.f47139a);
        sbA.append(", adMarkup=");
        sbA.append(this.f47140b);
        sbA.append(", csb=");
        sbA.append(this.f47141c);
        sbA.append(')');
        return sbA.toString();
    }
}
