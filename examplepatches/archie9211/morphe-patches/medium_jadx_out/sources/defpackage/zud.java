package defpackage;

import com.google.gson.JsonIOException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class zud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        try {
            String strQ = gd6Var.q();
            if (strQ.equals("null")) {
                return null;
            }
            return new URI(strQ);
        } catch (URISyntaxException e) {
            throw new JsonIOException(e);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        URI uri = (URI) obj;
        yd6Var.A0(uri == null ? null : uri.toASCIIString());
    }
}
