package defpackage;

import java.io.EOFException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class aa4 extends v05 {
    public final x45 b;
    public boolean c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aa4(bfc bfcVar, x45 x45Var) {
        super(bfcVar);
        bfcVar.getClass();
        this.b = x45Var;
    }

    @Override // defpackage.v05, defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws EOFException {
        kz0Var.getClass();
        if (this.c) {
            kz0Var.skip(j);
            return;
        }
        try {
            this.a.c0(kz0Var, j);
        } catch (IOException e) {
            this.c = true;
            this.b.invoke(e);
        }
    }

    @Override // defpackage.v05, defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        try {
            super.close();
        } catch (IOException e) {
            this.c = true;
            this.b.invoke(e);
        }
    }

    @Override // defpackage.v05, defpackage.bfc, java.io.Flushable
    public final void flush() {
        if (this.c) {
            return;
        }
        try {
            super.flush();
        } catch (IOException e) {
            this.c = true;
            this.b.invoke(e);
        }
    }
}
