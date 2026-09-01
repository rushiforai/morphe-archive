package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l5a extends s75 {
    public static final l5a g;
    public static final vf6 h = new vf6(9);
    public final g21 a;
    public int b;
    public int c;
    public c57 d;
    public byte e;
    public int f;

    static {
        l5a l5aVar = new l5a();
        g = l5aVar;
        l5aVar.c = 0;
        l5aVar.d = g21.a;
    }

    public l5a(tp1 tp1Var) {
        this.e = (byte) -1;
        this.f = -1;
        boolean z = false;
        this.c = 0;
        this.d = g21.a;
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
                                this.b |= 2;
                                this.d = tp1Var.e();
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
            c57 c57Var = this.d;
            iD += c57Var.size() + h30.h(c57Var.size()) + h30.j(2);
        }
        int size = this.a.size() + iD;
        this.f = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        b5a b5aVar = new b5a(1);
        b5aVar.e = g21.a;
        return b5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        b5a b5aVar = new b5a(1);
        b5aVar.e = g21.a;
        b5aVar.h(this);
        return b5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.C(1, this.c);
        }
        if ((this.b & 2) == 2) {
            c57 c57Var = this.d;
            h30Var.N(2, 2);
            h30Var.L(c57Var.size());
            h30Var.H(c57Var);
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
        if ((i & 2) == 2) {
            this.e = (byte) 1;
            return true;
        }
        this.e = (byte) 0;
        return false;
    }

    public l5a() {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public l5a(b5a b5aVar) {
        this.e = (byte) -1;
        this.f = -1;
        this.a = b5aVar.a;
    }
}
