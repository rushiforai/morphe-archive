package defpackage;

import gen.model.SourceParameter;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mq9 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final boolean e;
    public final bo4 f;
    public final int g;
    public final boolean h;
    public final bt4 i;
    public final d88 j;
    public final d88 k;
    public final boolean l;
    public final p99 m;
    public final boolean n;
    public final boolean o;
    public final boolean p;
    public final lq9 q;
    public final bo4 r;
    public final SourceParameter s;

    public mq9(String str, String str2, String str3, String str4, boolean z, bo4 bo4Var, int i, boolean z2, bt4 bt4Var, d88 d88Var, d88 d88Var2, boolean z3, p99 p99Var, boolean z4, boolean z5, boolean z6, lq9 lq9Var, bo4 bo4Var2, SourceParameter sourceParameter) {
        str.getClass();
        bt4Var.getClass();
        d88Var.getClass();
        d88Var2.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
        this.f = bo4Var;
        this.g = i;
        this.h = z2;
        this.i = bt4Var;
        this.j = d88Var;
        this.k = d88Var2;
        this.l = z3;
        this.m = p99Var;
        this.n = z4;
        this.o = z5;
        this.p = z6;
        this.q = lq9Var;
        this.r = bo4Var2;
        this.s = sourceParameter;
    }

    public static mq9 a(mq9 mq9Var, boolean z, int i, boolean z2, bt4 bt4Var, d88 d88Var, d88 d88Var2, p99 p99Var, int i2) {
        String str = mq9Var.a;
        String str2 = mq9Var.b;
        String str3 = mq9Var.c;
        String str4 = mq9Var.d;
        boolean z3 = (i2 & 16) != 0 ? mq9Var.e : z;
        bo4 bo4Var = mq9Var.f;
        int i3 = (i2 & 64) != 0 ? mq9Var.g : i;
        boolean z4 = (i2 & 128) != 0 ? mq9Var.h : z2;
        bt4 bt4Var2 = (i2 & 256) != 0 ? mq9Var.i : bt4Var;
        d88 d88Var3 = (i2 & 512) != 0 ? mq9Var.j : d88Var;
        d88 d88Var4 = (i2 & 1024) != 0 ? mq9Var.k : d88Var2;
        boolean z5 = mq9Var.l;
        p99 p99Var2 = (i2 & 4096) != 0 ? mq9Var.m : p99Var;
        boolean z6 = mq9Var.n;
        boolean z7 = mq9Var.o;
        p99 p99Var3 = p99Var2;
        boolean z8 = mq9Var.p;
        lq9 lq9Var = mq9Var.q;
        bo4 bo4Var2 = mq9Var.r;
        SourceParameter sourceParameter = mq9Var.s;
        mq9Var.getClass();
        str.getClass();
        bt4Var2.getClass();
        d88Var3.getClass();
        d88Var4.getClass();
        sourceParameter.getClass();
        return new mq9(str, str2, str3, str4, z3, bo4Var, i3, z4, bt4Var2, d88Var3, d88Var4, z5, p99Var3, z6, z7, z8, lq9Var, bo4Var2, sourceParameter);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mq9)) {
            return false;
        }
        mq9 mq9Var = (mq9) obj;
        return g76.L(this.a, mq9Var.a) && g76.L(this.b, mq9Var.b) && this.c.equals(mq9Var.c) && g76.L(this.d, mq9Var.d) && this.e == mq9Var.e && this.f.equals(mq9Var.f) && this.g == mq9Var.g && this.h == mq9Var.h && this.i == mq9Var.i && this.j == mq9Var.j && this.k == mq9Var.k && this.l == mq9Var.l && this.m.equals(mq9Var.m) && this.n == mq9Var.n && this.o == mq9Var.o && this.p == mq9Var.p && this.q.equals(mq9Var.q) && this.r.equals(mq9Var.r) && g76.L(this.s, mq9Var.s);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
        String str2 = this.d;
        return this.s.hashCode() + ka1.a(this.r, (this.q.hashCode() + ((((((((this.m.hashCode() + ((((this.k.hashCode() + ((this.j.hashCode() + ((this.i.hashCode() + ((((ka1.a(this.f, (((iO + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237)) * 31, 31) + this.g) * 31) + (this.h ? 1231 : 1237)) * 31)) * 31)) * 31)) * 31) + (this.l ? 1231 : 1237)) * 31)) * 31) + (this.n ? 1231 : 1237)) * 31) + (this.o ? 1231 : 1237)) * 31) + (this.p ? 1231 : 1237)) * 31)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostTopBarUiModel(postId=", this.a, ", postTitle=", this.b, ", authorId=");
        ka1.C(sbU, this.c, ", publicationId=", this.d, ", isAudioPlaying=");
        sbU.append(this.e);
        sbU.append(", explicitSignalStateStream=");
        sbU.append(this.f);
        sbU.append(", currentUserClapCount=");
        sbU.append(this.g);
        sbU.append(", canUndoClaps=");
        sbU.append(this.h);
        sbU.append(", collectionFollowState=");
        sbU.append(this.i);
        sbU.append(fiHTiFJ.grG);
        sbU.append(this.j);
        sbU.append(", collectionMuteState=");
        sbU.append(this.k);
        sbU.append(", canReportPost=");
        sbU.append(this.l);
        sbU.append(", postPinState=");
        sbU.append(this.m);
        sbU.append(", canEditPost=");
        sbU.append(this.n);
        sbU.append(", canDeletePost=");
        ho2.R(sbU, this.o, ", showStats=", this.p, ", publicationHierarchyStatus=");
        sbU.append(this.q);
        sbU.append(", postFeaturingStateStream=");
        sbU.append(this.r);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.s, ")");
    }
}
