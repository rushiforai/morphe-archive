package j$.time.format;

import java.text.ParsePosition;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class l {
    public String a;
    public String b;
    public final char c;
    public l d;
    public l e;

    public l(String str, String str2, l lVar) {
        this.a = str;
        this.b = str2;
        this.d = lVar;
        if (str.isEmpty()) {
            this.c = (char) 65535;
        } else {
            this.c = this.a.charAt(0);
        }
    }

    public final boolean a(String str, String str2) {
        int i = 0;
        while (i < str.length() && i < this.a.length() && b(str.charAt(i), this.a.charAt(i))) {
            i++;
        }
        if (i != this.a.length()) {
            l lVarD = d(this.a.substring(i), this.b, this.d);
            this.a = str.substring(0, i);
            this.d = lVarD;
            if (i >= str.length()) {
                this.b = str2;
                return true;
            }
            this.d.e = d(str.substring(i), str2, null);
            this.b = null;
            return true;
        }
        if (i >= str.length()) {
            this.b = str2;
            return true;
        }
        String strSubstring = str.substring(i);
        for (l lVar = this.d; lVar != null; lVar = lVar.e) {
            if (b(lVar.c, strSubstring.charAt(0))) {
                return lVar.a(strSubstring, str2);
            }
        }
        l lVarD2 = d(strSubstring, str2, null);
        lVarD2.e = this.d;
        this.d = lVarD2;
        return true;
    }

    public boolean b(char c, char c2) {
        return c == c2;
    }

    public final String c(CharSequence charSequence, ParsePosition parsePosition) {
        int index = parsePosition.getIndex();
        int length = charSequence.length();
        if (!e(charSequence, index, length)) {
            return null;
        }
        int length2 = this.a.length() + index;
        l lVar = this.d;
        if (lVar != null && length2 != length) {
            while (true) {
                if (b(lVar.c, charSequence.charAt(length2))) {
                    parsePosition.setIndex(length2);
                    String strC = lVar.c(charSequence, parsePosition);
                    if (strC != null) {
                        return strC;
                    }
                } else {
                    lVar = lVar.e;
                    if (lVar == null) {
                        break;
                    }
                }
            }
        }
        parsePosition.setIndex(length2);
        return this.b;
    }

    public l d(String str, String str2, l lVar) {
        return new l(str, str2, lVar);
    }

    public boolean e(CharSequence charSequence, int i, int i2) {
        boolean z = charSequence instanceof String;
        String str = this.a;
        if (z) {
            return ((String) charSequence).startsWith(str, i);
        }
        int length = str.length();
        if (length > i2 - i) {
            return false;
        }
        int i3 = 0;
        while (true) {
            int i4 = length - 1;
            if (length <= 0) {
                return true;
            }
            int i5 = i3 + 1;
            int i6 = i + 1;
            if (!b(this.a.charAt(i3), charSequence.charAt(i))) {
                return false;
            }
            i = i6;
            length = i4;
            i3 = i5;
        }
    }
}
