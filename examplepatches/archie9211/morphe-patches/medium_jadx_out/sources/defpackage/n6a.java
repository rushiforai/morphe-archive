package defpackage;

import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n6a extends s75 {
    public static final n6a e;
    public static final vf6 f = new vf6(21);
    public final g21 a;
    public vw6 b;
    public byte c;
    public int d;

    static {
        n6a n6aVar = new n6a();
        e = n6aVar;
        n6aVar.b = sw6.b;
    }

    public n6a(tp1 tp1Var) {
        this.c = (byte) -1;
        this.d = -1;
        this.b = sw6.b;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z2 = false;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 10) {
                            c57 c57VarE = tp1Var.e();
                            if (!z2) {
                                this.b = new sw6();
                                z2 = true;
                            }
                            this.b.l(c57VarE);
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if (z2) {
                        this.b = this.b.b();
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
            } catch (InvalidProtocolBufferException e2) {
                e2.a = this;
                throw e2;
            } catch (IOException e3) {
                InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e3.getMessage());
                invalidProtocolBufferException.a = this;
                throw invalidProtocolBufferException;
            }
        }
        if (z2) {
            this.b = this.b.b();
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
        int i = this.d;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        int size = 0;
        while (true) {
            int size2 = this.b.size();
            vw6 vw6Var = this.b;
            if (i2 >= size2) {
                int size3 = this.a.size() + vw6Var.size() + size;
                this.d = size3;
                return size3;
            }
            g21 g21VarK = vw6Var.k(i2);
            size += g21VarK.size() + h30.h(g21VarK.size());
            i2++;
        }
    }

    @Override // defpackage.q1
    public final g75 b() {
        o5a o5aVar = new o5a(3);
        o5aVar.d = sw6.b;
        return o5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        o5a o5aVar = new o5a(3);
        o5aVar.d = sw6.b;
        o5aVar.k(this);
        return o5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        for (int i = 0; i < this.b.size(); i++) {
            g21 g21VarK = this.b.k(i);
            h30Var.N(1, 2);
            h30Var.L(g21VarK.size());
            h30Var.H(g21VarK);
        }
        h30Var.H(this.a);
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.c;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        this.c = (byte) 1;
        return true;
    }

    public n6a() {
        this.c = (byte) -1;
        this.d = -1;
        this.a = g21.a;
    }

    public n6a(o5a o5aVar) {
        this.c = (byte) -1;
        this.d = -1;
        this.a = o5aVar.a;
    }
}
