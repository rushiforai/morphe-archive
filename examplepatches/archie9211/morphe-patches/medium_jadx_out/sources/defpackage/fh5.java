package defpackage;

import com.squareup.wire.AndroidMessage;
import java.nio.charset.Charset;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fh5 implements ub6 {
    public static final Charset b = Charset.forName("UTF-8");
    public final ch5 a;

    public fh5(ch5 ch5Var) {
        this.a = ch5Var;
    }

    public final Map a(AndroidMessage androidMessage) {
        eh5 eh5Var = new eh5();
        Class<?> cls = androidMessage.getClass();
        qd6 qd6Var = new qd6();
        ch5 ch5Var = this.a;
        ch5Var.j(androidMessage, cls, qd6Var);
        dc6 dc6VarG0 = qd6Var.G0();
        Object objA = dc6VarG0 == null ? null : ch5Var.a(new od6(dc6VarG0), kxd.b(eh5Var.d()));
        objA.getClass();
        return (Map) objA;
    }
}
