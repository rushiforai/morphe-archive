package e10;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class z {
    public static final Enum a(String str, Enum r42) {
        Class<?> superclass = r42.getClass();
        if (!Intrinsics.b(superclass.getSuperclass(), Enum.class)) {
            superclass = superclass.getSuperclass();
        }
        if (str != null && !r70.k.U0(str)) {
            try {
                Intrinsics.e(superclass, "null cannot be cast to non-null type java.lang.Class<T of com.teslacoilsw.launcher.preferences.ConfigObjectFromStringKt.asEnumClass>");
                return Enum.valueOf(superclass, str);
            } catch (Exception unused) {
            }
        }
        return r42;
    }

    public static final ArrayList b(String str) {
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i5 < str.length()) {
            char cCharAt = str.charAt(i5);
            int i14 = i12 + 1;
            if (cCharAt == '{') {
                i13++;
            } else if (i13 > 0) {
                if (cCharAt == '}') {
                    i13--;
                }
            } else if (cCharAt == ':') {
                String strSubstring = str.substring(i11, i12);
                Intrinsics.f(strSubstring, "substring(...)");
                arrayList.add(strSubstring);
                i11 = i14;
            }
            i5++;
            i12 = i14;
        }
        String strSubstring2 = str.substring(i11);
        Intrinsics.f(strSubstring2, "substring(...)");
        arrayList.add(strSubstring2);
        return arrayList;
    }
}
