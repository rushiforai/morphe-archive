package ads_mobile_sdk;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class ke3 {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f5719a = new String[128];

    static {
        for (int i5 = 0; i5 <= 31; i5++) {
            f5719a[i5] = String.format("\\%03o", Integer.valueOf(i5));
        }
        String[] strArr = f5719a;
        strArr[127] = "\\177";
        strArr[34] = "\\\"";
        strArr[39] = "\\'";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        strArr[7] = "\\a";
        strArr[11] = "\\v";
    }

    public static String a(sq sqVar) {
        return a(sqVar.c());
    }

    public static String a(byte[] bArr) {
        StringBuilder sb2 = new StringBuilder(bArr.length);
        for (byte b11 : bArr) {
            if (b11 == 34) {
                sb2.append("\\\"");
            } else if (b11 == 39) {
                sb2.append("\\'");
            } else if (b11 != 92) {
                switch (b11) {
                    case 7:
                        sb2.append("\\a");
                        break;
                    case 8:
                        sb2.append("\\b");
                        break;
                    case 9:
                        sb2.append("\\t");
                        break;
                    case 10:
                        sb2.append("\\n");
                        break;
                    case 11:
                        sb2.append("\\v");
                        break;
                    case 12:
                        sb2.append("\\f");
                        break;
                    case 13:
                        sb2.append("\\r");
                        break;
                    default:
                        if (b11 < 32 || b11 > 126) {
                            sb2.append(AbstractJsonLexerKt.STRING_ESC);
                            sb2.append((char) (((b11 >>> 6) & 3) + 48));
                            sb2.append((char) (((b11 >>> 3) & 7) + 48));
                            sb2.append((char) ((b11 & 7) + 48));
                            break;
                        } else {
                            sb2.append((char) b11);
                            break;
                        }
                }
            } else {
                sb2.append("\\\\");
            }
        }
        return sb2.toString();
    }
}
