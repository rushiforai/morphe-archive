package defpackage;

import com.medium.android.core.navigation.PublicationTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hna implements ina {
    public final String a;
    public final sma b;
    public final pia c;
    public final az5 d;
    public final PublicationTab e;
    public final String f;
    public final int g;

    public hna(String str, sma smaVar, pia piaVar, az5 az5Var, PublicationTab publicationTab, String str2) {
        str.getClass();
        az5Var.getClass();
        publicationTab.getClass();
        str2.getClass();
        this.a = str;
        this.b = smaVar;
        this.c = piaVar;
        this.d = az5Var;
        this.e = publicationTab;
        this.f = str2;
        int iIndexOf = az5Var.indexOf(publicationTab);
        this.g = iIndexOf < 0 ? 0 : iIndexOf;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hna)) {
            return false;
        }
        hna hnaVar = (hna) obj;
        return g76.L(this.a, hnaVar.a) && this.b.equals(hnaVar.b) && this.c.equals(hnaVar.c) && g76.L(this.d, hnaVar.d) && g76.L(this.e, hnaVar.e) && g76.L(this.f, hnaVar.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + ((this.e.hashCode() + ka1.b(this.d, (this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31, 31)) * 31);
    }

    public final String toString() {
        return "Publication(publicationId=" + this.a + ", publicationTopBarUiModel=" + this.b + ", publicationHeaderUiModel=" + this.c + ", publicationTabs=" + this.d + ", selectedTab=" + this.e + ", referrerSource=" + this.f + ")";
    }
}
