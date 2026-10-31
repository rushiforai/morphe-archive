package com.bytedance.sdk.component.zb.ycx;

import a2.c;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class ul {

    /* renamed from: dj, reason: collision with root package name */
    private static final char[] f24194dj = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    private final List<String> fby;

    /* renamed from: jc, reason: collision with root package name */
    private final String f24195jc;

    /* renamed from: jw, reason: collision with root package name */
    private final String f24196jw;

    /* renamed from: lt, reason: collision with root package name */
    private final String f24197lt;
    private final String lud;
    final int sya;

    /* renamed from: ul, reason: collision with root package name */
    private final List<String> f24198ul;
    final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    final String f24199zb;

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        String f24200dj;
        String fby;

        /* renamed from: lt, reason: collision with root package name */
        final List<String> f24201lt;

        /* renamed from: ul, reason: collision with root package name */
        List<String> f24202ul;
        String ycx;

        /* renamed from: zb, reason: collision with root package name */
        String f24203zb = b.f42142b;
        String sya = b.f42142b;
        int lud = -1;

        /* renamed from: com.bytedance.sdk.component.zb.ycx.ul$ycx$ycx, reason: collision with other inner class name */
        public enum EnumC0045ycx {
            SUCCESS,
            MISSING_SCHEME,
            UNSUPPORTED_SCHEME,
            INVALID_PORT,
            INVALID_HOST
        }

        public ycx() {
            ArrayList arrayList = new ArrayList();
            this.f24201lt = arrayList;
            arrayList.add(b.f42142b);
        }

        private boolean lt(String str) {
            return str.equals("..") || str.equalsIgnoreCase("%2e.") || str.equalsIgnoreCase(".%2e") || str.equalsIgnoreCase("%2e%2e");
        }

        private boolean lud(String str) {
            return str.equals(".") || str.equalsIgnoreCase("%2e");
        }

        public ycx dj(String str) {
            this.f24202ul = str != null ? ul.zb(ul.ycx(str, " \"'<>#", true, false, true, true)) : null;
            return this;
        }

        public ycx sya(String str) {
            if (str != null) {
                return ycx(str, true);
            }
            throw new NullPointerException("encodedPathSegments == null");
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.ycx);
            sb2.append("://");
            if (!this.f24203zb.isEmpty() || !this.sya.isEmpty()) {
                sb2.append(this.f24203zb);
                if (!this.sya.isEmpty()) {
                    sb2.append(AbstractJsonLexerKt.COLON);
                    sb2.append(this.sya);
                }
                sb2.append('@');
            }
            if (this.f24200dj.indexOf(58) != -1) {
                sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                sb2.append(this.f24200dj);
                sb2.append(AbstractJsonLexerKt.END_LIST);
            } else {
                sb2.append(this.f24200dj);
            }
            int iYcx = ycx();
            if (iYcx != ul.ycx(this.ycx)) {
                sb2.append(AbstractJsonLexerKt.COLON);
                sb2.append(iYcx);
            }
            ul.ycx(sb2, this.f24201lt);
            if (this.f24202ul != null) {
                sb2.append('?');
                ul.zb(sb2, this.f24202ul);
            }
            if (this.fby != null) {
                sb2.append('#');
                sb2.append(this.fby);
            }
            return sb2.toString();
        }

        public ycx ycx(String str) {
            if (str == null) {
                throw new NullPointerException("scheme == null");
            }
            if (str.equalsIgnoreCase("http")) {
                this.ycx = "http";
                return this;
            }
            if (!str.equalsIgnoreCase("https")) {
                throw new IllegalArgumentException("unexpected scheme: ".concat(str));
            }
            this.ycx = "https";
            return this;
        }

        public ycx zb(String str) {
            if (str == null) {
                throw new NullPointerException("host == null");
            }
            String strLud = lud(str, 0, str.length());
            if (strLud == null) {
                throw new IllegalArgumentException("unexpected host: ".concat(str));
            }
            this.f24200dj = strLud;
            return this;
        }

        private static String lud(String str, int i5, int i11) {
            return com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(ul.ycx(str, i5, i11, false));
        }

        private static int dj(String str, int i5, int i11) {
            while (i5 < i11) {
                char cCharAt = str.charAt(i5);
                if (cCharAt == ':') {
                    return i5;
                }
                if (cCharAt == '[') {
                    do {
                        i5++;
                        if (i5 < i11) {
                        }
                    } while (str.charAt(i5) != ']');
                }
                i5++;
            }
            return i11;
        }

        private void sya() {
            if (this.f24201lt.remove(r0.size() - 1).isEmpty() && !this.f24201lt.isEmpty()) {
                this.f24201lt.set(r0.size() - 1, b.f42142b);
            } else {
                this.f24201lt.add(b.f42142b);
            }
        }

        private static int lt(String str, int i5, int i11) throws NumberFormatException {
            try {
                int i12 = Integer.parseInt(ul.ycx(str, i5, i11, b.f42142b, false, false, false, true, null));
                if (i12 <= 0 || i12 > 65535) {
                    return -1;
                }
                return i12;
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X4=", "c/o5hTauZYOiX95RiBSy", "S+8/hgaMZtWU", 671);
                return -1;
            }
        }

        public ul zb() {
            if (this.ycx != null) {
                if (this.f24200dj != null) {
                    return new ul(this);
                }
                throw new IllegalStateException("host == null");
            }
            throw new IllegalStateException("scheme == null");
        }

        private static int sya(String str, int i5, int i11) {
            int i12 = 0;
            while (i5 < i11) {
                char cCharAt = str.charAt(i5);
                if (cCharAt != '\\' && cCharAt != '/') {
                    break;
                }
                i12++;
                i5++;
            }
            return i12;
        }

        public int ycx() {
            int i5 = this.lud;
            return i5 != -1 ? i5 : ul.ycx(this.ycx);
        }

        private ycx ycx(String str, boolean z11) {
            boolean z12;
            ycx ycxVar;
            String str2;
            boolean z13;
            int i5 = 0;
            while (true) {
                int iYcx = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str, i5, str.length(), "/\\");
                if (iYcx < str.length()) {
                    z12 = true;
                    str2 = str;
                    z13 = z11;
                    ycxVar = this;
                } else {
                    z12 = false;
                    ycxVar = this;
                    str2 = str;
                    z13 = z11;
                }
                ycxVar.ycx(str2, i5, iYcx, z12, z13);
                i5 = iYcx + 1;
                if (i5 > str2.length()) {
                    return ycxVar;
                }
                str = str2;
                z11 = z13;
            }
        }

        private static int zb(String str, int i5, int i11) {
            if (i11 - i5 < 2) {
                return -1;
            }
            char cCharAt = str.charAt(i5);
            if ((cCharAt >= 'a' && cCharAt <= 'z') || (cCharAt >= 'A' && cCharAt <= 'Z')) {
                while (true) {
                    i5++;
                    if (i5 >= i11) {
                        break;
                    }
                    char cCharAt2 = str.charAt(i5);
                    if (cCharAt2 < 'a' || cCharAt2 > 'z') {
                        if (cCharAt2 < 'A' || cCharAt2 > 'Z') {
                            if (cCharAt2 < '0' || cCharAt2 > '9') {
                                if (cCharAt2 != '+' && cCharAt2 != '-' && cCharAt2 != '.') {
                                    if (cCharAt2 == ':') {
                                        return i5;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return -1;
        }

        public ycx ycx(String str, String str2) {
            if (str != null) {
                if (this.f24202ul == null) {
                    this.f24202ul = new ArrayList();
                }
                this.f24202ul.add(ul.ycx(str, " \"'<>#&=", true, false, true, true));
                this.f24202ul.add(str2 != null ? ul.ycx(str2, " \"'<>#&=", true, false, true, true) : null);
                return this;
            }
            throw new NullPointerException("encodedName == null");
        }

        public EnumC0045ycx ycx(ul ulVar, String str) throws NumberFormatException {
            int iYcx;
            String str2;
            int i5;
            String str3;
            String str4 = str;
            int iYcx2 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str4, 0, str4.length());
            int iZb = com.bytedance.sdk.component.zb.ycx.zb.jw.zb(str4, iYcx2, str4.length());
            if (zb(str4, iYcx2, iZb) != -1) {
                if (str4.regionMatches(true, iYcx2, "https:", 0, 6)) {
                    this.ycx = "https";
                    iYcx2 += 6;
                    str4 = str;
                } else {
                    str4 = str;
                    if (str4.regionMatches(true, iYcx2, "http:", 0, 5)) {
                        this.ycx = "http";
                        iYcx2 += 5;
                    } else {
                        return EnumC0045ycx.UNSUPPORTED_SCHEME;
                    }
                }
            } else if (ulVar != null) {
                this.ycx = ulVar.ycx;
            } else {
                return EnumC0045ycx.MISSING_SCHEME;
            }
            int iSya = sya(str4, iYcx2, iZb);
            char c11 = '#';
            if (iSya < 2 && ulVar != null && ulVar.ycx.equals(this.ycx)) {
                this.f24203zb = ulVar.zb();
                this.sya = ulVar.sya();
                this.f24200dj = ulVar.f24199zb;
                this.lud = ulVar.sya;
                this.f24201lt.clear();
                this.f24201lt.addAll(ulVar.dj());
                if (iYcx2 == iZb || str4.charAt(iYcx2) == '#') {
                    dj(ulVar.lud());
                }
                str2 = str4;
            } else {
                int i11 = iYcx2 + iSya;
                boolean z11 = false;
                boolean z12 = false;
                while (true) {
                    iYcx = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str4, i11, iZb, "@/\\?#");
                    char cCharAt = iYcx != iZb ? str4.charAt(iYcx) : (char) 65535;
                    if (cCharAt == 65535 || cCharAt == c11 || cCharAt == '/' || cCharAt == '\\' || cCharAt == '?') {
                        break;
                    }
                    if (cCharAt == '@') {
                        if (!z11) {
                            int iYcx3 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str4, i11, iYcx, AbstractJsonLexerKt.COLON);
                            String strYcx = ul.ycx(str, i11, iYcx3, " \"':;<=>@[]^`{}|/\\?#", true, false, false, true, null);
                            if (z12) {
                                strYcx = c0.r(new StringBuilder(), this.f24203zb, "%40", strYcx);
                            }
                            this.f24203zb = strYcx;
                            if (iYcx3 != iYcx) {
                                i5 = iYcx;
                                this.sya = ul.ycx(str, iYcx3 + 1, i5, " \"':;<=>@[]^`{}|/\\?#", true, false, false, true, null);
                                z11 = true;
                            } else {
                                i5 = iYcx;
                            }
                            str3 = str;
                            z12 = true;
                        } else {
                            i5 = iYcx;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(this.sya);
                            sb2.append("%40");
                            str3 = str;
                            sb2.append(ul.ycx(str3, i11, i5, " \"':;<=>@[]^`{}|/\\?#", true, false, false, true, null));
                            this.sya = sb2.toString();
                        }
                        i11 = i5 + 1;
                        str4 = str3;
                        c11 = '#';
                    }
                }
                str2 = str4;
                int i12 = i11;
                int iDj = dj(str2, i12, iYcx);
                int i13 = iDj + 1;
                if (i13 < iYcx) {
                    this.f24200dj = lud(str2, i12, iDj);
                    int iLt = lt(str2, i13, iYcx);
                    this.lud = iLt;
                    if (iLt == -1) {
                        return EnumC0045ycx.INVALID_PORT;
                    }
                } else {
                    this.f24200dj = lud(str2, i12, iDj);
                    this.lud = ul.ycx(this.ycx);
                }
                if (this.f24200dj == null) {
                    return EnumC0045ycx.INVALID_HOST;
                }
                iYcx2 = iYcx;
            }
            int iYcx4 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str2, iYcx2, iZb, "?#");
            ycx(str2, iYcx2, iYcx4);
            if (iYcx4 < iZb && str2.charAt(iYcx4) == '?') {
                int iYcx5 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str2, iYcx4, iZb, '#');
                this.f24202ul = ul.zb(ul.ycx(str2, iYcx4 + 1, iYcx5, " \"'<>#", true, false, true, true, null));
                iYcx4 = iYcx5;
            }
            if (iYcx4 < iZb && str2.charAt(iYcx4) == '#') {
                this.fby = ul.ycx(str2, iYcx4 + 1, iZb, b.f42142b, true, false, false, false, null);
            }
            return EnumC0045ycx.SUCCESS;
        }

        private void ycx(String str, int i5, int i11) {
            if (i5 == i11) {
                return;
            }
            char cCharAt = str.charAt(i5);
            if (cCharAt != '/' && cCharAt != '\\') {
                List<String> list = this.f24201lt;
                list.set(list.size() - 1, b.f42142b);
            } else {
                this.f24201lt.clear();
                this.f24201lt.add(b.f42142b);
                i5++;
            }
            int i12 = i5;
            while (i12 < i11) {
                int iYcx = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str, i12, i11, "/\\");
                boolean z11 = iYcx < i11;
                String str2 = str;
                ycx(str2, i12, iYcx, z11, true);
                if (z11) {
                    iYcx++;
                }
                i12 = iYcx;
                str = str2;
            }
        }

        private void ycx(String str, int i5, int i11, boolean z11, boolean z12) {
            String strYcx = ul.ycx(str, i5, i11, " \"<>^`{}|/\\?#", z12, false, false, true, null);
            if (lud(strYcx)) {
                return;
            }
            if (lt(strYcx)) {
                sya();
                return;
            }
            if (((String) c.e(1, this.f24201lt)).isEmpty()) {
                List<String> list = this.f24201lt;
                list.set(list.size() - 1, strYcx);
            } else {
                this.f24201lt.add(strYcx);
            }
            if (z11) {
                this.f24201lt.add(b.f42142b);
            }
        }
    }

    public ul(ycx ycxVar) {
        this.ycx = ycxVar.ycx;
        this.lud = ycx(ycxVar.f24203zb, false);
        this.f24197lt = ycx(ycxVar.sya, false);
        this.f24199zb = ycxVar.f24200dj;
        this.sya = ycxVar.ycx();
        this.f24198ul = ycx(ycxVar.f24201lt, false);
        List<String> list = ycxVar.f24202ul;
        this.fby = list != null ? ycx(list, true) : null;
        String str = ycxVar.fby;
        this.f24196jw = str != null ? ycx(str, false) : null;
        this.f24195jc = ycxVar.toString();
    }

    public List<String> dj() {
        int iIndexOf = this.f24195jc.indexOf(47, this.ycx.length() + 3);
        String str = this.f24195jc;
        int iYcx = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str, iIndexOf, str.length(), "?#");
        ArrayList arrayList = new ArrayList();
        while (iIndexOf < iYcx) {
            int i5 = iIndexOf + 1;
            int iYcx2 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(this.f24195jc, i5, iYcx, '/');
            arrayList.add(this.f24195jc.substring(i5, iYcx2));
            iIndexOf = iYcx2;
        }
        return arrayList;
    }

    public boolean equals(Object obj) {
        return (obj instanceof ul) && ((ul) obj).f24195jc.equals(this.f24195jc);
    }

    public int hashCode() {
        return this.f24195jc.hashCode();
    }

    public String lud() {
        if (this.fby == null) {
            return null;
        }
        int iIndexOf = this.f24195jc.indexOf(63) + 1;
        String str = this.f24195jc;
        return this.f24195jc.substring(iIndexOf, com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str, iIndexOf, str.length(), '#'));
    }

    public String sya() {
        if (this.f24197lt.isEmpty()) {
            return b.f42142b;
        }
        return this.f24195jc.substring(this.f24195jc.indexOf(58, this.ycx.length() + 3) + 1, this.f24195jc.indexOf(64));
    }

    public String toString() {
        return this.f24195jc;
    }

    public URL ycx() {
        try {
            return new URL(this.f24195jc);
        } catch (MalformedURLException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X4=", "c/o5hTauZQ==", "Tvwh", 56);
            throw new RuntimeException(e3);
        }
    }

    public String zb() {
        if (this.lud.isEmpty()) {
            return b.f42142b;
        }
        int length = this.ycx.length() + 3;
        String str = this.f24195jc;
        return this.f24195jc.substring(length, com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str, length, str.length(), ":@"));
    }

    public static int ycx(String str) {
        if (str.equals("http")) {
            return 80;
        }
        return str.equals("https") ? 443 : -1;
    }

    public static ul sya(String str) {
        ycx ycxVar = new ycx();
        if (ycxVar.ycx((ul) null, str) == ycx.EnumC0045ycx.SUCCESS) {
            return ycxVar.zb();
        }
        return null;
    }

    public static void zb(StringBuilder sb2, List<String> list) {
        int size = list.size();
        for (int i5 = 0; i5 < size; i5 += 2) {
            String str = list.get(i5);
            String str2 = list.get(i5 + 1);
            if (i5 > 0) {
                sb2.append('&');
            }
            sb2.append(str);
            if (str2 != null) {
                sb2.append('=');
                sb2.append(str2);
            }
        }
    }

    public static void ycx(StringBuilder sb2, List<String> list) {
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            sb2.append('/');
            sb2.append(list.get(i5));
        }
    }

    public static String ycx(String str, boolean z11) {
        return ycx(str, 0, str.length(), z11);
    }

    private List<String> ycx(List<String> list, boolean z11) {
        int size = list.size();
        ArrayList arrayList = new ArrayList(size);
        for (int i5 = 0; i5 < size; i5++) {
            String str = list.get(i5);
            arrayList.add(str != null ? ycx(str, z11) : null);
        }
        return Collections.unmodifiableList(arrayList);
    }

    public static List<String> zb(String str) {
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        while (i5 <= str.length()) {
            int iIndexOf = str.indexOf(38, i5);
            if (iIndexOf == -1) {
                iIndexOf = str.length();
            }
            int iIndexOf2 = str.indexOf(61, i5);
            if (iIndexOf2 != -1 && iIndexOf2 <= iIndexOf) {
                arrayList.add(str.substring(i5, iIndexOf2));
                arrayList.add(str.substring(iIndexOf2 + 1, iIndexOf));
            } else {
                arrayList.add(str.substring(i5, iIndexOf));
                arrayList.add(null);
            }
            i5 = iIndexOf + 1;
        }
        return arrayList;
    }

    public static String ycx(String str, int i5, int i11, boolean z11) {
        for (int i12 = i5; i12 < i11; i12++) {
            char cCharAt = str.charAt(i12);
            if (cCharAt == '%' || (cCharAt == '+' && z11)) {
                com.bytedance.sdk.component.zb.ycx.zb.ycx ycxVar = new com.bytedance.sdk.component.zb.ycx.zb.ycx();
                ycxVar.ycx(str, i5, i12);
                ycx(ycxVar, str, i12, i11, z11);
                return ycxVar.sya();
            }
        }
        return str.substring(i5, i11);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0039  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(com.bytedance.sdk.component.zb.ycx.zb.ycx ycxVar, String str, int i5, int i11, boolean z11) {
        int i12;
        while (i5 < i11) {
            int iCodePointAt = str.codePointAt(i5);
            if (iCodePointAt == 37 && (i12 = i5 + 2) < i11) {
                int iYcx = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str.charAt(i5 + 1));
                int iYcx2 = com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str.charAt(i12));
                if (iYcx != -1 && iYcx2 != -1) {
                    ycxVar.zb((iYcx << 4) + iYcx2);
                    i5 = i12;
                }
            } else if (iCodePointAt == 43 && z11) {
                ycxVar.zb(32);
            } else {
                ycxVar.ycx(iCodePointAt);
            }
            i5 += Character.charCount(iCodePointAt);
        }
    }

    public static boolean ycx(String str, int i5, int i11) {
        int i12 = i5 + 2;
        return i12 < i11 && str.charAt(i5) == '%' && com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str.charAt(i5 + 1)) != -1 && com.bytedance.sdk.component.zb.ycx.zb.jw.ycx(str.charAt(i12)) != -1;
    }

    public static String ycx(String str, int i5, int i11, String str2, boolean z11, boolean z12, boolean z13, boolean z14, Charset charset) {
        int iCharCount = i5;
        while (iCharCount < i11) {
            int iCodePointAt = str.codePointAt(iCharCount);
            if (iCodePointAt >= 32 && iCodePointAt != 127 && ((iCodePointAt < 128 || !z14) && str2.indexOf(iCodePointAt) == -1 && ((iCodePointAt != 37 || (z11 && (!z12 || ycx(str, iCharCount, i11)))) && (iCodePointAt != 43 || !z13)))) {
                iCharCount += Character.charCount(iCodePointAt);
            } else {
                com.bytedance.sdk.component.zb.ycx.zb.ycx ycxVar = new com.bytedance.sdk.component.zb.ycx.zb.ycx();
                ycxVar.ycx(str, i5, iCharCount);
                ycx(ycxVar, str, iCharCount, i11, str2, z11, z12, z13, z14, charset);
                return ycxVar.sya();
            }
        }
        return str.substring(i5, i11);
    }

    public static void ycx(com.bytedance.sdk.component.zb.ycx.zb.ycx ycxVar, String str, int i5, int i11, String str2, boolean z11, boolean z12, boolean z13, boolean z14, Charset charset) {
        com.bytedance.sdk.component.zb.ycx.zb.ycx ycxVar2 = null;
        while (i5 < i11) {
            int iCodePointAt = str.codePointAt(i5);
            if (!z11 || (iCodePointAt != 9 && iCodePointAt != 10 && iCodePointAt != 12 && iCodePointAt != 13)) {
                if (iCodePointAt == 43 && z13) {
                    ycxVar.ycx(z11 ? "+" : "%2B");
                } else if (iCodePointAt >= 32 && iCodePointAt != 127 && ((iCodePointAt < 128 || !z14) && str2.indexOf(iCodePointAt) == -1 && (iCodePointAt != 37 || (z11 && (!z12 || ycx(str, i5, i11)))))) {
                    ycxVar.ycx(iCodePointAt);
                } else {
                    if (ycxVar2 == null) {
                        ycxVar2 = new com.bytedance.sdk.component.zb.ycx.zb.ycx();
                    }
                    if (charset != null && !charset.equals(com.bytedance.sdk.component.zb.ycx.zb.jw.ycx)) {
                        ycxVar2.ycx(str, i5, Character.charCount(iCodePointAt) + i5, charset);
                    } else {
                        ycxVar2.ycx(iCodePointAt);
                    }
                    while (!ycxVar2.ycx()) {
                        byte bZb = ycxVar2.zb();
                        ycxVar.zb(37);
                        char[] cArr = f24194dj;
                        ycxVar.zb((int) cArr[((bZb & 255) >> 4) & 15]);
                        ycxVar.zb((int) cArr[bZb & 15]);
                    }
                }
            }
            i5 += Character.charCount(iCodePointAt);
        }
    }

    public static String ycx(String str, String str2, boolean z11, boolean z12, boolean z13, boolean z14) {
        return ycx(str, 0, str.length(), str2, z11, z12, z13, z14, null);
    }
}
