package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class nuc extends yo7 {
    public static String A(String str) {
        return szb.L0(new srd(new j80(5, str), new nmc("    ", 2)), "\n");
    }

    public static String B(String str) throws IOException {
        int length;
        Comparable comparable;
        List listF0 = muc.f0(str);
        ArrayList arrayList = new ArrayList();
        for (Object obj : listF0) {
            if (!muc.b0((String) obj)) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (true) {
            length = 0;
            if (!it2.hasNext()) {
                break;
            }
            String str2 = (String) it2.next();
            int length2 = str2.length();
            while (true) {
                if (length >= length2) {
                    length = -1;
                    break;
                }
                if (!kyd.c0(str2.charAt(length))) {
                    break;
                }
                length++;
            }
            if (length == -1) {
                length = str2.length();
            }
            arrayList2.add(Integer.valueOf(length));
        }
        Iterator it3 = arrayList2.iterator();
        if (it3.hasNext()) {
            comparable = (Comparable) it3.next();
            while (it3.hasNext()) {
                Comparable comparable2 = (Comparable) it3.next();
                if (comparable.compareTo(comparable2) > 0) {
                    comparable = comparable2;
                }
            }
        } else {
            comparable = null;
        }
        Integer num = (Integer) comparable;
        int iIntValue = num != null ? num.intValue() : 0;
        int length3 = str.length();
        listF0.size();
        int size = listF0.size() - 1;
        ArrayList arrayList3 = new ArrayList();
        for (Object obj2 : listF0) {
            int i = length + 1;
            if (length < 0) {
                d46.i0();
                throw null;
            }
            String str3 = (String) obj2;
            String strT = ((length == 0 || length == size) && muc.b0(str3)) ? null : muc.T(iIntValue, str3);
            if (strT != null) {
                arrayList3.add(strT);
            }
            length = i;
        }
        StringBuilder sb = new StringBuilder(length3);
        bu1.E0(arrayList3, sb, "\n", null, null, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
        return sb.toString();
    }

    public static String C(String str) throws IOException {
        if (muc.b0("|")) {
            ay0.e("marginPrefix must be non-blank string.");
            return null;
        }
        List listF0 = muc.f0(str);
        int length = str.length();
        listF0.size();
        int size = listF0.size() - 1;
        ArrayList arrayList = new ArrayList();
        int i = 0;
        for (Object obj : listF0) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            String str2 = (String) obj;
            if ((i == 0 || i == size) && muc.b0(str2)) {
                str2 = null;
            } else {
                int length2 = str2.length();
                int i3 = 0;
                while (true) {
                    if (i3 >= length2) {
                        i3 = -1;
                        break;
                    }
                    if (!kyd.c0(str2.charAt(i3))) {
                        break;
                    }
                    i3++;
                }
                String strSubstring = (i3 != -1 && tuc.M(i3, str2, "|", false)) ? str2.substring("|".length() + i3) : null;
                if (strSubstring != null) {
                    str2 = strSubstring;
                }
            }
            if (str2 != null) {
                arrayList.add(str2);
            }
            i = i2;
        }
        StringBuilder sb = new StringBuilder(length);
        bu1.E0(arrayList, sb, "\n", null, null, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
        return sb.toString();
    }
}
