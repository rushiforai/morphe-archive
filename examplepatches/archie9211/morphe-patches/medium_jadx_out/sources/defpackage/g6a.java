package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g6a extends l75 {
    public static final g6a j;
    public static final vf6 k = new vf6(17);
    public final g21 b;
    public int c;
    public n6a d;
    public m6a e;
    public e6a f;
    public List g;
    public byte h;
    public int i;

    static {
        g6a g6aVar = new g6a();
        j = g6aVar;
        g6aVar.d = n6a.e;
        g6aVar.e = m6a.e;
        g6aVar.f = e6a.k;
        g6aVar.g = Collections.EMPTY_LIST;
    }

    public g6a(tp1 tp1Var, q74 q74Var) {
        this.h = (byte) -1;
        this.i = -1;
        this.d = n6a.e;
        this.e = m6a.e;
        this.f = e6a.k;
        this.g = Collections.EMPTY_LIST;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        char c = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        d6a d6aVarG = null;
                        o5a o5aVar = null;
                        o5a o5aVar2 = null;
                        if (iM == 10) {
                            if ((this.c & 1) == 1) {
                                n6a n6aVar = this.d;
                                n6aVar.getClass();
                                o5aVar = new o5a(3);
                                o5aVar.d = sw6.b;
                                o5aVar.k(n6aVar);
                            }
                            n6a n6aVar2 = (n6a) tp1Var.f(n6a.f, q74Var);
                            this.d = n6aVar2;
                            if (o5aVar != null) {
                                o5aVar.k(n6aVar2);
                                this.d = o5aVar.g();
                            }
                            this.c |= 1;
                        } else if (iM == 18) {
                            if ((this.c & 2) == 2) {
                                m6a m6aVar = this.e;
                                m6aVar.getClass();
                                o5aVar2 = new o5a(1);
                                o5aVar2.d = Collections.EMPTY_LIST;
                                o5aVar2.j(m6aVar);
                            }
                            m6a m6aVar2 = (m6a) tp1Var.f(m6a.f, q74Var);
                            this.e = m6aVar2;
                            if (o5aVar2 != null) {
                                o5aVar2.j(m6aVar2);
                                this.e = o5aVar2.e();
                            }
                            this.c |= 2;
                        } else if (iM == 26) {
                            if ((this.c & 4) == 4) {
                                e6a e6aVar = this.f;
                                e6aVar.getClass();
                                d6aVarG = d6a.g();
                                d6aVarG.h(e6aVar);
                            }
                            e6a e6aVar2 = (e6a) tp1Var.f(e6a.l, q74Var);
                            this.f = e6aVar2;
                            if (d6aVarG != null) {
                                d6aVarG.h(e6aVar2);
                                this.f = d6aVarG.e();
                            }
                            this.c |= 4;
                        } else if (iM == 34) {
                            int i = (c == true ? 1 : 0) & '\b';
                            c = c;
                            if (i != 8) {
                                this.g = new ArrayList();
                                c = '\b';
                            }
                            this.g.add(tp1Var.f(k5a.H, q74Var));
                        } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if (((c == true ? 1 : 0) & '\b') == 8) {
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
        if (((c == true ? 1 : 0) & '\b') == 8) {
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
        int i = this.i;
        if (i != -1) {
            return i;
        }
        int iF = (this.c & 1) == 1 ? h30.f(1, this.d) : 0;
        if ((this.c & 2) == 2) {
            iF += h30.f(2, this.e);
        }
        if ((this.c & 4) == 4) {
            iF += h30.f(3, this.f);
        }
        for (int i2 = 0; i2 < this.g.size(); i2++) {
            iF += h30.f(4, (q1) this.g.get(i2));
        }
        int size = this.b.size() + h() + iF;
        this.i = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return f6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        f6a f6aVarG = f6a.g();
        f6aVarG.h(this);
        return f6aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.E(1, this.d);
        }
        if ((this.c & 2) == 2) {
            h30Var.E(2, this.e);
        }
        if ((this.c & 4) == 4) {
            h30Var.E(3, this.f);
        }
        for (int i = 0; i < this.g.size(); i++) {
            h30Var.E(4, (q1) this.g.get(i));
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return j;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.h;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.c & 2) == 2 && !this.e.isInitialized()) {
            this.h = (byte) 0;
            return false;
        }
        if ((this.c & 4) == 4 && !this.f.isInitialized()) {
            this.h = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.g.size(); i++) {
            if (!((k5a) this.g.get(i)).isInitialized()) {
                this.h = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.h = (byte) 1;
            return true;
        }
        this.h = (byte) 0;
        return false;
    }

    public g6a() {
        this.h = (byte) -1;
        this.i = -1;
        this.b = g21.a;
    }

    public g6a(f6a f6aVar) {
        super(f6aVar);
        this.h = (byte) -1;
        this.i = -1;
        this.b = f6aVar.a;
    }
}
