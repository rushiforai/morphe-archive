package defpackage;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i6a extends l75 {
    public static final i6a C;
    public static final vf6 D = new vf6(18);
    public byte A;
    public int B;
    public final g21 b;
    public int c;
    public int d;
    public int e;
    public int f;
    public s6a g;
    public int h;
    public List i;
    public s6a j;
    public int k;
    public List l;
    public List m;
    public int n;
    public List o;
    public a7a p;
    public int q;
    public int r;
    public List s;
    public List t;
    public List u;
    public List v;
    public List w;
    public List x;
    public List y;
    public List z;

    static {
        i6a i6aVar = new i6a();
        C = i6aVar;
        i6aVar.n();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x03ac  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x03ba  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03c6  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x03de  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x03ea  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x03f6  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x0402  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0410  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x041e  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0046  */
    /* JADX WARN: Type inference failed for: r4v10, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public i6a(defpackage.tp1 r23, defpackage.q74 r24) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1364
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i6a.<init>(tp1, q74):void");
    }

    @Override // defpackage.q1
    public final int a() {
        List list;
        List list2;
        int i = this.B;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 2) == 2 ? h30.d(1, this.e) : 0;
        if ((this.c & 4) == 4) {
            iD += h30.d(2, this.f);
        }
        if ((this.c & 8) == 8) {
            iD += h30.f(3, this.g);
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            iD += h30.f(4, (q1) this.i.get(i2));
        }
        if ((this.c & 32) == 32) {
            iD += h30.f(5, this.j);
        }
        if ((this.c & 128) == 128) {
            iD += h30.f(6, this.p);
        }
        if ((this.c & 256) == 256) {
            iD += h30.d(7, this.q);
        }
        if ((this.c & 512) == 512) {
            iD += h30.d(8, this.r);
        }
        if ((this.c & 16) == 16) {
            iD += h30.d(9, this.h);
        }
        if ((this.c & 64) == 64) {
            iD += h30.d(10, this.k);
        }
        if ((this.c & 1) == 1) {
            iD += h30.d(11, this.d);
        }
        for (int i3 = 0; i3 < this.l.size(); i3++) {
            iD += h30.f(12, (q1) this.l.get(i3));
        }
        int i4 = 0;
        int iE = 0;
        while (true) {
            int size = this.m.size();
            list = this.m;
            if (i4 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i4)).intValue());
            i4++;
        }
        int iF = iD + iE;
        if (!list.isEmpty()) {
            iF = iF + 1 + h30.e(iE);
        }
        this.n = iE;
        for (int i5 = 0; i5 < this.u.size(); i5++) {
            iF += h30.f(14, (q1) this.u.get(i5));
        }
        for (int i6 = 0; i6 < this.v.size(); i6++) {
            iF += h30.f(15, (q1) this.v.get(i6));
        }
        for (int i7 = 0; i7 < this.w.size(); i7++) {
            iF += h30.f(16, (q1) this.w.get(i7));
        }
        for (int i8 = 0; i8 < this.o.size(); i8++) {
            iF += h30.f(17, (q1) this.o.get(i8));
        }
        int i9 = 0;
        int iE2 = 0;
        while (true) {
            int size2 = this.s.size();
            list2 = this.s;
            if (i9 >= size2) {
                break;
            }
            iE2 += h30.e(((Integer) list2.get(i9)).intValue());
            i9++;
        }
        int size3 = (list2.size() * 2) + iF + iE2;
        for (int i10 = 0; i10 < this.t.size(); i10++) {
            size3 += h30.f(32, (q1) this.t.get(i10));
        }
        for (int i11 = 0; i11 < this.x.size(); i11++) {
            size3 += h30.f(33, (q1) this.x.get(i11));
        }
        for (int i12 = 0; i12 < this.y.size(); i12++) {
            size3 += h30.f(34, (q1) this.y.get(i12));
        }
        for (int i13 = 0; i13 < this.z.size(); i13++) {
            size3 += h30.f(35, (q1) this.z.get(i13));
        }
        int size4 = this.b.size() + h() + size3;
        this.B = size4;
        return size4;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return h6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        h6a h6aVarG = h6a.g();
        h6aVarG.h(this);
        return h6aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 2) == 2) {
            h30Var.C(1, this.e);
        }
        if ((this.c & 4) == 4) {
            h30Var.C(2, this.f);
        }
        if ((this.c & 8) == 8) {
            h30Var.E(3, this.g);
        }
        for (int i = 0; i < this.i.size(); i++) {
            h30Var.E(4, (q1) this.i.get(i));
        }
        if ((this.c & 32) == 32) {
            h30Var.E(5, this.j);
        }
        if ((this.c & 128) == 128) {
            h30Var.E(6, this.p);
        }
        if ((this.c & 256) == 256) {
            h30Var.C(7, this.q);
        }
        if ((this.c & 512) == 512) {
            h30Var.C(8, this.r);
        }
        if ((this.c & 16) == 16) {
            h30Var.C(9, this.h);
        }
        if ((this.c & 64) == 64) {
            h30Var.C(10, this.k);
        }
        if ((this.c & 1) == 1) {
            h30Var.C(11, this.d);
        }
        for (int i2 = 0; i2 < this.l.size(); i2++) {
            h30Var.E(12, (q1) this.l.get(i2));
        }
        if (this.m.size() > 0) {
            h30Var.L(106);
            h30Var.L(this.n);
        }
        for (int i3 = 0; i3 < this.m.size(); i3++) {
            h30Var.D(((Integer) this.m.get(i3)).intValue());
        }
        for (int i4 = 0; i4 < this.u.size(); i4++) {
            h30Var.E(14, (q1) this.u.get(i4));
        }
        for (int i5 = 0; i5 < this.v.size(); i5++) {
            h30Var.E(15, (q1) this.v.get(i5));
        }
        for (int i6 = 0; i6 < this.w.size(); i6++) {
            h30Var.E(16, (q1) this.w.get(i6));
        }
        for (int i7 = 0; i7 < this.o.size(); i7++) {
            h30Var.E(17, (q1) this.o.get(i7));
        }
        for (int i8 = 0; i8 < this.s.size(); i8++) {
            h30Var.C(31, ((Integer) this.s.get(i8)).intValue());
        }
        for (int i9 = 0; i9 < this.t.size(); i9++) {
            h30Var.E(32, (q1) this.t.get(i9));
        }
        for (int i10 = 0; i10 < this.x.size(); i10++) {
            h30Var.E(33, (q1) this.x.get(i10));
        }
        for (int i11 = 0; i11 < this.y.size(); i11++) {
            h30Var.E(34, (q1) this.y.get(i11));
        }
        for (int i12 = 0; i12 < this.z.size(); i12++) {
            h30Var.E(35, (q1) this.z.get(i12));
        }
        s26Var.A0(19000, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return C;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.A;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        int i = this.c;
        if ((i & 4) != 4) {
            this.A = (byte) 0;
            return false;
        }
        if ((i & 8) == 8 && !this.g.isInitialized()) {
            this.A = (byte) 0;
            return false;
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            if (!((x6a) this.i.get(i2)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        if ((this.c & 32) == 32 && !this.j.isInitialized()) {
            this.A = (byte) 0;
            return false;
        }
        for (int i3 = 0; i3 < this.l.size(); i3++) {
            if (!((s6a) this.l.get(i3)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i4 = 0; i4 < this.o.size(); i4++) {
            if (!((a7a) this.o.get(i4)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        if ((this.c & 128) == 128 && !this.p.isInitialized()) {
            this.A = (byte) 0;
            return false;
        }
        for (int i5 = 0; i5 < this.t.size(); i5++) {
            if (!((l5a) this.t.get(i5)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i6 = 0; i6 < this.u.size(); i6++) {
            if (!((h5a) this.u.get(i6)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i7 = 0; i7 < this.v.size(); i7++) {
            if (!((h5a) this.v.get(i7)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i8 = 0; i8 < this.w.size(); i8++) {
            if (!((h5a) this.w.get(i8)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i9 = 0; i9 < this.x.size(); i9++) {
            if (!((h5a) this.x.get(i9)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i10 = 0; i10 < this.y.size(); i10++) {
            if (!((h5a) this.y.get(i10)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        for (int i11 = 0; i11 < this.z.size(); i11++) {
            if (!((h5a) this.z.get(i11)).isInitialized()) {
                this.A = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.A = (byte) 1;
            return true;
        }
        this.A = (byte) 0;
        return false;
    }

    public final void n() {
        this.d = 518;
        this.e = 2054;
        this.f = 0;
        s6a s6aVar = s6a.t;
        this.g = s6aVar;
        this.h = 0;
        List list = Collections.EMPTY_LIST;
        this.i = list;
        this.j = s6aVar;
        this.k = 0;
        this.l = list;
        this.m = list;
        this.o = list;
        this.p = a7a.n;
        this.q = 0;
        this.r = 0;
        this.s = list;
        this.t = list;
        this.u = list;
        this.v = list;
        this.w = list;
        this.x = list;
        this.y = list;
        this.z = list;
    }

    public i6a() {
        this.n = -1;
        this.A = (byte) -1;
        this.B = -1;
        this.b = g21.a;
    }

    public i6a(h6a h6aVar) {
        super(h6aVar);
        this.n = -1;
        this.A = (byte) -1;
        this.B = -1;
        this.b = h6aVar.a;
    }
}
