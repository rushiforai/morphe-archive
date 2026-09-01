package defpackage;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class mud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        return new AtomicBoolean(gd6Var.nextBoolean());
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.E0(((AtomicBoolean) obj).get());
    }
}
