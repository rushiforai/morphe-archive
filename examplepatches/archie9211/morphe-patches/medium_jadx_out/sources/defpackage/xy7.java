package defpackage;

import java.io.Closeable;
import java.util.zip.Deflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xy7 implements Closeable {
    public final /* synthetic */ int a;
    public final boolean b;
    public final kz0 c;
    public Object d;
    public Closeable e;

    public xy7(int i, boolean z) {
        this.a = i;
        switch (i) {
            case 1:
                this.b = z;
                this.c = new kz0();
                break;
            default:
                this.b = z;
                kz0 kz0Var = new kz0();
                this.c = kz0Var;
                Deflater deflater = new Deflater(-1, true);
                this.d = deflater;
                this.e = new w33(new xua(kz0Var), deflater, 0);
                break;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws Throwable {
        switch (this.a) {
            case 0:
                ((w33) this.e).close();
                break;
            default:
                o16 o16Var = (o16) this.e;
                if (o16Var != null) {
                    o16Var.close();
                }
                this.e = null;
                this.d = null;
                break;
        }
    }
}
