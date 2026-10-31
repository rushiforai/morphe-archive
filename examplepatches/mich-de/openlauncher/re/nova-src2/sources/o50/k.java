package o50;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final Set f79578a = kotlin.collections.c.f1(new Character[]{'(', ')', '<', '>', '@', Character.valueOf(AbstractJsonLexerKt.COMMA), ';', Character.valueOf(AbstractJsonLexerKt.COLON), Character.valueOf(AbstractJsonLexerKt.STRING_ESC), Character.valueOf(AbstractJsonLexerKt.STRING), '/', Character.valueOf(AbstractJsonLexerKt.BEGIN_LIST), Character.valueOf(AbstractJsonLexerKt.END_LIST), '?', '=', Character.valueOf(AbstractJsonLexerKt.BEGIN_OBJ), Character.valueOf(AbstractJsonLexerKt.END_OBJ), ' ', '\t', '\n', '\r'});

    public static final boolean a(String str) {
        if (str.length() != 0) {
            if (str.length() >= 2 && r70.l.D1(str) == '\"' && r70.l.F1(str) == '\"') {
                int i5 = 1;
                do {
                    int iR0 = r70.k.R0(AbstractJsonLexerKt.STRING, i5, 4, str);
                    if (iR0 == r70.k.O0(str)) {
                        break;
                    }
                    int i11 = 0;
                    for (int i12 = iR0 - 1; str.charAt(i12) == '\\'; i12--) {
                        i11++;
                    }
                    if (i11 % 2 != 0) {
                        i5 = iR0 + 1;
                    }
                } while (i5 < str.length());
                return false;
            }
            int length = str.length();
            for (int i13 = 0; i13 < length; i13++) {
                if (!f79578a.contains(Character.valueOf(str.charAt(i13)))) {
                }
            }
            return false;
        }
        return true;
    }

    public static final String b(String str) {
        Intrinsics.g(str, "<this>");
        StringBuilder sb2 = new StringBuilder("\"");
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt == '\t') {
                sb2.append("\\t");
            } else if (cCharAt == '\n') {
                sb2.append("\\n");
            } else if (cCharAt == '\r') {
                sb2.append("\\r");
            } else if (cCharAt == '\"') {
                sb2.append("\\\"");
            } else if (cCharAt != '\\') {
                sb2.append(cCharAt);
            } else {
                sb2.append("\\\\");
            }
        }
        sb2.append("\"");
        return sb2.toString();
    }
}
