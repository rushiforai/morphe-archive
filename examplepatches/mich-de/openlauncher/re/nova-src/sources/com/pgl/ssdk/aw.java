package com.pgl.ssdk;

import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: classes.dex */
public class aw {

    /* renamed from: a, reason: collision with root package name */
    private static SharedPreferences f42321a;

    public static int a(Context context, String str, int i5) {
        SharedPreferences sharedPreferencesA = a(context);
        return sharedPreferencesA != null ? sharedPreferencesA.getInt(str, i5) : i5;
    }

    public static void b(Context context, String str, int i5) {
        SharedPreferences sharedPreferencesA = a(context);
        if (sharedPreferencesA != null) {
            sharedPreferencesA.edit().putInt(str, i5).apply();
        }
    }

    public static long a(Context context, String str, long j11) {
        SharedPreferences sharedPreferencesA = a(context);
        return sharedPreferencesA != null ? sharedPreferencesA.getLong(str, j11) : j11;
    }

    public static void b(Context context, String str, long j11) {
        SharedPreferences sharedPreferencesA = a(context);
        if (sharedPreferencesA != null) {
            sharedPreferencesA.edit().putLong(str, j11).apply();
        }
    }

    public static SharedPreferences a(Context context) {
        if (f42321a == null) {
            f42321a = context.getSharedPreferences("ss_config", 0);
        }
        return f42321a;
    }

    public static void b(Context context, String str, String str2) {
        SharedPreferences sharedPreferencesA = a(context);
        if (sharedPreferencesA != null) {
            a2.c.v(sharedPreferencesA, str, str2);
        }
    }

    public static String a(Context context, String str) {
        return a(context, str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static String a(Context context, String str, String str2) {
        SharedPreferences sharedPreferencesA = a(context);
        return sharedPreferencesA != null ? sharedPreferencesA.getString(str, str2) : str2;
    }
}
