package defpackage;

import java.io.Closeable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hz0 implements Closeable {
    public kz0 a;
    public boolean b;
    public iwb c;
    public byte[] e;
    public long d = -1;
    public int f = -1;
    public int g = -1;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.a == null) {
            ygf.f("not attached to a buffer");
            return;
        }
        this.a = null;
        this.c = null;
        this.d = -1L;
        this.e = null;
        this.f = -1;
        this.g = -1;
    }

    public final void f(long j) {
        kz0 kz0Var = this.a;
        if (kz0Var == null) {
            ygf.f("not attached to a buffer");
            return;
        }
        if (!this.b) {
            ygf.f("resizeBuffer() only permitted for read/write buffers");
            return;
        }
        long j2 = kz0Var.b;
        if (j <= j2) {
            if (j < 0) {
                ywb.g(ho2.D(j, "newSize < 0: "));
                return;
            }
            long j3 = j2 - j;
            while (true) {
                if (j3 <= 0) {
                    break;
                }
                iwb iwbVar = kz0Var.a;
                iwbVar.getClass();
                iwb iwbVar2 = iwbVar.g;
                iwbVar2.getClass();
                int i = iwbVar2.c;
                long j4 = i - iwbVar2.b;
                if (j4 > j3) {
                    iwbVar2.c = i - ((int) j3);
                    break;
                } else {
                    kz0Var.a = iwbVar2.a();
                    lwb.a(iwbVar2);
                    j3 -= j4;
                }
            }
            this.c = null;
            this.d = j;
            this.e = null;
            this.f = -1;
            this.g = -1;
        } else if (j > j2) {
            long j5 = j - j2;
            int i2 = 1;
            boolean z = true;
            for (long j6 = 0; j5 > j6; j6 = 0) {
                iwb iwbVarI0 = kz0Var.I0(i2);
                int iMin = (int) Math.min(j5, 8192 - iwbVarI0.c);
                int i3 = iwbVarI0.c + iMin;
                iwbVarI0.c = i3;
                j5 -= (long) iMin;
                if (z) {
                    this.c = iwbVarI0;
                    this.d = j2;
                    this.e = iwbVarI0.a;
                    this.f = i3 - iMin;
                    this.g = i3;
                    z = false;
                }
                i2 = 1;
            }
        }
        kz0Var.b = j;
    }

    public final int m(long j) {
        kz0 kz0Var = this.a;
        if (kz0Var == null) {
            ygf.f("not attached to a buffer");
            return 0;
        }
        if (j >= -1) {
            long j2 = kz0Var.b;
            if (j <= j2) {
                if (j == -1 || j == j2) {
                    this.c = null;
                    this.d = j;
                    this.e = null;
                    this.f = -1;
                    this.g = -1;
                    return -1;
                }
                iwb iwbVar = kz0Var.a;
                iwb iwbVar2 = this.c;
                long j3 = 0;
                if (iwbVar2 != null) {
                    long j4 = this.d - ((long) (this.f - iwbVar2.b));
                    if (j4 > j) {
                        iwbVar2 = iwbVar;
                        iwbVar = iwbVar2;
                        j2 = j4;
                    } else {
                        j3 = j4;
                    }
                } else {
                    iwbVar2 = iwbVar;
                }
                if (j2 - j > j - j3) {
                    while (true) {
                        iwbVar2.getClass();
                        long j5 = ((long) (iwbVar2.c - iwbVar2.b)) + j3;
                        if (j < j5) {
                            break;
                        }
                        iwbVar2 = iwbVar2.f;
                        j3 = j5;
                    }
                } else {
                    while (j2 > j) {
                        iwbVar.getClass();
                        iwbVar = iwbVar.g;
                        iwbVar.getClass();
                        j2 -= (long) (iwbVar.c - iwbVar.b);
                    }
                    iwbVar2 = iwbVar;
                    j3 = j2;
                }
                if (this.b) {
                    iwbVar2.getClass();
                    if (iwbVar2.d) {
                        byte[] bArr = iwbVar2.a;
                        iwb iwbVar3 = new iwb(Arrays.copyOf(bArr, bArr.length), iwbVar2.b, iwbVar2.c, false, true);
                        if (kz0Var.a == iwbVar2) {
                            kz0Var.a = iwbVar3;
                        }
                        iwbVar2.b(iwbVar3);
                        iwb iwbVar4 = iwbVar3.g;
                        iwbVar4.getClass();
                        iwbVar4.a();
                        iwbVar2 = iwbVar3;
                    }
                }
                this.c = iwbVar2;
                this.d = j;
                iwbVar2.getClass();
                this.e = iwbVar2.a;
                int i = iwbVar2.b + ((int) (j - j3));
                this.f = i;
                int i2 = iwbVar2.c;
                this.g = i2;
                return i2 - i;
            }
        }
        StringBuilder sbD = b09.D("offset=", " > size=", j);
        sbD.append(kz0Var.b);
        throw new ArrayIndexOutOfBoundsException(sbD.toString());
    }
}
