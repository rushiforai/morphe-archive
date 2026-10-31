package x80;

import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class w {

    /* renamed from: k, reason: collision with root package name */
    public static final char[] f95624k = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /* renamed from: a, reason: collision with root package name */
    public final String f95625a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95626b;

    /* renamed from: c, reason: collision with root package name */
    public final String f95627c;

    /* renamed from: d, reason: collision with root package name */
    public final String f95628d;

    /* renamed from: e, reason: collision with root package name */
    public final int f95629e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f95630f;

    /* renamed from: g, reason: collision with root package name */
    public final List f95631g;

    /* renamed from: h, reason: collision with root package name */
    public final String f95632h;

    /* renamed from: i, reason: collision with root package name */
    public final String f95633i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f95634j;

    public w(String scheme, String str, String str2, String host, int i5, ArrayList arrayList, ArrayList arrayList2, String str3, String str4) {
        Intrinsics.g(scheme, "scheme");
        Intrinsics.g(host, "host");
        this.f95625a = scheme;
        this.f95626b = str;
        this.f95627c = str2;
        this.f95628d = host;
        this.f95629e = i5;
        this.f95630f = arrayList;
        this.f95631g = arrayList2;
        this.f95632h = str3;
        this.f95633i = str4;
        this.f95634j = scheme.equals("https");
    }

    public final String a() {
        if (this.f95632h == null) {
            return null;
        }
        String str = this.f95633i;
        String strSubstring = str.substring(r70.k.R0('#', 0, 6, str) + 1);
        Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
        return strSubstring;
    }

    public final String b() {
        if (this.f95627c.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int length = this.f95625a.length() + 3;
        String str = this.f95633i;
        String strSubstring = str.substring(r70.k.R0(AbstractJsonLexerKt.COLON, length, 4, str) + 1, r70.k.R0('@', 0, 6, str));
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public final String c() {
        int length = this.f95625a.length() + 3;
        String str = this.f95633i;
        int iR0 = r70.k.R0('/', length, 4, str);
        String strSubstring = str.substring(iR0, y80.c.e(iR0, str.length(), str, "?#"));
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public final ArrayList d() {
        int length = this.f95625a.length() + 3;
        String str = this.f95633i;
        int iR0 = r70.k.R0('/', length, 4, str);
        int iE = y80.c.e(iR0, str.length(), str, "?#");
        ArrayList arrayList = new ArrayList();
        while (iR0 < iE) {
            int i5 = iR0 + 1;
            int iF = y80.c.f(str, i5, iE, '/');
            String strSubstring = str.substring(i5, iF);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            arrayList.add(strSubstring);
            iR0 = iF;
        }
        return arrayList;
    }

    public final String e() {
        if (this.f95631g == null) {
            return null;
        }
        String str = this.f95633i;
        int iR0 = r70.k.R0('?', 0, 6, str) + 1;
        String strSubstring = str.substring(iR0, y80.c.f(str, iR0, str.length(), '#'));
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof w) && Intrinsics.b(((w) obj).f95633i, this.f95633i);
    }

    public final String f() {
        if (this.f95626b.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int length = this.f95625a.length() + 3;
        String str = this.f95633i;
        String strSubstring = str.substring(length, y80.c.e(length, str.length(), str, ":@"));
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public final v g() {
        v vVar = new v();
        String scheme = this.f95625a;
        vVar.f95616a = scheme;
        vVar.f95617b = f();
        vVar.f95618c = b();
        vVar.f95619d = this.f95628d;
        Intrinsics.g(scheme, "scheme");
        int i5 = scheme.equals("http") ? 80 : scheme.equals("https") ? 443 : -1;
        int i11 = this.f95629e;
        vVar.f95620e = i11 != i5 ? i11 : -1;
        ArrayList arrayList = vVar.f95621f;
        arrayList.clear();
        arrayList.addAll(d());
        String strE = e();
        vVar.f95622g = strE != null ? b.f(b.b(strE, 0, 0, 211, " \"'<>#")) : null;
        vVar.f95623h = a();
        return vVar;
    }

    public final v h(String link) {
        Intrinsics.g(link, "link");
        try {
            v vVar = new v();
            vVar.e(this, link);
            return vVar;
        } catch (IllegalArgumentException unused) {
            return null;
        }
    }

    public final int hashCode() {
        return this.f95633i.hashCode();
    }

    public final String i() {
        List list = this.f95631g;
        if (list == null) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        b.g(list, sb2);
        return sb2.toString();
    }

    public final String j(String str) {
        List list = this.f95631g;
        if (list == null) {
            return null;
        }
        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, list.size()), 2);
        int i5 = intProgressionL0.f71906a;
        int i11 = intProgressionL0.f71907b;
        int i12 = intProgressionL0.f71908c;
        if ((i12 <= 0 || i5 > i11) && (i12 >= 0 || i11 > i5)) {
            return null;
        }
        while (!str.equals(list.get(i5))) {
            if (i5 == i11) {
                return null;
            }
            i5 += i12;
        }
        return (String) list.get(i5 + 1);
    }

    public final Set k() {
        List list = this.f95631g;
        if (list == null) {
            return EmptySet.f71734a;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, list.size()), 2);
        int i5 = intProgressionL0.f71906a;
        int i11 = intProgressionL0.f71907b;
        int i12 = intProgressionL0.f71908c;
        if ((i12 > 0 && i5 <= i11) || (i12 < 0 && i11 <= i5)) {
            while (true) {
                Object obj = list.get(i5);
                Intrinsics.d(obj);
                linkedHashSet.add(obj);
                if (i5 == i11) {
                    break;
                }
                i5 += i12;
            }
        }
        Set setUnmodifiableSet = Collections.unmodifiableSet(linkedHashSet);
        Intrinsics.f(setUnmodifiableSet, "unmodifiableSet(result)");
        return setUnmodifiableSet;
    }

    public final URI l() {
        v vVarG = g();
        ArrayList arrayList = vVarG.f95621f;
        String str = vVarG.f95619d;
        vVarG.f95619d = str != null ? u4.i("[\"<>^`{|}]", str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : null;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            arrayList.set(i5, b.b((String) arrayList.get(i5), 0, 0, Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, "[]"));
        }
        ArrayList arrayList2 = vVarG.f95622g;
        if (arrayList2 != null) {
            int size2 = arrayList2.size();
            for (int i11 = 0; i11 < size2; i11++) {
                String str2 = (String) arrayList2.get(i11);
                arrayList2.set(i11, str2 != null ? b.b(str2, 0, 0, 195, "\\^`{|}") : null);
            }
        }
        String str3 = vVarG.f95623h;
        vVarG.f95623h = str3 != null ? b.b(str3, 0, 0, 163, " \"#<>\\^`{|}") : null;
        String string = vVarG.toString();
        try {
            return new URI(string);
        } catch (URISyntaxException e3) {
            try {
                URI uriCreate = URI.create(new Regex("[\\u0000-\\u001F\\u007F-\\u009F\\p{javaWhitespace}]").h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, string));
                Intrinsics.f(uriCreate, "{\n      // Unlikely edge…Unexpected!\n      }\n    }");
                return uriCreate;
            } catch (Exception unused) {
                throw new RuntimeException(e3);
            }
        }
    }

    public final String toString() {
        return this.f95633i;
    }
}
