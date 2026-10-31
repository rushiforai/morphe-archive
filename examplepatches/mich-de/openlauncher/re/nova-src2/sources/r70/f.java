package r70;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import qx.z0;

/* loaded from: classes.dex */
public abstract class f extends bh.g {
    public static String o0(String str) throws IOException {
        int length;
        Intrinsics.g(str, "<this>");
        List listX0 = k.X0(str);
        ArrayList arrayList = new ArrayList();
        for (Object obj : listX0) {
            if (!k.U0((String) obj)) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (true) {
            length = 0;
            if (!it.hasNext()) {
                break;
            }
            String str2 = (String) it.next();
            int length2 = str2.length();
            while (true) {
                if (length >= length2) {
                    length = -1;
                    break;
                }
                if (!kotlin.text.a.b(str2.charAt(length))) {
                    break;
                }
                length++;
            }
            if (length == -1) {
                length = str2.length();
            }
            arrayList2.add(Integer.valueOf(length));
        }
        Integer num = (Integer) b70.g.m1(arrayList2);
        int iIntValue = num != null ? num.intValue() : 0;
        int length3 = str.length();
        listX0.size();
        z0 z0Var = new z0(21);
        int iK = ul.b.K(listX0);
        ArrayList arrayList3 = new ArrayList();
        for (Object obj2 : listX0) {
            int i5 = length + 1;
            String str3 = null;
            if (length < 0) {
                ul.b.e0();
                throw null;
            }
            String str4 = (String) obj2;
            if (((length != 0 && length != iK) || !k.U0(str4)) && (str3 = (String) z0Var.invoke(l.B1(iIntValue, str4))) == null) {
                str3 = str4;
            }
            if (str3 != null) {
                arrayList3.add(str3);
            }
            length = i5;
        }
        StringBuilder sb2 = new StringBuilder(length3);
        b70.g.e1(arrayList3, sb2, "\n", null, null, null, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        return sb2.toString();
    }

    public static String p0(String str) throws IOException {
        Intrinsics.g(str, "<this>");
        if (k.U0("|")) {
            throw new IllegalArgumentException("marginPrefix must be non-blank string.");
        }
        List listX0 = k.X0(str);
        int length = str.length();
        listX0.size();
        z0 z0Var = new z0(21);
        int iK = ul.b.K(listX0);
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        for (Object obj : listX0) {
            int i11 = i5 + 1;
            String strSubstring = null;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            String str2 = (String) obj;
            if ((i5 != 0 && i5 != iK) || !k.U0(str2)) {
                int length2 = str2.length();
                int i12 = 0;
                while (true) {
                    if (i12 >= length2) {
                        i12 = -1;
                        break;
                    }
                    if (!kotlin.text.a.b(str2.charAt(i12))) {
                        break;
                    }
                    i12++;
                }
                if (i12 != -1 && j.H0(i12, str2, "|", false)) {
                    strSubstring = str2.substring("|".length() + i12);
                    Intrinsics.f(strSubstring, "substring(...)");
                }
                if (strSubstring == null || (strSubstring = (String) z0Var.invoke(strSubstring)) == null) {
                    strSubstring = str2;
                }
            }
            if (strSubstring != null) {
                arrayList.add(strSubstring);
            }
            i5 = i11;
        }
        StringBuilder sb2 = new StringBuilder(length);
        b70.g.e1(arrayList, sb2, "\n", null, null, null, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        return sb2.toString();
    }
}
