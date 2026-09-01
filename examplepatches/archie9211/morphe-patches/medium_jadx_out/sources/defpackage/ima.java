package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ima extends kma {
    public final boolean a;
    public final List b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final boolean h;

    public ima(boolean z, List list, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7) {
        this.a = z;
        this.b = list;
        this.c = z2;
        this.d = z3;
        this.e = z4;
        this.f = z5;
        this.g = z6;
        this.h = z7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ima)) {
            return false;
        }
        ima imaVar = (ima) obj;
        return this.a == imaVar.a && this.b.equals(imaVar.b) && this.c == imaVar.c && this.d == imaVar.d && this.e == imaVar.e && this.f == imaVar.f && this.g == imaVar.g && this.h == imaVar.h;
    }

    public final int hashCode() {
        return ((((((((((wgd.p((this.a ? 1231 : 1237) * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Loaded(showNoPublicationItem=");
        sb.append(this.a);
        sb.append(", publications=");
        sb.append(this.b);
        sb.append(", canSelectDraftsOnlyPublications=");
        ho2.R(sb, this.c, ", canSelectPublishedOnlyPublications=", this.d, ", showWithdrawSubmissionCta=");
        ho2.R(sb, this.e, ", enableSelectCta=", this.f, ", isPostPublished=");
        return b09.C(sb, this.g, ", showLoading=", this.h, ")");
    }
}
