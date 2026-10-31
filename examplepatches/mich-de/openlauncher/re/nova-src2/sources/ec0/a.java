package ec0;

import java.io.IOException;
import jc0.c;
import jc0.d;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x60.e;

/* loaded from: classes5.dex */
public final class a extends b {
    @Override // ec0.b
    public final Appendable K(e eVar, Appendable appendable) throws IOException {
        String strP = P(eVar);
        if (strP != null) {
            return appendable.append(strP);
        }
        if (!(eVar instanceof d)) {
            throw new IllegalArgumentException("Cannot format given Object as a Unit");
        }
        d dVar = (d) eVar;
        c[] cVarArr = dVar.f69438d;
        for (int i5 = 0; i5 < cVarArr.length; i5++) {
            if (i5 != 0) {
                appendable.append('*');
            }
            String strP2 = P(dVar.w(i5));
            int iX = dVar.x(i5);
            int i11 = cVarArr[i5].f69437c;
            appendable.append(strP2);
            if (iX != 1 || i11 != 1) {
                appendable.append('^');
                appendable.append(String.valueOf(iX));
                if (i11 != 1) {
                    appendable.append(AbstractJsonLexerKt.COLON);
                    appendable.append(String.valueOf(i11));
                }
            }
        }
        return appendable;
    }

    @Override // ec0.b
    public final boolean N(String str) {
        if (str != null && str.length() != 0 && b.M(str.charAt(0))) {
            for (int i5 = 0; i5 < str.length(); i5++) {
                if (str.charAt(i5) <= 127) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // ec0.b
    public final String P(e eVar) {
        String str = (String) this.f52686e.get(eVar);
        return str != null ? str : b.f52683k.P(eVar);
    }

    @Override // ec0.b
    public final String toString() {
        return "SimpleUnitFormat - ASCII";
    }
}
