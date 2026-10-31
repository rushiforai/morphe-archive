package ws;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import es.v;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f94640a;

    /* renamed from: b, reason: collision with root package name */
    public final v f94641b;

    /* renamed from: c, reason: collision with root package name */
    public final ResolvableString f94642c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f94643d;

    /* renamed from: e, reason: collision with root package name */
    public final ou.a f94644e;

    /* renamed from: f, reason: collision with root package name */
    public final ft.b f94645f;

    /* renamed from: g, reason: collision with root package name */
    public final ResolvableString f94646g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f94647h;

    public a(String str, v vVar, ResolvableString resolvableString, boolean z11, ou.a aVar, ft.b bVar, ResolvableString resolvableString2, boolean z12) {
        this.f94640a = str;
        this.f94641b = vVar;
        this.f94642c = resolvableString;
        this.f94643d = z11;
        this.f94644e = aVar;
        this.f94645f = bVar;
        this.f94646g = resolvableString2;
        this.f94647h = z12;
    }

    public static a a(a aVar, String str, boolean z11, ou.a aVar2, ft.b bVar, ResolvableString resolvableString, boolean z12, int i5) {
        if ((i5 & 1) != 0) {
            str = aVar.f94640a;
        }
        String str2 = str;
        v vVar = aVar.f94641b;
        ResolvableString resolvableString2 = aVar.f94642c;
        if ((i5 & 8) != 0) {
            z11 = aVar.f94643d;
        }
        boolean z13 = z11;
        if ((i5 & 16) != 0) {
            aVar2 = aVar.f94644e;
        }
        ou.a aVar3 = aVar2;
        if ((i5 & 32) != 0) {
            bVar = aVar.f94645f;
        }
        ft.b bVar2 = bVar;
        ResolvableString resolvableString3 = (i5 & 64) != 0 ? aVar.f94646g : resolvableString;
        boolean z14 = (i5 & 128) != 0 ? aVar.f94647h : z12;
        aVar.getClass();
        return new a(str2, vVar, resolvableString2, z13, aVar3, bVar2, resolvableString3, z14);
    }

    public final boolean b() {
        return this.f94641b != null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f94640a, aVar.f94640a) && Intrinsics.b(this.f94641b, aVar.f94641b) && Intrinsics.b(this.f94642c, aVar.f94642c) && this.f94643d == aVar.f94643d && Intrinsics.b(this.f94644e, aVar.f94644e) && this.f94645f == aVar.f94645f && Intrinsics.b(this.f94646g, aVar.f94646g) && this.f94647h == aVar.f94647h;
    }

    public final int hashCode() {
        int iHashCode = this.f94640a.hashCode() * 31;
        v vVar = this.f94641b;
        int iF = c9.f((this.f94642c.hashCode() + ((iHashCode + (vVar == null ? 0 : vVar.hashCode())) * 31)) * 31, 31, this.f94643d);
        ou.a aVar = this.f94644e;
        int iHashCode2 = (iF + (aVar == null ? 0 : aVar.hashCode())) * 31;
        ft.b bVar = this.f94645f;
        int iHashCode3 = (iHashCode2 + (bVar == null ? 0 : bVar.hashCode())) * 31;
        ResolvableString resolvableString = this.f94646g;
        return Boolean.hashCode(this.f94647h) + ((iHashCode3 + (resolvableString != null ? resolvableString.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "UpdateCardScreenState(paymentDetailsId=" + this.f94640a + ", billingDetailsUpdateFlow=" + this.f94641b + ", primaryButtonLabel=" + this.f94642c + ", isDefault=" + this.f94643d + ", cardUpdateParams=" + this.f94644e + ", preferredCardBrand=" + this.f94645f + ", error=" + this.f94646g + ", processing=" + this.f94647h + ")";
    }
}
