package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h5a extends s75 {
    public static final h5a g;
    public static final vf6 h = new vf6(5);
    public final g21 a;
    public int b;
    public int c;
    public List d;
    public byte e;
    public int f;

    static {
        h5a h5aVar = new h5a();
        g = h5aVar;
        h5aVar.c = 0;
        h5aVar.d = Collections.EMPTY_LIST;
    }

    public h5a(tp1 tp1Var, q74 q74Var) {
        this.e = (byte) -1;
        this.f = -1;
        boolean z = false;
        this.c = 0;
        this.d = Collections.EMPTY_LIST;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        char c = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            this.b |= 1;
                            this.c = tp1Var.j();
                        } else if (iM == 18) {
                            if ((c & 2) != 2) {
                                this.d = new ArrayList();
                                c = 2;
                            }
                            this.d.add(tp1Var.f(f5a.h, q74Var));
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
        int i = this.f;
        if (i != -1) {
            return i;
        }
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        for (int i2 = 0; i2 < this.d.size(); i2++) {
            iD += h30.f(2, (q1) this.d.get(i2));
        }
        int size = this.a.size() + iD;
        this.f = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        g5a g5aVar = new g5a(0);
        g5aVar.d = Collections.EMPTY_LIST;
        return g5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        g5a g5aVar = new g5a(0);
        g5aVar.d = Collections.EMPTY_LIST;
        g5aVar.g(this);
        return g5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.C(1, this.c);
        }
        for (int i = 0; i < this.d.size(); i++) {
            h30Var.E(2, (q1) this.d.get(i));
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
        if ((this.b & 1) != 1) {
            this.e = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.d.size(); i++) {
            if (!((f5a) this.d.get(i)).isInitialized()) {
                this.e = (byte) 0;
                return false;
            }
        }
        this.e = (byte) 1;
        return true;
    }

    public h5a() {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public h5a(g5a g5aVar) {
        this.e = (byte) -1;
        this.f = -1;
        this.a = g5aVar.a;
    }
}
