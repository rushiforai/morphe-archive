package defpackage;

import com.medium.android.core.susi.SusiDestination;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c2e {
    public final uid a;
    public final String b;
    public final boolean c;
    public final SourceParameter d;
    public final SusiDestination e;
    public final boolean f;

    public c2e(uid uidVar, String str, boolean z, SourceParameter sourceParameter, SusiDestination susiDestination, boolean z2) {
        uidVar.getClass();
        str.getClass();
        sourceParameter.getClass();
        this.a = uidVar;
        this.b = str;
        this.c = z;
        this.d = sourceParameter;
        this.e = susiDestination;
        this.f = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c2e)) {
            return false;
        }
        c2e c2eVar = (c2e) obj;
        return g76.L(this.a, c2eVar.a) && g76.L(this.b, c2eVar.b) && this.c == c2eVar.c && g76.L(this.d, c2eVar.d) && g76.L(this.e, c2eVar.e) && this.f == c2eVar.f;
    }

    public final int hashCode() {
        int iO = ev6.o(this.d, (wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31, 31);
        SusiDestination susiDestination = this.e;
        return ((iO + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        return "Content(email=" + this.a + ", initialEmail=" + this.b + ", canSubmit=" + this.c + ", sourceParameter=" + this.d + ", susiDestination=" + this.e + ", rememberMe=" + this.f + ")";
    }
}
