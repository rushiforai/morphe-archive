package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n5a extends l75 {
    public static final n5a k;
    public static final vf6 l = new vf6(10);
    public final g21 b;
    public int c;
    public int d;
    public List e;
    public List f;
    public List g;
    public List h;
    public byte i;
    public int j;

    static {
        n5a n5aVar = new n5a();
        k = n5aVar;
        n5aVar.d = 6;
        List list = Collections.EMPTY_LIST;
        n5aVar.e = list;
        n5aVar.f = list;
        n5aVar.g = list;
        n5aVar.h = list;
    }

    public n5a(tp1 tp1Var, q74 q74Var) {
        this.i = (byte) -1;
        this.j = -1;
        this.d = 6;
        List list = Collections.EMPTY_LIST;
        this.e = list;
        this.f = list;
        this.g = list;
        this.h = list;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            this.c |= 1;
                            this.d = tp1Var.j();
                        } else if (iM == 18) {
                            if ((i & 2) != 2) {
                                this.e = new ArrayList();
                                i |= 2;
                            }
                            this.e.add(tp1Var.f(a7a.o, q74Var));
                        } else if (iM == 26) {
                            if ((i & 16) != 16) {
                                this.h = new ArrayList();
                                i |= 16;
                            }
                            this.h.add(tp1Var.f(h5a.h, q74Var));
                        } else if (iM == 248) {
                            if ((i & 4) != 4) {
                                this.f = new ArrayList();
                                i |= 4;
                            }
                            this.f.add(Integer.valueOf(tp1Var.j()));
                        } else if (iM == 250) {
                            int iD = tp1Var.d(tp1Var.j());
                            if ((i & 4) != 4 && tp1Var.b() > 0) {
                                this.f = new ArrayList();
                                i |= 4;
                            }
                            while (tp1Var.b() > 0) {
                                this.f.add(Integer.valueOf(tp1Var.j()));
                            }
                            tp1Var.c(iD);
                        } else if (iM == 258) {
                            if ((i & 8) != 8) {
                                this.g = new ArrayList();
                                i |= 8;
                            }
                            this.g.add(tp1Var.f(l5a.h, q74Var));
                        } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if ((i & 2) == 2) {
                        this.e = DesugarCollections.unmodifiableList(this.e);
                    }
                    if ((i & 16) == 16) {
                        this.h = DesugarCollections.unmodifiableList(this.h);
                    }
                    if ((i & 4) == 4) {
                        this.f = DesugarCollections.unmodifiableList(this.f);
                    }
                    if ((i & 8) == 8) {
                        this.g = DesugarCollections.unmodifiableList(this.g);
                    }
                    try {
                        h30VarT.y();
                    } catch (IOException unused) {
                    } catch (Throwable th2) {
                        this.b = e21Var.p();
                        throw th2;
                    }
                    this.b = e21Var.p();
                    k();
                    throw th;
                }
            } catch (InvalidProtocolBufferException e) {
                e.a = this;
                throw e;
            } catch (IOException e2) {
                InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                invalidProtocolBufferException.a = this;
                throw invalidProtocolBufferException;
            }
        }
        if ((i & 2) == 2) {
            this.e = DesugarCollections.unmodifiableList(this.e);
        }
        if ((i & 16) == 16) {
            this.h = DesugarCollections.unmodifiableList(this.h);
        }
        if ((i & 4) == 4) {
            this.f = DesugarCollections.unmodifiableList(this.f);
        }
        if ((i & 8) == 8) {
            this.g = DesugarCollections.unmodifiableList(this.g);
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
    }

    @Override // defpackage.q1
    public final int a() {
        List list;
        int i = this.j;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            iD += h30.f(2, (q1) this.e.get(i2));
        }
        for (int i3 = 0; i3 < this.h.size(); i3++) {
            iD += h30.f(3, (q1) this.h.get(i3));
        }
        int i4 = 0;
        int iE = 0;
        while (true) {
            int size = this.f.size();
            list = this.f;
            if (i4 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i4)).intValue());
            i4++;
        }
        int size2 = (list.size() * 2) + iD + iE;
        for (int i5 = 0; i5 < this.g.size(); i5++) {
            size2 += h30.f(32, (q1) this.g.get(i5));
        }
        int size3 = this.b.size() + h() + size2;
        this.j = size3;
        return size3;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return m5a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        m5a m5aVarG = m5a.g();
        m5aVarG.h(this);
        return m5aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.C(1, this.d);
        }
        for (int i = 0; i < this.e.size(); i++) {
            h30Var.E(2, (q1) this.e.get(i));
        }
        for (int i2 = 0; i2 < this.h.size(); i2++) {
            h30Var.E(3, (q1) this.h.get(i2));
        }
        for (int i3 = 0; i3 < this.f.size(); i3++) {
            h30Var.C(31, ((Integer) this.f.get(i3)).intValue());
        }
        for (int i4 = 0; i4 < this.g.size(); i4++) {
            h30Var.E(32, (q1) this.g.get(i4));
        }
        s26Var.A0(19000, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return k;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.i;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        for (int i = 0; i < this.e.size(); i++) {
            if (!((a7a) this.e.get(i)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        for (int i2 = 0; i2 < this.g.size(); i2++) {
            if (!((l5a) this.g.get(i2)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        for (int i3 = 0; i3 < this.h.size(); i3++) {
            if (!((h5a) this.h.get(i3)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.i = (byte) 1;
            return true;
        }
        this.i = (byte) 0;
        return false;
    }

    public n5a() {
        this.i = (byte) -1;
        this.j = -1;
        this.b = g21.a;
    }

    public n5a(m5a m5aVar) {
        super(m5aVar);
        this.i = (byte) -1;
        this.j = -1;
        this.b = m5aVar.a;
    }
}
