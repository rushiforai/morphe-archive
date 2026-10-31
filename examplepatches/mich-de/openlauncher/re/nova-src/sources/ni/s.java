package ni;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class s extends x7.f {

    /* renamed from: b, reason: collision with root package name */
    public final r f78322b;

    /* renamed from: c, reason: collision with root package name */
    public final String f78323c;

    /* renamed from: d, reason: collision with root package name */
    public final w f78324d;

    public s(r rVar, String str, w wVar) {
        this.f78322b = rVar;
        this.f78323c = str;
        this.f78324d = wVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f78322b == sVar.f78322b && Intrinsics.b(this.f78323c, sVar.f78323c) && Intrinsics.b(this.f78324d, sVar.f78324d);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f78322b.hashCode() * 31, 31, this.f78323c);
        w wVar = this.f78324d;
        return iE + (wVar == null ? 0 : wVar.hashCode());
    }

    public final String toString() {
        return "FullScreenContentError(code=" + this.f78322b + ", message=" + this.f78323c + ", mediationAdError=" + this.f78324d + ")";
    }
}
