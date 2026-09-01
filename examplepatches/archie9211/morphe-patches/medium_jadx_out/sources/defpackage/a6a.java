package defpackage;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a6a extends l75 {
    public static final a6a y;
    public static final vf6 z = new vf6(15);
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
    public List p;
    public y6a q;
    public List r;
    public p5a s;
    public List t;
    public List u;
    public List v;
    public byte w;
    public int x;

    static {
        a6a a6aVar = new a6a();
        y = a6aVar;
        a6aVar.n();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0044  */
    /* JADX WARN: Type inference failed for: r4v12, types: [r6a] */
    /* JADX WARN: Type inference failed for: r4v22, types: [r6a] */
    /* JADX WARN: Type inference failed for: r4v55, types: [g5a] */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v6, types: [boolean] */
    /* JADX WARN: Type inference failed for: r5v7 */
    /* JADX WARN: Type inference failed for: r5v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public a6a(defpackage.tp1 r21, defpackage.q74 r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1116
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a6a.<init>(tp1, q74):void");
    }

    @Override // defpackage.q1
    public final int a() {
        List list;
        List list2;
        int i = this.x;
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
        for (int i3 = 0; i3 < this.p.size(); i3++) {
            iD += h30.f(6, (q1) this.p.get(i3));
        }
        if ((this.c & 16) == 16) {
            iD += h30.d(7, this.h);
        }
        if ((this.c & 64) == 64) {
            iD += h30.d(8, this.k);
        }
        if ((this.c & 1) == 1) {
            iD += h30.d(9, this.d);
        }
        for (int i4 = 0; i4 < this.l.size(); i4++) {
            iD += h30.f(10, (q1) this.l.get(i4));
        }
        int i5 = 0;
        int iE = 0;
        while (true) {
            int size = this.m.size();
            list = this.m;
            if (i5 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i5)).intValue());
            i5++;
        }
        int iF = iD + iE;
        if (!list.isEmpty()) {
            iF = iF + 1 + h30.e(iE);
        }
        this.n = iE;
        for (int i6 = 0; i6 < this.u.size(); i6++) {
            iF += h30.f(12, (q1) this.u.get(i6));
        }
        for (int i7 = 0; i7 < this.o.size(); i7++) {
            iF += h30.f(13, (q1) this.o.get(i7));
        }
        if ((this.c & 128) == 128) {
            iF += h30.f(30, this.q);
        }
        int i8 = 0;
        int iE2 = 0;
        while (true) {
            int size2 = this.r.size();
            list2 = this.r;
            if (i8 >= size2) {
                break;
            }
            iE2 += h30.e(((Integer) list2.get(i8)).intValue());
            i8++;
        }
        int size3 = (list2.size() * 2) + iF + iE2;
        if ((this.c & 256) == 256) {
            size3 += h30.f(32, this.s);
        }
        for (int i9 = 0; i9 < this.t.size(); i9++) {
            size3 += h30.f(33, (q1) this.t.get(i9));
        }
        for (int i10 = 0; i10 < this.v.size(); i10++) {
            size3 += h30.f(34, (q1) this.v.get(i10));
        }
        int size4 = this.b.size() + h() + size3;
        this.x = size4;
        return size4;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return z5a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        z5a z5aVarG = z5a.g();
        z5aVarG.h(this);
        return z5aVarG;
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
        for (int i2 = 0; i2 < this.p.size(); i2++) {
            h30Var.E(6, (q1) this.p.get(i2));
        }
        if ((this.c & 16) == 16) {
            h30Var.C(7, this.h);
        }
        if ((this.c & 64) == 64) {
            h30Var.C(8, this.k);
        }
        if ((this.c & 1) == 1) {
            h30Var.C(9, this.d);
        }
        for (int i3 = 0; i3 < this.l.size(); i3++) {
            h30Var.E(10, (q1) this.l.get(i3));
        }
        if (this.m.size() > 0) {
            h30Var.L(90);
            h30Var.L(this.n);
        }
        for (int i4 = 0; i4 < this.m.size(); i4++) {
            h30Var.D(((Integer) this.m.get(i4)).intValue());
        }
        for (int i5 = 0; i5 < this.u.size(); i5++) {
            h30Var.E(12, (q1) this.u.get(i5));
        }
        for (int i6 = 0; i6 < this.o.size(); i6++) {
            h30Var.E(13, (q1) this.o.get(i6));
        }
        if ((this.c & 128) == 128) {
            h30Var.E(30, this.q);
        }
        for (int i7 = 0; i7 < this.r.size(); i7++) {
            h30Var.C(31, ((Integer) this.r.get(i7)).intValue());
        }
        if ((this.c & 256) == 256) {
            h30Var.E(32, this.s);
        }
        for (int i8 = 0; i8 < this.t.size(); i8++) {
            h30Var.E(33, (q1) this.t.get(i8));
        }
        for (int i9 = 0; i9 < this.v.size(); i9++) {
            h30Var.E(34, (q1) this.v.get(i9));
        }
        s26Var.A0(19000, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return y;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.w;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        int i = this.c;
        if ((i & 4) != 4) {
            this.w = (byte) 0;
            return false;
        }
        if ((i & 8) == 8 && !this.g.isInitialized()) {
            this.w = (byte) 0;
            return false;
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            if (!((x6a) this.i.get(i2)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        if ((this.c & 32) == 32 && !this.j.isInitialized()) {
            this.w = (byte) 0;
            return false;
        }
        for (int i3 = 0; i3 < this.l.size(); i3++) {
            if (!((s6a) this.l.get(i3)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        for (int i4 = 0; i4 < this.o.size(); i4++) {
            if (!((a7a) this.o.get(i4)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        for (int i5 = 0; i5 < this.p.size(); i5++) {
            if (!((a7a) this.p.get(i5)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        if ((this.c & 128) == 128 && !this.q.isInitialized()) {
            this.w = (byte) 0;
            return false;
        }
        if ((this.c & 256) == 256 && !this.s.isInitialized()) {
            this.w = (byte) 0;
            return false;
        }
        for (int i6 = 0; i6 < this.t.size(); i6++) {
            if (!((l5a) this.t.get(i6)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        for (int i7 = 0; i7 < this.u.size(); i7++) {
            if (!((h5a) this.u.get(i7)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        for (int i8 = 0; i8 < this.v.size(); i8++) {
            if (!((h5a) this.v.get(i8)).isInitialized()) {
                this.w = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.w = (byte) 1;
            return true;
        }
        this.w = (byte) 0;
        return false;
    }

    public final void n() {
        this.d = 6;
        this.e = 6;
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
        this.p = list;
        this.q = y6a.g;
        this.r = list;
        this.s = p5a.e;
        this.t = list;
        this.u = list;
        this.v = list;
    }

    public a6a() {
        this.n = -1;
        this.w = (byte) -1;
        this.x = -1;
        this.b = g21.a;
    }

    public a6a(z5a z5aVar) {
        super(z5aVar);
        this.n = -1;
        this.w = (byte) -1;
        this.x = -1;
        this.b = z5aVar.a;
    }
}
