package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class kvd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        try {
            int iNextInt = gd6Var.nextInt();
            if (iNextInt <= 255 && iNextInt >= -128) {
                return Byte.valueOf((byte) iNextInt);
            }
            StringBuilder sbC = ev6.C("Lossy conversion from ", iNextInt, " to byte; at path ");
            sbC.append(gd6Var.R());
            throw new JsonSyntaxException(sbC.toString());
        } catch (NumberFormatException e) {
            throw new JsonSyntaxException(e);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        if (((Number) obj) == null) {
            yd6Var.Q();
        } else {
            yd6Var.o0(r4.byteValue());
        }
    }
}
