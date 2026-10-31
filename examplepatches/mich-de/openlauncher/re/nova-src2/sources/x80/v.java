package x80;

import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public String f95616a;

    /* renamed from: d, reason: collision with root package name */
    public String f95619d;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f95621f;

    /* renamed from: g, reason: collision with root package name */
    public ArrayList f95622g;

    /* renamed from: h, reason: collision with root package name */
    public String f95623h;

    /* renamed from: b, reason: collision with root package name */
    public String f95617b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public String f95618c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: e, reason: collision with root package name */
    public int f95620e = -1;

    public v() {
        ArrayList arrayList = new ArrayList();
        this.f95621f = arrayList;
        arrayList.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static boolean d(String str) {
        return str.equals("..") || str.equalsIgnoreCase("%2e.") || str.equalsIgnoreCase(".%2e") || str.equalsIgnoreCase("%2e%2e");
    }

    public final void a(String name, String str) {
        Intrinsics.g(name, "name");
        if (this.f95622g == null) {
            this.f95622g = new ArrayList();
        }
        ArrayList arrayList = this.f95622g;
        Intrinsics.d(arrayList);
        arrayList.add(b.b(name, 0, 0, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, " !\"#$&'(),/:;<=>?@[]\\^`{|}~"));
        ArrayList arrayList2 = this.f95622g;
        Intrinsics.d(arrayList2);
        arrayList2.add(str != null ? b.b(str, 0, 0, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, " !\"#$&'(),/:;<=>?@[]\\^`{|}~") : null);
    }

    public final w b() {
        ArrayList arrayList;
        String str = this.f95616a;
        if (str == null) {
            throw new IllegalStateException("scheme == null");
        }
        String strE = b.e(0, 0, 7, this.f95617b);
        String strE2 = b.e(0, 0, 7, this.f95618c);
        String str2 = this.f95619d;
        if (str2 == null) {
            throw new IllegalStateException("host == null");
        }
        int iC = c();
        ArrayList arrayList2 = this.f95621f;
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
        Iterator it = arrayList2.iterator();
        while (it.hasNext()) {
            arrayList3.add(b.e(0, 0, 7, (String) it.next()));
        }
        ArrayList<String> arrayList4 = this.f95622g;
        if (arrayList4 != null) {
            arrayList = new ArrayList(b70.c.u0(arrayList4, 10));
            for (String str3 : arrayList4) {
                arrayList.add(str3 != null ? b.e(0, 0, 3, str3) : null);
            }
        } else {
            arrayList = null;
        }
        String str4 = this.f95623h;
        return new w(str, strE, strE2, str2, iC, arrayList3, arrayList, str4 != null ? b.e(0, 0, 7, str4) : null, toString());
    }

    public final int c() {
        int i5 = this.f95620e;
        if (i5 != -1) {
            return i5;
        }
        String str = this.f95616a;
        Intrinsics.d(str);
        if (str.equals("http")) {
            return 80;
        }
        return str.equals("https") ? 443 : -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x007d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(w wVar, String input) {
        int i5;
        int iE;
        int i11;
        char cCharAt;
        Intrinsics.g(input, "input");
        byte[] bArr = y80.c.f96853a;
        int iL = y80.c.l(0, input.length(), input);
        int iM = y80.c.m(iL, input.length(), input);
        if (iM - iL < 2) {
            i5 = -1;
        } else {
            char cCharAt2 = input.charAt(iL);
            if ((Intrinsics.h(cCharAt2, 97) >= 0 && Intrinsics.h(cCharAt2, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) <= 0) || (Intrinsics.h(cCharAt2, 65) >= 0 && Intrinsics.h(cCharAt2, 90) <= 0)) {
                i5 = iL + 1;
                while (true) {
                    if (i5 >= iM) {
                        break;
                    }
                    char cCharAt3 = input.charAt(i5);
                    if (('a' > cCharAt3 || cCharAt3 >= '{') && (('A' > cCharAt3 || cCharAt3 >= '[') && (('0' > cCharAt3 || cCharAt3 >= ':') && cCharAt3 != '+' && cCharAt3 != '-' && cCharAt3 != '.'))) {
                        if (cCharAt3 != ':') {
                            break;
                        }
                    } else {
                        i5++;
                    }
                }
                i5 = -1;
            }
        }
        if (i5 == -1) {
            if (wVar == null) {
                throw new IllegalArgumentException(b.c0.k("Expected URL scheme 'http' or 'https' but no scheme was found for ", input.length() > 6 ? r70.l.G1(6, input).concat("...") : input));
            }
            this.f95616a = wVar.f95625a;
        } else if (r70.j.H0(iL, input, "https:", true)) {
            this.f95616a = "https";
            iL += 6;
        } else {
            if (!r70.j.H0(iL, input, "http:", true)) {
                StringBuilder sb2 = new StringBuilder("Expected URL scheme 'http' or 'https' but was '");
                String strSubstring = input.substring(0, i5);
                Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                sb2.append(strSubstring);
                sb2.append('\'');
                throw new IllegalArgumentException(sb2.toString());
            }
            this.f95616a = "http";
            iL += 5;
        }
        int i12 = 0;
        for (int i13 = iL; i13 < iM && ((cCharAt = input.charAt(i13)) == '\\' || cCharAt == '/'); i13++) {
            i12++;
        }
        ArrayList arrayList = this.f95621f;
        char c11 = '#';
        if (i12 >= 2 || wVar == null || !Intrinsics.b(wVar.f95625a, this.f95616a)) {
            int i14 = iL + i12;
            boolean z11 = false;
            boolean z12 = false;
            while (true) {
                iE = y80.c.e(i14, iM, input, "@/\\?#");
                char cCharAt4 = iE != iM ? input.charAt(iE) : (char) 65535;
                if (cCharAt4 == 65535 || cCharAt4 == c11 || cCharAt4 == '/' || cCharAt4 == '\\' || cCharAt4 == '?') {
                    break;
                }
                if (cCharAt4 == '@') {
                    if (z11) {
                        this.f95618c += "%40" + b.b(input, i14, iE, 240, " \"':;<=>@[]^`{}|/\\?#");
                        z11 = z11;
                    } else {
                        boolean z13 = z11;
                        int iF = y80.c.f(input, i14, iE, AbstractJsonLexerKt.COLON);
                        String strB = b.b(input, i14, iF, 240, " \"':;<=>@[]^`{}|/\\?#");
                        if (z12) {
                            strB = b.c0.r(new StringBuilder(), this.f95617b, "%40", strB);
                        }
                        this.f95617b = strB;
                        if (iF != iE) {
                            this.f95618c = b.b(input, iF + 1, iE, 240, " \"':;<=>@[]^`{}|/\\?#");
                            z11 = true;
                        } else {
                            z11 = z13;
                        }
                        z12 = true;
                    }
                    i14 = iE + 1;
                    c11 = '#';
                }
            }
            int i15 = i14;
            while (true) {
                if (i15 >= iE) {
                    i15 = iE;
                    break;
                }
                char cCharAt5 = input.charAt(i15);
                if (cCharAt5 != '[') {
                    if (cCharAt5 == ':') {
                        break;
                    }
                } else {
                    do {
                        i15++;
                        if (i15 >= iE) {
                            break;
                        }
                    } while (input.charAt(i15) != ']');
                }
                i15++;
            }
            int i16 = i15 + 1;
            if (i16 < iE) {
                this.f95619d = y80.a.b(b.e(i14, i15, 4, input));
                try {
                    i11 = Integer.parseInt(b.b(input, i16, iE, 248, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                } catch (NumberFormatException unused) {
                }
                if (1 > i11 || i11 >= 65536) {
                    i11 = -1;
                }
                this.f95620e = i11;
                if (i11 == -1) {
                    StringBuilder sb3 = new StringBuilder("Invalid URL port: \"");
                    String strSubstring2 = input.substring(i16, iE);
                    Intrinsics.f(strSubstring2, "this as java.lang.String…ing(startIndex, endIndex)");
                    sb3.append(strSubstring2);
                    sb3.append(AbstractJsonLexerKt.STRING);
                    throw new IllegalArgumentException(sb3.toString().toString());
                }
            } else {
                this.f95619d = y80.a.b(b.e(i14, i15, 4, input));
                String str = this.f95616a;
                Intrinsics.d(str);
                this.f95620e = str.equals("http") ? 80 : str.equals("https") ? 443 : -1;
            }
            if (this.f95619d == null) {
                StringBuilder sb4 = new StringBuilder("Invalid URL host: \"");
                String strSubstring3 = input.substring(i14, i15);
                Intrinsics.f(strSubstring3, "this as java.lang.String…ing(startIndex, endIndex)");
                sb4.append(strSubstring3);
                sb4.append(AbstractJsonLexerKt.STRING);
                throw new IllegalArgumentException(sb4.toString().toString());
            }
            iL = iE;
        } else {
            this.f95617b = wVar.f();
            this.f95618c = wVar.b();
            this.f95619d = wVar.f95628d;
            this.f95620e = wVar.f95629e;
            arrayList.clear();
            arrayList.addAll(wVar.d());
            if (iL == iM || input.charAt(iL) == '#') {
                String strE = wVar.e();
                this.f95622g = strE != null ? b.f(b.b(strE, 0, 0, 211, " \"'<>#")) : null;
            }
        }
        int iE2 = y80.c.e(iL, iM, input, "?#");
        if (iL != iE2) {
            char cCharAt6 = input.charAt(iL);
            if (cCharAt6 == '/' || cCharAt6 == '\\') {
                arrayList.clear();
                arrayList.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                iL++;
            } else {
                arrayList.set(arrayList.size() - 1, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            while (iL < iE2) {
                int iE3 = y80.c.e(iL, iE2, input, "/\\");
                boolean z14 = iE3 < iE2;
                String strB2 = b.b(input, iL, iE3, 240, " \"<>^`{}|/\\?#");
                if (!strB2.equals(".") && !strB2.equalsIgnoreCase("%2e")) {
                    if (!d(strB2)) {
                        if (((CharSequence) c1.l(arrayList, 1)).length() == 0) {
                            arrayList.set(arrayList.size() - 1, strB2);
                        } else {
                            arrayList.add(strB2);
                        }
                        if (z14) {
                            arrayList.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        }
                    } else if (((String) arrayList.remove(arrayList.size() - 1)).length() != 0 || arrayList.isEmpty()) {
                        arrayList.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    } else {
                        arrayList.set(arrayList.size() - 1, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    }
                }
                iL = z14 ? iE3 + 1 : iE3;
            }
        }
        if (iE2 < iM && input.charAt(iE2) == '?') {
            int iF2 = y80.c.f(input, iE2, iM, '#');
            this.f95622g = b.f(b.b(input, iE2 + 1, iF2, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, " \"'<>#"));
            iE2 = iF2;
        }
        if (iE2 >= iM || input.charAt(iE2) != '#') {
            return;
        }
        this.f95623h = b.b(input, iE2 + 1, iM, 176, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public final void f(String str) {
        this.f95618c = b.b(str, 0, 0, 251, " \"':;<=>@[]^`{}|/\\?#");
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void g(String name, String str) {
        Intrinsics.g(name, "name");
        if (this.f95622g != null) {
            String strB = b.b(name, 0, 0, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, " !\"#$&'(),/:;<=>?@[]\\^`{|}~");
            ArrayList arrayList = this.f95622g;
            Intrinsics.d(arrayList);
            int size = arrayList.size() - 2;
            int iA = ProgressionUtilKt.a(size, 0, -2);
            if (iA <= size) {
                while (true) {
                    ArrayList arrayList2 = this.f95622g;
                    Intrinsics.d(arrayList2);
                    if (strB.equals(arrayList2.get(size))) {
                        ArrayList arrayList3 = this.f95622g;
                        Intrinsics.d(arrayList3);
                        arrayList3.remove(size + 1);
                        ArrayList arrayList4 = this.f95622g;
                        Intrinsics.d(arrayList4);
                        arrayList4.remove(size);
                        ArrayList arrayList5 = this.f95622g;
                        Intrinsics.d(arrayList5);
                        if (!arrayList5.isEmpty()) {
                            if (size == iA) {
                                break;
                            } else {
                                size -= 2;
                            }
                        } else {
                            this.f95622g = null;
                            break;
                        }
                    }
                }
            }
        }
        a(name, str);
    }

    public final void h(String str) {
        this.f95617b = b.b(str, 0, 0, 251, " \"':;<=>@[]^`{}|/\\?#");
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x008b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        String str = this.f95616a;
        if (str != null) {
            sb2.append(str);
            sb2.append("://");
        } else {
            sb2.append("//");
        }
        if (this.f95617b.length() > 0 || this.f95618c.length() > 0) {
            sb2.append(this.f95617b);
            if (this.f95618c.length() > 0) {
                sb2.append(AbstractJsonLexerKt.COLON);
                sb2.append(this.f95618c);
            }
            sb2.append('@');
        }
        String str2 = this.f95619d;
        if (str2 != null) {
            if (r70.k.L0(str2, AbstractJsonLexerKt.COLON)) {
                sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                sb2.append(this.f95619d);
                sb2.append(AbstractJsonLexerKt.END_LIST);
            } else {
                sb2.append(this.f95619d);
            }
        }
        int i5 = -1;
        if (this.f95620e != -1 || this.f95616a != null) {
            int iC = c();
            String str3 = this.f95616a;
            if (str3 == null) {
                sb2.append(AbstractJsonLexerKt.COLON);
                sb2.append(iC);
            } else {
                if (str3.equals("http")) {
                    i5 = 80;
                } else if (str3.equals("https")) {
                    i5 = 443;
                }
                if (iC != i5) {
                }
            }
        }
        ArrayList arrayList = this.f95621f;
        Intrinsics.g(arrayList, "<this>");
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            sb2.append('/');
            sb2.append((String) arrayList.get(i11));
        }
        if (this.f95622g != null) {
            sb2.append('?');
            ArrayList arrayList2 = this.f95622g;
            Intrinsics.d(arrayList2);
            b.g(arrayList2, sb2);
        }
        if (this.f95623h != null) {
            sb2.append('#');
            sb2.append(this.f95623h);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        return string;
    }
}
