package com.bytedance.sdk.openadsdk.dv;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.openadsdk.dv.zb;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private final String sya;
    private SharedPreferences ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f26779zb;

    public sya(Context context, String str) {
        this.f26779zb = context;
        this.sya = str;
    }

    public SharedPreferences ycx() {
        Context context;
        SharedPreferences sharedPreferences = this.ycx;
        if (sharedPreferences != null) {
            return sharedPreferences;
        }
        if (TextUtils.isEmpty(this.sya) || (context = this.f26779zb) == null) {
            return null;
        }
        try {
            this.ycx = context.getSharedPreferences(this.sya, 0);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5pgu9e8KEesVYihSyLVXtKIY=", 36);
            Log.e("SPUnit", th2.getMessage());
        }
        return this.ycx;
    }

    public long zb(String str, long j11) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null && sharedPreferencesYcx.contains(str)) {
                return sharedPreferencesYcx.getLong(str, j11);
            }
            return j11;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5uQyybg==", 128);
            Log.i("SPUnit", this.sya + th2.getMessage());
            return j11;
        }
    }

    public void zb() {
        SharedPreferences sharedPreferencesYcx = ycx();
        if (sharedPreferencesYcx != null) {
            SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
            editorEdit.clear();
            editorEdit.commit();
        }
    }

    public void ycx(JSONObject jSONObject) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null) {
                SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    try {
                        if (!TextUtils.isEmpty(next)) {
                            Object obj = jSONObject.get(next);
                            if (obj instanceof Integer) {
                                editorEdit.putInt(next, ((Integer) obj).intValue());
                            } else if (obj instanceof Long) {
                                editorEdit.putLong(next, ((Long) obj).longValue());
                            } else if (obj instanceof String) {
                                editorEdit.putString(next, (String) obj);
                            } else if (obj instanceof Boolean) {
                                editorEdit.putBoolean(next, ((Boolean) obj).booleanValue());
                            } else if (obj instanceof Float) {
                                editorEdit.putFloat(next, ((Float) obj).floatValue());
                            } else if (obj instanceof Double) {
                                editorEdit.putFloat(next, ((Double) obj).floatValue());
                            } else {
                                editorEdit.putString(next, String.valueOf(obj));
                            }
                        }
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "S/s5vxCzZw==", 70);
                        Log.e("SPUnit", th2.getMessage());
                    }
                }
                editorEdit.apply();
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "S/s5vxCzZw==", 77);
            Log.e("SPUnit", th3.getMessage());
        }
    }

    public void ycx(String str, long j11) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null) {
                SharedPreferences.Editor editorEdit = sharedPreferencesYcx.edit();
                editorEdit.putLong(str, j11);
                editorEdit.apply();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "S/s5uQyybg==", 92);
            Log.e("SPUnit", th2.getMessage());
        }
    }

    public int ycx(String str, int i5) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null && sharedPreferencesYcx.contains(str)) {
                return sharedPreferencesYcx.getInt(str, i5);
            }
            return i5;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5vA2o", 114);
            Log.i("SPUnit", this.sya + th2.getMessage());
            return i5;
        }
    }

    public String ycx(String str, String str2) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null && sharedPreferencesYcx.contains(str)) {
                return sharedPreferencesYcx.getString(str, str2);
            }
            return str2;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5pheuYMmH", 142);
            Log.i("SPUnit", this.sya + th2.getMessage());
            return str2;
        }
    }

    public boolean ycx(String str, boolean z11) {
        try {
            SharedPreferences sharedPreferencesYcx = ycx();
            if (sharedPreferencesYcx != null && sharedPreferencesYcx.contains(str)) {
                return sharedPreferencesYcx.getBoolean(str, z11);
            }
            return z11;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5twyzZcKBRA==", 170);
            Log.i("SPUnit", this.sya + th2.getMessage());
            return z11;
        }
    }

    public <T> T ycx(String str, T t6, zb.ycx<T> ycxVar) {
        String string;
        if (str != null && !str.isEmpty()) {
            try {
                SharedPreferences sharedPreferencesYcx = ycx();
                if (sharedPreferencesYcx != null && sharedPreferencesYcx.contains(str) && (string = sharedPreferencesYcx.getString(str, null)) != null && ycxVar != null) {
                    T tZb = ycxVar.zb(string);
                    if (tZb != null) {
                        return tZb;
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aN4Ymwqo", "XOs5ugG2bMSU", 198);
                Log.i("SPUnit", this.sya + th2.getMessage());
            }
        }
        return t6;
    }
}
