package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jsc implements usc {
    public final ssc a;
    public final msc b;
    public final SourceParameter c;

    public jsc(ssc sscVar, msc mscVar, SourceParameter sourceParameter) {
        sscVar.getClass();
        mscVar.getClass();
        sourceParameter.getClass();
        this.a = sscVar;
        this.b = mscVar;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jsc)) {
            return false;
        }
        jsc jscVar = (jsc) obj;
        return this.a.equals(jscVar.a) && this.b.equals(jscVar.b) && g76.L(this.c, jscVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(monthlyContent=");
        sb.append(this.a);
        sb.append(", lifeTimeContent=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
