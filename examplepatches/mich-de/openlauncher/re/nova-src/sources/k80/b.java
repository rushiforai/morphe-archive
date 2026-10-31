package k80;

import com.amplitude.core.events.Identify;

/* loaded from: classes5.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final a[] f71205a = {new a("+", 2, 500, 0, true), new a(Identify.UNSET_VALUE, 2, 500, 1, true), new a("*", 2, 1000, 4, true), new a("/", 2, 1000, 5, true), new a("^", 2, 10000, 6, false), new a("%", 2, 1000, 7, true), new a(Identify.UNSET_VALUE, 1, 5000, 2, false), new a("+", 1, 5000, 3, false)};

    public static a a(char c11, int i5) {
        a[] aVarArr = f71205a;
        if (c11 == '%') {
            return aVarArr[5];
        }
        if (c11 == '-') {
            return i5 != 1 ? aVarArr[1] : aVarArr[6];
        }
        if (c11 == '/') {
            return aVarArr[3];
        }
        if (c11 == '^') {
            return aVarArr[4];
        }
        if (c11 == '*') {
            return aVarArr[2];
        }
        if (c11 != '+') {
            return null;
        }
        return i5 != 1 ? aVarArr[0] : aVarArr[7];
    }
}
