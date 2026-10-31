package j80;

import com.google.android.libraries.places.api.model.PlaceTypes;

/* loaded from: classes5.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final a[] f69155a = {new b("sin", 1, 10), new b("cos", 1, 15), new b("tan", 1, 16), new b("cot", 1, 17), new b("log", 1, 18), new b("log1p", 1, 21), new b("abs", 1, 22), new b("acos", 1, 0), new b("asin", 1, 1), new b("atan", 1, 2), new b("cbrt", 1, 3), new b("ceil", 1, 9), new b(PlaceTypes.FLOOR, 1, 4), new b("sinh", 1, 5), new b("sqrt", 1, 6), new b("tanh", 1, 7), new b("cosh", 1, 8), new b("pow", 2, 11), new b("exp", 1, 12), new b("expm1", 1, 13), new b("log10", 1, 20), new b("log2", 1, 19), new b("signum", 1, 14)};

    public static a a(String str) {
        boolean zEquals = str.equals("sin");
        a[] aVarArr = f69155a;
        if (zEquals) {
            return aVarArr[0];
        }
        if (str.equals("cos")) {
            return aVarArr[1];
        }
        if (str.equals("tan")) {
            return aVarArr[2];
        }
        if (str.equals("cot")) {
            return aVarArr[3];
        }
        if (str.equals("asin")) {
            return aVarArr[8];
        }
        if (str.equals("acos")) {
            return aVarArr[7];
        }
        if (str.equals("atan")) {
            return aVarArr[9];
        }
        if (str.equals("sinh")) {
            return aVarArr[13];
        }
        if (str.equals("cosh")) {
            return aVarArr[16];
        }
        if (str.equals("tanh")) {
            return aVarArr[15];
        }
        if (str.equals("abs")) {
            return aVarArr[6];
        }
        if (str.equals("log")) {
            return aVarArr[4];
        }
        if (str.equals("log10")) {
            return aVarArr[20];
        }
        if (str.equals("log2")) {
            return aVarArr[21];
        }
        if (str.equals("log1p")) {
            return aVarArr[5];
        }
        if (str.equals("ceil")) {
            return aVarArr[11];
        }
        if (str.equals(PlaceTypes.FLOOR)) {
            return aVarArr[12];
        }
        if (str.equals("sqrt")) {
            return aVarArr[14];
        }
        if (str.equals("cbrt")) {
            return aVarArr[10];
        }
        if (str.equals("pow")) {
            return aVarArr[17];
        }
        if (str.equals("exp")) {
            return aVarArr[18];
        }
        if (str.equals("expm1")) {
            return aVarArr[19];
        }
        if (str.equals("signum")) {
            return aVarArr[22];
        }
        return null;
    }
}
