package defpackage;

import com.google.android.gms.analytics.wYI.ivbZv;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qt5 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final int e;
    public final ArrayList f;
    public final List g;
    public final String h;
    public final String i;

    public qt5(String str, String str2, String str3, String str4, int i, ArrayList arrayList, ArrayList arrayList2, String str5, String str6) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = i;
        this.f = arrayList;
        this.g = arrayList2;
        this.h = str5;
        this.i = str6;
    }

    public final String a() {
        if (this.c.length() == 0) {
            return "";
        }
        int length = this.a.length() + 3;
        String str = this.i;
        return str.substring(muc.Y(str, ':', length, 4) + 1, muc.Y(str, '@', 0, 6));
    }

    public final String b() {
        int length = this.a.length() + 3;
        String str = this.i;
        int iY = muc.Y(str, '/', length, 4);
        return str.substring(iY, egf.f(str, iY, str.length(), "?#"));
    }

    public final ArrayList c() {
        int length = this.a.length() + 3;
        String str = this.i;
        int iY = muc.Y(str, '/', length, 4);
        int iF = egf.f(str, iY, str.length(), "?#");
        ArrayList arrayList = new ArrayList();
        while (iY < iF) {
            int i = iY + 1;
            int iE = egf.e(str, '/', i, iF);
            arrayList.add(str.substring(i, iE));
            iY = iE;
        }
        return arrayList;
    }

    public final String d() {
        if (this.g == null) {
            return null;
        }
        String str = this.i;
        int iY = muc.Y(str, '?', 0, 6) + 1;
        return str.substring(iY, egf.e(str, '#', iY, str.length()));
    }

    public final String e() {
        if (this.b.length() == 0) {
            return "";
        }
        int length = this.a.length() + 3;
        String str = this.i;
        return str.substring(length, egf.f(str, length, str.length(), ":@"));
    }

    public final boolean equals(Object obj) {
        return (obj instanceof qt5) && ((qt5) obj).i.equals(this.i);
    }

    public final boolean f() {
        return g76.L(this.a, "https");
    }

    public final pt5 g() {
        pt5 pt5Var = new pt5();
        String str = this.a;
        pt5Var.a = str;
        pt5Var.b = e();
        pt5Var.c = a();
        pt5Var.d = this.d;
        str.getClass();
        int i = str.equals("http") ? 80 : str.equals("https") ? 443 : -1;
        int i2 = this.e;
        pt5Var.e = i2 != i ? i2 : -1;
        ArrayList arrayList = pt5Var.f;
        arrayList.clear();
        arrayList.addAll(c());
        String strD = d();
        String strSubstring = null;
        pt5Var.g = strD != null ? pt5.i(kyd.F(0, 0, 83, strD, " \"'<>#", true)) : null;
        if (this.h != null) {
            String str2 = this.i;
            strSubstring = str2.substring(muc.Y(str2, '#', 0, 6) + 1);
        }
        pt5Var.h = strSubstring;
        return pt5Var;
    }

    public final String h() {
        pt5 pt5Var;
        try {
            pt5Var = new pt5();
            pt5Var.f(this, "/...");
        } catch (IllegalArgumentException unused) {
            pt5Var = null;
        }
        pt5Var.getClass();
        pt5Var.b = kyd.F(0, 0, 123, "", " \"':;<=>@[]^`{}|/\\?#", false);
        pt5Var.c = kyd.F(0, 0, 123, "", " \"':;<=>@[]^`{}|/\\?#", false);
        return pt5Var.c().i;
    }

    public final int hashCode() {
        return this.i.hashCode();
    }

    public final String i() {
        x2b x2bVar = cgf.a;
        String str = this.d;
        str.getClass();
        if (cgf.a.c(str)) {
            return null;
        }
        return faa.d.a(str);
    }

    public final String toString() {
        return this.i;
    }

    public final URI j() {
        String strReplaceAll;
        String strF;
        String strF2;
        pt5 pt5VarG = g();
        ArrayList arrayList = pt5VarG.f;
        String str = pt5VarG.d;
        if (str != null) {
            Pattern patternCompile = Pattern.compile("[\"<>^`{|}]");
            patternCompile.getClass();
            strReplaceAll = patternCompile.matcher(str).replaceAll("");
            strReplaceAll.getClass();
        } else {
            strReplaceAll = null;
        }
        pt5VarG.d = strReplaceAll;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            arrayList.set(i, kyd.F(0, 0, 99, (String) arrayList.get(i), "[]", true));
        }
        ArrayList arrayList2 = pt5VarG.g;
        if (arrayList2 != null) {
            int size2 = arrayList2.size();
            for (int i2 = 0; i2 < size2; i2++) {
                String str2 = (String) arrayList2.get(i2);
                if (str2 != null) {
                    strF2 = kyd.F(0, 0, 67, str2, "\\^`{|}", true);
                } else {
                    strF2 = null;
                }
                arrayList2.set(i2, strF2);
            }
        }
        String str3 = pt5VarG.h;
        if (str3 != null) {
            strF = kyd.F(0, 0, 35, str3, " \"#<>\\^`{|}", true);
        } else {
            strF = null;
        }
        pt5VarG.h = strF;
        String string = pt5VarG.toString();
        try {
            return new URI(string);
        } catch (URISyntaxException e) {
            try {
                Pattern patternCompile2 = Pattern.compile(ivbZv.XEgZX);
                patternCompile2.getClass();
                String strReplaceAll2 = patternCompile2.matcher(string).replaceAll("");
                strReplaceAll2.getClass();
                URI uriCreate = URI.create(strReplaceAll2);
                uriCreate.getClass();
                return uriCreate;
            } catch (Exception unused) {
                ik4.j(e);
                return null;
            }
        }
    }
}
