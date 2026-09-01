package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e5a extends s75 {
    public static final e5a p;
    public static final vf6 q = new vf6(7);
    public final g21 a;
    public int b;
    public d5a c;
    public long d;
    public float e;
    public double f;
    public int g;
    public int h;
    public int i;
    public h5a j;
    public List k;
    public int l;
    public int m;
    public byte n;
    public int o;

    static {
        e5a e5aVar = new e5a();
        p = e5aVar;
        e5aVar.g();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v2, types: [boolean] */
    public e5a(tp1 tp1Var, q74 q74Var) {
        g5a g5aVar;
        this.n = (byte) -1;
        this.o = -1;
        g();
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z = false;
        char c = 0;
        while (true) {
            ?? P = 256;
            if (z) {
                if ((c & 256) == 256) {
                    this.k = DesugarCollections.unmodifiableList(this.k);
                }
                try {
                    h30VarT.y();
                } catch (IOException unused) {
                } catch (Throwable th) {
                    this.a = e21Var.p();
                    throw th;
                }
                this.a = e21Var.p();
                return;
            }
            try {
                try {
                    int iM = tp1Var.m();
                    switch (iM) {
                        case 0:
                            z = true;
                            break;
                        case 8:
                            int iJ = tp1Var.j();
                            d5a d5aVarValueOf = d5a.valueOf(iJ);
                            if (d5aVarValueOf == null) {
                                h30VarT.L(iM);
                                h30VarT.L(iJ);
                            } else {
                                this.b |= 1;
                                this.c = d5aVarValueOf;
                            }
                            break;
                        case 16:
                            this.b |= 2;
                            long jK = tp1Var.k();
                            this.d = (-(jK & 1)) ^ (jK >>> 1);
                            break;
                        case 29:
                            this.b |= 4;
                            this.e = Float.intBitsToFloat(tp1Var.h());
                            break;
                        case 33:
                            this.b |= 8;
                            this.f = Double.longBitsToDouble(tp1Var.i());
                            break;
                        case 40:
                            this.b |= 16;
                            this.g = tp1Var.j();
                            break;
                        case 48:
                            this.b |= 32;
                            this.h = tp1Var.j();
                            break;
                        case 56:
                            this.b |= 64;
                            this.i = tp1Var.j();
                            break;
                        case 66:
                            if ((this.b & 128) == 128) {
                                h5a h5aVar = this.j;
                                h5aVar.getClass();
                                g5aVar = new g5a(0);
                                g5aVar.d = Collections.EMPTY_LIST;
                                g5aVar.g(h5aVar);
                            } else {
                                g5aVar = null;
                            }
                            h5a h5aVar2 = (h5a) tp1Var.f(h5a.h, q74Var);
                            this.j = h5aVar2;
                            if (g5aVar != null) {
                                g5aVar.g(h5aVar2);
                                this.j = g5aVar.d();
                            }
                            this.b |= 128;
                            break;
                        case 74:
                            if ((c & 256) != 256) {
                                this.k = new ArrayList();
                                c = 256;
                            }
                            this.k.add(tp1Var.f(q, q74Var));
                            break;
                        case 80:
                            this.b |= 512;
                            this.m = tp1Var.j();
                            break;
                        case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                            this.b |= 256;
                            this.l = tp1Var.j();
                            break;
                        default:
                            P = tp1Var.p(iM, h30VarT);
                            if (P == 0) {
                                z = true;
                            }
                            break;
                    }
                } catch (Throwable th2) {
                    if ((c & 256) == P) {
                        this.k = DesugarCollections.unmodifiableList(this.k);
                    }
                    try {
                        h30VarT.y();
                    } catch (IOException unused2) {
                    } catch (Throwable th3) {
                        this.a = e21Var.p();
                        throw th3;
                    }
                    this.a = e21Var.p();
                    throw th2;
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
    }

    @Override // defpackage.q1
    public final int a() {
        int i = this.o;
        if (i != -1) {
            return i;
        }
        int iC = (this.b & 1) == 1 ? h30.c(1, this.c.getNumber()) : 0;
        if ((this.b & 2) == 2) {
            long j = this.d;
            iC += h30.i((j >> 63) ^ (j << 1)) + h30.j(2);
        }
        if ((this.b & 4) == 4) {
            iC += h30.j(3) + 4;
        }
        if ((this.b & 8) == 8) {
            iC += h30.j(4) + 8;
        }
        if ((this.b & 16) == 16) {
            iC += h30.d(5, this.g);
        }
        if ((this.b & 32) == 32) {
            iC += h30.d(6, this.h);
        }
        if ((this.b & 64) == 64) {
            iC += h30.d(7, this.i);
        }
        if ((this.b & 128) == 128) {
            iC += h30.f(8, this.j);
        }
        for (int i2 = 0; i2 < this.k.size(); i2++) {
            iC += h30.f(9, (q1) this.k.get(i2));
        }
        if ((this.b & 512) == 512) {
            iC += h30.d(10, this.m);
        }
        if ((this.b & 256) == 256) {
            iC += h30.d(11, this.l);
        }
        int size = this.a.size() + iC;
        this.o = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return c5a.e();
    }

    @Override // defpackage.q1
    public final g75 c() {
        c5a c5aVarE = c5a.e();
        c5aVarE.g(this);
        return c5aVarE;
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        if ((this.b & 1) == 1) {
            h30Var.B(1, this.c.getNumber());
        }
        if ((this.b & 2) == 2) {
            long j = this.d;
            h30Var.N(2, 0);
            h30Var.M((j >> 63) ^ (j << 1));
        }
        if ((this.b & 4) == 4) {
            float f = this.e;
            h30Var.N(3, 5);
            h30Var.J(Float.floatToRawIntBits(f));
        }
        if ((this.b & 8) == 8) {
            double d = this.f;
            h30Var.N(4, 1);
            h30Var.K(Double.doubleToRawLongBits(d));
        }
        if ((this.b & 16) == 16) {
            h30Var.C(5, this.g);
        }
        if ((this.b & 32) == 32) {
            h30Var.C(6, this.h);
        }
        if ((this.b & 64) == 64) {
            h30Var.C(7, this.i);
        }
        if ((this.b & 128) == 128) {
            h30Var.E(8, this.j);
        }
        for (int i = 0; i < this.k.size(); i++) {
            h30Var.E(9, (q1) this.k.get(i));
        }
        if ((this.b & 512) == 512) {
            h30Var.C(10, this.m);
        }
        if ((this.b & 256) == 256) {
            h30Var.C(11, this.l);
        }
        h30Var.H(this.a);
    }

    public final void g() {
        this.c = d5a.BYTE;
        this.d = 0L;
        this.e = 0.0f;
        this.f = 0.0d;
        this.g = 0;
        this.h = 0;
        this.i = 0;
        this.j = h5a.g;
        this.k = Collections.EMPTY_LIST;
        this.l = 0;
        this.m = 0;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.n;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        if ((this.b & 128) == 128 && !this.j.isInitialized()) {
            this.n = (byte) 0;
            return false;
        }
        for (int i = 0; i < this.k.size(); i++) {
            if (!((e5a) this.k.get(i)).isInitialized()) {
                this.n = (byte) 0;
                return false;
            }
        }
        this.n = (byte) 1;
        return true;
    }

    public e5a() {
        this.n = (byte) -1;
        this.o = -1;
        this.a = g21.a;
    }

    public e5a(c5a c5aVar) {
        this.n = (byte) -1;
        this.o = -1;
        this.a = c5aVar.a;
    }
}
