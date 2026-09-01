package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fm8 extends jud {
    public static final dm8 b = new dm8(0, new fm8(umd.LAZILY_PARSED_NUMBER));
    public final umd a;

    public fm8(umd umdVar) {
        this.a = umdVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        jd6 jd6VarP0 = gd6Var.p0();
        int i = em8.a[jd6VarP0.ordinal()];
        if (i == 1) {
            gd6Var.a0();
            return null;
        }
        if (i == 2 || i == 3) {
            return this.a.readNumber(gd6Var);
        }
        StringBuilder sb = new StringBuilder("Expecting number, got: ");
        sb.append(jd6VarP0);
        String strN = gd6Var.N();
        sb.append("; at path ");
        sb.append(strN);
        throw new JsonSyntaxException(sb.toString());
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.z0((Number) obj);
    }
}
