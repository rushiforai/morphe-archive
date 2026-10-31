package com.apm.insight.i;

import android.annotation.SuppressLint;
import android.content.Context;
import android.provider.Settings;
import android.text.TextUtils;
import com.apm.insight.runtime.o;
import java.util.UUID;

/* loaded from: classes2.dex */
public class a {

    /* renamed from: a, reason: collision with root package name */
    private static volatile UUID f21639a = null;

    /* renamed from: b, reason: collision with root package name */
    private static String f21640b = "";

    @SuppressLint({"MissingPermission", "HardwareIds"})
    private a(Context context) {
        String string;
        if (f21639a == null) {
            synchronized (a.class) {
                if (f21639a == null) {
                    String strC = o.a().c();
                    if (strC != null) {
                        f21639a = UUID.fromString(strC);
                    } else {
                        try {
                            string = Settings.Secure.getString(context.getContentResolver(), "android_id");
                        } catch (Throwable unused) {
                            string = null;
                        }
                        try {
                            if (string != null) {
                                f21639a = UUID.nameUUIDFromBytes(string.getBytes("utf8"));
                            } else {
                                f21639a = UUID.randomUUID();
                            }
                        } catch (Throwable unused2) {
                        }
                        try {
                            o.a().b(f21639a.toString());
                        } catch (Throwable unused3) {
                        }
                    }
                }
            }
        }
    }

    public static synchronized String a(Context context) {
        try {
            if (TextUtils.isEmpty(f21640b)) {
                new a(context);
                UUID uuid = f21639a;
                if (uuid != null) {
                    f21640b = uuid.toString();
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f21640b;
    }
}
