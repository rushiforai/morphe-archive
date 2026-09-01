package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y5a extends s75 {
    public static final y5a l;
    public static final vf6 m = new vf6(14);
    public final g21 a;
    public int b;
    public int c;
    public int d;
    public x5a e;
    public s6a f;
    public int g;
    public List h;
    public List i;
    public byte j;
    public int k;

    static {
        y5a y5aVar = new y5a();
        l = y5aVar;
        y5aVar.c = 0;
        y5aVar.d = 0;
        y5aVar.e = x5a.TRUE;
        y5aVar.f = s6a.t;
        y5aVar.g = 0;
        List list = Collections.EMPTY_LIST;
        y5aVar.h = list;
        y5aVar.i = list;
    }

    public y5a(tp1 tp1Var, q74 q74Var) {
        r6a r6aVarP;
        this.j = (byte) -1;
        this.k = -1;
        boolean z = false;
        this.c = 0;
        this.d = 0;
        this.e = x5a.TRUE;
        this.f = s6a.t;
        this.g = 0;
        List list = Collections.EMPTY_LIST;
        this.h = list;
        this.i = list;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            this.b |= 1;
                            this.c = tp1Var.j();
                        } else if (iM == 16) {
                            this.b |= 2;
                            this.d = tp1Var.j();
                        } else if (iM == 24) {
                            int iJ = tp1Var.j();
                            x5a x5aVarValueOf = x5a.valueOf(iJ);
                            if (x5aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 4;
                                this.e = x5aVarValueOf;
                            }
                        } else if (iM == 34) {
                            if ((this.b & 8) == 8) {
                                s6a s6aVar = this.f;
                                s6aVar.getClass();
                                r6aVarP = s6a.p(s6aVar);
                            } else {
                                r6aVarP = null;
                            }
                            s6a s6aVar2 = (s6a) tp1Var.f(s6a.u, q74Var);
                            this.f = s6aVar2;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar2);
                                this.f = r6aVarP.e();
                            }
                            this.b |= 8;
                        } else if (iM != 40) {
                            vf6 vf6Var = m;
                            if (iM == 50) {
                                if ((i & 32) != 32) {
                                    this.h = new ArrayList();
                                    i |= 32;
                                }
                                this.h.add(tp1Var.f(vf6Var, q74Var));
                            } else if (iM == 58) {
                                if ((i & 64) != 64) {
                                    this.i = new ArrayList();
                                    i |= 64;
                                }
                                this.i.add(tp1Var.f(vf6Var, q74Var));
                            } else if (!tp1Var.p(iM, h30VarT)) {
                            }
                        } else {
                            this.b |= 16;
                            this.g = tp1Var.j();
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if ((i & 32) == 32) {
                        this.h = DesugarCollections.unmodifiableList(this.h);
                    }
                    if ((i & 64) == 64) {
                        this.i = DesugarCollections.unmodifiableList(this.i);
                    }
                    try {
                        h30VarT.y();
                    } catch (IOException unused) {
                    } catch (Throwable th2) {
                        this.a = e21Var.p();
                        throw th2;
                    }
                    this.a = e21Var.p();
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
        if ((i & 32) == 32) {
            this.h = DesugarCollections.unmodifiableList(this.h);
        }
        if ((i & 64) == 64) {
            this.i = DesugarCollections.unmodifiableList(this.i);
        }
        try {
            h30VarT.y();
        } catch (IOException unused2) {
        } catch (Throwable th3) {
            this.a = e21Var.p();
            throw th3;
        }
        this.a = e21Var.p();
    }

    @Override // defpackage.q1
    public final int a() {
        int i = this.k;
        if (i != -1) {
            return i;
        }
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iD += h30.d(2, this.d);
        }
        if ((this.b & 4) == 4) {
            iD += h30.c(3, this.e.getNumber());
        }
        if ((this.b & 8) == 8) {
            iD += h30.f(4, this.f);
        }
        if ((this.b & 16) == 16) {
            iD += h30.d(5, this.g);
        }
        for (int i2 = 0; i2 < this.h.size(); i2++) {
            iD += h30.f(6, (q1) this.h.get(i2));
        }
        for (int i3 = 0; i3 < this.i.size(); i3++) {
            iD += h30.f(7, (q1) this.i.get(i3));
        }
        int size = this.a.size() + iD;
        this.k = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return w5a.e();
    }

    @Override // defpackage.q1
    public final g75 c() {
        w5a w5aVarE = w5a.e();
        w5aVarE.g(this);
        return w5aVarE;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.C(1, this.c);
        }
        if ((this.b & 2) == 2) {
            h30Var.C(2, this.d);
        }
        if ((this.b & 4) == 4) {
            h30Var.B(3, this.e.getNumber());
        }
        if ((this.b & 8) == 8) {
            h30Var.E(4, this.f);
        }
        if ((this.b & 16) == 16) {
            h30Var.C(5, this.g);
        }
        for (int i = 0; i < this.h.size(); i++) {
            h30Var.E(6, (q1) this.h.get(i));
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            h30Var.E(7, (q1) this.i.get(i2));
        }
        h30Var.H(this.a);
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.j;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.b & 8) == 8 && !this.f.isInitialized()) {
            this.j = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.h.size(); i++) {
            if (!((y5a) this.h.get(i)).isInitialized()) {
                this.j = (byte) 0;
                return false;
            }
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            if (!((y5a) this.i.get(i2)).isInitialized()) {
                this.j = (byte) 0;
                return false;
            }
        }
        this.j = (byte) 1;
        return true;
    }

    public y5a() {
        this.j = (byte) -1;
        this.k = -1;
        this.a = g21.a;
    }

    public y5a(w5a w5aVar) {
        this.j = (byte) -1;
        this.k = -1;
        this.a = w5aVar.a;
    }
}
