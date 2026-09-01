package defpackage;

import androidx.work.impl.yX.VrhD;
import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class aa2 {
    public static final Pattern k = Pattern.compile("(\\d{2,4})[^\\d]*");
    public static final Pattern l = Pattern.compile("(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*");
    public static final Pattern m = Pattern.compile("(\\d{1,2})[^\\d]*");
    public static final Pattern n = Pattern.compile("(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*");
    public final String a;
    public final String b;
    public final long c;
    public final String d;
    public final String e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final String j;

    public aa2(String str, String str2, long j, String str3, String str4, boolean z, boolean z2, boolean z3, boolean z4, String str5) {
        this.a = str;
        this.b = str2;
        this.c = j;
        this.d = str3;
        this.e = str4;
        this.f = z;
        this.g = z2;
        this.h = z3;
        this.i = z4;
        this.j = str5;
    }

    public final boolean a(qt5 qt5Var) {
        qt5Var.getClass();
        String str = qt5Var.d;
        String str2 = this.d;
        if (this.i ? g76.L(str, str2) : op8.T(str, str2)) {
            String strB = qt5Var.b();
            String str3 = this.e;
            if ((strB.equals(str3) || (tuc.N(strB, str3, false) && (tuc.F(str3, "/", false) || strB.charAt(str3.length()) == '/'))) && (!this.f || qt5Var.f())) {
                return true;
            }
        }
        return false;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof aa2)) {
            return false;
        }
        aa2 aa2Var = (aa2) obj;
        return g76.L(aa2Var.a, this.a) && g76.L(aa2Var.b, this.b) && aa2Var.c == this.c && g76.L(aa2Var.d, this.d) && g76.L(aa2Var.e, this.e) && aa2Var.f == this.f && aa2Var.g == this.g && aa2Var.h == this.h && aa2Var.i == this.i && g76.L(aa2Var.j, this.j);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(527, 31, this.a), 31, this.b);
        long j = this.c;
        int iO2 = (((((((wgd.o(wgd.o((iO + ((int) (j ^ (j >>> 32)))) * 31, 31, this.d), 31, this.e) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31;
        String str = this.j;
        return iO2 + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        sb.append('=');
        sb.append(this.b);
        if (this.h) {
            long j = this.c;
            if (j == Long.MIN_VALUE) {
                sb.append("; max-age=0");
            } else {
                sb.append("; expires=");
                String str = ((DateFormat) nv2.a.get()).format(new Date(j));
                str.getClass();
                sb.append(str);
            }
        }
        if (!this.i) {
            sb.append(VrhD.RCaDRqohIYDE);
            sb.append(this.d);
        }
        sb.append("; path=");
        sb.append(this.e);
        if (this.f) {
            sb.append("; secure");
        }
        if (this.g) {
            sb.append("; httponly");
        }
        String str2 = this.j;
        if (str2 != null) {
            sb.append("; samesite=");
            sb.append(str2);
        }
        return sb.toString();
    }
}
