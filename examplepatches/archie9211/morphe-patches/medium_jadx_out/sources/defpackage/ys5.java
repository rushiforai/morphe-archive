package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ys5 implements Closeable {
    public static final Logger f = Logger.getLogger(is5.class.getName());
    public final xua a;
    public final kz0 b;
    public int c;
    public boolean d;
    public final as5 e;

    public ys5(xua xuaVar) {
        this.a = xuaVar;
        kz0 kz0Var = new kz0();
        this.b = kz0Var;
        this.c = OlympusMakernoteDirectory.TAG_MAIN_INFO;
        this.e = new as5(kz0Var);
    }

    public final void B(int i, b14 b14Var, byte[] bArr) {
        b14Var.getClass();
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            if (b14Var.getHttpCode() == -1) {
                throw new IllegalArgumentException("errorCode.httpCode == -1");
            }
            p(0, bArr.length + 8, 7, 0);
            this.a.m(i);
            this.a.m(b14Var.getHttpCode());
            if (bArr.length != 0) {
                this.a.write(bArr);
            }
            this.a.flush();
        }
    }

    public final void D(boolean z, int i, ArrayList arrayList) {
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            this.e.d(arrayList);
            long j = this.b.b;
            long jMin = Math.min(this.c, j);
            int i2 = j == jMin ? 4 : 0;
            if (z) {
                i2 |= 1;
            }
            p(i, (int) jMin, 1, i2);
            this.a.c0(this.b, jMin);
            if (j > jMin) {
                long j2 = j - jMin;
                while (j2 > 0) {
                    long jMin2 = Math.min(this.c, j2);
                    j2 -= jMin2;
                    p(i, (int) jMin2, 9, j2 == 0 ? 4 : 0);
                    this.a.c0(this.b, jMin2);
                }
            }
        }
    }

    public final void I(int i, int i2, boolean z) {
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            p(0, 8, 6, z ? 1 : 0);
            this.a.m(i);
            this.a.m(i2);
            this.a.flush();
        }
    }

    public final void L(int i, b14 b14Var) {
        b14Var.getClass();
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            if (b14Var.getHttpCode() == -1) {
                throw new IllegalArgumentException("Failed requirement.");
            }
            p(i, 4, 3, 0);
            this.a.m(b14Var.getHttpCode());
            this.a.flush();
        }
    }

    public final void N(v1c v1cVar) {
        v1cVar.getClass();
        synchronized (this) {
            try {
                if (this.d) {
                    throw new IOException("closed");
                }
                p(0, Integer.bitCount(v1cVar.a) * 6, 4, 0);
                for (int i = 0; i < 10; i++) {
                    boolean z = true;
                    if (((1 << i) & v1cVar.a) == 0) {
                        z = false;
                    }
                    if (z) {
                        xua xuaVar = this.a;
                        if (xuaVar.c) {
                            throw new IllegalStateException("closed");
                        }
                        xuaVar.b.P0(i);
                        xuaVar.f();
                        this.a.m(v1cVar.b[i]);
                    }
                }
                this.a.flush();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void Q(int i, long j) {
        synchronized (this) {
            try {
                if (this.d) {
                    throw new IOException("closed");
                }
                if (j == 0 || j > 2147483647L) {
                    throw new IllegalArgumentException(("windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: " + j).toString());
                }
                Logger logger = f;
                if (logger.isLoggable(Level.FINE)) {
                    logger.fine(is5.c(false, i, 4, j));
                }
                p(i, 4, 8, 0);
                this.a.m((int) j);
                this.a.flush();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        synchronized (this) {
            this.d = true;
            this.a.close();
        }
    }

    public final void f(v1c v1cVar) {
        v1cVar.getClass();
        synchronized (this) {
            try {
                if (this.d) {
                    throw new IOException("closed");
                }
                int i = this.c;
                int i2 = v1cVar.a;
                if ((i2 & 32) != 0) {
                    i = v1cVar.b[5];
                }
                this.c = i;
                if (((i2 & 2) != 0 ? v1cVar.b[1] : -1) != -1) {
                    as5 as5Var = this.e;
                    int iMin = Math.min((i2 & 2) != 0 ? v1cVar.b[1] : -1, OlympusMakernoteDirectory.TAG_MAIN_INFO);
                    int i3 = as5Var.d;
                    if (i3 != iMin) {
                        if (iMin < i3) {
                            as5Var.b = Math.min(as5Var.b, iMin);
                        }
                        as5Var.c = true;
                        as5Var.d = iMin;
                        int i4 = as5Var.h;
                        if (iMin < i4) {
                            if (iMin == 0) {
                                vi5[] vi5VarArr = as5Var.e;
                                k80.o0(0, vi5VarArr.length, null, vi5VarArr);
                                as5Var.f = as5Var.e.length - 1;
                                as5Var.g = 0;
                                as5Var.h = 0;
                            } else {
                                as5Var.a(i4 - iMin);
                            }
                        }
                    }
                }
                p(0, 0, 4, 1);
                this.a.flush();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void flush() {
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            this.a.flush();
        }
    }

    public final void m(boolean z, int i, kz0 kz0Var, int i2) {
        synchronized (this) {
            if (this.d) {
                throw new IOException("closed");
            }
            p(i, i2, 0, z ? 1 : 0);
            if (i2 > 0) {
                xua xuaVar = this.a;
                kz0Var.getClass();
                xuaVar.c0(kz0Var, i2);
            }
        }
    }

    public final void p(int i, int i2, int i3, int i4) {
        if (i3 != 8) {
            Level level = Level.FINE;
            Logger logger = f;
            if (logger.isLoggable(level)) {
                logger.fine(is5.b(false, i, i2, i3, i4));
            }
        }
        if (i2 > this.c) {
            throw new IllegalArgumentException(("FRAME_SIZE_ERROR length > " + this.c + ": " + i2).toString());
        }
        if ((Integer.MIN_VALUE & i) != 0) {
            ywb.g(b09.w(i, "reserved bit set: "));
            return;
        }
        byte[] bArr = egf.a;
        xua xuaVar = this.a;
        xuaVar.writeByte((i2 >>> 16) & 255);
        xuaVar.writeByte((i2 >>> 8) & 255);
        xuaVar.writeByte(i2 & 255);
        xuaVar.writeByte(i3 & 255);
        xuaVar.writeByte(i4 & 255);
        xuaVar.m(i & Integer.MAX_VALUE);
    }
}
