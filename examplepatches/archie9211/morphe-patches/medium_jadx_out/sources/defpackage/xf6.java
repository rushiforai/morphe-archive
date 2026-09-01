package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xf6 extends s75 {
    public static final xf6 g;
    public static final vf6 h = new vf6(0);
    public final g21 a;
    public int b;
    public int c;
    public int d;
    public byte e;
    public int f;

    static {
        xf6 xf6Var = new xf6();
        g = xf6Var;
        xf6Var.c = 0;
        xf6Var.d = 0;
    }

    public xf6(tp1 tp1Var) {
        this.e = (byte) -1;
        this.f = -1;
        boolean z = false;
        this.c = 0;
        this.d = 0;
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
        int i = this.f;
        if (i != -1) {
            return i;
        }
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iD += h30.d(2, this.d);
        }
        int size = this.a.size() + iD;
        this.f = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return new wf6(0);
    }

    @Override // defpackage.q1
    public final g75 c() {
        wf6 wf6Var = new wf6(0);
        wf6Var.g(this);
        return wf6Var;
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
        this.e = (byte) 1;
        return true;
    }

    public xf6() {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public xf6(wf6 wf6Var) {
        this.e = (byte) -1;
        this.f = -1;
        this.a = wf6Var.a;
    }
}
