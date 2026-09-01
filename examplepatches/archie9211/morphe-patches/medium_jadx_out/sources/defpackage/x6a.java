package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x6a extends l75 {
    public static final x6a m;
    public static final vf6 n = new vf6(25);
    public final g21 b;
    public int c;
    public int d;
    public int e;
    public boolean f;
    public w6a g;
    public List h;
    public List i;
    public int j;
    public byte k;
    public int l;

    static {
        x6a x6aVar = new x6a();
        m = x6aVar;
        x6aVar.d = 0;
        x6aVar.e = 0;
        x6aVar.f = false;
        x6aVar.g = w6a.INV;
        List list = Collections.EMPTY_LIST;
        x6aVar.h = list;
        x6aVar.i = list;
    }

    public x6a(tp1 tp1Var, q74 q74Var) {
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.d = 0;
        this.e = 0;
        this.f = false;
        this.g = w6a.INV;
        List list = Collections.EMPTY_LIST;
        this.h = list;
        this.i = list;
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z = false;
        int i = 0;
        while (!z) {
            try {
                try {
                    try {
                        int iM = tp1Var.m();
                        if (iM != 0) {
                            if (iM == 8) {
                                this.c |= 1;
                                this.d = tp1Var.j();
                            } else if (iM == 16) {
                                this.c |= 2;
                                this.e = tp1Var.j();
                            } else if (iM == 24) {
                                this.c |= 4;
                                this.f = tp1Var.k() != 0;
                            } else if (iM == 32) {
                                int iJ = tp1Var.j();
                                w6a w6aVarValueOf = w6a.valueOf(iJ);
                                if (w6aVarValueOf == null) {
                                    h30VarT.L(iM);
                                    h30VarT.L(iJ);
                                } else {
                                    this.c |= 8;
                                    this.g = w6aVarValueOf;
                                }
                            } else if (iM == 42) {
                                if ((i & 16) != 16) {
                                    this.h = new ArrayList();
                                    i |= 16;
                                }
                                this.h.add(tp1Var.f(s6a.u, q74Var));
                            } else if (iM == 48) {
                                if ((i & 32) != 32) {
                                    this.i = new ArrayList();
                                    i |= 32;
                                }
                                this.i.add(Integer.valueOf(tp1Var.j()));
                            } else if (iM == 50) {
                                int iD = tp1Var.d(tp1Var.j());
                                if ((i & 32) != 32 && tp1Var.b() > 0) {
                                    this.i = new ArrayList();
                                    i |= 32;
                                }
                                while (tp1Var.b() > 0) {
                                    this.i.add(Integer.valueOf(tp1Var.j()));
                                }
                                tp1Var.c(iD);
                            } else if (!l(tp1Var, h30VarT, q74Var, iM)) {
                            }
                        }
                        z = true;
                    } catch (IOException e) {
                        InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(e.getMessage());
                        invalidProtocolBufferException.a = this;
                        throw invalidProtocolBufferException;
                    }
                } catch (InvalidProtocolBufferException e2) {
                    e2.a = this;
                    throw e2;
                }
            } catch (Throwable th) {
                if ((i & 16) == 16) {
                    this.h = DesugarCollections.unmodifiableList(this.h);
                }
                if ((i & 32) == 32) {
                    this.i = DesugarCollections.unmodifiableList(this.i);
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
        if ((i & 16) == 16) {
            this.h = DesugarCollections.unmodifiableList(this.h);
        }
        if ((i & 32) == 32) {
            this.i = DesugarCollections.unmodifiableList(this.i);
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
        List list;
        int i = this.l;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        int iD = (this.c & 1) == 1 ? h30.d(1, this.d) : 0;
        if ((this.c & 2) == 2) {
            iD += h30.d(2, this.e);
        }
        if ((this.c & 4) == 4) {
            iD += h30.j(3) + 1;
        }
        if ((this.c & 8) == 8) {
            iD += h30.c(4, this.g.getNumber());
        }
        for (int i3 = 0; i3 < this.h.size(); i3++) {
            iD += h30.f(5, (q1) this.h.get(i3));
        }
        int iE = 0;
        while (true) {
            int size = this.i.size();
            list = this.i;
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
        this.j = iE;
        int size2 = this.b.size() + h() + iE2;
        this.l = size2;
        return size2;
    }

    @Override // defpackage.q1
    public final g75 b() {
        v6a v6aVar = new v6a();
        v6aVar.h = w6a.INV;
        List list = Collections.EMPTY_LIST;
        v6aVar.i = list;
        v6aVar.j = list;
        return v6aVar;
    }

    @Override // defpackage.q1
    public final g75 c() {
        v6a v6aVar = new v6a();
        v6aVar.h = w6a.INV;
        List list = Collections.EMPTY_LIST;
        v6aVar.i = list;
        v6aVar.j = list;
        v6aVar.g(this);
        return v6aVar;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 1) == 1) {
            h30Var.C(1, this.d);
        }
        if ((this.c & 2) == 2) {
            h30Var.C(2, this.e);
        }
        if ((this.c & 4) == 4) {
            boolean z = this.f;
            h30Var.N(3, 0);
            h30Var.G(z ? 1 : 0);
        }
        if ((this.c & 8) == 8) {
            h30Var.B(4, this.g.getNumber());
        }
        for (int i = 0; i < this.h.size(); i++) {
            h30Var.E(5, (q1) this.h.get(i));
        }
        if (this.i.size() > 0) {
            h30Var.L(50);
            h30Var.L(this.j);
        }
        for (int i2 = 0; i2 < this.i.size(); i2++) {
            h30Var.D(((Integer) this.i.get(i2)).intValue());
        }
        s26Var.A0(PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return m;
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
        int i = this.c;
        if ((i & 1) != 1) {
            this.k = (byte) 0;
            return false;
        }
        if ((i & 2) != 2) {
            this.k = (byte) 0;
            return false;
        }
        for (int i2 = 0; i2 < this.h.size(); i2++) {
            if (!((s6a) this.h.get(i2)).isInitialized()) {
                this.k = (byte) 0;
                return false;
            }
        }
        if (g()) {
            this.k = (byte) 1;
            return true;
        }
        this.k = (byte) 0;
        return false;
    }

    public x6a() {
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.b = g21.a;
    }

    public x6a(v6a v6aVar) {
        super(v6aVar);
        this.j = -1;
        this.k = (byte) -1;
        this.l = -1;
        this.b = v6aVar.a;
    }
}
