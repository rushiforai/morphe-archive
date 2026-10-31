package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes3.dex */
public abstract class p4 {
    public static Object a(w wVar, j4 j4Var, o4 o4Var) {
        switch (e4.f30796a[j4Var.ordinal()]) {
            case 1:
                return Double.valueOf(wVar.f());
            case 2:
                return Float.valueOf(wVar.j());
            case 3:
                return Long.valueOf(wVar.l());
            case 4:
                return Long.valueOf(wVar.v());
            case 5:
                return Integer.valueOf(wVar.k());
            case 6:
                return Long.valueOf(wVar.i());
            case 7:
                return Integer.valueOf(wVar.h());
            case 8:
                return Boolean.valueOf(wVar.d());
            case 9:
                return wVar.e();
            case 10:
                return Integer.valueOf(wVar.u());
            case 11:
                return Integer.valueOf(wVar.n());
            case 12:
                return Long.valueOf(wVar.o());
            case 13:
                return Integer.valueOf(wVar.p());
            case 14:
                return Long.valueOf(wVar.q());
            case 15:
                return o4Var.a(wVar);
            case 16:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle nested groups.");
            case 17:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle embedded messages.");
            case 18:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle enums.");
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }
}
