package defpackage;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class jb6 {
    public abstract Object a(hd6 hd6Var);

    public final Object b(String str) {
        kz0 kz0Var = new kz0();
        kz0Var.R0(str);
        sd6 sd6Var = new sd6(kz0Var);
        Object objA = a(sd6Var);
        if ((this instanceof hb6) || sd6Var.I() == dd6.END_DOCUMENT) {
            return objA;
        }
        throw new JsonDataException("JSON document was not fully consumed.");
    }

    public final rl8 c() {
        return this instanceof rl8 ? (rl8) this : new rl8(this);
    }

    public final String d(Object obj) {
        kz0 kz0Var = new kz0();
        try {
            e(new ud6(kz0Var), obj);
            return kz0Var.G0();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }

    public abstract void e(zd6 zd6Var, Object obj);
}
