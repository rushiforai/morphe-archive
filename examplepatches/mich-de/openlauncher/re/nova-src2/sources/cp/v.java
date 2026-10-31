package cp;

import b.u4;
import com.nimbusds.jose.shaded.gson.JsonParseException;
import com.nimbusds.jose.shaded.gson.stream.MalformedJsonException;

/* loaded from: classes4.dex */
public enum v extends x {
    public v() {
        super("LONG_OR_DOUBLE", 2);
    }

    public static Double b(String str, kp.a aVar) throws MalformedJsonException, NumberFormatException {
        try {
            Double dValueOf = Double.valueOf(str);
            if (dValueOf.isInfinite() || dValueOf.isNaN()) {
                if (aVar.o != 1) {
                    throw new MalformedJsonException("JSON forbids NaN and infinities: " + dValueOf + "; at path " + aVar.l(true));
                }
            }
            return dValueOf;
        } catch (NumberFormatException e3) {
            StringBuilder sbK = u4.k("Cannot parse ", str, "; at path ");
            sbK.append(aVar.l(true));
            throw new JsonParseException(sbK.toString(), e3);
        }
    }

    @Override // cp.x
    public final Number a(kp.a aVar) {
        String strD0 = aVar.d0();
        if (strD0.indexOf(46) >= 0) {
            return b(strD0, aVar);
        }
        try {
            return Long.valueOf(Long.parseLong(strD0));
        } catch (NumberFormatException unused) {
            return b(strD0, aVar);
        }
    }
}
