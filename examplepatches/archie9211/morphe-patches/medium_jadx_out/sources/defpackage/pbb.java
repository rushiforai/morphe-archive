package defpackage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pbb extends sbb {
    public final /* synthetic */ fn7 b;
    public final /* synthetic */ File c;

    public pbb(fn7 fn7Var, File file) {
        this.b = fn7Var;
        this.c = file;
    }

    @Override // defpackage.sbb
    public final long a() {
        return this.c.length();
    }

    @Override // defpackage.sbb
    public final fn7 b() {
        return this.b;
    }

    @Override // defpackage.sbb
    public final void d(xz0 xz0Var) throws IOException {
        y26 y26Var = new y26(new FileInputStream(this.c), fmd.d);
        try {
            xz0Var.J(y26Var);
            y26Var.close();
        } finally {
        }
    }
}
