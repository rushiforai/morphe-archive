package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ag3 extends w05 {
    public boolean b;
    public final /* synthetic */ lg3 c;
    public final /* synthetic */ cg3 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ag3(ikc ikcVar, lg3 lg3Var, cg3 cg3Var) {
        super(ikcVar);
        this.c = lg3Var;
        this.d = cg3Var;
    }

    @Override // defpackage.w05, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        super.close();
        if (this.b) {
            return;
        }
        this.b = true;
        lg3 lg3Var = this.c;
        cg3 cg3Var = this.d;
        synchronized (lg3Var) {
            int i = cg3Var.h - 1;
            cg3Var.h = i;
            if (i == 0 && cg3Var.f) {
                lg3Var.T(cg3Var);
            }
        }
    }
}
