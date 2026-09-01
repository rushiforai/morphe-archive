package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a7a extends l75 {
    public static final a7a n;
    public static final vf6 o = new vf6(27);
    public final g21 b;
    public int c;
    public int d;
    public int e;
    public s6a f;
    public int g;
    public s6a h;
    public int i;
    public List j;
    public e5a k;
    public byte l;
    public int m;

    static {
        a7a a7aVar = new a7a();
        n = a7aVar;
        a7aVar.d = 0;
        a7aVar.e = 0;
        s6a s6aVar = s6a.t;
        a7aVar.f = s6aVar;
        a7aVar.g = 0;
        a7aVar.h = s6aVar;
        a7aVar.i = 0;
        a7aVar.j = Collections.EMPTY_LIST;
        a7aVar.k = e5a.p;
    }

    public a7a(tp1 tp1Var, q74 q74Var) {
        this.l = (byte) -1;
        this.m = -1;
        boolean z = false;
        this.d = 0;
        this.e = 0;
        s6a s6aVar = s6a.t;
        this.f = s6aVar;
        this.g = 0;
        this.h = s6aVar;
        this.i = 0;
        this.j = Collections.EMPTY_LIST;
        this.k = e5a.p;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        char c = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            this.c |= 1;
                            this.d = tp1Var.j();
                        } else if (iM != 16) {
                            c5a c5aVarE = null;
                            r6a r6aVarP = null;
                            r6a r6aVarP2 = null;
                            if (iM == 26) {
                                if ((this.c & 4) == 4) {
                                    s6a s6aVar2 = this.f;
                                    s6aVar2.getClass();
                                    r6aVarP = s6a.p(s6aVar2);
                                }
                                s6a s6aVar3 = (s6a) tp1Var.f(s6a.u, q74Var);
                                this.f = s6aVar3;
                                if (r6aVarP != null) {
                                    r6aVarP.h(s6aVar3);
                                    this.f = r6aVarP.e();
                                }
                                this.c |= 4;
                            } else if (iM == 34) {
                                if ((this.c & 16) == 16) {
                                    s6a s6aVar4 = this.h;
                                    s6aVar4.getClass();
                                    r6aVarP2 = s6a.p(s6aVar4);
                                }
                                s6a s6aVar5 = (s6a) tp1Var.f(s6a.u, q74Var);
                                this.h = s6aVar5;
                                if (r6aVarP2 != null) {
                                    r6aVarP2.h(s6aVar5);
                                    this.h = r6aVarP2.e();
                                }
                                this.c |= 16;
                            } else if (iM == 40) {
                                this.c |= 8;
                                this.g = tp1Var.j();
                            } else if (iM == 48) {
                                this.c |= 32;
                                this.i = tp1Var.j();
                            } else if (iM == 58) {
                                int i = (c == true ? 1 : 0) & '@';
                                c = c;
                                if (i != 64) {
                                    this.j = new ArrayList();
                                    c = '@';
                                }
                                this.j.add(tp1Var.f(h5a.h, q74Var));
                            } else if (iM == 66) {
                                if ((this.c & 64) == 64) {
                                    e5a e5aVar = this.k;
                                    e5aVar.getClass();
                                    c5aVarE = c5a.e();
                                    c5aVarE.g(e5aVar);
                                }
                                e5a e5aVar2 = (e5a) tp1Var.f(e5a.q, q74Var);
                                this.k = e5aVar2;
                                if (c5aVarE != null) {
                                    c5aVarE.g(e5aVar2);
                                    this.k = c5aVarE.d();
                                }
                                this.c |= 64;
                            } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
                            }
                        } else {
                            this.c |= 2;
                            this.e = tp1Var.j();
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if (((c == true ? 1 : 0) & '@') == 64) {
                        this.j = DesugarCollections.unmodifiableList(this.j);
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
        if (((c == true ? 1 : 0) & '@') == 64) {
            this.j = DesugarCollections.unmodifiableList(this.j);
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
        int i = this.m;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        if ((this.c & 2) == 2) {
            iD += h30.d(2, this.e);
        }
        if ((this.c & 4) == 4) {
            iD += h30.f(3, this.f);
        }
        if ((this.c & 16) == 16) {
            iD += h30.f(4, this.h);
        }
        if ((this.c & 8) == 8) {
            iD += h30.d(5, this.g);
        }
        if ((this.c & 32) == 32) {
            iD += h30.d(6, this.i);
        }
        for (int i2 = 0; i2 < this.j.size(); i2++) {
            iD += h30.f(7, (q1) this.j.get(i2));
        }
        if ((this.c & 64) == 64) {
            iD += h30.f(8, this.k);
        }
        int size = this.b.size() + h() + iD;
        this.m = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return z6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        z6a z6aVarG = z6a.g();
        z6aVarG.h(this);
        return z6aVarG;
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
        if ((this.c & 4) == 4) {
            h30Var.E(3, this.f);
        }
        if ((this.c & 16) == 16) {
            h30Var.E(4, this.h);
        }
        if ((this.c & 8) == 8) {
            h30Var.C(5, this.g);
        }
        if ((this.c & 32) == 32) {
            h30Var.C(6, this.i);
        }
        for (int i = 0; i < this.j.size(); i++) {
            h30Var.E(7, (q1) this.j.get(i));
        }
        if ((this.c & 64) == 64) {
            h30Var.E(8, this.k);
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return n;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.l;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        int i = this.c;
        if ((i & 2) != 2) {
            this.l = (byte) 0;
            return false;
        }
        if ((i & 4) == 4 && !this.f.isInitialized()) {
            this.l = (byte) 0;
            return false;
        }
        if ((this.c & 16) == 16 && !this.h.isInitialized()) {
            this.l = (byte) 0;
            return false;
        }
        for (int i2 = 0; i2 < this.j.size(); i2++) {
            if (!((h5a) this.j.get(i2)).isInitialized()) {
                this.l = (byte) 0;
                return false;
            }
        }
        if ((this.c & 64) == 64 && !this.k.isInitialized()) {
            this.l = (byte) 0;
            return false;
        }
        if (g()) {
            this.l = (byte) 1;
            return true;
        }
        this.l = (byte) 0;
        return false;
    }

    public a7a() {
        this.l = (byte) -1;
        this.m = -1;
        this.b = g21.a;
    }

    public a7a(z6a z6aVar) {
        super(z6aVar);
        this.l = (byte) -1;
        this.m = -1;
        this.b = z6aVar.a;
    }
}
