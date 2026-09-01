package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.zip.Inflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u1f implements Closeable {
    public final yua a;
    public final zva b;
    public final boolean c;
    public final boolean d;
    public boolean e;
    public int f;
    public long g;
    public boolean h;
    public boolean i;
    public boolean j;
    public final kz0 k;
    public final kz0 l;
    public xy7 m;
    public final byte[] n;

    public u1f(yua yuaVar, zva zvaVar, boolean z, boolean z2) {
        zvaVar.getClass();
        this.a = yuaVar;
        this.b = zvaVar;
        this.c = z;
        this.d = z2;
        this.k = new kz0();
        this.l = new kz0();
        this.n = null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        xy7 xy7Var = this.m;
        if (xy7Var != null) {
            egf.b(xy7Var);
        }
        egf.b(this.a);
    }

    public final void f() throws IOException {
        p();
        if (this.i) {
            m();
            return;
        }
        int i = this.f;
        if (i != 1 && i != 2) {
            TimeZone timeZone = ggf.a;
            String hexString = Integer.toHexString(i);
            hexString.getClass();
            throw new ProtocolException("Unknown opcode: ".concat(hexString));
        }
        while (!this.e) {
            long j = this.g;
            kz0 kz0Var = this.l;
            if (j > 0) {
                this.a.m(kz0Var, j);
            }
            if (this.h) {
                if (this.j) {
                    xy7 xy7Var = this.m;
                    if (xy7Var == null) {
                        xy7Var = new xy7(1, this.d);
                        this.m = xy7Var;
                    }
                    kz0 kz0Var2 = xy7Var.c;
                    if (kz0Var2.b != 0) {
                        ay0.e("Failed requirement.");
                        return;
                    }
                    Inflater inflater = (Inflater) xy7Var.d;
                    if (inflater == null) {
                        inflater = new Inflater(true);
                        xy7Var.d = inflater;
                    }
                    o16 o16Var = (o16) xy7Var.e;
                    if (o16Var == null) {
                        o16Var = new o16(new yua(kz0Var2), inflater);
                        xy7Var.e = o16Var;
                    }
                    if (xy7Var.b) {
                        inflater.reset();
                    }
                    kz0Var2.J(kz0Var);
                    kz0Var2.N0(65535);
                    long bytesRead = inflater.getBytesRead() + kz0Var2.b;
                    do {
                        o16Var.f(kz0Var, Long.MAX_VALUE);
                        if (inflater.getBytesRead() >= bytesRead) {
                            break;
                        }
                    } while (!inflater.finished());
                    if (inflater.getBytesRead() < bytesRead) {
                        kz0Var2.B();
                        o16Var.close();
                        xy7Var.e = null;
                        xy7Var.d = null;
                    }
                }
                zva zvaVar = this.b;
                if (i == 1) {
                    String strG0 = kz0Var.G0();
                    zvaVar.getClass();
                    ((uz0) zvaVar.a.c).e(strG0);
                    return;
                } else {
                    h21 h21VarR = kz0Var.r(kz0Var.b);
                    zvaVar.getClass();
                    h21VarR.getClass();
                    ((uz0) zvaVar.a.c).e(h21VarR.t());
                    return;
                }
            }
            while (!this.e) {
                p();
                if (!this.i) {
                    break;
                } else {
                    m();
                }
            }
            if (this.f != 0) {
                int i2 = this.f;
                TimeZone timeZone2 = ggf.a;
                String hexString2 = Integer.toHexString(i2);
                hexString2.getClass();
                throw new ProtocolException("Expected continuation opcode. Got: ".concat(hexString2));
            }
        }
        ik4.g("closed");
    }

    public final void m() throws ProtocolException, EOFException {
        String strG0;
        short sA0;
        long j = this.g;
        if (j > 0) {
            this.a.m(this.k, j);
        }
        switch (this.f) {
            case 8:
                kz0 kz0Var = this.k;
                long j2 = kz0Var.b;
                if (j2 == 1) {
                    lg8.k("Malformed close payload length of 1.");
                    return;
                }
                if (j2 != 0) {
                    sA0 = kz0Var.A0();
                    strG0 = this.k.G0();
                    String strW = (sA0 < 1000 || sA0 >= 5000) ? b09.w(sA0, "Code must be in range [1000,5000): ") : ((1004 > sA0 || sA0 >= 1007) && (1015 > sA0 || sA0 >= 3000)) ? null : ev6.w("Code ", sA0, " is reserved and may not be used.");
                    if (strW != null) {
                        lg8.k(strW);
                        return;
                    }
                } else {
                    strG0 = "";
                    sA0 = 1005;
                }
                this.b.f(sA0, strG0);
                this.e = true;
                return;
            case 9:
                zva zvaVar = this.b;
                kz0 kz0Var2 = this.k;
                zvaVar.g(kz0Var2.r(kz0Var2.b));
                return;
            case 10:
                zva zvaVar2 = this.b;
                kz0 kz0Var3 = this.k;
                h21 h21VarR = kz0Var3.r(kz0Var3.b);
                synchronized (zvaVar2) {
                    h21VarR.getClass();
                    zvaVar2.w = false;
                }
                return;
            default:
                int i = this.f;
                TimeZone timeZone = ggf.a;
                String hexString = Integer.toHexString(i);
                hexString.getClass();
                throw new ProtocolException("Unknown control opcode: ".concat(hexString));
        }
    }

    public final void p() throws IOException {
        boolean z;
        TimeUnit timeUnit = TimeUnit.NANOSECONDS;
        yua yuaVar = this.a;
        kz0 kz0Var = yuaVar.b;
        ikc ikcVar = yuaVar.a;
        if (this.e) {
            ik4.g(uuLAxLN.ZdrjYDOzod);
            return;
        }
        long jH = ikcVar.b().h();
        ikcVar.b().b();
        try {
            byte b = yuaVar.readByte();
            byte[] bArr = egf.a;
            ikcVar.b().g(jH, timeUnit);
            int i = b & 15;
            this.f = i;
            int i2 = 0;
            boolean z2 = (b & 128) != 0;
            this.h = z2;
            boolean z3 = (b & 8) != 0;
            this.i = z3;
            if (z3 && !z2) {
                lg8.k("Control frames must be final.");
                return;
            }
            boolean z4 = (b & 64) != 0;
            if (i == 1 || i == 2) {
                if (!z4) {
                    z = false;
                } else {
                    if (!this.c) {
                        lg8.k("Unexpected rsv1 flag");
                        return;
                    }
                    z = true;
                }
                this.j = z;
            } else if (z4) {
                lg8.k("Unexpected rsv1 flag");
                return;
            }
            if ((b & 32) != 0) {
                lg8.k("Unexpected rsv2 flag");
                return;
            }
            if ((b & 16) != 0) {
                lg8.k("Unexpected rsv3 flag");
                return;
            }
            byte b2 = yuaVar.readByte();
            boolean z5 = (b2 & 128) != 0;
            if (z5) {
                lg8.k("Server-sent frames must not be masked.");
                return;
            }
            long jZ0 = b2 & 127;
            this.g = jZ0;
            if (jZ0 == 126) {
                jZ0 = yuaVar.B() & 65535;
                this.g = jZ0;
            } else if (jZ0 == 127) {
                yuaVar.x0(8L);
                jZ0 = kz0Var.z0();
                this.g = jZ0;
                if (jZ0 < 0) {
                    long j = this.g;
                    TimeZone timeZone = ggf.a;
                    String hexString = Long.toHexString(j);
                    hexString.getClass();
                    throw new ProtocolException("Frame length 0x" + hexString + " > 0x7FFFFFFFFFFFFFFF");
                }
            }
            if (this.i && jZ0 > 125) {
                lg8.k("Control frame must be less than 125B.");
                return;
            }
            if (!z5) {
                return;
            }
            byte[] bArr2 = this.n;
            bArr2.getClass();
            try {
                yuaVar.x0(bArr2.length);
                kz0Var.j0(bArr2);
            } catch (EOFException e) {
                while (true) {
                    long j2 = kz0Var.b;
                    if (j2 <= 0) {
                        throw e;
                    }
                    int i3 = kz0Var.read(bArr2, i2, (int) j2);
                    if (i3 == -1) {
                        ywb.d();
                        return;
                    }
                    i2 += i3;
                }
            }
        } catch (Throwable th) {
            ikcVar.b().g(jH, timeUnit);
            throw th;
        }
    }
}
