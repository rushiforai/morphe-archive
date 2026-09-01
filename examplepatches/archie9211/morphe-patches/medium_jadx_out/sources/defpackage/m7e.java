package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m7e implements n7e {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public m7e(SourceParameter sourceParameter, String str, String str2, String str3) {
        str2.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m7e)) {
            return false;
        }
        m7e m7eVar = (m7e) obj;
        return g76.L(this.a, m7eVar.a) && g76.L(this.b, m7eVar.b) && this.c.equals(m7eVar.c) && g76.L(this.d, m7eVar.d);
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + wgd.o(wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FollowAndSubscribeSuccess(newsletterId=", this.a, bPUi.MUzGPc, this.b, ", userName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
