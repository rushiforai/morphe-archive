package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.Currency;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class cvd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        String strQ = gd6Var.q();
        try {
            return Currency.getInstance(strQ);
        } catch (IllegalArgumentException e) {
            StringBuilder sbU = lv8.u("Failed parsing '", strQ, "' as Currency; at path ");
            sbU.append(gd6Var.R());
            throw new JsonSyntaxException(sbU.toString(), e);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.A0(((Currency) obj).getCurrencyCode());
    }
}
