package com.bytedance.sdk.component.lt.ycx.ycx.ycx;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import java.util.List;

/* loaded from: classes2.dex */
public class sya {
    public static void ycx(Context context, String str, ContentValues contentValues) {
        if (contentValues == null || TextUtils.isEmpty(str)) {
            return;
        }
        try {
            ycx.ycx(context).ycx().ycx(str, (String) null, contentValues);
        } catch (Throwable unused) {
        }
    }

    public static void ycx(Context context, String str, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (list == null || TextUtils.isEmpty(str)) {
            return;
        }
        try {
            ycx.ycx(context).ycx().ycx(str, (String) null, list);
        } catch (Throwable unused) {
        }
    }

    public static int ycx(Context context, String str, String str2, String[] strArr) {
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        try {
            return ycx.ycx(context).ycx().ycx(str, str2, strArr);
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static int ycx(Context context, String str, ContentValues contentValues, String str2, String[] strArr) {
        if (contentValues != null && !TextUtils.isEmpty(str)) {
            try {
                return ycx.ycx(context).ycx().ycx(str, contentValues, str2, strArr);
            } catch (Throwable unused) {
            }
        }
        return 0;
    }

    public static Cursor ycx(Context context, String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return ycx.ycx(context).ycx().ycx(str, strArr, str2, strArr2, null, null, str5);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void ycx(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            ycx.ycx(context).ycx().ycx(Uri.decode(str));
        } catch (Throwable unused) {
        }
    }
}
