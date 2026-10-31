package com.vungle.ads.internal.model;

import com.vungle.ads.fpd.FirstPartyData;
import com.vungle.ads.fpd.FirstPartyData$$serializer;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class t1 {

    @NotNull
    public static final s1 Companion = new s1();

    /* renamed from: a, reason: collision with root package name */
    public h1 f47150a;

    /* renamed from: b, reason: collision with root package name */
    public x0 f47151b;

    /* renamed from: c, reason: collision with root package name */
    public a1 f47152c;

    /* renamed from: d, reason: collision with root package name */
    public FirstPartyData f47153d;

    /* renamed from: e, reason: collision with root package name */
    public k1 f47154e;

    public /* synthetic */ t1(int i5, h1 h1Var, x0 x0Var, a1 a1Var, FirstPartyData firstPartyData, k1 k1Var) {
        if ((i5 & 1) == 0) {
            this.f47150a = null;
        } else {
            this.f47150a = h1Var;
        }
        if ((i5 & 2) == 0) {
            this.f47151b = null;
        } else {
            this.f47151b = x0Var;
        }
        if ((i5 & 4) == 0) {
            this.f47152c = null;
        } else {
            this.f47152c = a1Var;
        }
        if ((i5 & 8) == 0) {
            this.f47153d = null;
        } else {
            this.f47153d = firstPartyData;
        }
        if ((i5 & 16) == 0) {
            this.f47154e = null;
        } else {
            this.f47154e = k1Var;
        }
    }

    public static final void a(t1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47150a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, f1.f47004a, self.f47150a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47151b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, v0.f47166a, self.f47151b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47152c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, y0.f47198a, self.f47152c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47153d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, FirstPartyData$$serializer.INSTANCE, self.f47153d);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.f47154e == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, i1.f47055a, self.f47154e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t1)) {
            return false;
        }
        t1 t1Var = (t1) obj;
        return Intrinsics.b(this.f47150a, t1Var.f47150a) && Intrinsics.b(this.f47151b, t1Var.f47151b) && Intrinsics.b(this.f47152c, t1Var.f47152c) && Intrinsics.b(this.f47153d, t1Var.f47153d) && Intrinsics.b(this.f47154e, t1Var.f47154e);
    }

    public final int hashCode() {
        h1 h1Var = this.f47150a;
        int iHashCode = (h1Var == null ? 0 : h1Var.hashCode()) * 31;
        x0 x0Var = this.f47151b;
        int iHashCode2 = (iHashCode + (x0Var == null ? 0 : x0Var.f47195a.hashCode())) * 31;
        a1 a1Var = this.f47152c;
        int iHashCode3 = (iHashCode2 + (a1Var == null ? 0 : a1Var.hashCode())) * 31;
        FirstPartyData firstPartyData = this.f47153d;
        int iHashCode4 = (iHashCode3 + (firstPartyData == null ? 0 : firstPartyData.hashCode())) * 31;
        k1 k1Var = this.f47154e;
        return iHashCode4 + (k1Var != null ? k1Var.f47073a.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("User(gdpr=");
        sbA.append(this.f47150a);
        sbA.append(", ccpa=");
        sbA.append(this.f47151b);
        sbA.append(", coppa=");
        sbA.append(this.f47152c);
        sbA.append(", fpd=");
        sbA.append(this.f47153d);
        sbA.append(", iab=");
        sbA.append(this.f47154e);
        sbA.append(')');
        return sbA.toString();
    }

    public t1(h1 h1Var, x0 x0Var, a1 a1Var, FirstPartyData firstPartyData, k1 k1Var) {
        this.f47150a = h1Var;
        this.f47151b = x0Var;
        this.f47152c = a1Var;
        this.f47153d = firstPartyData;
        this.f47154e = k1Var;
    }
}
