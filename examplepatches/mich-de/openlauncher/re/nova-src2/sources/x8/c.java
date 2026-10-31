package x8;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final h6.u f95293a;

    /* renamed from: b, reason: collision with root package name */
    public final y8.g f95294b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95295c;

    /* renamed from: d, reason: collision with root package name */
    public final b9.e f95296d;

    /* renamed from: e, reason: collision with root package name */
    public final int f95297e;

    /* renamed from: f, reason: collision with root package name */
    public final Boolean f95298f;

    public c(h6.u uVar, y8.g gVar, int i5, b9.e eVar, int i11, Boolean bool) {
        this.f95293a = uVar;
        this.f95294b = gVar;
        this.f95295c = i5;
        this.f95296d = eVar;
        this.f95297e = i11;
        this.f95298f = bool;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f95293a, cVar.f95293a) && Intrinsics.b(this.f95294b, cVar.f95294b) && this.f95295c == cVar.f95295c && Intrinsics.b(this.f95296d, cVar.f95296d) && this.f95297e == cVar.f95297e && Intrinsics.b(this.f95298f, cVar.f95298f);
    }

    public final int hashCode() {
        h6.u uVar = this.f95293a;
        int iHashCode = (uVar != null ? uVar.hashCode() : 0) * 31;
        y8.g gVar = this.f95294b;
        int iHashCode2 = (iHashCode + (gVar != null ? gVar.hashCode() : 0)) * 31;
        int i5 = this.f95295c;
        int iF = (iHashCode2 + (i5 != 0 ? c0.F(i5) : 0)) * 28629151;
        b9.e eVar = this.f95296d;
        int iHashCode3 = (iF + (eVar != null ? eVar.hashCode() : 0)) * 31;
        int i11 = this.f95297e;
        int iF2 = (iHashCode3 + (i11 != 0 ? c0.F(i11) : 0)) * 961;
        Boolean bool = this.f95298f;
        return (iF2 + (bool != null ? bool.hashCode() : 0)) * 923521;
    }
}
