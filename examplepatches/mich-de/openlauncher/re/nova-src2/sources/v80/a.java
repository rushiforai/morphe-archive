package v80;

import r70.k;

/* loaded from: classes5.dex */
public final class a {
    public static int a(String str) {
        if (str == null) {
            return 2131231561;
        }
        if (k.K0(str, "image/", false)) {
            return 2131231559;
        }
        if (k.K0(str, "audio/", false)) {
            return 2131231553;
        }
        if (k.K0(str, "video/", false)) {
            return 2131231562;
        }
        if (str.equals("application/vnd.android.package-archive")) {
            return 2131231551;
        }
        if (b.f92215c.contains(str)) {
            return 2131231555;
        }
        if (b.f92217e.contains(str)) {
            return 2131231560;
        }
        if (b.f92216d.contains(str)) {
            return 2131231563;
        }
        if (b.f92218f.contains(str)) {
            return 2131231552;
        }
        return str.equals("application/pdf") ? 2131231558 : 2131231561;
    }
}
