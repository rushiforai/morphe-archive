package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ag6 extends s75 {
    public static final ag6 j;
    public static final vf6 k = new vf6(2);
    public final g21 a;
    public int b;
    public xf6 c;
    public yf6 d;
    public yf6 e;
    public yf6 f;
    public yf6 g;
    public byte h;
    public int i;

    static {
        ag6 ag6Var = new ag6();
        j = ag6Var;
        ag6Var.c = xf6.g;
        yf6 yf6Var = yf6.g;
        ag6Var.d = yf6Var;
        ag6Var.e = yf6Var;
        ag6Var.f = yf6Var;
        ag6Var.g = yf6Var;
    }

    public ag6(tp1 tp1Var, q74 q74Var) {
        this.h = (byte) -1;
        this.i = -1;
        this.c = xf6.g;
        yf6 yf6Var = yf6.g;
        this.d = yf6Var;
        this.e = yf6Var;
        this.f = yf6Var;
        this.g = yf6Var;
        int i = 0;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z = false;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        wf6 wf6VarG = null;
                        if (iM == 10) {
                            if ((this.b & 1) == 1) {
                                xf6 xf6Var = this.c;
                                xf6Var.getClass();
                                wf6VarG = new wf6(i);
                                wf6VarG.g(xf6Var);
                            }
                            xf6 xf6Var2 = (xf6) tp1Var.f(xf6.h, q74Var);
                            this.c = xf6Var2;
                            if (wf6VarG != null) {
                                wf6VarG.g(xf6Var2);
                                this.c = wf6VarG.d();
                            }
                            this.b |= 1;
                        } else if (iM == 18) {
                            if ((this.b & 2) == 2) {
                                yf6 yf6Var2 = this.d;
                                yf6Var2.getClass();
                                wf6VarG = yf6.g(yf6Var2);
                            }
                            yf6 yf6Var3 = (yf6) tp1Var.f(yf6.h, q74Var);
                            this.d = yf6Var3;
                            if (wf6VarG != null) {
                                wf6VarG.h(yf6Var3);
                                this.d = wf6VarG.e();
                            }
                            this.b |= 2;
                        } else if (iM == 26) {
                            if ((this.b & 4) == 4) {
                                yf6 yf6Var4 = this.e;
                                yf6Var4.getClass();
                                wf6VarG = yf6.g(yf6Var4);
                            }
                            yf6 yf6Var5 = (yf6) tp1Var.f(yf6.h, q74Var);
                            this.e = yf6Var5;
                            if (wf6VarG != null) {
                                wf6VarG.h(yf6Var5);
                                this.e = wf6VarG.e();
                            }
                            this.b |= 4;
                        } else if (iM == 34) {
                            if ((this.b & 8) == 8) {
                                yf6 yf6Var6 = this.f;
                                yf6Var6.getClass();
                                wf6VarG = yf6.g(yf6Var6);
                            }
                            yf6 yf6Var7 = (yf6) tp1Var.f(yf6.h, q74Var);
                            this.f = yf6Var7;
                            if (wf6VarG != null) {
                                wf6VarG.h(yf6Var7);
                                this.f = wf6VarG.e();
                            }
                            this.b |= 8;
                        } else if (iM == 42) {
                            if ((this.b & 16) == 16) {
                                yf6 yf6Var8 = this.g;
                                yf6Var8.getClass();
                                wf6VarG = yf6.g(yf6Var8);
                            }
                            yf6 yf6Var9 = (yf6) tp1Var.f(yf6.h, q74Var);
                            this.g = yf6Var9;
                            if (wf6VarG != null) {
                                wf6VarG.h(yf6Var9);
                                this.g = wf6VarG.e();
                            }
                            this.b |= 16;
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
        int i = this.i;
        if (i != -1) {
            return i;
        }
        int iF = (this.b & 1) == 1 ? h30.f(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iF += h30.f(2, this.d);
        }
        if ((this.b & 4) == 4) {
            iF += h30.f(3, this.e);
        }
        if ((this.b & 8) == 8) {
            iF += h30.f(4, this.f);
        }
        if ((this.b & 16) == 16) {
            iF += h30.f(5, this.g);
        }
        int size = this.a.size() + iF;
        this.i = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return zf6.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        zf6 zf6VarG = zf6.g();
        zf6VarG.i(this);
        return zf6VarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.E(1, this.c);
        }
        if ((this.b & 2) == 2) {
            h30Var.E(2, this.d);
        }
        if ((this.b & 4) == 4) {
            h30Var.E(3, this.e);
        }
        if ((this.b & 8) == 8) {
            h30Var.E(4, this.f);
        }
        if ((this.b & 16) == 16) {
            h30Var.E(5, this.g);
        }
        h30Var.H(this.a);
    }

    public final boolean g() {
        return (this.b & 4) == 4;
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
        this.h = (byte) 1;
        return true;
    }

    public ag6() {
        this.h = (byte) -1;
        this.i = -1;
        this.a = g21.a;
    }

    public ag6(zf6 zf6Var) {
        this.h = (byte) -1;
        this.i = -1;
        this.a = zf6Var.a;
    }
}
