package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lh3 {
    public final boolean a;
    public final boolean b;
    public final dne c;
    public final zy4 d;
    public final DarkMode e;
    public final Boolean f;

    public lh3(boolean z, boolean z2, dne dneVar, zy4 zy4Var, DarkMode darkMode, Boolean bool) {
        dneVar.getClass();
        zy4Var.getClass();
        darkMode.getClass();
        this.a = z;
        this.b = z2;
        this.c = dneVar;
        this.d = zy4Var;
        this.e = darkMode;
        this.f = bool;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lh3)) {
            return false;
        }
        lh3 lh3Var = (lh3) obj;
        return this.a == lh3Var.a && this.b == lh3Var.b && this.c == lh3Var.c && this.d == lh3Var.d && this.e == lh3Var.e && g76.L(this.f, lh3Var.f);
    }

    public final int hashCode() {
        int iHashCode = (this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31)) * 31)) * 31)) * 31;
        Boolean bool = this.f;
        return iHashCode + (bool == null ? 0 : bool.hashCode());
    }

    public final String toString() {
        return "ViewState(canDecreaseTextSize=" + this.a + ", canIncreaseTextSize=" + this.b + ", currentTextSize=" + this.c + ", currentFontFamily=" + this.d + ", currentDarkMode=" + this.e + ", isHighlightsFromOthersEnabled=" + this.f + ")";
    }
}
