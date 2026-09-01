package defpackage;

import j$.util.DesugarCollections;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eg6 extends s75 {
    public static final eg6 m;
    public static final vf6 n = new vf6(4);
    public final g21 a;
    public int b;
    public int c;
    public int d;
    public Object e;
    public dg6 f;
    public List g;
    public int h;
    public List i;
    public int j;
    public byte k;
    public int l;

    static {
        eg6 eg6Var = new eg6();
        m = eg6Var;
        eg6Var.c = 1;
        eg6Var.d = 0;
        eg6Var.e = "";
        eg6Var.f = dg6.NONE;
        List list = Collections.EMPTY_LIST;
        eg6Var.g = list;
        eg6Var.i = list;
    }

    public eg6(tp1 tp1Var) {
        this.h = -1;
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.c = 1;
        boolean z = false;
        this.d = 0;
        this.e = "";
        this.f = dg6.NONE;
        List list = Collections.EMPTY_LIST;
        this.g = list;
        this.i = list;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        int i = 0;
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
                            dg6 dg6VarValueOf = dg6.valueOf(iJ);
                            if (dg6VarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 8;
                                this.f = dg6VarValueOf;
                            }
                        } else if (iM == 32) {
                            if ((i & 16) != 16) {
                                this.g = new ArrayList();
                                i |= 16;
                            }
                            this.g.add(Integer.valueOf(tp1Var.j()));
                        } else if (iM == 34) {
                            int iD = tp1Var.d(tp1Var.j());
                            if ((i & 16) != 16 && tp1Var.b() > 0) {
                                this.g = new ArrayList();
                                i |= 16;
                            }
                            while (tp1Var.b() > 0) {
                                this.g.add(Integer.valueOf(tp1Var.j()));
                            }
                            tp1Var.c(iD);
                        } else if (iM == 40) {
                            if ((i & 32) != 32) {
                                this.i = new ArrayList();
                                i |= 32;
                            }
                            this.i.add(Integer.valueOf(tp1Var.j()));
                        } else if (iM == 42) {
                            int iD2 = tp1Var.d(tp1Var.j());
                            if ((i & 32) != 32 && tp1Var.b() > 0) {
                                this.i = new ArrayList();
                                i |= 32;
                            }
                            while (tp1Var.b() > 0) {
                                this.i.add(Integer.valueOf(tp1Var.j()));
                            }
                            tp1Var.c(iD2);
                        } else if (iM == 50) {
                            c57 c57VarE = tp1Var.e();
                            this.b |= 4;
                            this.e = c57VarE;
                        } else if (!tp1Var.p(iM, h30VarT)) {
                        }
                    }
                    z = true;
                } catch (Throwable th) {
                    if ((i & 16) == 16) {
                        this.g = DesugarCollections.unmodifiableList(this.g);
                    }
                    if ((i & 32) == 32) {
                        this.i = DesugarCollections.unmodifiableList(this.i);
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
            } catch (InvalidProtocolBufferException e) {
                e.a = this;
                throw e;
            } catch (IOException e2) {
                InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e2.getMessage());
                invalidProtocolBufferException.a = this;
                throw invalidProtocolBufferException;
            }
        }
        if ((i & 16) == 16) {
            this.g = DesugarCollections.unmodifiableList(this.g);
        }
        if ((i & 32) == 32) {
            this.i = DesugarCollections.unmodifiableList(this.i);
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
        List list2;
        g21 c57Var;
        int i = this.l;
        if (i != -1) {
            return i;
        }
        int iD = (this.b & 1) == 1 ? h30.d(1, this.c) : 0;
        if ((this.b & 2) == 2) {
            iD += h30.d(2, this.d);
        }
        if ((this.b & 8) == 8) {
            iD += h30.c(3, this.f.getNumber());
        }
        int i2 = 0;
        int iE = 0;
        while (true) {
            int size = this.g.size();
            list = this.g;
            if (i2 >= size) {
                break;
            }
            iE += h30.e(((Integer) list.get(i2)).intValue());
            i2++;
        }
        int iE2 = iD + iE;
        if (!list.isEmpty()) {
            iE2 = iE2 + 1 + h30.e(iE);
        }
        this.h = iE;
        int i3 = 0;
        int iE3 = 0;
        while (true) {
            int size2 = this.i.size();
            list2 = this.i;
            if (i3 >= size2) {
                break;
            }
            iE3 += h30.e(((Integer) list2.get(i3)).intValue());
            i3++;
        }
        int size3 = iE2 + iE3;
        if (!list2.isEmpty()) {
            size3 = size3 + 1 + h30.e(iE3);
        }
        this.j = iE3;
        if ((this.b & 4) == 4) {
            Object obj = this.e;
            if (obj instanceof String) {
                try {
                    c57Var = new c57(((String) obj).getBytes("UTF-8"));
                    this.e = c57Var;
                } catch (UnsupportedEncodingException e) {
                    lg8.p("UTF-8 not supported?", e);
                    return 0;
                }
            } else {
                c57Var = (g21) obj;
            }
            size3 += c57Var.size() + h30.h(c57Var.size()) + h30.j(6);
        }
        int size4 = this.a.size() + size3;
        this.l = size4;
        return size4;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return cg6.e();
    }

    @Override // defpackage.q1
    public final g75 c() {
        cg6 cg6VarE = cg6.e();
        cg6VarE.g(this);
        return cg6VarE;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        g21 c57Var;
        a();
        if ((this.b & 1) == 1) {
            h30Var.C(1, this.c);
        }
        if ((this.b & 2) == 2) {
            h30Var.C(2, this.d);
        }
        if ((this.b & 8) == 8) {
            h30Var.B(3, this.f.getNumber());
        }
        if (this.g.size() > 0) {
            h30Var.L(34);
            h30Var.L(this.h);
        }
        for (int i = 0; i < this.g.size(); i++) {
            h30Var.D(((Integer) this.g.get(i)).intValue());
        }
        if (this.i.size() > 0) {
            h30Var.L(42);
            h30Var.L(this.j);
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            h30Var.D(((Integer) this.i.get(i2)).intValue());
        }
        if ((this.b & 4) == 4) {
            Object obj = this.e;
            if (obj instanceof String) {
                try {
                    c57Var = new c57(((String) obj).getBytes("UTF-8"));
                    this.e = c57Var;
                } catch (UnsupportedEncodingException e) {
                    lg8.p("UTF-8 not supported?", e);
                    return;
                }
            } else {
                c57Var = (g21) obj;
            }
            h30Var.N(6, 2);
            h30Var.L(c57Var.size());
            h30Var.H(c57Var);
        }
        h30Var.H(this.a);
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.k;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        this.k = (byte) 1;
        return true;
    }

    public eg6() {
        this.h = -1;
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.a = g21.a;
    }

    public eg6(cg6 cg6Var) {
        this.h = -1;
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.a = cg6Var.a;
    }
}
