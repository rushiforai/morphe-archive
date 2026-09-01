package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k5a extends l75 {
    public static final k5a G;
    public static final vf6 H = new vf6(8);
    public y6a A;
    public List B;
    public f7a C;
    public List D;
    public byte E;
    public int F;
    public final g21 b;
    public int c;
    public int d;
    public int e;
    public int f;
    public List g;
    public List h;
    public List i;
    public int j;
    public List k;
    public int l;
    public List m;
    public List n;
    public int o;
    public List p;
    public List q;
    public List r;
    public List s;
    public List t;
    public List u;
    public int v;
    public int w;
    public s6a x;
    public int y;
    public List z;

    static {
        k5a k5aVar = new k5a();
        G = k5aVar;
        k5aVar.n();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:9:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public k5a(defpackage.tp1 r22, defpackage.q74 r23) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1618
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k5a.<init>(tp1, q74):void");
    }

    @Override // defpackage.q1
    public final int a() {
        List list;
        List list2;
        List list3;
        List list4;
        List list5;
        int i = this.F;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        int i2 = 0;
        int iE = 0;
        while (true) {
            int size = this.i.size();
            list = this.i;
            if (i2 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i2)).intValue());
            i2++;
        }
        int iF = iD + iE;
        if (!list.isEmpty()) {
            iF = iF + 1 + h30.e(iE);
        }
        this.j = iE;
        if ((this.c & 2) == 2) {
            iF += h30.d(3, this.e);
        }
        if ((this.c & 4) == 4) {
            iF += h30.d(4, this.f);
        }
        for (int i3 = 0; i3 < this.g.size(); i3++) {
            iF += h30.f(5, (q1) this.g.get(i3));
        }
        for (int i4 = 0; i4 < this.h.size(); i4++) {
            iF += h30.f(6, (q1) this.h.get(i4));
        }
        int i5 = 0;
        int iE2 = 0;
        while (true) {
            int size2 = this.k.size();
            list2 = this.k;
            if (i5 >= size2) {
                break;
            }
            iE2 += h30.e(((Integer) list2.get(i5)).intValue());
            i5++;
        }
        int iF2 = iF + iE2;
        if (!list2.isEmpty()) {
            iF2 = iF2 + 1 + h30.e(iE2);
        }
        this.l = iE2;
        for (int i6 = 0; i6 < this.p.size(); i6++) {
            iF2 += h30.f(8, (q1) this.p.get(i6));
        }
        for (int i7 = 0; i7 < this.q.size(); i7++) {
            iF2 += h30.f(9, (q1) this.q.get(i7));
        }
        for (int i8 = 0; i8 < this.r.size(); i8++) {
            iF2 += h30.f(10, (q1) this.r.get(i8));
        }
        for (int i9 = 0; i9 < this.s.size(); i9++) {
            iF2 += h30.f(11, (q1) this.s.get(i9));
        }
        for (int i10 = 0; i10 < this.t.size(); i10++) {
            iF2 += h30.f(13, (q1) this.t.get(i10));
        }
        int i11 = 0;
        int iE3 = 0;
        while (true) {
            int size3 = this.u.size();
            list3 = this.u;
            if (i11 >= size3) {
                break;
            }
            iE3 += h30.e(((Integer) list3.get(i11)).intValue());
            i11++;
        }
        int iF3 = iF2 + iE3;
        if (!list3.isEmpty()) {
            iF3 = iF3 + 2 + h30.e(iE3);
        }
        this.v = iE3;
        if ((this.c & 8) == 8) {
            iF3 += h30.d(17, this.w);
        }
        if ((this.c & 16) == 16) {
            iF3 += h30.f(18, this.x);
        }
        if ((this.c & 32) == 32) {
            iF3 += h30.d(19, this.y);
        }
        for (int i12 = 0; i12 < this.m.size(); i12++) {
            iF3 += h30.f(20, (q1) this.m.get(i12));
        }
        int i13 = 0;
        int iE4 = 0;
        while (true) {
            int size4 = this.n.size();
            list4 = this.n;
            if (i13 >= size4) {
                break;
            }
            iE4 += h30.e(((Integer) list4.get(i13)).intValue());
            i13++;
        }
        int iF4 = iF3 + iE4;
        if (!list4.isEmpty()) {
            iF4 = iF4 + 2 + h30.e(iE4);
        }
        this.o = iE4;
        for (int i14 = 0; i14 < this.z.size(); i14++) {
            iF4 += h30.f(25, (q1) this.z.get(i14));
        }
        if ((this.c & 64) == 64) {
            iF4 += h30.f(30, this.A);
        }
        int i15 = 0;
        int iE5 = 0;
        while (true) {
            int size5 = this.B.size();
            list5 = this.B;
            if (i15 >= size5) {
                break;
            }
            iE5 += h30.e(((Integer) list5.get(i15)).intValue());
            i15++;
        }
        int size6 = (list5.size() * 2) + iF4 + iE5;
        if ((this.c & 128) == 128) {
            size6 += h30.f(32, this.C);
        }
        for (int i16 = 0; i16 < this.D.size(); i16++) {
            size6 += h30.f(33, (q1) this.D.get(i16));
        }
        int size7 = this.b.size() + h() + size6;
        this.F = size7;
        return size7;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return i5a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        i5a i5aVarG = i5a.g();
        i5aVarG.h(this);
        return i5aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.C(1, this.d);
        }
        if (this.i.size() > 0) {
            h30Var.L(18);
            h30Var.L(this.j);
        }
        for (int i = 0; i < this.i.size(); i++) {
            h30Var.D(((Integer) this.i.get(i)).intValue());
        }
        if ((this.c & 2) == 2) {
            h30Var.C(3, this.e);
        }
        if ((this.c & 4) == 4) {
            h30Var.C(4, this.f);
        }
        for (int i2 = 0; i2 < this.g.size(); i2++) {
            h30Var.E(5, (q1) this.g.get(i2));
        }
        for (int i3 = 0; i3 < this.h.size(); i3++) {
            h30Var.E(6, (q1) this.h.get(i3));
        }
        if (this.k.size() > 0) {
            h30Var.L(58);
            h30Var.L(this.l);
        }
        for (int i4 = 0; i4 < this.k.size(); i4++) {
            h30Var.D(((Integer) this.k.get(i4)).intValue());
        }
        for (int i5 = 0; i5 < this.p.size(); i5++) {
            h30Var.E(8, (q1) this.p.get(i5));
        }
        for (int i6 = 0; i6 < this.q.size(); i6++) {
            h30Var.E(9, (q1) this.q.get(i6));
        }
        for (int i7 = 0; i7 < this.r.size(); i7++) {
            h30Var.E(10, (q1) this.r.get(i7));
        }
        for (int i8 = 0; i8 < this.s.size(); i8++) {
            h30Var.E(11, (q1) this.s.get(i8));
        }
        for (int i9 = 0; i9 < this.t.size(); i9++) {
            h30Var.E(13, (q1) this.t.get(i9));
        }
        if (this.u.size() > 0) {
            h30Var.L(NikonType2MakernoteDirectory.TAG_ADAPTER);
            h30Var.L(this.v);
        }
        for (int i10 = 0; i10 < this.u.size(); i10++) {
            h30Var.D(((Integer) this.u.get(i10)).intValue());
        }
        if ((this.c & 8) == 8) {
            h30Var.C(17, this.w);
        }
        if ((this.c & 16) == 16) {
            h30Var.E(18, this.x);
        }
        if ((this.c & 32) == 32) {
            h30Var.C(19, this.y);
        }
        for (int i11 = 0; i11 < this.m.size(); i11++) {
            h30Var.E(20, (q1) this.m.get(i11));
        }
        if (this.n.size() > 0) {
            h30Var.L(170);
            h30Var.L(this.o);
        }
        for (int i12 = 0; i12 < this.n.size(); i12++) {
            h30Var.D(((Integer) this.n.get(i12)).intValue());
        }
        for (int i13 = 0; i13 < this.z.size(); i13++) {
            h30Var.E(25, (q1) this.z.get(i13));
        }
        if ((this.c & 64) == 64) {
            h30Var.E(30, this.A);
        }
        for (int i14 = 0; i14 < this.B.size(); i14++) {
            h30Var.C(31, ((Integer) this.B.get(i14)).intValue());
        }
        if ((this.c & 128) == 128) {
            h30Var.E(32, this.C);
        }
        for (int i15 = 0; i15 < this.D.size(); i15++) {
            h30Var.E(33, (q1) this.D.get(i15));
        }
        s26Var.A0(19000, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return G;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.E;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.c & 2) != 2) {
            this.E = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.g.size(); i++) {
            if (!((x6a) this.g.get(i)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i2 = 0; i2 < this.h.size(); i2++) {
            if (!((s6a) this.h.get(i2)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i3 = 0; i3 < this.m.size(); i3++) {
            if (!((s6a) this.m.get(i3)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i4 = 0; i4 < this.p.size(); i4++) {
            if (!((n5a) this.p.get(i4)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i5 = 0; i5 < this.q.size(); i5++) {
            if (!((a6a) this.q.get(i5)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i6 = 0; i6 < this.r.size(); i6++) {
            if (!((i6a) this.r.get(i6)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i7 = 0; i7 < this.s.size(); i7++) {
            if (!((u6a) this.s.get(i7)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        for (int i8 = 0; i8 < this.t.size(); i8++) {
            if (!((v5a) this.t.get(i8)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        if ((this.c & 16) == 16 && !this.x.isInitialized()) {
            this.E = (byte) 0;
            return false;
        }
        for (int i9 = 0; i9 < this.z.size(); i9++) {
            if (!((h5a) this.z.get(i9)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        if ((this.c & 64) == 64 && !this.A.isInitialized()) {
            this.E = (byte) 0;
            return false;
        }
        for (int i10 = 0; i10 < this.D.size(); i10++) {
            if (!((l5a) this.D.get(i10)).isInitialized()) {
                this.E = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.E = (byte) 1;
            return true;
        }
        this.E = (byte) 0;
        return false;
    }

    public final void n() {
        this.d = 6;
        this.e = 0;
        this.f = 0;
        List list = Collections.EMPTY_LIST;
        this.g = list;
        this.h = list;
        this.i = list;
        this.k = list;
        this.m = list;
        this.n = list;
        this.p = list;
        this.q = list;
        this.r = list;
        this.s = list;
        this.t = list;
        this.u = list;
        this.w = 0;
        this.x = s6a.t;
        this.y = 0;
        this.z = list;
        this.A = y6a.g;
        this.B = list;
        this.C = f7a.e;
        this.D = list;
    }

    public k5a() {
        this.j = -1;
        this.l = -1;
        this.o = -1;
        this.v = -1;
        this.E = (byte) -1;
        this.F = -1;
        this.b = g21.a;
    }

    public k5a(i5a i5aVar) {
        super(i5aVar);
        this.j = -1;
        this.l = -1;
        this.o = -1;
        this.v = -1;
        this.E = (byte) -1;
        this.F = -1;
        this.b = i5aVar.a;
    }
}
