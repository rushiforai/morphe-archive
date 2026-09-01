package defpackage;

import com.google.gson.JsonParseException;
import com.google.gson.stream.MalformedJsonException;
import java.io.IOException;
import java.math.BigDecimal;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class umd {
    public static final umd BIG_DECIMAL;
    public static final umd DOUBLE;
    public static final umd LAZILY_PARSED_NUMBER;
    public static final umd LONG_OR_DOUBLE;
    public static final /* synthetic */ umd[] a;

    static {
        umd umdVar = new umd() { // from class: qmd
            @Override // defpackage.umd
            public Double readNumber(gd6 gd6Var) {
                return Double.valueOf(gd6Var.nextDouble());
            }
        };
        DOUBLE = umdVar;
        umd umdVar2 = new umd() { // from class: rmd
            @Override // defpackage.umd
            public Number readNumber(gd6 gd6Var) {
                return new uq6(gd6Var.q());
            }
        };
        LAZILY_PARSED_NUMBER = umdVar2;
        umd umdVar3 = new umd() { // from class: smd
            public static Double a(String str, gd6 gd6Var) throws MalformedJsonException {
                try {
                    Double dValueOf = Double.valueOf(str);
                    if (dValueOf.isInfinite() || dValueOf.isNaN()) {
                        if (!(gd6Var.b == euc.LENIENT)) {
                            throw new MalformedJsonException("JSON forbids NaN and infinities: " + dValueOf + "; at path " + gd6Var.R());
                        }
                    }
                    return dValueOf;
                } catch (NumberFormatException e) {
                    StringBuilder sbU = lv8.u("Cannot parse ", str, "; at path ");
                    sbU.append(gd6Var.R());
                    throw new JsonParseException(sbU.toString(), e);
                }
            }

            @Override // defpackage.umd
            public Number readNumber(gd6 gd6Var) throws IOException {
                String strQ = gd6Var.q();
                if (strQ.indexOf(46) >= 0) {
                    return a(strQ, gd6Var);
                }
                try {
                    return Long.valueOf(Long.parseLong(strQ));
                } catch (NumberFormatException unused) {
                    return a(strQ, gd6Var);
                }
            }
        };
        LONG_OR_DOUBLE = umdVar3;
        umd umdVar4 = new umd() { // from class: tmd
            @Override // defpackage.umd
            public BigDecimal readNumber(gd6 gd6Var) throws IOException {
                String strQ = gd6Var.q();
                try {
                    return qk7.w(strQ);
                } catch (NumberFormatException e) {
                    StringBuilder sbU = lv8.u("Cannot parse ", strQ, "; at path ");
                    sbU.append(gd6Var.R());
                    throw new JsonParseException(sbU.toString(), e);
                }
            }
        };
        BIG_DECIMAL = umdVar4;
        a = new umd[]{umdVar, umdVar2, umdVar3, umdVar4};
    }

    public static umd valueOf(String str) {
        return (umd) Enum.valueOf(umd.class, str);
    }

    public static umd[] values() {
        return (umd[]) a.clone();
    }

    public abstract Number readNumber(gd6 gd6Var);
}
