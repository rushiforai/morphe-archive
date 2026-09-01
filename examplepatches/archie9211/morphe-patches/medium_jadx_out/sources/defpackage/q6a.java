package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q6a extends s75 {
    public static final q6a h;
    public static final vf6 i = new vf6(23);
    public final g21 a;
    public int b;
    public p6a c;
    public s6a d;
    public int e;
    public byte f;
    public int g;

    static {
        q6a q6aVar = new q6a();
        h = q6aVar;
        q6aVar.c = p6a.INV;
        q6aVar.d = s6a.t;
        q6aVar.e = 0;
    }

    public q6a(tp1 tp1Var, q74 q74Var) {
        r6a r6aVarP;
        this.f = (byte) -1;
        this.g = -1;
        this.c = p6a.INV;
        this.d = s6a.t;
        boolean z = false;
        this.e = 0;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        while (!z) {
            try {
                try {
                    try {
                        int iM = tp1Var.m();
                        if (iM != 0) {
                            if (iM == 8) {
                                int iJ = tp1Var.j();
                                p6a p6aVarValueOf = p6a.valueOf(iJ);
                                if (p6aVarValueOf == null) {
                                    h30VarT.L(iM);
                                    h30VarT.L(iJ);
                                } else {
                                    this.b |= 1;
                                    this.c = p6aVarValueOf;
                                }
                            } else if (iM == 18) {
                                if ((this.b & 2) == 2) {
                                    s6a s6aVar = this.d;
                                    s6aVar.getClass();
                                    r6aVarP = s6a.p(s6aVar);
                                } else {
                                    r6aVarP = null;
                                }
                                s6a s6aVar2 = (s6a) tp1Var.f(s6a.u, q74Var);
                                this.d = s6aVar2;
                                if (r6aVarP != null) {
                                    r6aVarP.h(s6aVar2);
                                    this.d = r6aVarP.e();
                                }
                                this.b |= 2;
                            } else if (iM == 24) {
                                this.b |= 4;
                                this.e = tp1Var.j();
                            } else if (!tp1Var.p(iM, h30VarT)) {
                            }
                        }
                        z = true;
                    } catch (InvalidProtocolBufferException e) {
                        e.a = this;
                        throw e;
                    }
                } catch (IOException e2) {
                    InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                    invalidProtocolBufferException.a = this;
                    throw invalidProtocolBufferException;
                }
            } catch (Throwable th) {
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
        int i2 = this.g;
        if (i2 != -1) {
            return i2;
        }
        int iC = (this.b & 1) == 1 ? h30.c(1, this.c.getNumber()) : 0;
        if ((this.b & 2) == 2) {
            iC += h30.f(2, this.d);
        }
        if ((this.b & 4) == 4) {
            iC += h30.d(3, this.e);
        }
        int size = this.a.size() + iC;
        this.g = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        o6a o6aVar = new o6a();
        o6aVar.c = p6a.INV;
        o6aVar.d = s6a.t;
        return o6aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        o6a o6aVar = new o6a();
        o6aVar.c = p6a.INV;
        o6aVar.d = s6a.t;
        o6aVar.e(this);
        return o6aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.B(1, this.c.getNumber());
        }
        if ((this.b & 2) == 2) {
            h30Var.E(2, this.d);
        }
        if ((this.b & 4) == 4) {
            h30Var.C(3, this.e);
        }
        h30Var.H(this.a);
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.f;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.b & 2) != 2 || this.d.isInitialized()) {
            this.f = (byte) 1;
            return true;
        }
        this.f = (byte) 0;
        return false;
    }

    public q6a() {
        this.f = (byte) -1;
        this.g = -1;
        this.a = g21.a;
    }

    public q6a(o6a o6aVar) {
        this.f = (byte) -1;
        this.g = -1;
        this.a = o6aVar.a;
    }
}
