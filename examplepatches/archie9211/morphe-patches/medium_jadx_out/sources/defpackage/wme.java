package defpackage;

import com.medium.stats.ui.user.UserStatsTab;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wme {
    public final UserStatsTab a;
    public final String b;
    public final SourceParameter c;

    public wme(UserStatsTab userStatsTab, String str, SourceParameter sourceParameter) {
        userStatsTab.getClass();
        this.a = userStatsTab;
        this.b = str;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wme)) {
            return false;
        }
        wme wmeVar = (wme) obj;
        return this.a == wmeVar.a && g76.L(this.b, wmeVar.b) && this.c.equals(wmeVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(selectedTab=");
        sb.append(this.a);
        sb.append(", username=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
