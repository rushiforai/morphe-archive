package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vq5 {
    public final List a;
    public final uq5 b;
    public final boolean c;
    public final zib d;
    public final xn8 e;
    public final SourceParameter f;
    public final String g;
    public final r92 h;
    public final boolean i;
    public final int j;

    public vq5(List list, uq5 uq5Var, boolean z, zib zibVar, xn8 xn8Var, SourceParameter sourceParameter, String str, r92 r92Var, boolean z2) {
        uq5Var.getClass();
        sourceParameter.getClass();
        str.getClass();
        this.a = list;
        this.b = uq5Var;
        this.c = z;
        this.d = zibVar;
        this.e = xn8Var;
        this.f = sourceParameter;
        this.g = str;
        this.h = r92Var;
        this.i = z2;
        this.j = list.indexOf(uq5Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vq5)) {
            return false;
        }
        vq5 vq5Var = (vq5) obj;
        return this.a.equals(vq5Var.a) && this.b == vq5Var.b && this.c == vq5Var.c && g76.L(this.d, vq5Var.d) && g76.L(this.e, vq5Var.e) && g76.L(this.f, vq5Var.f) && g76.L(this.g, vq5Var.g) && g76.L(this.h, vq5Var.h) && this.i == vq5Var.i;
    }

    public final int hashCode() {
        int iHashCode = (((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31;
        zib zibVar = this.d;
        int iHashCode2 = (iHashCode + (zibVar == null ? 0 : zibVar.hashCode())) * 31;
        xn8 xn8Var = this.e;
        int iO = wgd.o(ev6.o(this.f, (iHashCode2 + (xn8Var == null ? 0 : xn8Var.hashCode())) * 31, 31), 31, this.g);
        r92 r92Var = this.h;
        return ((iO + (r92Var != null ? r92Var.hashCode() : 0)) * 31) + (this.i ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(tabs=");
        sb.append(this.a);
        sb.append(", selectedTab=");
        sb.append(this.b);
        sb.append(", hasUnreadNotifications=");
        sb.append(this.c);
        sb.append(", resubscribeBannerUiModel=");
        sb.append(this.d);
        sb.append(", offerBannerUiModel=");
        sb.append(this.e);
        sb.append(", sourceParameter=");
        sb.append(this.f);
        sb.append(", referrerSource=");
        sb.append(this.g);
        sb.append(", continueReadingData=");
        sb.append(this.h);
        sb.append(", showContinueReadingBanner=");
        return lv8.t(sb, this.i, ")");
    }
}
