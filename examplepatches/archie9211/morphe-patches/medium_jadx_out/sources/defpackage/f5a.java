package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f5a extends s75 {
    public static final f5a g;
    public static final vf6 h = new vf6(6);
    public final g21 a;
    public int b;
    public int c;
    public e5a d;
    public byte e;
    public int f;

    static {
        f5a f5aVar = new f5a();
        g = f5aVar;
        f5aVar.c = 0;
        f5aVar.d = e5a.p;
    }

    public f5a(tp1 tp1Var, q74 q74Var) {
        c5a c5aVarE;
        this.e = (byte) -1;
        this.f = -1;
        boolean z = false;
        this.c = 0;
        this.d = e5a.p;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        while (!z) {
            try {
                try {
                    try {
                        int iM = tp1Var.m();
                        if (iM != 0) {
                            if (iM == 8) {
                                this.b |= 1;
                                this.c = tp1Var.j();
                            } else if (iM == 18) {
                                if ((this.b & 2) == 2) {
                                    e5a e5aVar = this.d;
                                    e5aVar.getClass();
                                    c5aVarE = c5a.e();
                                    c5aVarE.g(e5aVar);
                                } else {
                                    c5aVarE = null;
                                }
                                e5a e5aVar2 = (e5a) tp1Var.f(e5a.q, q74Var);
                                this.d = e5aVar2;
                                if (c5aVarE != null) {
                                    c5aVarE.g(e5aVar2);
                                    this.d = c5aVarE.d();
                                }
                                this.b |= 2;
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
        int i = this.f;
        if (i != -1) {
            return i;
        }
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iD += h30.f(2, this.d);
        }
        int size = this.a.size() + iD;
        this.f = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        b5a b5aVar = new b5a(0);
        b5aVar.e = e5a.p;
        return b5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        b5a b5aVar = new b5a(0);
        b5aVar.e = e5a.p;
        b5aVar.g(this);
        return b5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.C(1, this.c);
        }
        if ((this.b & 2) == 2) {
            h30Var.E(2, this.d);
        }
        h30Var.H(this.a);
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.e;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        int i = this.b;
        if ((i & 1) != 1) {
            this.e = (byte) 0;
            return false;
        }
        if ((i & 2) != 2) {
            this.e = (byte) 0;
            return false;
        }
        if (this.d.isInitialized()) {
            this.e = (byte) 1;
            return true;
        }
        this.e = (byte) 0;
        return false;
    }

    public f5a() {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public f5a(b5a b5aVar) {
        this.e = (byte) -1;
        this.f = -1;
        this.a = b5aVar.a;
    }
}
