package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.net.Uri;

/* loaded from: classes3.dex */
public abstract class mb {

    /* renamed from: a, reason: collision with root package name */
    public static final z.e f32818a = new z.e(0);

    public static synchronized Uri a() {
        z.e eVar = f32818a;
        Uri uri = (Uri) eVar.get("com.google.android.gms.measurement");
        if (uri != null) {
            return uri;
        }
        Uri uri2 = Uri.parse("content://com.google.android.gms.phenotype/".concat(String.valueOf(Uri.encode("com.google.android.gms.measurement"))));
        eVar.put("com.google.android.gms.measurement", uri2);
        return uri2;
    }

    public static String b(Context context, String str) {
        if (str.contains("#")) {
            throw new IllegalArgumentException("The passed in package cannot already have a subpackage: ".concat(str));
        }
        String packageName = context.getPackageName();
        return b.c0.r(new StringBuilder(str.length() + 1 + String.valueOf(packageName).length()), str, "#", packageName);
    }
}
