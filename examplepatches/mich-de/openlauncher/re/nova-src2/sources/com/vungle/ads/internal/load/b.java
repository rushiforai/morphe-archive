package com.vungle.ads.internal.load;

import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleCSBData;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.model.q0;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class b implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final j3 f46872a;

    /* renamed from: b, reason: collision with root package name */
    public final q0 f46873b;

    /* renamed from: c, reason: collision with root package name */
    public final VungleAdSize f46874c;

    /* renamed from: d, reason: collision with root package name */
    public final VungleCSBData f46875d;

    public b(j3 placement, q0 q0Var, VungleAdSize vungleAdSize, VungleCSBData vungleCSBData) {
        Intrinsics.g(placement, "placement");
        this.f46872a = placement;
        this.f46873b = q0Var;
        this.f46874c = vungleAdSize;
        this.f46875d = vungleCSBData;
    }

    public final q0 a() {
        return this.f46873b;
    }

    public final VungleCSBData b() {
        return this.f46875d;
    }

    public final j3 c() {
        return this.f46872a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && b.class.equals(obj.getClass())) {
            b bVar = (b) obj;
            if (!Intrinsics.b(this.f46872a.b(), bVar.f46872a.b()) || !Intrinsics.b(this.f46874c, bVar.f46874c)) {
                return false;
            }
            q0 q0Var = this.f46873b;
            if (q0Var != null) {
                if (!q0Var.equals(bVar.f46873b)) {
                    return false;
                }
            } else if (bVar.f46873b != null) {
                return false;
            }
            VungleCSBData vungleCSBData = this.f46875d;
            VungleCSBData vungleCSBData2 = bVar.f46875d;
            if (vungleCSBData != null) {
                return vungleCSBData.equals(vungleCSBData2);
            }
            if (vungleCSBData2 == null) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.f46872a.f47068a.hashCode() * 31;
        VungleAdSize vungleAdSize = this.f46874c;
        int iHashCode2 = (iHashCode + (vungleAdSize != null ? vungleAdSize.hashCode() : 0)) * 31;
        q0 q0Var = this.f46873b;
        int iHashCode3 = (iHashCode2 + (q0Var != null ? q0Var.hashCode() : 0)) * 31;
        VungleCSBData vungleCSBData = this.f46875d;
        return iHashCode3 + (vungleCSBData != null ? vungleCSBData.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AdRequest{placementId='");
        sbA.append(this.f46872a.f47068a);
        sbA.append("', adMarkup=");
        sbA.append(this.f46873b);
        sbA.append(", requestAdSize=");
        sbA.append(this.f46874c);
        sbA.append(", csbData=");
        sbA.append(this.f46875d);
        sbA.append(AbstractJsonLexerKt.END_OBJ);
        return sbA.toString();
    }
}
