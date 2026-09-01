package defpackage;

import java.io.EOFException;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o16 implements ikc {
    public final yua a;
    public final Inflater b;
    public int c;
    public boolean d;

    public o16(yua yuaVar, Inflater inflater) {
        this.a = yuaVar;
        this.b = inflater;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.a.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.d) {
            return;
        }
        this.b.end();
        this.d = true;
        this.a.close();
    }

    public final long f(kz0 kz0Var, long j) {
        Inflater inflater = this.b;
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        if (this.d) {
            ygf.f("closed");
            return 0L;
        }
        if (j != 0) {
            try {
                iwb iwbVarI0 = kz0Var.I0(1);
                int iMin = (int) Math.min(j, 8192 - iwbVarI0.c);
                boolean zNeedsInput = inflater.needsInput();
                yua yuaVar = this.a;
                if (zNeedsInput && !yuaVar.H()) {
                    iwb iwbVar = yuaVar.b.a;
                    iwbVar.getClass();
                    int i = iwbVar.c;
                    int i2 = iwbVar.b;
                    int i3 = i - i2;
                    this.c = i3;
                    inflater.setInput(iwbVar.a, i2, i3);
                }
                int iInflate = inflater.inflate(iwbVarI0.a, iwbVarI0.c, iMin);
                int i4 = this.c;
                if (i4 != 0) {
                    int remaining = i4 - inflater.getRemaining();
                    this.c -= remaining;
                    yuaVar.skip(remaining);
                }
                if (iInflate > 0) {
                    iwbVarI0.c += iInflate;
                    long j2 = iInflate;
                    kz0Var.b += j2;
                    return j2;
                }
                if (iwbVarI0.b == iwbVarI0.c) {
                    kz0Var.a = iwbVarI0.a();
                    lwb.a(iwbVarI0);
                }
            } catch (DataFormatException e) {
                throw new IOException(e);
            }
        }
        return 0L;
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws EOFException {
        kz0Var.getClass();
        do {
            long jF = f(kz0Var, j);
            if (jF > 0) {
                return jF;
            }
            Inflater inflater = this.b;
            if (inflater.finished() || inflater.needsDictionary()) {
                return -1L;
            }
        } while (!this.a.H());
        throw new EOFException("source exhausted prematurely");
    }
}
