package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s6a extends l75 {
    public static final s6a t;
    public static final vf6 u = new vf6(22);
    public final g21 b;
    public int c;
    public List d;
    public boolean e;
    public int f;
    public s6a g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int l;
    public s6a m;
    public int n;
    public s6a o;
    public int p;
    public int q;
    public byte r;
    public int s;

    static {
        s6a s6aVar = new s6a();
        t = s6aVar;
        s6aVar.o();
    }

    public s6a(tp1 tp1Var, q74 q74Var) {
        this.r = (byte) -1;
        this.s = -1;
        o();
        e21 e21Var = new e21(0);
        h30 h30VarT = h30.t(e21Var, 1);
        boolean z = false;
        boolean z2 = false;
        while (!z) {
            try {
                try {
                    int iM = tp1Var.m();
                    vf6 vf6Var = u;
                    r6a r6aVarP = null;
                    switch (iM) {
                        case 0:
                            break;
                        case 8:
                            this.c |= 4096;
                            this.q = tp1Var.j();
                            continue;
                        case 18:
                            if (!z2) {
                                this.d = new ArrayList();
                                z2 = true;
                            }
                            this.d.add(tp1Var.f(q6a.i, q74Var));
                            continue;
                        case 24:
                            this.c |= 1;
                            this.e = tp1Var.k() != 0;
                            continue;
                        case 32:
                            this.c |= 2;
                            this.f = tp1Var.j();
                            continue;
                        case 42:
                            if ((this.c & 4) == 4) {
                                s6a s6aVar = this.g;
                                s6aVar.getClass();
                                r6aVarP = p(s6aVar);
                            }
                            s6a s6aVar2 = (s6a) tp1Var.f(vf6Var, q74Var);
                            this.g = s6aVar2;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar2);
                                this.g = r6aVarP.e();
                            }
                            this.c |= 4;
                            continue;
                        case 48:
                            this.c |= 16;
                            this.i = tp1Var.j();
                            continue;
                        case 56:
                            this.c |= 32;
                            this.j = tp1Var.j();
                            continue;
                        case 64:
                            this.c |= 8;
                            this.h = tp1Var.j();
                            continue;
                        case 72:
                            this.c |= 64;
                            this.k = tp1Var.j();
                            continue;
                        case 82:
                            if ((this.c & 256) == 256) {
                                s6a s6aVar3 = this.m;
                                s6aVar3.getClass();
                                r6aVarP = p(s6aVar3);
                            }
                            s6a s6aVar4 = (s6a) tp1Var.f(vf6Var, q74Var);
                            this.m = s6aVar4;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar4);
                                this.m = r6aVarP.e();
                            }
                            this.c |= 256;
                            continue;
                        case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                            this.c |= 512;
                            this.n = tp1Var.j();
                            continue;
                        case 96:
                            this.c |= 128;
                            this.l = tp1Var.j();
                            continue;
                        case 106:
                            if ((this.c & 1024) == 1024) {
                                s6a s6aVar5 = this.o;
                                s6aVar5.getClass();
                                r6aVarP = p(s6aVar5);
                            }
                            s6a s6aVar6 = (s6a) tp1Var.f(vf6Var, q74Var);
                            this.o = s6aVar6;
                            if (r6aVarP != null) {
                                r6aVarP.h(s6aVar6);
                                this.o = r6aVarP.e();
                            }
                            this.c |= 1024;
                            continue;
                        case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                            this.c |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
                            this.p = tp1Var.j();
                            continue;
                        default:
                            if (!l(tp1Var, h30VarT, q74Var, iM)) {
                            }
                            break;
                    }
                    z = true;
                } catch (Throwable th) {
                    if (z2) {
                        this.d = DesugarCollections.unmodifiableList(this.d);
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
        if (z2) {
            this.d = DesugarCollections.unmodifiableList(this.d);
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

    public static r6a p(s6a s6aVar) {
        r6a r6aVarG = r6a.g();
        r6aVarG.h(s6aVar);
        return r6aVarG;
    }

    @Override // defpackage.q1
    public final int a() {
        int i = this.s;
        if (i != -1) {
            return i;
        }
        int iD = (this.c & 4096) == 4096 ? h30.d(1, this.q) : 0;
        for (int i2 = 0; i2 < this.d.size(); i2++) {
            iD += h30.f(2, (q1) this.d.get(i2));
        }
        if ((this.c & 1) == 1) {
            iD += h30.j(3) + 1;
        }
        if ((this.c & 2) == 2) {
            iD += h30.d(4, this.f);
        }
        if ((this.c & 4) == 4) {
            iD += h30.f(5, this.g);
        }
        if ((this.c & 16) == 16) {
            iD += h30.d(6, this.i);
        }
        if ((this.c & 32) == 32) {
            iD += h30.d(7, this.j);
        }
        if ((this.c & 8) == 8) {
            iD += h30.d(8, this.h);
        }
        if ((this.c & 64) == 64) {
            iD += h30.d(9, this.k);
        }
        if ((this.c & 256) == 256) {
            iD += h30.f(10, this.m);
        }
        if ((this.c & 512) == 512) {
            iD += h30.d(11, this.n);
        }
        if ((this.c & 128) == 128) {
            iD += h30.d(12, this.l);
        }
        if ((this.c & 1024) == 1024) {
            iD += h30.f(13, this.o);
        }
        if ((this.c & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            iD += h30.d(14, this.p);
        }
        int size = this.b.size() + h() + iD;
        this.s = size;
        return size;
    }

    @Override // defpackage.q1
    public final g75 b() {
        return r6a.g();
    }

    @Override // defpackage.q1
    public final g75 c() {
        return p(this);
    }

    @Override // defpackage.q1
    public final void d(h30 h30Var) throws IOException {
        a();
        s26 s26Var = new s26(this);
        if ((this.c & 4096) == 4096) {
            h30Var.C(1, this.q);
        }
        for (int i = 0; i < this.d.size(); i++) {
            h30Var.E(2, (q1) this.d.get(i));
        }
        if ((this.c & 1) == 1) {
            boolean z = this.e;
            h30Var.N(3, 0);
            h30Var.G(z ? 1 : 0);
        }
        if ((this.c & 2) == 2) {
            h30Var.C(4, this.f);
        }
        if ((this.c & 4) == 4) {
            h30Var.E(5, this.g);
        }
        if ((this.c & 16) == 16) {
            h30Var.C(6, this.i);
        }
        if ((this.c & 32) == 32) {
            h30Var.C(7, this.j);
        }
        if ((this.c & 8) == 8) {
            h30Var.C(8, this.h);
        }
        if ((this.c & 64) == 64) {
            h30Var.C(9, this.k);
        }
        if ((this.c & 256) == 256) {
            h30Var.E(10, this.m);
        }
        if ((this.c & 512) == 512) {
            h30Var.C(11, this.n);
        }
        if ((this.c & 128) == 128) {
            h30Var.C(12, this.l);
        }
        if ((this.c & 1024) == 1024) {
            h30Var.E(13, this.o);
        }
        if ((this.c & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            h30Var.C(14, this.p);
        }
        s26Var.A0(200, h30Var);
        h30Var.H(this.b);
    }

    @Override // defpackage.dz7
    public final q1 getDefaultInstanceForType() {
        return t;
    }

    @Override // defpackage.dz7
    public final boolean isInitialized() {
        byte b = this.r;
        if (b == 1) {
            return true;
        }
        if (b == 0) {
            return false;
        }
        for (int i = 0; i < this.d.size(); i++) {
            if (!((q6a) this.d.get(i)).isInitialized()) {
                this.r = (byte) 0;
                return false;
            }
        }
        if ((this.c & 4) == 4 && !this.g.isInitialized()) {
            this.r = (byte) 0;
            return false;
        }
        if ((this.c & 256) == 256 && !this.m.isInitialized()) {
            this.r = (byte) 0;
            return false;
        }
        if ((this.c & 1024) == 1024 && !this.o.isInitialized()) {
            this.r = (byte) 0;
            return false;
        }
        if (g()) {
            this.r = (byte) 1;
            return true;
        }
        this.r = (byte) 0;
        return false;
    }

    public final boolean n() {
        return (this.c & 16) == 16;
    }

    public final void o() {
        this.d = Collections.EMPTY_LIST;
        this.e = false;
        this.f = 0;
        s6a s6aVar = t;
        this.g = s6aVar;
        this.h = 0;
        this.i = 0;
        this.j = 0;
        this.k = 0;
        this.l = 0;
        this.m = s6aVar;
        this.n = 0;
        this.o = s6aVar;
        this.p = 0;
        this.q = 0;
    }

    public s6a() {
        this.r = (byte) -1;
        this.s = -1;
        this.b = g21.a;
    }

    public s6a(r6a r6aVar) {
        super(r6aVar);
        this.r = (byte) -1;
        this.s = -1;
        this.b = r6aVar.a;
    }
}
