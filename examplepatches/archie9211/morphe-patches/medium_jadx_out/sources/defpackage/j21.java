package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import j$.util.DesugarCollections;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j21 {
    public static final String c;
    public static final Set d;
    public static final j21 e;
    public static final j21 f;
    public final String a;
    public final String b;

    static {
        String strQ = to7.q("hts/frbslgiggolai.o/0clgbthfra=snpoo", "tp:/ieaeogn.ogepscmvc/o/ac?omtjo_rt3");
        c = strQ;
        String strQ2 = to7.q("hts/frbslgigp.ogepscmv/ieo/eaybtho", "tp:/ieaeogn-agolai.o/1frlglgc/aclg");
        String strQ3 = to7.q("AzSCki82AwsLzKd5O8zo", "IayckHiZRO1EFl1aGoK");
        d = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList(new wy3("proto"), new wy3("json"))));
        e = new j21(strQ, null);
        f = new j21(strQ2, strQ3);
    }

    public j21(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public static j21 a(byte[] bArr) {
        String str = new String(bArr, Charset.forName("UTF-8"));
        if (!str.startsWith("1$")) {
            ay0.e("Version marker missing from extras");
            return null;
        }
        String[] strArrSplit = str.substring(2).split(Pattern.quote(PdtluglzAX.kjipq), 2);
        if (strArrSplit.length != 2) {
            ay0.e("Extra is not a valid encoded LegacyFlgDestination");
            return null;
        }
        String str2 = strArrSplit[0];
        if (str2.isEmpty()) {
            ay0.e("Missing endpoint in CCTDestination extras");
            return null;
        }
        String str3 = strArrSplit[1];
        return new j21(str2, str3.isEmpty() ? null : str3);
    }
}
