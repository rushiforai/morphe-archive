package com.pgl.ssdk.ces;

import android.content.Context;

/* loaded from: classes.dex */
public final class a {
    public static native Object meta(int i5, Context context, Object obj);

    public static Object njss(int i5, Object obj) {
        try {
            b bVarE = b.e();
            if (bVarE != null) {
                return bVarE.a(i5, obj);
            }
        } catch (Throwable unused) {
        }
        return null;
    }
}
