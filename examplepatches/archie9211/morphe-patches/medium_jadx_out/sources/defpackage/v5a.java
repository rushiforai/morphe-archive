package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v5a extends l75 {
    public static final v5a h;
    public static final vf6 i = new vf6(13);
    public final g21 b;
    public int c;
    public int d;
    public List e;
    public byte f;
    public int g;

    static {
        v5a v5aVar = new v5a();
        h = v5aVar;
        v5aVar.d = 0;
        v5aVar.e = Collections.EMPTY_LIST;
    }

    public v5a(tp1 tp1Var, q74 q74Var) {
        this.f = (byte) -1;
        this.g = -1;
        boolean z = false;
        this.d = 0;
        this.e = Collections.EMPTY_LIST;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        char c = 0;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 8) {
                            this.c |= 1;
                            this.d = tp1Var.j();
                        } else if (iM == 18) {
                            if ((c & 2) != 2) {
                                this.e = new ArrayList();
                                c = 2;
                            }
                            this.e.add(tp1Var.f(h5a.h, q74Var));
                        } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
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
                    this.e = DesugarCollections.unmodifiableList(this.e);
                }
                try {
                    h30VarT.y();
                } catch (IOException unused) {
                } catch (Throwable th2) {
                    this.b = e21Var.p();
                    throw th2;
                }
                this.b = e21Var.p();
                k();
                throw th;
            }
        }
        if ((c & 2) == 2) {
            this.e = DesugarCollections.unmodifiableList(this.e);
        }
        try {
            h30VarT.y();
        } catch (IOException unused2) {
        } catch (Throwable th3) {
            this.b = e21Var.p();
            throw th3;
        }
        this.b = e21Var.p();
        k();
    }

    @Override // defpackage.q1
    public final int a() {
        int i2 = this.g;
        if (i2 != -1) {
            return i2;
        }
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        for (int i3 = 0; i3 < this.e.size(); i3++) {
            iD += h30.f(2, (q1) this.e.get(i3));
        }
        int size = this.b.size() + h() + iD;
        this.g = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        u5a u5aVar = new u5a();
        u5aVar.f = Collections.EMPTY_LIST;
        return u5aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        u5a u5aVar = new u5a();
        u5aVar.f = Collections.EMPTY_LIST;
        u5aVar.g(this);
        return u5aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.C(1, this.d);
        }
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            h30Var.E(2, (q1) this.e.get(i2));
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return h;
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
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            if (!((h5a) this.e.get(i2)).isInitialized()) {
                this.f = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.f = (byte) 1;
            return true;
        }
        this.f = (byte) 0;
        return false;
    }

    public v5a() {
        this.f = (byte) -1;
        this.g = -1;
        this.b = g21.a;
    }

    public v5a(u5a u5aVar) {
        super(u5aVar);
        this.f = (byte) -1;
        this.g = -1;
        this.b = u5aVar.a;
    }
}
