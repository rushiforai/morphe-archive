package defpackage;

import com.medium.refinerecommendations.RefineRecommendationsTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zza {
    public final RefineRecommendationsTab a;

    public zza(RefineRecommendationsTab refineRecommendationsTab) {
        refineRecommendationsTab.getClass();
        this.a = refineRecommendationsTab;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zza) && this.a == ((zza) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "ViewState(selectedTab=" + this.a + ")";
    }
}
