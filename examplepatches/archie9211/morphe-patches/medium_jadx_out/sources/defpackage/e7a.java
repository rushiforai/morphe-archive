package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e7a extends s75 {
    public static final e7a k;
    public static final vf6 l = new vf6(28);
    public final g21 a;
    public int b;
    public int c;
    public int d;
    public c7a e;
    public int f;
    public int g;
    public d7a h;
    public byte i;
    public int j;

    static {
        e7a e7aVar = new e7a();
        k = e7aVar;
        e7aVar.c = 0;
        e7aVar.d = 0;
        e7aVar.e = c7a.ERROR;
        e7aVar.f = 0;
        e7aVar.g = 0;
        e7aVar.h = d7a.LANGUAGE_VERSION;
    }

    public e7a(tp1 tp1Var) {
        this.i = (byte) -1;
        this.j = -1;
        boolean z = false;
        this.c = 0;
        this.d = 0;
        this.e = c7a.ERROR;
        this.f = 0;
        this.g = 0;
        this.h = d7a.LANGUAGE_VERSION;
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
                            c7a c7aVarValueOf = c7a.valueOf(iJ);
                            if (c7aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 4;
                                this.e = c7aVarValueOf;
                            }
                        } else if (iM == 32) {
                            this.b |= 8;
                            this.f = tp1Var.j();
                        } else if (iM == 40) {
                            this.b |= 16;
                            this.g = tp1Var.j();
                        } else if (iM == 48) {
                            int iJ2 = tp1Var.j();
                            d7a d7aVarValueOf = d7a.valueOf(iJ2);
                            if (d7aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ2);
                            } else {
                                this.b |= 32;
                                this.h = d7aVarValueOf;
                            }
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
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
            } catch (InvalidProtocolBufferException e) {
                e.a = this;
                throw e;
            } catch (IOException e2) {
                InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                invalidProtocolBufferException.a = this;
                throw invalidProtocolBufferException;
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
        int i = this.j;
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
            iD += h30.d(4, this.f);
        }
        if ((this.b & 16) == 16) {
            iD += h30.d(5, this.g);
        }
        if ((this.b & 32) == 32) {
            iD += h30.c(6, this.h.getNumber());
        }
        int size = this.a.size() + iD;
        this.j = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        b7a b7aVar = new b7a();
        b7aVar.e = c7a.ERROR;
        b7aVar.h = d7a.LANGUAGE_VERSION;
        return b7aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        b7a b7aVar = new b7a();
        b7aVar.e = c7a.ERROR;
        b7aVar.h = d7a.LANGUAGE_VERSION;
        b7aVar.e(this);
        return b7aVar;
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
            h30Var.C(4, this.f);
        }
        if ((this.b & 16) == 16) {
            h30Var.C(5, this.g);
        }
        if ((this.b & 32) == 32) {
            h30Var.B(6, this.h.getNumber());
        }
        h30Var.H(this.a);
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
        this.i = (byte) 1;
        return true;
    }

    public e7a() {
        this.i = (byte) -1;
        this.j = -1;
        this.a = g21.a;
    }

    public e7a(b7a b7aVar) {
        this.i = (byte) -1;
        this.j = -1;
        this.a = b7aVar.a;
    }
}
