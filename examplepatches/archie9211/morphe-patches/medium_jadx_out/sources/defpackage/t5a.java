package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t5a extends s75 {
    public static final t5a j;
    public static final vf6 k = new vf6(12);
    public final g21 a;
    public int b;
    public r5a c;
    public List d;
    public y5a e;
    public s5a f;
    public q5a g;
    public byte h;
    public int i;

    static {
        t5a t5aVar = new t5a();
        j = t5aVar;
        t5aVar.c = r5a.RETURNS_CONSTANT;
        t5aVar.d = Collections.EMPTY_LIST;
        t5aVar.e = y5a.l;
        t5aVar.f = s5a.AT_MOST_ONCE;
        t5aVar.g = q5a.CONCLUSION_CONDITION;
    }

    public t5a(tp1 tp1Var, q74 q74Var) {
        w5a w5aVarE;
        this.h = (byte) -1;
        this.i = -1;
        this.c = r5a.RETURNS_CONSTANT;
        this.d = Collections.EMPTY_LIST;
        this.e = y5a.l;
        this.f = s5a.AT_MOST_ONCE;
        this.g = q5a.CONCLUSION_CONDITION;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        char c = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            int iJ = tp1Var.j();
                            r5a r5aVarValueOf = r5a.valueOf(iJ);
                            if (r5aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 1;
                                this.c = r5aVarValueOf;
                            }
                        } else if (iM == 18) {
                            if ((c & 2) != 2) {
                                this.d = new ArrayList();
                                c = 2;
                            }
                            this.d.add(tp1Var.f(y5a.m, q74Var));
                        } else if (iM == 26) {
                            if ((this.b & 2) == 2) {
                                y5a y5aVar = this.e;
                                y5aVar.getClass();
                                w5aVarE = w5a.e();
                                w5aVarE.g(y5aVar);
                            } else {
                                w5aVarE = null;
                            }
                            y5a y5aVar2 = (y5a) tp1Var.f(y5a.m, q74Var);
                            this.e = y5aVar2;
                            if (w5aVarE != null) {
                                w5aVarE.g(y5aVar2);
                                this.e = w5aVarE.d();
                            }
                            this.b |= 2;
                        } else if (iM == 32) {
                            int iJ2 = tp1Var.j();
                            s5a s5aVarValueOf = s5a.valueOf(iJ2);
                            if (s5aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ2);
                            } else {
                                this.b |= 4;
                                this.f = s5aVarValueOf;
                            }
                        } else if (iM == 40) {
                            int iJ3 = tp1Var.j();
                            q5a q5aVarValueOf = q5a.valueOf(iJ3);
                            if (q5aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ3);
                            } else {
                                this.b |= 8;
                                this.g = q5aVarValueOf;
                            }
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if ((c & 2) == 2) {
                        this.d = DesugarCollections.unmodifiableList(this.d);
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
        if ((c & 2) == 2) {
            this.d = DesugarCollections.unmodifiableList(this.d);
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
        int i = this.i;
        if (i != -1) {
            return i;
        }
        int iC = (this.b & 1) == 1 ? h30.c(1, this.c.getNumber()) : 0;
        for (int i2 = 0; i2 < this.d.size(); i2++) {
            iC += h30.f(2, (q1) this.d.get(i2));
        }
        if ((this.b & 2) == 2) {
            iC += h30.f(3, this.e);
        }
        if ((this.b & 4) == 4) {
            iC += h30.c(4, this.f.getNumber());
        }
        if ((this.b & 8) == 8) {
            iC += h30.c(5, this.g.getNumber());
        }
        int size = this.a.size() + iC;
        this.i = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return zf6.h();
    }

    @Override // defpackage.q1
    public final g75 c() {
        zf6 zf6VarH = zf6.h();
        zf6VarH.j(this);
        return zf6VarH;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.B(1, this.c.getNumber());
        }
        for (int i = 0; i < this.d.size(); i++) {
            h30Var.E(2, (q1) this.d.get(i));
        }
        if ((this.b & 2) == 2) {
            h30Var.E(3, this.e);
        }
        if ((this.b & 4) == 4) {
            h30Var.B(4, this.f.getNumber());
        }
        if ((this.b & 8) == 8) {
            h30Var.B(5, this.g.getNumber());
        }
        h30Var.H(this.a);
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
        for (int i = 0; i < this.d.size(); i++) {
            if (!((y5a) this.d.get(i)).isInitialized()) {
                this.h = (byte) 0;
                return false;
            }
        }
        if ((this.b & 2) != 2 || this.e.isInitialized()) {
            this.h = (byte) 1;
            return true;
        }
        this.h = (byte) 0;
        return false;
    }

    public t5a() {
        this.h = (byte) -1;
        this.i = -1;
        this.a = g21.a;
    }

    public t5a(zf6 zf6Var) {
        this.h = (byte) -1;
        this.i = -1;
        this.a = zf6Var.a;
    }
}
