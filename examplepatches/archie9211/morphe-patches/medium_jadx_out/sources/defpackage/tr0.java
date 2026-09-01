package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tr0 extends w05 {
    public final /* synthetic */ int b = 0;
    public Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tr0(qp8 qp8Var, zz0 zz0Var) {
        super(zz0Var);
        this.c = qp8Var;
    }

    @Override // defpackage.w05, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        switch (this.b) {
            case 1:
                ((u21) this.c).c.close();
                super.close();
                break;
            default:
                super.close();
                break;
        }
    }

    @Override // defpackage.w05, defpackage.ikc
    public long q0(kz0 kz0Var, long j) throws Exception {
        switch (this.b) {
            case 0:
                try {
                    return super.q0(kz0Var, j);
                } catch (Exception e) {
                    this.c = e;
                    throw e;
                }
            case 1:
            default:
                return super.q0(kz0Var, j);
            case 2:
                try {
                    return super.q0(kz0Var, j);
                } catch (IOException e2) {
                    ((qp8) this.c).e = e2;
                    throw e2;
                }
        }
    }

    public /* synthetic */ tr0(ikc ikcVar) {
        super(ikcVar);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tr0(ikc ikcVar, u21 u21Var) {
        super(ikcVar);
        this.c = u21Var;
    }
}
