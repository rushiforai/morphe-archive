package fe;

import com.google.android.exoplayer2.drm.DrmInitData;
import com.google.android.exoplayer2.metadata.Metadata;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class k0 implements e {
    public static final k0 G = new k0(new j0());
    public static final ep.c H = new ep.c(6);
    public final int A;
    public final int B;
    public final int C;
    public final int D;
    public final int E;
    public int F;

    /* renamed from: a, reason: collision with root package name */
    public final String f54872a;

    /* renamed from: b, reason: collision with root package name */
    public final String f54873b;

    /* renamed from: c, reason: collision with root package name */
    public final String f54874c;

    /* renamed from: d, reason: collision with root package name */
    public final int f54875d;

    /* renamed from: e, reason: collision with root package name */
    public final int f54876e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54877f;

    /* renamed from: g, reason: collision with root package name */
    public final int f54878g;

    /* renamed from: h, reason: collision with root package name */
    public final int f54879h;

    /* renamed from: i, reason: collision with root package name */
    public final String f54880i;

    /* renamed from: j, reason: collision with root package name */
    public final Metadata f54881j;

    /* renamed from: k, reason: collision with root package name */
    public final String f54882k;

    /* renamed from: l, reason: collision with root package name */
    public final String f54883l;

    /* renamed from: m, reason: collision with root package name */
    public final int f54884m;
    public final List n;
    public final DrmInitData o;

    /* renamed from: p, reason: collision with root package name */
    public final long f54885p;

    /* renamed from: q, reason: collision with root package name */
    public final int f54886q;

    /* renamed from: r, reason: collision with root package name */
    public final int f54887r;

    /* renamed from: s, reason: collision with root package name */
    public final float f54888s;

    /* renamed from: t, reason: collision with root package name */
    public final int f54889t;

    /* renamed from: u, reason: collision with root package name */
    public final float f54890u;

    /* renamed from: v, reason: collision with root package name */
    public final byte[] f54891v;

    /* renamed from: w, reason: collision with root package name */
    public final int f54892w;

    /* renamed from: x, reason: collision with root package name */
    public final xf.a f54893x;

    /* renamed from: y, reason: collision with root package name */
    public final int f54894y;

    /* renamed from: z, reason: collision with root package name */
    public final int f54895z;

    public k0(j0 j0Var) {
        this.f54872a = j0Var.f54846a;
        this.f54873b = j0Var.f54847b;
        this.f54874c = wf.v.z(j0Var.f54848c);
        this.f54875d = j0Var.f54849d;
        this.f54876e = j0Var.f54850e;
        int i5 = j0Var.f54851f;
        this.f54877f = i5;
        int i11 = j0Var.f54852g;
        this.f54878g = i11;
        this.f54879h = i11 != -1 ? i11 : i5;
        this.f54880i = j0Var.f54853h;
        this.f54881j = j0Var.f54854i;
        this.f54882k = j0Var.f54855j;
        this.f54883l = j0Var.f54856k;
        this.f54884m = j0Var.f54857l;
        List list = j0Var.f54858m;
        this.n = list == null ? Collections.EMPTY_LIST : list;
        DrmInitData drmInitData = j0Var.n;
        this.o = drmInitData;
        this.f54885p = j0Var.o;
        this.f54886q = j0Var.f54859p;
        this.f54887r = j0Var.f54860q;
        this.f54888s = j0Var.f54861r;
        int i12 = j0Var.f54862s;
        this.f54889t = i12 == -1 ? 0 : i12;
        float f11 = j0Var.f54863t;
        this.f54890u = f11 == -1.0f ? 1.0f : f11;
        this.f54891v = j0Var.f54864u;
        this.f54892w = j0Var.f54865v;
        this.f54893x = j0Var.f54866w;
        this.f54894y = j0Var.f54867x;
        this.f54895z = j0Var.f54868y;
        this.A = j0Var.f54869z;
        int i13 = j0Var.A;
        this.B = i13 == -1 ? 0 : i13;
        int i14 = j0Var.B;
        this.C = i14 != -1 ? i14 : 0;
        this.D = j0Var.C;
        int i15 = j0Var.D;
        if (i15 != 0 || drmInitData == null) {
            this.E = i15;
        } else {
            this.E = 1;
        }
    }

    public final j0 a() {
        j0 j0Var = new j0();
        j0Var.f54846a = this.f54872a;
        j0Var.f54847b = this.f54873b;
        j0Var.f54848c = this.f54874c;
        j0Var.f54849d = this.f54875d;
        j0Var.f54850e = this.f54876e;
        j0Var.f54851f = this.f54877f;
        j0Var.f54852g = this.f54878g;
        j0Var.f54853h = this.f54880i;
        j0Var.f54854i = this.f54881j;
        j0Var.f54855j = this.f54882k;
        j0Var.f54856k = this.f54883l;
        j0Var.f54857l = this.f54884m;
        j0Var.f54858m = this.n;
        j0Var.n = this.o;
        j0Var.o = this.f54885p;
        j0Var.f54859p = this.f54886q;
        j0Var.f54860q = this.f54887r;
        j0Var.f54861r = this.f54888s;
        j0Var.f54862s = this.f54889t;
        j0Var.f54863t = this.f54890u;
        j0Var.f54864u = this.f54891v;
        j0Var.f54865v = this.f54892w;
        j0Var.f54866w = this.f54893x;
        j0Var.f54867x = this.f54894y;
        j0Var.f54868y = this.f54895z;
        j0Var.f54869z = this.A;
        j0Var.A = this.B;
        j0Var.B = this.C;
        j0Var.C = this.D;
        j0Var.D = this.E;
        return j0Var;
    }

    public final boolean b(k0 k0Var) {
        List list = this.n;
        if (list.size() != k0Var.n.size()) {
            return false;
        }
        for (int i5 = 0; i5 < list.size(); i5++) {
            if (!Arrays.equals((byte[]) list.get(i5), (byte[]) k0Var.n.get(i5))) {
                return false;
            }
        }
        return true;
    }

    public final boolean equals(Object obj) {
        int i5;
        if (this == obj) {
            return true;
        }
        if (obj != null && k0.class == obj.getClass()) {
            k0 k0Var = (k0) obj;
            int i11 = this.F;
            if ((i11 == 0 || (i5 = k0Var.F) == 0 || i11 == i5) && this.f54875d == k0Var.f54875d && this.f54876e == k0Var.f54876e && this.f54877f == k0Var.f54877f && this.f54878g == k0Var.f54878g && this.f54884m == k0Var.f54884m && this.f54885p == k0Var.f54885p && this.f54886q == k0Var.f54886q && this.f54887r == k0Var.f54887r && this.f54889t == k0Var.f54889t && this.f54892w == k0Var.f54892w && this.f54894y == k0Var.f54894y && this.f54895z == k0Var.f54895z && this.A == k0Var.A && this.B == k0Var.B && this.C == k0Var.C && this.D == k0Var.D && this.E == k0Var.E && Float.compare(this.f54888s, k0Var.f54888s) == 0 && Float.compare(this.f54890u, k0Var.f54890u) == 0 && wf.v.a(this.f54872a, k0Var.f54872a) && wf.v.a(this.f54873b, k0Var.f54873b) && wf.v.a(this.f54880i, k0Var.f54880i) && wf.v.a(this.f54882k, k0Var.f54882k) && wf.v.a(this.f54883l, k0Var.f54883l) && wf.v.a(this.f54874c, k0Var.f54874c) && Arrays.equals(this.f54891v, k0Var.f54891v) && wf.v.a(this.f54881j, k0Var.f54881j) && wf.v.a(this.f54893x, k0Var.f54893x) && wf.v.a(this.o, k0Var.o) && b(k0Var)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.F == 0) {
            String str = this.f54872a;
            int iHashCode = (527 + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f54873b;
            int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
            String str3 = this.f54874c;
            int iHashCode3 = (((((((((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31) + this.f54875d) * 31) + this.f54876e) * 31) + this.f54877f) * 31) + this.f54878g) * 31;
            String str4 = this.f54880i;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            Metadata metadata = this.f54881j;
            int iHashCode5 = (iHashCode4 + (metadata == null ? 0 : metadata.hashCode())) * 31;
            String str5 = this.f54882k;
            int iHashCode6 = (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f54883l;
            this.F = ((((((((((((((((Float.floatToIntBits(this.f54890u) + ((((Float.floatToIntBits(this.f54888s) + ((((((((((iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 31) + this.f54884m) * 31) + ((int) this.f54885p)) * 31) + this.f54886q) * 31) + this.f54887r) * 31)) * 31) + this.f54889t) * 31)) * 31) + this.f54892w) * 31) + this.f54894y) * 31) + this.f54895z) * 31) + this.A) * 31) + this.B) * 31) + this.C) * 31) + this.D) * 31) + this.E;
        }
        return this.F;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Format(");
        sb2.append(this.f54872a);
        sb2.append(", ");
        sb2.append(this.f54873b);
        sb2.append(", ");
        sb2.append(this.f54882k);
        sb2.append(", ");
        sb2.append(this.f54883l);
        sb2.append(", ");
        sb2.append(this.f54880i);
        sb2.append(", ");
        sb2.append(this.f54879h);
        sb2.append(", ");
        sb2.append(this.f54874c);
        sb2.append(", [");
        sb2.append(this.f54886q);
        sb2.append(", ");
        sb2.append(this.f54887r);
        sb2.append(", ");
        sb2.append(this.f54888s);
        sb2.append("], [");
        sb2.append(this.f54894y);
        sb2.append(", ");
        return b.c0.o(sb2, this.f54895z, "])");
    }
}
