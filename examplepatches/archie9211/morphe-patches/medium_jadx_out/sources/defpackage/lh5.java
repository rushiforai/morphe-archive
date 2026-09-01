package defpackage;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lh5 implements y92 {
    public static final fn7 c;
    public final ch5 a;
    public final jud b;

    static {
        x2b x2bVar = fn7.d;
        c = en7.x("application/json; charset=UTF-8");
    }

    public lh5(ch5 ch5Var, jud judVar) {
        this.a = ch5Var;
        this.b = judVar;
    }

    @Override // defpackage.y92
    public final Object v(Object obj) throws IOException {
        kz0 kz0Var = new kz0();
        yd6 yd6VarG = this.a.g(new OutputStreamWriter(new jz0(kz0Var), StandardCharsets.UTF_8));
        this.b.c(yd6VarG, obj);
        yd6VarG.close();
        h21 h21VarR = kz0Var.r(kz0Var.b);
        qbb qbbVar = sbb.a;
        h21VarR.getClass();
        return new qbb(c, h21VarR);
    }
}
