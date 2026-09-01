package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u6a extends l75 {
    public static final u6a p;
    public static final vf6 q = new vf6(24);
    public final g21 b;
    public int c;
    public int d;
    public int e;
    public List f;
    public s6a g;
    public int h;
    public s6a i;
    public int j;
    public List k;
    public List l;
    public List m;
    public byte n;
    public int o;

    static {
        u6a u6aVar = new u6a();
        p = u6aVar;
        u6aVar.d = 6;
        u6aVar.e = 0;
        List list = Collections.EMPTY_LIST;
        u6aVar.f = list;
        s6a s6aVar = s6a.t;
        u6aVar.g = s6aVar;
        u6aVar.h = 0;
        u6aVar.i = s6aVar;
        u6aVar.j = 0;
        u6aVar.k = list;
        u6aVar.l = list;
        u6aVar.m = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [boolean] */
    public u6a(tp1 tp1Var, q74 q74Var) {
        this.n = (byte) -1;
        this.o = -1;
        this.d = 6;
        boolean z = false;
        this.e = 0;
        List list = Collections.EMPTY_LIST;
        this.f = list;
        s6a s6aVar = s6a.t;
        this.g = s6aVar;
        this.h = 0;
        this.i = s6aVar;
        this.j = 0;
        this.k = list;
        this.l = list;
        this.m = list;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
        while (true) {
            ?? L = 128;
            if (z) {
                if ((i & 4) == 4) {
                    this.f = DesugarCollections.unmodifiableList(this.f);
                }
                if ((i & 128) == 128) {
                    this.k = DesugarCollections.unmodifiableList(this.k);
                }
                if ((i & 256) == 256) {
                    this.l = DesugarCollections.unmodifiableList(this.l);
                }
                if ((i & 512) == 512) {
                    this.m = DesugarCollections.unmodifiableList(this.m);
                }
                try {
                    h30VarT.y();
                } catch (IOException unused) {
                } catch (Throwable th) {
                    this.b = e21Var.p();
                    throw th;
                }
                this.b = e21Var.p();
                k();
                return;
            }
            try {
                try {
                    int iM = tp1Var.m();
                    r6a r6aVarP = null;
                    switch (iM) {
                        case 0:
                            z = true;
                            break;
                        case 8:
                            this.c |= 1;
                            this.d = tp1Var.j();
                            break;
                        case 16:
                            this.c |= 2;
                            this.e = tp1Var.j();
                            break;
                        case 26:
                            if ((i & 4) != 4) {
                                this.f = new ArrayList();
                                i |= 4;
                            }
                            this.f.add(tp1Var.f(x6a.n, q74Var));
                            break;
                        case 34:
                            if ((this.c & 4) == 4) {
                                s6a s6aVar2 = this.g;
                                s6aVar2.getClass();
                                r6aVarP = s6a.p(s6aVar2);
                            }
                            s6a s6aVar3 = (s6a) tp1Var.f(s6a.u, q74Var);
                            this.g = s6aVar3;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar3);
                                this.g = r6aVarP.e();
                            }
                            this.c |= 4;
                            break;
                        case 40:
                            this.c |= 8;
                            this.h = tp1Var.j();
                            break;
                        case 50:
                            if ((this.c & 16) == 16) {
                                s6a s6aVar4 = this.i;
                                s6aVar4.getClass();
                                r6aVarP = s6a.p(s6aVar4);
                            }
                            s6a s6aVar5 = (s6a) tp1Var.f(s6a.u, q74Var);
                            this.i = s6aVar5;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar5);
                                this.i = r6aVarP.e();
                            }
                            this.c |= 16;
                            break;
                        case 56:
                            this.c |= 32;
                            this.j = tp1Var.j();
                            break;
                        case 66:
                            if ((i & 128) != 128) {
                                this.k = new ArrayList();
                                i |= 128;
                            }
                            this.k.add(tp1Var.f(h5a.h, q74Var));
                            break;
                        case 248:
                            if ((i & 256) != 256) {
                                this.l = new ArrayList();
                                i |= 256;
                            }
                            this.l.add(Integer.valueOf(tp1Var.j()));
                            break;
                        case 250:
                            int iD = tp1Var.d(tp1Var.j());
                            if ((i & 256) != 256 && tp1Var.b() > 0) {
                                this.l = new ArrayList();
                                i |= 256;
                            }
                            while (tp1Var.b() > 0) {
                                this.l.add(Integer.valueOf(tp1Var.j()));
                            }
                            tp1Var.c(iD);
                            break;
                        case 258:
                            if ((i & 512) != 512) {
                                this.m = new ArrayList();
                                i |= 512;
                            }
                            this.m.add(tp1Var.f(l5a.h, q74Var));
                            break;
                        default:
                            L = l(tp1Var, h30VarT, q74Var, iM);
                            if (L == 0) {
                                z = true;
                            }
                            break;
                    }
                } catch (InvalidProtocolBufferException e) {
                    e.a = this;
                    throw e;
                } catch (IOException e2) {
                    InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                    invalidProtocolBufferException.a = this;
                    throw invalidProtocolBufferException;
                }
            } catch (Throwable th2) {
                if ((i & 4) == 4) {
                    this.f = DesugarCollections.unmodifiableList(this.f);
                }
                if ((i & 128) == L) {
                    this.k = DesugarCollections.unmodifiableList(this.k);
                }
                if ((i & 256) == 256) {
                    this.l = DesugarCollections.unmodifiableList(this.l);
                }
                if ((i & 512) == 512) {
                    this.m = DesugarCollections.unmodifiableList(this.m);
                }
                try {
                    h30VarT.y();
                } catch (IOException unused2) {
                } catch (Throwable th3) {
                    this.b = e21Var.p();
                    throw th3;
                }
                this.b = e21Var.p();
                k();
                throw th2;
            }
        }
    }

    @Override // defpackage.q1
    public final int a() {
        List list;
        int i = this.o;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        if ((this.c & 2) == 2) {
            iD += h30.d(2, this.e);
        }
        for (int i2 = 0; i2 < this.f.size(); i2++) {
            iD += h30.f(3, (q1) this.f.get(i2));
        }
        if ((this.c & 4) == 4) {
            iD += h30.f(4, this.g);
        }
        if ((this.c & 8) == 8) {
            iD += h30.d(5, this.h);
        }
        if ((this.c & 16) == 16) {
            iD += h30.f(6, this.i);
        }
        if ((this.c & 32) == 32) {
            iD += h30.d(7, this.j);
        }
        for (int i3 = 0; i3 < this.k.size(); i3++) {
            iD += h30.f(8, (q1) this.k.get(i3));
        }
        int i4 = 0;
        int iE = 0;
        while (true) {
            int size = this.l.size();
            list = this.l;
            if (i4 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i4)).intValue());
            i4++;
        }
        int size2 = (list.size() * 2) + iD + iE;
        for (int i5 = 0; i5 < this.m.size(); i5++) {
            size2 += h30.f(32, (q1) this.m.get(i5));
        }
        int size3 = this.b.size() + h() + size2;
        this.o = size3;
        return size3;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return t6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        t6a t6aVarG = t6a.g();
        t6aVarG.h(this);
        return t6aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.C(1, this.d);
        }
        if ((this.c & 2) == 2) {
            h30Var.C(2, this.e);
        }
        for (int i = 0; i < this.f.size(); i++) {
            h30Var.E(3, (q1) this.f.get(i));
        }
        if ((this.c & 4) == 4) {
            h30Var.E(4, this.g);
        }
        if ((this.c & 8) == 8) {
            h30Var.C(5, this.h);
        }
        if ((this.c & 16) == 16) {
            h30Var.E(6, this.i);
        }
        if ((this.c & 32) == 32) {
            h30Var.C(7, this.j);
        }
        for (int i2 = 0; i2 < this.k.size(); i2++) {
            h30Var.E(8, (q1) this.k.get(i2));
        }
        for (int i3 = 0; i3 < this.l.size(); i3++) {
            h30Var.C(31, ((Integer) this.l.get(i3)).intValue());
        }
        for (int i4 = 0; i4 < this.m.size(); i4++) {
            h30Var.E(32, (q1) this.m.get(i4));
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return p;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.n;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.c & 2) != 2) {
            this.n = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.f.size(); i++) {
            if (!((x6a) this.f.get(i)).isInitialized()) {
                this.n = (byte) 0;
                return false;
            }
        }
        if ((this.c & 4) == 4 && !this.g.isInitialized()) {
            this.n = (byte) 0;
            return false;
        }
        if ((this.c & 16) == 16 && !this.i.isInitialized()) {
            this.n = (byte) 0;
            return false;
        }
        for (int i2 = 0; i2 < this.k.size(); i2++) {
            if (!((h5a) this.k.get(i2)).isInitialized()) {
                this.n = (byte) 0;
                return false;
            }
        }
        for (int i3 = 0; i3 < this.m.size(); i3++) {
            if (!((l5a) this.m.get(i3)).isInitialized()) {
                this.n = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.n = (byte) 1;
            return true;
        }
        this.n = (byte) 0;
        return false;
    }

    public u6a() {
        this.n = (byte) -1;
        this.o = -1;
        this.b = g21.a;
    }

    public u6a(t6a t6aVar) {
        super(t6aVar);
        this.n = (byte) -1;
        this.o = -1;
        this.b = t6aVar.a;
    }
}
