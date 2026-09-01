package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class qud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        String strQ = gd6Var.q();
        if (strQ.length() == 1) {
            return Character.valueOf(strQ.charAt(0));
        }
        StringBuilder sbU = lv8.u("Expecting character, got: ", strQ, "; at ");
        sbU.append(gd6Var.R());
        throw new JsonSyntaxException(sbU.toString());
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        Character ch = (Character) obj;
        yd6Var.A0(ch == null ? null : String.valueOf(ch));
    }
}
