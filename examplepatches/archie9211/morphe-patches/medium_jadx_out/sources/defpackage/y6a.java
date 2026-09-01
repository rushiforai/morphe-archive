package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y6a extends s75 {
    public static final y6a g;
    public static final vf6 h = new vf6(26);
    public final g21 a;
    public int b;
    public List c;
    public int d;
    public byte e;
    public int f;

    static {
        y6a y6aVar = new y6a();
        g = y6aVar;
        y6aVar.c = Collections.EMPTY_LIST;
        y6aVar.d = -1;
    }

    public y6a(tp1 tp1Var, q74 q74Var) {
        this.e = (byte) -1;
        this.f = -1;
        this.c = Collections.EMPTY_LIST;
        this.d = -1;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z2 = false;
        while (!z) {
            try {
                try {
                    try {
                        int iM = tp1Var.m();
                        if (iM != 0) {
                            if (iM == 10) {
                                if (!z2) {
                                    this.c = new ArrayList();
                                    z2 = true;
                                }
                                this.c.add(tp1Var.f(s6a.u, q74Var));
                            } else if (iM == 16) {
                                this.b |= 1;
                                this.d = tp1Var.j();
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
                if (z2) {
                    this.c = DesugarCollections.unmodifiableList(this.c);
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
        }
        if (z2) {
            this.c = DesugarCollections.unmodifiableList(this.c);
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

    public static g5a g(y6a y6aVar) {
        g5a g5aVar = new g5a(1);
        g5aVar.d = Collections.EMPTY_LIST;
        g5aVar.e = -1;
        g5aVar.h(y6aVar);
        return g5aVar;
    }

    @Override // defpackage.q1
    public final int a() {
        int i = this.f;
        if (i != -1) {
            return i;
        }
        int iD = 0;
        for (int i2 = 0; i2 < this.c.size(); i2++) {
            iD += h30.f(1, (q1) this.c.get(i2));
        }
        if ((this.b & 1) == 1) {
            iD += h30.d(2, this.d);
        }
        int size = this.a.size() + iD;
        this.f = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        g5a g5aVar = new g5a(1);
        g5aVar.d = Collections.EMPTY_LIST;
        g5aVar.e = -1;
        return g5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        return g(this);
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        for (int i = 0; i < this.c.size(); i++) {
            h30Var.E(1, (q1) this.c.get(i));
        }
        if ((this.b & 1) == 1) {
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
        for (int i = 0; i < this.c.size(); i++) {
            if (!((s6a) this.c.get(i)).isInitialized()) {
                this.e = (byte) 0;
                return false;
            }
        }
        this.e = (byte) 1;
        return true;
    }

    public y6a() {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public y6a(g5a g5aVar) {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g5aVar.a;
    }
}
