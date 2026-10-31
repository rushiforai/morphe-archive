package com.google.android.gms.internal.measurement;

import java.util.ArrayList;

/* loaded from: classes3.dex */
public interface b6 {
    static f6 d(b6 b6Var, i6 i6Var, j8 j8Var, ArrayList arrayList) {
        String str = i6Var.f32640a;
        if (b6Var.e(str)) {
            f6 f6VarB = b6Var.b(str);
            if (f6VarB instanceof t4) {
                return ((t4) f6VarB).a(j8Var, arrayList);
            }
            throw new IllegalArgumentException(b.c0.E(str, " is not a function"));
        }
        if (!"hasOwnProperty".equals(str)) {
            throw new IllegalArgumentException(b.c0.k("Object has no function ", str));
        }
        gh.c(1, "hasOwnProperty", arrayList);
        return b6Var.e(((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0)).zzc()) ? f6.Vo : f6.Wo;
    }

    f6 b(String str);

    void c(String str, f6 f6Var);

    boolean e(String str);
}
