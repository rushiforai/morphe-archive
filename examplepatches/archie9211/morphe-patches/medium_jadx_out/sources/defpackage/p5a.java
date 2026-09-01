package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p5a extends s75 {
    public static final p5a e;
    public static final vf6 f = new vf6(11);
    public final g21 a;
    public List b;
    public byte c;
    public int d;

    static {
        p5a p5aVar = new p5a();
        e = p5aVar;
        p5aVar.b = Collections.EMPTY_LIST;
    }

    public p5a(tp1 tp1Var, q74 q74Var) {
        this.c = (byte) -1;
        this.d = -1;
        this.b = Collections.EMPTY_LIST;
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
                            if (!z2) {
                                this.b = new ArrayList();
                                z2 = true;
                            }
                            this.b.add(tp1Var.f(t5a.k, q74Var));
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if (z2) {
                        this.b = DesugarCollections.unmodifiableList(this.b);
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
            this.b = DesugarCollections.unmodifiableList(this.b);
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
        int iF = 0;
        for (int i2 = 0; i2 < this.b.size(); i2++) {
            iF += h30.f(1, (q1) this.b.get(i2));
        }
        int size = this.a.size() + iF;
        this.d = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        o5a o5aVar = new o5a(0);
        o5aVar.d = Collections.EMPTY_LIST;
        return o5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        o5a o5aVar = new o5a(0);
        o5aVar.d = Collections.EMPTY_LIST;
        o5aVar.i(this);
        return o5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        for (int i = 0; i < this.b.size(); i++) {
            h30Var.E(1, (q1) this.b.get(i));
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
        for (int i = 0; i < this.b.size(); i++) {
            if (!((t5a) this.b.get(i)).isInitialized()) {
                this.c = (byte) 0;
                return false;
            }
        }
        this.c = (byte) 1;
        return true;
    }

    public p5a() {
        this.c = (byte) -1;
        this.d = -1;
        this.a = g21.a;
    }

    public p5a(o5a o5aVar) {
        this.c = (byte) -1;
        this.d = -1;
        this.a = o5aVar.a;
    }
}
