package e90;

import androidx.compose.ui.node.LayoutNode;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public final class z implements Closeable {

    /* renamed from: f, reason: collision with root package name */
    public static final Logger f52411f = Logger.getLogger(e.class.getName());

    /* renamed from: a, reason: collision with root package name */
    public final m90.h f52412a;

    /* renamed from: b, reason: collision with root package name */
    public final m90.g f52413b;

    /* renamed from: c, reason: collision with root package name */
    public int f52414c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f52415d;

    /* renamed from: e, reason: collision with root package name */
    public final c f52416e;

    public z(m90.c0 sink) {
        Intrinsics.g(sink, "sink");
        this.f52412a = sink;
        m90.g gVar = new m90.g();
        this.f52413b = gVar;
        this.f52414c = ReaderJsonLexerKt.BATCH_SIZE;
        this.f52416e = new c(gVar);
    }

    public final synchronized void a(c0 peerSettings) {
        try {
            Intrinsics.g(peerSettings, "peerSettings");
            if (this.f52415d) {
                throw new IOException("closed");
            }
            int i5 = this.f52414c;
            int i11 = peerSettings.f52309a;
            if ((i11 & 32) != 0) {
                i5 = peerSettings.f52310b[5];
            }
            this.f52414c = i5;
            if (((i11 & 2) != 0 ? peerSettings.f52310b[1] : -1) != -1) {
                c cVar = this.f52416e;
                int i12 = (i11 & 2) != 0 ? peerSettings.f52310b[1] : -1;
                cVar.getClass();
                int iMin = Math.min(i12, ReaderJsonLexerKt.BATCH_SIZE);
                int i13 = cVar.f52304d;
                if (i13 != iMin) {
                    if (iMin < i13) {
                        cVar.f52302b = Math.min(cVar.f52302b, iMin);
                    }
                    cVar.f52303c = true;
                    cVar.f52304d = iMin;
                    int i14 = cVar.f52308h;
                    if (iMin < i14) {
                        if (iMin == 0) {
                            a[] aVarArr = cVar.f52305e;
                            u90.b.B(0, aVarArr.length, null, aVarArr);
                            cVar.f52306f = cVar.f52305e.length - 1;
                            cVar.f52307g = 0;
                            cVar.f52308h = 0;
                        } else {
                            cVar.a(i14 - iMin);
                        }
                    }
                }
            }
            c(0, 0, 4, 1);
            this.f52412a.flush();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void b(boolean z11, int i5, m90.g gVar, int i11) {
        if (this.f52415d) {
            throw new IOException("closed");
        }
        c(i5, i11, 0, z11 ? 1 : 0);
        if (i11 > 0) {
            m90.h hVar = this.f52412a;
            Intrinsics.d(gVar);
            hVar.Z(gVar, i11);
        }
    }

    public final void c(int i5, int i11, int i12, int i13) {
        Level level = Level.FINE;
        Logger logger = f52411f;
        if (logger.isLoggable(level)) {
            logger.fine(e.a(i5, i11, i12, i13, false));
        }
        if (i11 > this.f52414c) {
            throw new IllegalArgumentException(("FRAME_SIZE_ERROR length > " + this.f52414c + ": " + i11).toString());
        }
        if ((Integer.MIN_VALUE & i5) != 0) {
            throw new IllegalArgumentException(b.c0.h(i5, "reserved bit set: ").toString());
        }
        byte[] bArr = y80.c.f96853a;
        m90.h hVar = this.f52412a;
        Intrinsics.g(hVar, "<this>");
        hVar.writeByte((i11 >>> 16) & 255);
        hVar.writeByte((i11 >>> 8) & 255);
        hVar.writeByte(i11 & 255);
        hVar.writeByte(i12 & 255);
        hVar.writeByte(i13 & 255);
        hVar.writeInt(i5 & LayoutNode.NotPlacedPlaceOrder);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        this.f52415d = true;
        this.f52412a.close();
    }

    public final synchronized void d(int i5, int i11, byte[] bArr) {
        fq.c.o(i11, "errorCode");
        if (this.f52415d) {
            throw new IOException("closed");
        }
        if (b.c0.F(i11) == -1) {
            throw new IllegalArgumentException("errorCode.httpCode == -1");
        }
        c(0, bArr.length + 8, 7, 0);
        this.f52412a.writeInt(i5);
        this.f52412a.writeInt(b.c0.F(i11));
        if (bArr.length != 0) {
            this.f52412a.write(bArr);
        }
        this.f52412a.flush();
    }

    public final synchronized void e(int i5, ArrayList arrayList, boolean z11) {
        if (this.f52415d) {
            throw new IOException("closed");
        }
        this.f52416e.d(arrayList);
        long j11 = this.f52413b.f76126b;
        long jMin = Math.min(this.f52414c, j11);
        int i11 = j11 == jMin ? 4 : 0;
        if (z11) {
            i11 |= 1;
        }
        c(i5, (int) jMin, 1, i11);
        this.f52412a.Z(this.f52413b, jMin);
        if (j11 > jMin) {
            long j12 = j11 - jMin;
            while (j12 > 0) {
                long jMin2 = Math.min(this.f52414c, j12);
                j12 -= jMin2;
                c(i5, (int) jMin2, 9, j12 == 0 ? 4 : 0);
                this.f52412a.Z(this.f52413b, jMin2);
            }
        }
    }

    public final synchronized void f(int i5, int i11, boolean z11) {
        if (this.f52415d) {
            throw new IOException("closed");
        }
        c(0, 8, 6, z11 ? 1 : 0);
        this.f52412a.writeInt(i5);
        this.f52412a.writeInt(i11);
        this.f52412a.flush();
    }

    public final synchronized void flush() {
        if (this.f52415d) {
            throw new IOException("closed");
        }
        this.f52412a.flush();
    }

    public final synchronized void h(int i5, int i11) {
        fq.c.o(i11, "errorCode");
        if (this.f52415d) {
            throw new IOException("closed");
        }
        if (b.c0.F(i11) == -1) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        c(i5, 4, 3, 0);
        this.f52412a.writeInt(b.c0.F(i11));
        this.f52412a.flush();
    }

    public final synchronized void l(int i5, long j11) {
        if (this.f52415d) {
            throw new IOException("closed");
        }
        if (j11 == 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(("windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: " + j11).toString());
        }
        c(i5, 4, 8, 0);
        this.f52412a.writeInt((int) j11);
        this.f52412a.flush();
    }
}
