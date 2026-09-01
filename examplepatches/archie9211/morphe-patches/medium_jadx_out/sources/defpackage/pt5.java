package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pt5 {
    public String a;
    public String d;
    public ArrayList g;
    public String h;
    public String b = "";
    public String c = "";
    public int e = -1;
    public final ArrayList f = d46.T("");

    public static ArrayList i(String str) {
        ArrayList arrayList = new ArrayList();
        int i = 0;
        while (i <= str.length()) {
            int iY = muc.Y(str, '&', i, 4);
            if (iY == -1) {
                iY = str.length();
            }
            int iY2 = muc.Y(str, '=', i, 4);
            if (iY2 == -1 || iY2 > iY) {
                arrayList.add(str.substring(i, iY));
                arrayList.add(null);
            } else {
                arrayList.add(str.substring(i, iY2));
                arrayList.add(str.substring(iY2 + 1, iY));
            }
            i = iY + 1;
        }
        return arrayList;
    }

    public final void a(String str) {
        str.getClass();
        g(str, 0, str.length(), false, false);
    }

    public final void b(String str, String str2) {
        str.getClass();
        ArrayList arrayList = this.g;
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.g = arrayList;
        }
        arrayList.add(kyd.F(0, 0, 91, str, " !\"#$&'(),/:;<=>?@[]\\^`{|}~", false));
        ArrayList arrayList2 = this.g;
        arrayList2.getClass();
        arrayList2.add(str2 != null ? kyd.F(0, 0, 91, str2, " !\"#$&'(),/:;<=>?@[]\\^`{|}~", false) : null);
    }

    public final qt5 c() {
        ArrayList arrayList;
        String str = this.a;
        if (str == null) {
            ygf.f("scheme == null");
            return null;
        }
        String strE0 = kyd.e0(0, 0, 7, this.b);
        String strE02 = kyd.e0(0, 0, 7, this.c);
        String str2 = this.d;
        if (str2 == null) {
            ygf.f("host == null");
            return null;
        }
        int iD = d();
        ArrayList arrayList2 = this.f;
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList2, 10));
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            arrayList3.add(kyd.e0(0, 0, 7, (String) it2.next()));
        }
        ArrayList<String> arrayList4 = this.g;
        if (arrayList4 != null) {
            arrayList = new ArrayList(cu1.k0(arrayList4, 10));
            for (String str3 : arrayList4) {
                arrayList.add(str3 != null ? kyd.e0(0, 0, 3, str3) : null);
            }
        } else {
            arrayList = null;
        }
        String str4 = this.h;
        return new qt5(str, strE0, strE02, str2, iD, arrayList3, arrayList, str4 != null ? kyd.e0(0, 0, 7, str4) : null, toString());
    }

    public final int d() {
        int i = this.e;
        if (i != -1) {
            return i;
        }
        String str = this.a;
        str.getClass();
        if (str.equals("http")) {
            return 80;
        }
        return str.equals("https") ? 443 : -1;
    }

    public final void e(String str) {
        str.getClass();
        String strB = cgf.b(kyd.e0(0, 0, 7, str));
        if (strB != null) {
            this.d = strB;
        } else {
            ay0.e("unexpected host: ".concat(str));
        }
    }

    public final void g(String str, int i, int i2, boolean z, boolean z2) {
        String strF = kyd.F(i, i2, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, str, " \"<>^`{}|/\\?#", z2);
        if (strF.equals(".") || strF.equalsIgnoreCase("%2e")) {
            return;
        }
        boolean zEquals = strF.equals("..");
        ArrayList arrayList = this.f;
        if (zEquals || strF.equalsIgnoreCase("%2e.") || strF.equalsIgnoreCase(".%2e") || strF.equalsIgnoreCase("%2e%2e")) {
            if (((String) arrayList.remove(arrayList.size() - 1)).length() != 0 || arrayList.isEmpty()) {
                arrayList.add("");
                return;
            } else {
                arrayList.set(arrayList.size() - 1, "");
                return;
            }
        }
        if (((CharSequence) y30.m(1, arrayList)).length() == 0) {
            arrayList.set(arrayList.size() - 1, strF);
        } else {
            arrayList.add(strF);
        }
        if (z) {
            arrayList.add("");
        }
    }

    public final void h(String str) {
        if (str.equalsIgnoreCase("http")) {
            this.a = "http";
        } else if (str.equalsIgnoreCase("https")) {
            this.a = "https";
        } else {
            ay0.e("unexpected scheme: ".concat(str));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x008b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() {
        /*
            Method dump skipped, instruction units count: 207
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pt5.toString():java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0026  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(defpackage.qt5 r25, java.lang.String r26) {
        /*
            Method dump skipped, instruction units count: 770
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pt5.f(qt5, java.lang.String):void");
    }
}
