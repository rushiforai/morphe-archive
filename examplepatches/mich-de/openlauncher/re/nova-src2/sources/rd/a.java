package rd;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;
import qd.c;
import td.k;

/* loaded from: classes.dex */
public final class a implements k {

    /* renamed from: c, reason: collision with root package name */
    public static final String f85794c;

    /* renamed from: d, reason: collision with root package name */
    public static final Set f85795d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f85796e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f85797f;

    /* renamed from: a, reason: collision with root package name */
    public final String f85798a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85799b;

    static {
        String strJ = fg.a.J("hts/frbslgiggolai.o/0clgbthfra=snpoo", "tp:/ieaeogn.ogepscmvc/o/ac?omtjo_rt3");
        f85794c = strJ;
        String strJ2 = fg.a.J("hts/frbslgigp.ogepscmv/ieo/eaybtho", "tp:/ieaeogn-agolai.o/1frlglgc/aclg");
        String strJ3 = fg.a.J("AzSCki82AwsLzKd5O8zo", "IayckHiZRO1EFl1aGoK");
        f85795d = Collections.unmodifiableSet(new HashSet(Arrays.asList(new c("proto"), new c("json"))));
        f85796e = new a(strJ, null);
        f85797f = new a(strJ2, strJ3);
    }

    public a(String str, String str2) {
        this.f85798a = str;
        this.f85799b = str2;
    }

    public static a a(byte[] bArr) {
        String str = new String(bArr, Charset.forName("UTF-8"));
        if (!str.startsWith("1$")) {
            throw new IllegalArgumentException("Version marker missing from extras");
        }
        String[] strArrSplit = str.substring(2).split(Pattern.quote("\\"), 2);
        if (strArrSplit.length != 2) {
            throw new IllegalArgumentException("Extra is not a valid encoded LegacyFlgDestination");
        }
        String str2 = strArrSplit[0];
        if (str2.isEmpty()) {
            throw new IllegalArgumentException("Missing endpoint in CCTDestination extras");
        }
        String str3 = strArrSplit[1];
        if (str3.isEmpty()) {
            str3 = null;
        }
        return new a(str2, str3);
    }
}
