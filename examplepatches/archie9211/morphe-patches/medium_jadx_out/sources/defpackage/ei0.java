package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ei0 extends od2 {
    public final String a;
    public final String b;
    public final String c;
    public final long d;
    public final Long e;
    public final boolean f;
    public final wc2 g;
    public final nd2 h;
    public final md2 i;
    public final xc2 j;
    public final List k;
    public final int l;

    public ei0(String str, String str2, String str3, long j, Long l, boolean z, wc2 wc2Var, nd2 nd2Var, md2 md2Var, xc2 xc2Var, List list, int i) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = j;
        this.e = l;
        this.f = z;
        this.g = wc2Var;
        this.h = nd2Var;
        this.i = md2Var;
        this.j = xc2Var;
        this.k = list;
        this.l = i;
    }

    @Override // defpackage.od2
    public final di0 a() {
        di0 di0Var = new di0();
        di0Var.a = this.a;
        di0Var.b = this.b;
        di0Var.c = this.c;
        di0Var.d = this.d;
        di0Var.e = this.e;
        di0Var.f = this.f;
        di0Var.g = this.g;
        di0Var.h = this.h;
        di0Var.i = this.i;
        di0Var.j = this.j;
        di0Var.k = this.k;
        di0Var.l = this.l;
        di0Var.m = (byte) 7;
        return di0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof od2) {
            ei0 ei0Var = (ei0) ((od2) obj);
            if (this.a.equals(ei0Var.a) && this.b.equals(ei0Var.b)) {
                String str = ei0Var.c;
                String str2 = this.c;
                if (str2 != null ? str2.equals(str) : str == null) {
                    if (this.d == ei0Var.d) {
                        Long l = ei0Var.e;
                        Long l2 = this.e;
                        if (l2 != null ? l2.equals(l) : l == null) {
                            if (this.f == ei0Var.f && this.g.equals(ei0Var.g)) {
                                nd2 nd2Var = ei0Var.h;
                                nd2 nd2Var2 = this.h;
                                if (nd2Var2 != null ? nd2Var2.equals(nd2Var) : nd2Var == null) {
                                    md2 md2Var = ei0Var.i;
                                    md2 md2Var2 = this.i;
                                    if (md2Var2 != null ? md2Var2.equals(md2Var) : md2Var == null) {
                                        xc2 xc2Var = ei0Var.j;
                                        xc2 xc2Var2 = this.j;
                                        if (xc2Var2 != null ? xc2Var2.equals(xc2Var) : xc2Var == null) {
                                            List list = ei0Var.k;
                                            List list2 = this.k;
                                            if (list2 != null ? list2.equals(list) : list == null) {
                                                if (this.l == ei0Var.l) {
                                                    return true;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003;
        String str = this.c;
        int iHashCode2 = str == null ? 0 : str.hashCode();
        long j = this.d;
        int i = (((iHashCode ^ iHashCode2) * 1000003) ^ ((int) (j ^ (j >>> 32)))) * 1000003;
        Long l = this.e;
        int iHashCode3 = (((((i ^ (l == null ? 0 : l.hashCode())) * 1000003) ^ (this.f ? 1231 : 1237)) * 1000003) ^ this.g.hashCode()) * 1000003;
        nd2 nd2Var = this.h;
        int iHashCode4 = (iHashCode3 ^ (nd2Var == null ? 0 : nd2Var.hashCode())) * 1000003;
        md2 md2Var = this.i;
        int iHashCode5 = (iHashCode4 ^ (md2Var == null ? 0 : md2Var.hashCode())) * 1000003;
        xc2 xc2Var = this.j;
        int iHashCode6 = (iHashCode5 ^ (xc2Var == null ? 0 : xc2Var.hashCode())) * 1000003;
        List list = this.k;
        return this.l ^ ((iHashCode6 ^ (list != null ? list.hashCode() : 0)) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Session{generator=");
        sb.append(this.a);
        sb.append(", identifier=");
        sb.append(this.b);
        sb.append(", appQualitySessionId=");
        sb.append(this.c);
        sb.append(", startedAt=");
        sb.append(this.d);
        sb.append(", endedAt=");
        sb.append(this.e);
        sb.append(", crashed=");
        sb.append(this.f);
        sb.append(", app=");
        sb.append(this.g);
        sb.append(", user=");
        sb.append(this.h);
        sb.append(", os=");
        sb.append(this.i);
        sb.append(", device=");
        sb.append(this.j);
        sb.append(", events=");
        sb.append(this.k);
        sb.append(", generatorType=");
        return ho2.H(sb, this.l, "}");
    }
}
