package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gnd implements fnd {
    public final String a;
    public final boolean b;
    public final SourceParameter c;
    public final Throwable d;

    public gnd(String str, boolean z, SourceParameter sourceParameter, Throwable th) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = z;
        this.c = sourceParameter;
        this.d = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gnd)) {
            return false;
        }
        gnd gndVar = (gnd) obj;
        return g76.L(this.a, gndVar.a) && this.b == gndVar.b && g76.L(this.c, gndVar.c) && this.d.equals(gndVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ev6.o(this.c, ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("TogglePinFailure(postId=", this.a, ", isPinned=", ", sourceParameter=", this.b);
        sbD.append(this.c);
        sbD.append(", exception=");
        sbD.append(this.d);
        sbD.append(PdtluglzAX.qETTTmI);
        return sbD.toString();
    }
}
