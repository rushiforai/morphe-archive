package defpackage;

import com.medium.android.yourlibrary.YourLibraryTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cff {
    public final az5 a;
    public final YourLibraryTab b;
    public final int c;

    public cff(az5 az5Var, YourLibraryTab yourLibraryTab) {
        az5Var.getClass();
        yourLibraryTab.getClass();
        this.a = az5Var;
        this.b = yourLibraryTab;
        int iIndexOf = az5Var.indexOf(yourLibraryTab);
        this.c = iIndexOf < 0 ? 0 : iIndexOf;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cff)) {
            return false;
        }
        cff cffVar = (cff) obj;
        return this.a.equals(cffVar.a) && this.b == cffVar.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ViewState(tabs=" + this.a + ", selectedTab=" + this.b + ")";
    }
}
