package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fg6 extends s75 {
    public static final fg6 g;
    public static final vf6 h = new vf6(3);
    public final g21 a;
    public List b;
    public List c;
    public int d;
    public byte e;
    public int f;

    static {
        fg6 fg6Var = new fg6();
        g = fg6Var;
        List list = Collections.EMPTY_LIST;
        fg6Var.b = list;
        fg6Var.c = list;
    }

    public fg6(tp1 tp1Var, q74 q74Var) {
        this.d = -1;
        this.e = (byte) -1;
        this.f = -1;
        List list = Collections.EMPTY_LIST;
        this.b = list;
        this.c = list;
        boolean z = false;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
        while (!z) {
            try {
                try {
                    try {
                        int iM = tp1Var.m();
                        if (iM != 0) {
                            if (iM == 10) {
                                if ((i & 1) != 1) {
                                    this.b = new ArrayList();
                                    i |= 1;
                                }
                                this.b.add(tp1Var.f(eg6.n, q74Var));
                            } else if (iM == 40) {
                                if ((i & 2) != 2) {
                                    this.c = new ArrayList();
                                    i |= 2;
                                }
                                this.c.add(Integer.valueOf(tp1Var.j()));
                            } else if (iM == 42) {
                                int iD = tp1Var.d(tp1Var.j());
                                if ((i & 2) != 2 && tp1Var.b() > 0) {
                                    this.c = new ArrayList();
                                    i |= 2;
                                }
                                while (tp1Var.b() > 0) {
                                    this.c.add(Integer.valueOf(tp1Var.j()));
                                }
                                tp1Var.c(iD);
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
                if ((i & 1) == 1) {
                    this.b = DesugarCollections.unmodifiableList(this.b);
                }
                if ((i & 2) == 2) {
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
        if ((i & 1) == 1) {
            this.b = DesugarCollections.unmodifiableList(this.b);
        }
        if ((i & 2) == 2) {
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

    @Override // defpackage.q1
    public final int a() {
        List list;
        int i = this.f;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        int iF = 0;
        for (int i3 = 0; i3 < this.b.size(); i3++) {
            iF += h30.f(1, (q1) this.b.get(i3));
        }
        int iE = 0;
        while (true) {
            int size = this.c.size();
            list = this.c;
            if (i2 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i2)).intValue());
            i2++;
        }
        int iE2 = iF + iE;
        if (!list.isEmpty()) {
            iE2 = iE2 + 1 + h30.e(iE);
        }
        this.d = iE;
        int size2 = this.a.size() + iE2;
        this.f = size2;
        return size2;
    }

    @Override // defpackage.q1
    public final g75 b() {
        bg6 bg6Var = new bg6();
        List list = Collections.EMPTY_LIST;
        bg6Var.c = list;
        bg6Var.d = list;
        return bg6Var;
    }

    @Override // defpackage.q1
    public final g75 c() {
        bg6 bg6Var = new bg6();
        List list = Collections.EMPTY_LIST;
        bg6Var.c = list;
        bg6Var.d = list;
        bg6Var.e(this);
        return bg6Var;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        for (int i = 0; i < this.b.size(); i++) {
            h30Var.E(1, (q1) this.b.get(i));
        }
        if (this.c.size() > 0) {
            h30Var.L(42);
            h30Var.L(this.d);
        }
        for (int i2 = 0; i2 < this.c.size(); i2++) {
            h30Var.D(((Integer) this.c.get(i2)).intValue());
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

    public fg6() {
        this.d = -1;
        this.e = (byte) -1;
        this.f = -1;
        this.a = g21.a;
    }

    public fg6(bg6 bg6Var) {
        this.d = -1;
        this.e = (byte) -1;
        this.f = -1;
        this.a = bg6Var.a;
    }
}
