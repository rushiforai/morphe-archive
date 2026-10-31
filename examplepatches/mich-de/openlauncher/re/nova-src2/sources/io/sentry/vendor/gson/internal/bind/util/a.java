package io.sentry.vendor.gson.internal.bind.util;

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
    public static final TimeZone f67869a = TimeZone.getTimeZone("UTC");

    public static boolean a(String str, int i5, char c11) {
        return i5 < str.length() && str.charAt(i5) == c11;
    }

    public static void b(StringBuilder sb2, int i5, int i11) {
        String string = Integer.toString(i5);
        for (int length = i11 - string.length(); length > 0; length--) {
            sb2.append('0');
        }
        sb2.append(string);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00ff A[Catch: IllegalArgumentException -> 0x00bf, NumberFormatException -> 0x00c2, IndexOutOfBoundsException -> 0x00c5, TRY_LEAVE, TryCatch #2 {IndexOutOfBoundsException -> 0x00c5, NumberFormatException -> 0x00c2, IllegalArgumentException -> 0x00bf, blocks: (B:3:0x000c, B:5:0x001f, B:6:0x0021, B:8:0x002d, B:9:0x002f, B:11:0x003e, B:13:0x0044, B:17:0x0058, B:19:0x0068, B:20:0x006a, B:22:0x0076, B:23:0x0079, B:25:0x007f, B:29:0x0089, B:34:0x0099, B:36:0x00a1, B:37:0x00a5, B:39:0x00ab, B:44:0x00b8, B:53:0x00cc, B:65:0x00f9, B:67:0x00ff, B:94:0x0196, B:76:0x011a, B:77:0x0130, B:78:0x0131, B:82:0x0141, B:84:0x014e, B:87:0x0157, B:89:0x0169, B:92:0x0178, B:93:0x0195, B:81:0x013d, B:96:0x01c9, B:97:0x01d0, B:58:0x00de, B:59:0x00e1, B:52:0x00c8), top: B:108:0x000c }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01c9 A[Catch: IllegalArgumentException -> 0x00bf, NumberFormatException -> 0x00c2, IndexOutOfBoundsException -> 0x00c5, TryCatch #2 {IndexOutOfBoundsException -> 0x00c5, NumberFormatException -> 0x00c2, IllegalArgumentException -> 0x00bf, blocks: (B:3:0x000c, B:5:0x001f, B:6:0x0021, B:8:0x002d, B:9:0x002f, B:11:0x003e, B:13:0x0044, B:17:0x0058, B:19:0x0068, B:20:0x006a, B:22:0x0076, B:23:0x0079, B:25:0x007f, B:29:0x0089, B:34:0x0099, B:36:0x00a1, B:37:0x00a5, B:39:0x00ab, B:44:0x00b8, B:53:0x00cc, B:65:0x00f9, B:67:0x00ff, B:94:0x0196, B:76:0x011a, B:77:0x0130, B:78:0x0131, B:82:0x0141, B:84:0x014e, B:87:0x0157, B:89:0x0169, B:92:0x0178, B:93:0x0195, B:81:0x013d, B:96:0x01c9, B:97:0x01d0, B:58:0x00de, B:59:0x00e1, B:52:0x00c8), top: B:108:0x000c }] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Date c(String str, ParsePosition parsePosition) throws ParseException {
        String message;
        int i5;
        int i11;
        int iD;
        int iD2;
        int length;
        char cCharAt;
        int length2;
        try {
            int index = parsePosition.getIndex();
            int i12 = index + 4;
            int iD3 = d(index, i12, str);
            if (a(str, i12, '-')) {
                i12 = index + 5;
            }
            int i13 = i12 + 2;
            int iD4 = d(i12, i13, str);
            if (a(str, i13, '-')) {
                i13 = i12 + 3;
            }
            int i14 = i13 + 2;
            int iD5 = d(i13, i14, str);
            boolean zA = a(str, i14, 'T');
            if (!zA && str.length() <= i14) {
                GregorianCalendar gregorianCalendar = new GregorianCalendar(iD3, iD4 - 1, iD5);
                parsePosition.setIndex(i14);
                return gregorianCalendar.getTime();
            }
            if (zA) {
                int i15 = i13 + 5;
                int iD6 = d(i13 + 3, i15, str);
                if (a(str, i15, AbstractJsonLexerKt.COLON)) {
                    i15 = i13 + 6;
                }
                int i16 = i15 + 2;
                int iD7 = d(i15, i16, str);
                if (a(str, i16, AbstractJsonLexerKt.COLON)) {
                    i16 = i15 + 3;
                }
                if (str.length() > i16 && (cCharAt = str.charAt(i16)) != 'Z' && cCharAt != '+' && cCharAt != '-') {
                    int i17 = i16 + 2;
                    iD2 = d(i16, i17, str);
                    if (iD2 > 59 && iD2 < 63) {
                        iD2 = 59;
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
                        iD = d(i18, iMin, str);
                        int i21 = iMin - i18;
                        if (i21 == 1) {
                            iD *= 100;
                        } else if (i21 == 2) {
                            iD *= 10;
                        }
                        i5 = iD6;
                        i14 = length2;
                        i11 = iD7;
                    } else {
                        i5 = iD6;
                        i14 = i17;
                        i11 = iD7;
                        iD = 0;
                    }
                    if (str.length() > i14) {
                        throw new IllegalArgumentException("No time zone indicator");
                    }
                    char cCharAt3 = str.charAt(i14);
                    TimeZone timeZone = f67869a;
                    if (cCharAt3 == 'Z') {
                        length = i14 + 1;
                    } else {
                        if (cCharAt3 != '+' && cCharAt3 != '-') {
                            throw new IndexOutOfBoundsException("Invalid time zone indicator '" + cCharAt3 + "'");
                        }
                        String strSubstring = str.substring(i14);
                        if (strSubstring.length() < 5) {
                            strSubstring = strSubstring.concat("00");
                        }
                        length = i14 + strSubstring.length();
                        if (!"+0000".equals(strSubstring) && !"+00:00".equals(strSubstring)) {
                            String strConcat = "GMT".concat(strSubstring);
                            timeZone = TimeZone.getTimeZone(strConcat);
                            String id2 = timeZone.getID();
                            if (!id2.equals(strConcat) && !id2.replace(":", b.f42142b).equals(strConcat)) {
                                throw new IndexOutOfBoundsException("Mismatching time zone indicator: " + strConcat + " given, resolves to " + timeZone.getID());
                            }
                        }
                    }
                    GregorianCalendar gregorianCalendar2 = new GregorianCalendar(timeZone);
                    gregorianCalendar2.setLenient(false);
                    gregorianCalendar2.set(1, iD3);
                    gregorianCalendar2.set(2, iD4 - 1);
                    gregorianCalendar2.set(5, iD5);
                    gregorianCalendar2.set(11, i5);
                    gregorianCalendar2.set(12, i11);
                    gregorianCalendar2.set(13, iD2);
                    gregorianCalendar2.set(14, iD);
                    parsePosition.setIndex(length);
                    return gregorianCalendar2.getTime();
                }
                i14 = i16;
                i5 = iD6;
                i11 = iD7;
            } else {
                i5 = 0;
                i11 = 0;
            }
            iD = 0;
            iD2 = 0;
            if (str.length() > i14) {
            }
        } catch (IndexOutOfBoundsException e3) {
            e = e3;
            String strM = str == null ? null : c1.m(AbstractJsonLexerKt.STRING, "\"", str);
            message = e.getMessage();
            if (message == null || message.isEmpty()) {
                message = "(" + e.getClass().getName() + ")";
            }
            ParseException parseException = new ParseException(c0.m("Failed to parse date [", strM, "]: ", message), parsePosition.getIndex());
            parseException.initCause(e);
            throw parseException;
        } catch (NumberFormatException e11) {
            e = e11;
            if (str == null) {
            }
            message = e.getMessage();
            if (message == null) {
                message = "(" + e.getClass().getName() + ")";
            }
            ParseException parseException2 = new ParseException(c0.m("Failed to parse date [", strM, "]: ", message), parsePosition.getIndex());
            parseException2.initCause(e);
            throw parseException2;
        } catch (IllegalArgumentException e12) {
            e = e12;
            if (str == null) {
            }
            message = e.getMessage();
            if (message == null) {
            }
            ParseException parseException22 = new ParseException(c0.m("Failed to parse date [", strM, "]: ", message), parsePosition.getIndex());
            parseException22.initCause(e);
            throw parseException22;
        }
    }

    public static int d(int i5, int i11, String str) {
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
