package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e6a extends l75 {
    public static final e6a k;
    public static final vf6 l = new vf6(16);
    public final g21 b;
    public int c;
    public List d;
    public List e;
    public List f;
    public y6a g;
    public f7a h;
    public byte i;
    public int j;

    static {
        e6a e6aVar = new e6a();
        k = e6aVar;
        List list = Collections.EMPTY_LIST;
        e6aVar.d = list;
        e6aVar.e = list;
        e6aVar.f = list;
        e6aVar.g = y6a.g;
        e6aVar.h = f7a.e;
    }

    public e6a(tp1 tp1Var, q74 q74Var) {
        this.i = (byte) -1;
        this.j = -1;
        List list = Collections.EMPTY_LIST;
        this.d = list;
        this.e = list;
        this.f = list;
        this.g = y6a.g;
        this.h = f7a.e;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
        while (true) {
            int i2 = 2;
            if (z) {
                break;
            }
            try {
                try {
                    int iM = tp1Var.m();
                    if (iM != 0) {
                        if (iM == 26) {
                            int i3 = (i == true ? 1 : 0) & 1;
                            i = i;
                            if (i3 != 1) {
                                this.d = new ArrayList();
                                i = (i == true ? 1 : 0) | 1;
                            }
                            this.d.add(tp1Var.f(a6a.z, q74Var));
                        } else if (iM == 34) {
                            int i4 = (i == true ? 1 : 0) & 2;
                            i = i;
                            if (i4 != 2) {
                                this.e = new ArrayList();
                                i = (i == true ? 1 : 0) | 2;
                            }
                            this.e.add(tp1Var.f(i6a.D, q74Var));
                        } else if (iM != 42) {
                            o5a o5aVar = null;
                            g5a g5aVarG = null;
                            if (iM == 242) {
                                if ((this.c & 1) == 1) {
                                    y6a y6aVar = this.g;
                                    y6aVar.getClass();
                                    g5aVarG = y6a.g(y6aVar);
                                }
                                y6a y6aVar2 = (y6a) tp1Var.f(y6a.h, q74Var);
                                this.g = y6aVar2;
                                if (g5aVarG != null) {
                                    g5aVarG.h(y6aVar2);
                                    this.g = g5aVarG.e();
                                }
                                this.c |= 1;
                            } else if (iM == 258) {
                                if ((this.c & 2) == 2) {
                                    f7a f7aVar = this.h;
                                    f7aVar.getClass();
                                    o5aVar = new o5a(i2);
                                    o5aVar.d = Collections.EMPTY_LIST;
                                    o5aVar.l(f7aVar);
                                }
                                f7a f7aVar2 = (f7a) tp1Var.f(f7a.f, q74Var);
                                this.h = f7aVar2;
                                if (o5aVar != null) {
                                    o5aVar.l(f7aVar2);
                                    this.h = o5aVar.h();
                                }
                                this.c |= 2;
                            } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
                            }
                        } else {
                            int i5 = (i == true ? 1 : 0) & 4;
                            i = i;
                            if (i5 != 4) {
                                this.f = new ArrayList();
                                i = (i == true ? 1 : 0) | 4;
                            }
                            this.f.add(tp1Var.f(u6a.q, q74Var));
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if (((i == true ? 1 : 0) & 1) == 1) {
                        this.d = DesugarCollections.unmodifiableList(this.d);
                    }
                    if (((i == true ? 1 : 0) & 2) == 2) {
                        this.e = DesugarCollections.unmodifiableList(this.e);
                    }
                    if (((i == true ? 1 : 0) & 4) == 4) {
                        this.f = DesugarCollections.unmodifiableList(this.f);
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
            } catch (InvalidProtocolBufferException e) {
                e.a = this;
                throw e;
            } catch (IOException e2) {
                InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                invalidProtocolBufferException.a = this;
                throw invalidProtocolBufferException;
            }
        }
        if (((i == true ? 1 : 0) & 1) == 1) {
            this.d = DesugarCollections.unmodifiableList(this.d);
        }
        if (((i == true ? 1 : 0) & 2) == 2) {
            this.e = DesugarCollections.unmodifiableList(this.e);
        }
        if (((i == true ? 1 : 0) & 4) == 4) {
            this.f = DesugarCollections.unmodifiableList(this.f);
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
        int i = this.j;
        if (i != -1) {
            return i;
        }
        int iF = 0;
        for (int i2 = 0; i2 < this.d.size(); i2++) {
            iF += h30.f(3, (q1) this.d.get(i2));
        }
        for (int i3 = 0; i3 < this.e.size(); i3++) {
            iF += h30.f(4, (q1) this.e.get(i3));
        }
        for (int i4 = 0; i4 < this.f.size(); i4++) {
            iF += h30.f(5, (q1) this.f.get(i4));
        }
        if ((this.c & 1) == 1) {
            iF += h30.f(30, this.g);
        }
        if ((this.c & 2) == 2) {
            iF += h30.f(32, this.h);
        }
        int size = this.b.size() + h() + iF;
        this.j = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return d6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        d6a d6aVarG = d6a.g();
        d6aVarG.h(this);
        return d6aVarG;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        for (int i = 0; i < this.d.size(); i++) {
            h30Var.E(3, (q1) this.d.get(i));
        }
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            h30Var.E(4, (q1) this.e.get(i2));
        }
        for (int i3 = 0; i3 < this.f.size(); i3++) {
            h30Var.E(5, (q1) this.f.get(i3));
        }
        if ((this.c & 1) == 1) {
            h30Var.E(30, this.g);
        }
        if ((this.c & 2) == 2) {
            h30Var.E(32, this.h);
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return k;
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
        for (int i = 0; i < this.d.size(); i++) {
            if (!((a6a) this.d.get(i)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            if (!((i6a) this.e.get(i2)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        for (int i3 = 0; i3 < this.f.size(); i3++) {
            if (!((u6a) this.f.get(i3)).isInitialized()) {
                this.i = (byte) 0;
                return false;
            }
        }
        if ((this.c & 1) == 1 && !this.g.isInitialized()) {
            this.i = (byte) 0;
            return false;
        }
        if (g()) {
            this.i = (byte) 1;
            return true;
        }
        this.i = (byte) 0;
        return false;
    }

    public e6a() {
        this.i = (byte) -1;
        this.j = -1;
        this.b = g21.a;
    }

    public e6a(d6a d6aVar) {
        super(d6aVar);
        this.i = (byte) -1;
        this.j = -1;
        this.b = d6aVar.a;
    }
}
