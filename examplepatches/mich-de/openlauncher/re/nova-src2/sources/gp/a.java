package gp;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final TimeZone f57750a = TimeZone.getTimeZone("UTC");

    public static boolean a(String str, int i5, char c11) {
        return i5 < str.length() && str.charAt(i5) == c11;
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01fa  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00f7 A[Catch: IllegalArgumentException -> 0x004e, IndexOutOfBoundsException -> 0x0051, TRY_LEAVE, TryCatch #2 {IllegalArgumentException -> 0x004e, IndexOutOfBoundsException -> 0x0051, blocks: (B:3:0x0004, B:5:0x0017, B:6:0x0019, B:8:0x0025, B:9:0x0027, B:11:0x0037, B:13:0x003d, B:21:0x005b, B:23:0x006b, B:24:0x006d, B:26:0x0079, B:27:0x007c, B:29:0x0082, B:33:0x008c, B:38:0x009c, B:40:0x00a4, B:41:0x00a8, B:43:0x00ae, B:48:0x00bb, B:51:0x00c6, B:62:0x00f1, B:64:0x00f7, B:90:0x01a9, B:72:0x0109, B:73:0x0124, B:74:0x0125, B:78:0x0142, B:80:0x014f, B:83:0x0158, B:85:0x0177, B:88:0x0186, B:89:0x01a8, B:77:0x0131, B:92:0x01da, B:93:0x01e1, B:55:0x00d6, B:56:0x00d9, B:50:0x00c2), top: B:104:0x0004 }] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01da A[Catch: IllegalArgumentException -> 0x004e, IndexOutOfBoundsException -> 0x0051, TryCatch #2 {IllegalArgumentException -> 0x004e, IndexOutOfBoundsException -> 0x0051, blocks: (B:3:0x0004, B:5:0x0017, B:6:0x0019, B:8:0x0025, B:9:0x0027, B:11:0x0037, B:13:0x003d, B:21:0x005b, B:23:0x006b, B:24:0x006d, B:26:0x0079, B:27:0x007c, B:29:0x0082, B:33:0x008c, B:38:0x009c, B:40:0x00a4, B:41:0x00a8, B:43:0x00ae, B:48:0x00bb, B:51:0x00c6, B:62:0x00f1, B:64:0x00f7, B:90:0x01a9, B:72:0x0109, B:73:0x0124, B:74:0x0125, B:78:0x0142, B:80:0x014f, B:83:0x0158, B:85:0x0177, B:88:0x0186, B:89:0x01a8, B:77:0x0131, B:92:0x01da, B:93:0x01e1, B:55:0x00d6, B:56:0x00d9, B:50:0x00c2), top: B:104:0x0004 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01e4  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01e6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Date b(String str, ParsePosition parsePosition) throws ParseException {
        String message;
        int i5;
        int i11;
        int iC;
        int iC2;
        int length;
        char cCharAt;
        int length2;
        try {
            int index = parsePosition.getIndex();
            int i12 = index + 4;
            int iC3 = c(index, i12, str);
            if (a(str, i12, '-')) {
                i12 = index + 5;
            }
            int i13 = i12 + 2;
            int iC4 = c(i12, i13, str);
            if (a(str, i13, '-')) {
                i13 = i12 + 3;
            }
            int i14 = i13 + 2;
            int iC5 = c(i13, i14, str);
            boolean zA = a(str, i14, 'T');
            if (!zA && str.length() <= i14) {
                GregorianCalendar gregorianCalendar = new GregorianCalendar(iC3, iC4 - 1, iC5);
                gregorianCalendar.setLenient(false);
                parsePosition.setIndex(i14);
                return gregorianCalendar.getTime();
            }
            if (zA) {
                int i15 = i13 + 5;
                int iC6 = c(i13 + 3, i15, str);
                if (a(str, i15, AbstractJsonLexerKt.COLON)) {
                    i15 = i13 + 6;
                }
                int i16 = i15 + 2;
                int iC7 = c(i15, i16, str);
                if (a(str, i16, AbstractJsonLexerKt.COLON)) {
                    i16 = i15 + 3;
                }
                if (str.length() > i16 && (cCharAt = str.charAt(i16)) != 'Z' && cCharAt != '+' && cCharAt != '-') {
                    int i17 = i16 + 2;
                    iC2 = c(i16, i17, str);
                    if (iC2 > 59 && iC2 < 63) {
                        iC2 = 59;
                    }
                    if (a(str, i17, '.')) {
                        int i18 = i16 + 3;
                        for (int i19 = i16 + 4; i19 < str.length(); i19++) {
                            char cCharAt2 = str.charAt(i19);
                            if (cCharAt2 >= '0' && cCharAt2 <= '9') {
                            }
                            length2 = i19;
                        }
                        length2 = str.length();
                        int iMin = Math.min(length2, i16 + 6);
                        iC = c(i18, iMin, str);
                        int i21 = iMin - i18;
                        if (i21 == 1) {
                            iC *= 100;
                        } else if (i21 == 2) {
                            iC *= 10;
                        }
                        i5 = iC6;
                        i14 = length2;
                        i11 = iC7;
                    } else {
                        i5 = iC6;
                        i14 = i17;
                        i11 = iC7;
                        iC = 0;
                    }
                    if (str.length() > i14) {
                        throw new IllegalArgumentException("No time zone indicator");
                    }
                    char cCharAt3 = str.charAt(i14);
                    TimeZone timeZone = f57750a;
                    if (cCharAt3 == 'Z') {
                        length = i14 + 1;
                    } else {
                        if (cCharAt3 != '+' && cCharAt3 != '-') {
                            throw new IndexOutOfBoundsException("Invalid time zone indicator '" + cCharAt3 + "'");
                        }
                        String strSubstring = str.substring(i14);
                        if (strSubstring.length() < 5) {
                            strSubstring = strSubstring + "00";
                        }
                        length = i14 + strSubstring.length();
                        if (!strSubstring.equals("+0000") && !strSubstring.equals("+00:00")) {
                            String str2 = "GMT" + strSubstring;
                            timeZone = TimeZone.getTimeZone(str2);
                            String id2 = timeZone.getID();
                            if (!id2.equals(str2) && !id2.replace(":", b.f42142b).equals(str2)) {
                                throw new IndexOutOfBoundsException("Mismatching time zone indicator: " + str2 + " given, resolves to " + timeZone.getID());
                            }
                        }
                    }
                    GregorianCalendar gregorianCalendar2 = new GregorianCalendar(timeZone);
                    gregorianCalendar2.setLenient(false);
                    gregorianCalendar2.set(1, iC3);
                    gregorianCalendar2.set(2, iC4 - 1);
                    gregorianCalendar2.set(5, iC5);
                    gregorianCalendar2.set(11, i5);
                    gregorianCalendar2.set(12, i11);
                    gregorianCalendar2.set(13, iC2);
                    gregorianCalendar2.set(14, iC);
                    parsePosition.setIndex(length);
                    return gregorianCalendar2.getTime();
                }
                i14 = i16;
                i5 = iC6;
                i11 = iC7;
            } else {
                i5 = 0;
                i11 = 0;
            }
            iC = 0;
            iC2 = 0;
            if (str.length() > i14) {
            }
        } catch (IllegalArgumentException e3) {
            e = e3;
            String strM = str != null ? null : c1.m(AbstractJsonLexerKt.STRING, "\"", str);
            message = e.getMessage();
            if (message != null || message.isEmpty()) {
                message = "(" + e.getClass().getName() + ")";
            }
            ParseException parseException = new ParseException(c0.m("Failed to parse date [", strM, "]: ", message), parsePosition.getIndex());
            parseException.initCause(e);
            throw parseException;
        } catch (IndexOutOfBoundsException e11) {
            e = e11;
            if (str != null) {
            }
            message = e.getMessage();
            if (message != null) {
                message = "(" + e.getClass().getName() + ")";
            }
            ParseException parseException2 = new ParseException(c0.m("Failed to parse date [", strM, "]: ", message), parsePosition.getIndex());
            parseException2.initCause(e);
            throw parseException2;
        }
    }

    public static int c(int i5, int i11, String str) {
        int i12;
        int i13;
        if (i5 < 0 || i11 > str.length() || i5 > i11) {
            throw new NumberFormatException(str);
        }
        if (i5 < i11) {
            i13 = i5 + 1;
            int iDigit = Character.digit(str.charAt(i5), 10);
            if (iDigit < 0) {
                throw new NumberFormatException("Invalid number: " + str.substring(i5, i11));
            }
            i12 = -iDigit;
        } else {
            i12 = 0;
            i13 = i5;
        }
        while (i13 < i11) {
            int i14 = i13 + 1;
            int iDigit2 = Character.digit(str.charAt(i13), 10);
            if (iDigit2 < 0) {
                throw new NumberFormatException("Invalid number: " + str.substring(i5, i11));
            }
            i12 = (i12 * 10) - iDigit2;
            i13 = i14;
        }
        return -i12;
    }
}
