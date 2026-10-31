package com.bytedance.sdk.openadsdk.uh.dj;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.component.zb;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.SoftReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class ycx {
    public static HashSet<String> ycx = new HashSet<String>() { // from class: com.bytedance.sdk.openadsdk.uh.dj.ycx.1
        {
            add("app_id");
            add("extra_data");
            add("sdk_app_sha1");
            add("uuid");
            add("android_system_ua");
            add("sdk_local_web_ua");
            add("sdk_local_rom_info");
        }
    };

    /* renamed from: zb, reason: collision with root package name */
    private static SoftReference<ConcurrentHashMap<String, Map<String, Object>>> f27089zb;

    private static void sya(String str) {
        ConcurrentHashMap<String, Map<String, Object>> concurrentHashMap;
        Map<String, Object> map;
        SoftReference<ConcurrentHashMap<String, Map<String, Object>>> softReference = f27089zb;
        if (softReference == null || (concurrentHashMap = softReference.get()) == null || (map = concurrentHashMap.get(zb(str))) == null) {
            return;
        }
        map.clear();
    }

    private static String ycx(Context context, String str, String str2) {
        if (ycx.contains(str2)) {
            str = "pag_sp_bad_par";
        }
        if (thx.ycx(context)) {
            return str;
        }
        StringBuilder sbK = k2.k(str, "_");
        sbK.append(thx.sya(context));
        return sbK.toString();
    }

    private static String zb(String str) {
        return TextUtils.isEmpty(str) ? "tt_sp" : str;
    }

    public static String zb(String str, String str2, String str3) {
        return ycx() ? str3 : ycx(pmi.ycx(), zb(str), str2, str3);
    }

    private static void zb(Context context, String str, String str2) {
        ConcurrentHashMap<String, Map<String, Object>> concurrentHashMap;
        Map<String, Object> map;
        try {
            String strYcx = ycx(context, str, str2);
            if (jc.ul(strYcx)) {
                zb.ycx(context, strYcx).zb().remove(str2).apply();
                return;
            }
            SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
            if (sharedPreferencesYcx == null) {
                return;
            }
            SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
            editorEdit.remove(str2);
            editorEdit.apply();
            SoftReference<ConcurrentHashMap<String, Map<String, Object>>> softReference = f27089zb;
            if (softReference != null && (concurrentHashMap = softReference.get()) != null && (map = concurrentHashMap.get(zb(strYcx))) != null && map.size() != 0) {
                map.remove(str2);
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTa95", "b9oelBW5QcKMWtJP", "SesgmhW5", 244);
        }
    }

    private static boolean ycx() {
        return pmi.ycx() == null;
    }

    public static void ycx(String str, String str2, Boolean bool) {
        if (ycx()) {
            return;
        }
        ycx(zb(str), str2, bool);
    }

    public static void ycx(String str, String str2, Long l9) {
        if (ycx()) {
            return;
        }
        ycx(zb(str), str2, l9);
    }

    public static void ycx(String str, String str2, String str3) {
        if (ycx()) {
            return;
        }
        ycx(zb(str), str2, str3);
    }

    public static void ycx(String str, String str2, Integer num) {
        if (ycx()) {
            return;
        }
        ycx(zb(str), str2, num);
    }

    public static int ycx(String str, String str2, int i5) {
        return ycx() ? i5 : ycx(pmi.ycx(), zb(str), str2, i5);
    }

    private static void zb(Context context, String str) {
        String strYcx = ycx(pmi.ycx(), str, b.f42142b);
        if (jc.ul(strYcx)) {
            zb.ycx(context, strYcx).zb().clear().apply();
            sya(strYcx);
            return;
        }
        SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
        if (sharedPreferencesYcx == null) {
            return;
        }
        SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
        editorEdit.clear();
        editorEdit.apply();
        sya(strYcx);
    }

    private static int ycx(Context context, String str, String str2, int i5) {
        String strYcx = ycx(context, str, str2);
        if (jc.ul(strYcx)) {
            return zb.ycx(context, strYcx).ycx(str2, i5);
        }
        SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
        return sharedPreferencesYcx == null ? i5 : sharedPreferencesYcx.getInt(str2, i5);
    }

    public static boolean ycx(String str, String str2, boolean z11) {
        return ycx() ? z11 : ycx(pmi.ycx(), zb(str), str2, z11);
    }

    private static boolean ycx(Context context, String str, String str2, boolean z11) {
        String strYcx = ycx(context, str, str2);
        if (jc.ul(strYcx)) {
            return zb.ycx(context, strYcx).ycx(str2, z11);
        }
        SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
        return sharedPreferencesYcx == null ? z11 : sharedPreferencesYcx.getBoolean(str2, z11);
    }

    private static Object zb(String str, String str2) {
        ConcurrentHashMap<String, Map<String, Object>> concurrentHashMap;
        Map<String, Object> map;
        SoftReference<ConcurrentHashMap<String, Map<String, Object>>> softReference = f27089zb;
        if (softReference == null || (concurrentHashMap = softReference.get()) == null || (map = concurrentHashMap.get(zb(str))) == null) {
            return null;
        }
        return map.get(str2);
    }

    private static void zb(String str, String str2, Object obj) {
        SoftReference<ConcurrentHashMap<String, Map<String, Object>>> softReference = f27089zb;
        if (softReference == null || softReference.get() == null) {
            f27089zb = new SoftReference<>(new ConcurrentHashMap());
        }
        String strZb = zb(str);
        ConcurrentHashMap<String, Map<String, Object>> concurrentHashMap = f27089zb.get();
        if (concurrentHashMap == null) {
            return;
        }
        Map<String, Object> map = concurrentHashMap.get(strZb);
        if (map == null) {
            map = new HashMap<>();
            concurrentHashMap.put(strZb, map);
        }
        map.put(str2, obj);
    }

    public static long ycx(String str, String str2, long j11) {
        return ycx() ? j11 : ycx(pmi.ycx(), zb(str), str2, j11);
    }

    private static long ycx(Context context, String str, String str2, long j11) {
        String strYcx = ycx(context, str, str2);
        if (jc.ul(strYcx)) {
            return zb.ycx(context, strYcx).ycx(str2, j11);
        }
        SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
        return sharedPreferencesYcx == null ? j11 : sharedPreferencesYcx.getLong(str2, j11);
    }

    private static String ycx(Context context, String str, String str2, String str3) {
        String strYcx = ycx(context, str, str2);
        if (jc.ul(strYcx)) {
            return zb.ycx(context, strYcx).ycx(str2, str3);
        }
        SharedPreferences sharedPreferencesYcx = ycx(context, strYcx);
        return sharedPreferencesYcx == null ? str3 : sharedPreferencesYcx.getString(str2, str3);
    }

    public static void ycx(String str, String str2) {
        if (ycx()) {
            return;
        }
        try {
            zb(pmi.ycx(), zb(str), str2);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTa95", "b9oelBW5QcKMWtJP", "SesgmhW5", 211);
        }
    }

    public static void ycx(String str) {
        if (ycx()) {
            return;
        }
        try {
            zb(pmi.ycx(), zb(str));
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTa95", "b9oelBW5QcKMWtJP", "WOIolBE=", 254);
        }
    }

    private static <T> void ycx(String str, String str2, T t6) {
        String strYcx = ycx(pmi.ycx(), str, str2);
        if (jc.ul(strYcx)) {
            if (t6.equals(zb(strYcx, str2))) {
                return;
            }
            zb.sya syaVarZb = zb.ycx(pmi.ycx(), zb(strYcx)).zb();
            ycx(syaVarZb, str2, (Object) t6);
            syaVarZb.apply();
            zb(strYcx, str2, t6);
            return;
        }
        SharedPreferences sharedPreferencesYcx = ycx(pmi.ycx(), zb(strYcx));
        if (sharedPreferencesYcx == null || t6.equals(zb(strYcx, str2))) {
            return;
        }
        SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
        ycx(editorEdit, str2, t6);
        editorEdit.apply();
        zb(strYcx, str2, t6);
    }

    public static SharedPreferences ycx(Context context, String str) {
        if (context == null) {
            return null;
        }
        try {
            return context.getSharedPreferences(zb(str), 0);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTa95", "b9oelBW5QcKMWtJP", "XOs5pjM=", 353);
            htf.sya("TTAD.TTSaveHelper", "getSharedPreferences error ", th2.getMessage());
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T> void ycx(zb.sya syaVar, String str, T t6) {
        if (t6 instanceof Integer) {
            syaVar.putInt(str, ((Integer) t6).intValue());
        }
        if (t6 instanceof Long) {
            syaVar.putLong(str, ((Long) t6).longValue());
        }
        if (t6 instanceof Float) {
            syaVar.putFloat(str, ((Float) t6).floatValue());
        }
        if (t6 instanceof Boolean) {
            syaVar.putBoolean(str, ((Boolean) t6).booleanValue());
        }
        if (t6 instanceof String) {
            syaVar.putString(str, (String) t6);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T> void ycx(SharedPreferences.Editor editor, String str, T t6) {
        if (t6 instanceof Integer) {
            editor.putInt(str, ((Integer) t6).intValue());
        }
        if (t6 instanceof Long) {
            editor.putLong(str, ((Long) t6).longValue());
        }
        if (t6 instanceof Float) {
            editor.putFloat(str, ((Float) t6).floatValue());
        }
        if (t6 instanceof Boolean) {
            editor.putBoolean(str, ((Boolean) t6).booleanValue());
        }
        if (t6 instanceof String) {
            editor.putString(str, (String) t6);
        }
    }
}
