package defpackage;

import java.io.File;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mg4 implements a34 {
    public final qg4 a;
    public final ba9 b;
    public final rg4 c;
    public final tl d;
    public final f66 e;
    public final w5d f;

    public mg4(qg4 qg4Var, ba9 ba9Var, ba9 ba9Var2, rg4 rg4Var, tl tlVar, f66 f66Var) {
        f66Var.getClass();
        this.a = qg4Var;
        this.b = ba9Var;
        this.c = rg4Var;
        this.d = tlVar;
        this.e = f66Var;
        this.f = new w5d(new ir(16, this));
    }

    @Override // defpackage.a34
    public final boolean a(qsa qsaVar, u34 u34Var) {
        boolean z;
        byte[] bArr = qsaVar.a;
        u34Var.getClass();
        w5d w5dVar = this.f;
        File file = (File) w5dVar.getValue();
        File file2 = (File) w5dVar.getValue();
        if (file2 != null) {
            this.a.d(file2);
        }
        if (file == null) {
            f49.L(this.e, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), ot2.w, null, 56);
            return false;
        }
        if (bArr.length == 0) {
            return true;
        }
        int length = bArr.length;
        if (length > this.c.c) {
            f49.K(this.e, d66.ERROR, e66.USER, new lg4(length, this), null, false, 56);
            return false;
        }
        ba9 ba9Var = this.b;
        try {
            ba9.c(file, qsaVar);
            z = true;
        } catch (IOException e) {
            f49.L(ba9Var.a, d66.ERROR, d46.Q(e66.MAINTAINER), new vp0(file, 16), e, 48);
            z = false;
        } catch (SecurityException e2) {
            f49.L(ba9Var.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 17), e2, 48);
            z = false;
        }
        if (!z) {
            return false;
        }
        tl tlVar = this.d;
        ((jzb) tlVar.k).z((String) tlVar.j, "android.benchmark.bytes_written");
        return true;
    }
}
