package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l6a extends s75 {
    public static final l6a h;
    public static final vf6 i = new vf6(20);
    public final g21 a;
    public int b;
    public int c;
    public int d;
    public k6a e;
    public byte f;
    public int g;

    static {
        l6a l6aVar = new l6a();
        h = l6aVar;
        l6aVar.c = -1;
        l6aVar.d = 0;
        l6aVar.e = k6a.PACKAGE;
    }

    public l6a(tp1 tp1Var) {
        this.f = (byte) -1;
        this.g = -1;
        this.c = -1;
        boolean z = false;
        this.d = 0;
        this.e = k6a.PACKAGE;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
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
                            k6a k6aVarValueOf = k6a.valueOf(iJ);
                            if (k6aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 4;
                                this.e = k6aVarValueOf;
                            }
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
                } catch (InvalidProtocolBufferException e) {
                    e.a = this;
                    throw e;
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
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iD += h30.d(2, this.d);
        }
        if ((this.b & 4) == 4) {
            iD += h30.c(3, this.e.getNumber());
        }
        int size = this.a.size() + iD;
        this.g = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        j6a j6aVar = new j6a();
        j6aVar.c = -1;
        j6aVar.e = k6a.PACKAGE;
        return j6aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        j6a j6aVar = new j6a();
        j6aVar.c = -1;
        j6aVar.e = k6a.PACKAGE;
        j6aVar.e(this);
        return j6aVar;
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
        if ((this.b & 2) == 2) {
            this.f = (byte) 1;
            return true;
        }
        this.f = (byte) 0;
        return false;
    }

    public l6a() {
        this.f = (byte) -1;
        this.g = -1;
        this.a = g21.a;
    }

    public l6a(j6a j6aVar) {
        this.f = (byte) -1;
        this.g = -1;
        this.a = j6aVar.a;
    }
}
