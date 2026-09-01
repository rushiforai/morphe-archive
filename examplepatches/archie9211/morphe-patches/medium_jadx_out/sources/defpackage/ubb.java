package defpackage;

import java.util.ArrayList;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ubb {
    public static final char[] l = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    public static final Pattern m = Pattern.compile("(.*/)?(\\.|%2e|%2E){1,2}(/.*)?");
    public final String a;
    public final qt5 b;
    public String c;
    public pt5 d;
    public final iq1 e = new iq1(14);
    public final ru f;
    public fn7 g;
    public final boolean h;
    public final ku3 i;
    public final n05 j;
    public sbb k;

    public ubb(String str, qt5 qt5Var, String str2, yi5 yi5Var, fn7 fn7Var, boolean z, boolean z2, boolean z3) {
        this.a = str;
        this.b = qt5Var;
        this.c = str2;
        this.g = fn7Var;
        this.h = z;
        if (yi5Var != null) {
            this.f = iq7.E(yi5Var);
        } else {
            this.f = new ru(3);
        }
        if (z2) {
            this.j = new n05(0);
            return;
        }
        if (z3) {
            ku3 ku3Var = new ku3(21);
            this.i = ku3Var;
            fn7 fn7Var2 = a68.g;
            fn7Var2.getClass();
            if (fn7Var2.b.equals("multipart")) {
                ku3Var.c = fn7Var2;
            } else {
                lg8.t("multipart != ", fn7Var2);
                throw null;
            }
        }
    }

    public final void a(String str, String str2, boolean z) {
        n05 n05Var = this.j;
        if (z) {
            n05Var.getClass();
            str.getClass();
            n05Var.a.add(kyd.G(str, 0, 0, " !\"#$&'()+,/:;<=>?@[\\]^`{|}~", true, false, true, false, 83));
            n05Var.b.add(kyd.G(str2, 0, 0, " !\"#$&'()+,/:;<=>?@[\\]^`{|}~", true, false, true, false, 83));
            return;
        }
        n05Var.getClass();
        str.getClass();
        n05Var.a.add(kyd.G(str, 0, 0, " !\"#$&'()+,/:;<=>?@[\\]^`{|}~", false, false, false, false, 91));
        n05Var.b.add(kyd.G(str2, 0, 0, " !\"#$&'()+,/:;<=>?@[\\]^`{|}~", false, false, false, false, 91));
    }

    public final void b(String str, String str2, boolean z) {
        if ("Content-Type".equalsIgnoreCase(str)) {
            try {
                x2b x2bVar = fn7.d;
                this.g = en7.x(str2);
                return;
            } catch (IllegalArgumentException e) {
                throw new IllegalArgumentException(ka1.r("Malformed content type: ", str2), e);
            }
        }
        ru ruVar = this.f;
        if (!z) {
            ruVar.c(str, str2);
            return;
        }
        ruVar.getClass();
        str.getClass();
        str2.getClass();
        iq7.J(str);
        iq7.B(ruVar, str, str2);
    }

    public final void c(yi5 yi5Var, sbb sbbVar) {
        ku3 ku3Var = this.i;
        ku3Var.getClass();
        sbbVar.getClass();
        if (yi5Var.d("Content-Type") != null) {
            ay0.e("Unexpected header: Content-Type");
        } else if (yi5Var.d("Content-Length") != null) {
            ay0.e("Unexpected header: Content-Length");
        } else {
            ((ArrayList) ku3Var.d).add(new z58(yi5Var, sbbVar));
        }
    }

    public final void d(String str, String str2, boolean z) {
        pt5 pt5Var;
        String str3 = this.c;
        if (str3 != null) {
            qt5 qt5Var = this.b;
            qt5Var.getClass();
            try {
                pt5Var = new pt5();
                pt5Var.f(qt5Var, str3);
            } catch (IllegalArgumentException unused) {
                pt5Var = null;
            }
            this.d = pt5Var;
            if (pt5Var == null) {
                StringBuilder sb = new StringBuilder("Malformed URL. Base: ");
                sb.append(qt5Var);
                ywb.l(sb, ", Relative: ", this.c);
                return;
            }
            this.c = null;
        }
        pt5 pt5Var2 = this.d;
        if (!z) {
            pt5Var2.b(str, str2);
            return;
        }
        pt5Var2.getClass();
        str.getClass();
        ArrayList arrayList = pt5Var2.g;
        if (arrayList == null) {
            arrayList = new ArrayList();
            pt5Var2.g = arrayList;
        }
        arrayList.add(kyd.F(0, 0, 83, str, " \"'<>#&=", true));
        ArrayList arrayList2 = pt5Var2.g;
        arrayList2.getClass();
        arrayList2.add(str2 != null ? kyd.F(0, 0, 83, str2, " \"'<>#&=", true) : null);
    }
}
