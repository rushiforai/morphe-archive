package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class nvd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        try {
            return new AtomicInteger(gd6Var.nextInt());
        } catch (NumberFormatException e) {
            throw new JsonSyntaxException(e);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.o0(((AtomicInteger) obj).get());
    }
}
