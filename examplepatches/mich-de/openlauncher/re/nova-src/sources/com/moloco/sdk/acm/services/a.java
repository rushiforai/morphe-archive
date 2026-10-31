package com.moloco.sdk.acm.services;

import android.text.TextUtils;
import java.lang.reflect.InvocationTargetException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f36160a = new a();

    public final boolean a(@NotNull String key) {
        Intrinsics.g(key, "key");
        return Boolean.parseBoolean(b(key));
    }

    public final String b(String str) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            Object objInvoke = Class.forName("android.os.SystemProperties").getMethod("get", String.class).invoke(null, str);
            Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.String");
            String str2 = (String) objInvoke;
            try {
                if (TextUtils.isEmpty(str2)) {
                    return null;
                }
                return str2;
            } catch (Exception unused) {
                return str2;
            }
        } catch (Exception unused2) {
            return null;
        }
    }
}
