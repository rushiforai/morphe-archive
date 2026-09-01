package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ige implements mge {
    public final ArrayList a;
    public final boolean b;
    public final SourceParameter c;
    public final boolean d;

    public ige(SourceParameter sourceParameter, ArrayList arrayList, boolean z, boolean z2) {
        sourceParameter.getClass();
        this.a = arrayList;
        this.b = z;
        this.c = sourceParameter;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ige)) {
            return false;
        }
        ige igeVar = (ige) obj;
        return this.a.equals(igeVar.a) && this.b == igeVar.b && g76.L(this.c, igeVar.c) && this.d == igeVar.d;
    }

    public final int hashCode() {
        return ev6.o(this.c, ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31, 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return "Content(uiModels=" + this.a + ", shouldShowVerifiedAuthorIntro=" + this.b + ", sourceParameter=" + this.c + ", isRefreshing=" + this.d + ")";
    }
}
