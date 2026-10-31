package com.bytedance.sdk.openadsdk.uh.zb;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.lt;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class ycx {
    private static final ConcurrentHashMap<String, Object> ycx = new ConcurrentHashMap<>();

    public static void ycx(Context context, String str, ContentValues contentValues) {
        if (contentValues == null || TextUtils.isEmpty(str)) {
            return;
        }
        synchronized (ycx(str)) {
            try {
                lt.ycx(context).ycx().ycx(str, (String) null, contentValues);
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbhr", "f8wMkQKsfcKSf8NUgAI=", "UuA+kBGo", 31);
            }
        }
    }

    public static int ycx(Context context, String str, String str2, String[] strArr) {
        int iYcx;
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        synchronized (ycx(str)) {
            try {
                try {
                    iYcx = lt.ycx(context).ycx().ycx(str, str2, strArr);
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbhr", "f8wMkQKsfcKSf8NUgAI=", "X+shkBe5", 44);
                    return 0;
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return iYcx;
    }

    public static int ycx(Context context, String str, ContentValues contentValues, String str2, String[] strArr) {
        int iYcx;
        if (contentValues == null || TextUtils.isEmpty(str)) {
            return 0;
        }
        synchronized (ycx(str)) {
            try {
                try {
                    iYcx = lt.ycx(context).ycx().ycx(str, contentValues, str2, strArr);
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbhr", "f8wMkQKsfcKSf8NUgAI=", "Tv4plBe5", 58);
                    return 0;
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return iYcx;
    }

    public static Map<String, List<String>> ycx(Context context, String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
        Map<String, List<String>> mapYcx;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (ycx(str)) {
            try {
                try {
                    mapYcx = ycx(lt.ycx(context).ycx().ycx(str, strArr, str2, strArr2, str3, str4, str5));
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbhr", "f8wMkQKsfcKSf8NUgAI=", "Svsohxo=", 73);
                    return null;
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return mapYcx;
    }

    public static Map<String, List<String>> ycx(Cursor cursor) {
        HashMap map = new HashMap();
        if (cursor != null) {
            try {
                String[] columnNames = cursor.getColumnNames();
                while (cursor.getCount() > 0 && cursor.moveToNext()) {
                    for (String str : columnNames) {
                        if (!map.containsKey(str)) {
                            map.put(str, new LinkedList());
                        }
                        ((List) map.get(str)).add(cursor.getString(cursor.getColumnIndex(str)));
                    }
                }
                cursor.close();
                return map;
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbhr", "f8wMkQKsfcKSf8NUgAI=", "WPs/hgyuXcitS8c=", 92);
                cursor.close();
            }
        }
        return map;
    }

    private static Object ycx(String str) {
        Object obj;
        ConcurrentHashMap<String, Object> concurrentHashMap = ycx;
        Object obj2 = concurrentHashMap.get(str);
        if (obj2 != null) {
            return obj2;
        }
        synchronized (ycx.class) {
            try {
                obj = concurrentHashMap.get(str);
                if (obj == null) {
                    obj = new Object();
                    concurrentHashMap.put(str, obj);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }
}
