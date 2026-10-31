package com.pgl.ssdk;

import android.content.Context;
import android.text.TextUtils;

/* loaded from: classes.dex */
public class a4 {

    /* renamed from: a, reason: collision with root package name */
    public static int f42245a = 504;

    /* renamed from: b, reason: collision with root package name */
    public static String f42246b;

    /* renamed from: c, reason: collision with root package name */
    private static volatile String f42247c;

    /* renamed from: d, reason: collision with root package name */
    private static Context f42248d;

    public static synchronized String a() {
        try {
            if (TextUtils.isEmpty(f42247c)) {
                f42247c = (String) com.pgl.ssdk.ces.a.meta(303, f42248d, null);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f42247c;
    }

    public static void b() {
        Context context = f42248d;
        if (context != null) {
            ar.b(new ao(context, 301, null));
            f42245a = 102;
            com.pgl.ssdk.ces.b bVarE = com.pgl.ssdk.ces.b.e();
            if (bVarE != null) {
                bVarE.a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
        }
    }

    public static void a(Context context, String str) {
        if (f42248d == null) {
            f42248d = context;
        }
        int i5 = f42245a;
        if (i5 == 102 || i5 == 202 || i5 == 200) {
            return;
        }
        f42246b = str;
        f42245a = 102;
        ar.b(new ao(context, 301, null));
    }

    public static synchronized void a(byte[] bArr) {
        if (bArr != null) {
            if (bArr.length > 0) {
                Object objMeta = com.pgl.ssdk.ces.a.meta(302, f42248d, bArr);
                if ((objMeta instanceof Integer) && ((Integer) objMeta).intValue() == 0) {
                    f42245a = 200;
                } else if (objMeta instanceof String) {
                    f42247c = (String) objMeta;
                    f42245a = 200;
                }
            }
        }
    }
}
