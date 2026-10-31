package com.bytedance.sdk.openadsdk.core.settings;

import android.util.Log;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.ry;
import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private static final ConcurrentHashMap<String, zb> ycx = new ConcurrentHashMap<>();

    public static void ycx(boolean z11) {
        File fileYcx = ycx();
        if (fileYcx.exists()) {
            try {
                HashMap<String, zb> mapZb = zb(new JSONArray(new String(com.bytedance.sdk.component.utils.ul.dj(fileYcx))));
                if (mapZb.isEmpty()) {
                    return;
                }
                for (Map.Entry<String, zb> entry : mapZb.entrySet()) {
                    ycx.put(entry.getKey(), entry.getValue());
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "euoemQyoWsKUXt5TiwI=", "V+EskSWuZsqsRdRcgA==", 57);
            }
        }
    }

    private static HashMap<String, zb> zb(JSONArray jSONArray) {
        HashMap<String, zb> map = new HashMap<>();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                zb zbVarYcx = ycx(jSONArray.getJSONObject(i5));
                if (zbVarYcx != null) {
                    map.put(zbVarYcx.ycx, zbVarYcx);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "euoemQyoWsKUXt5TiwI=", "S+8/hgaWWuiu", 75);
                return map;
            }
        }
        return map;
    }

    private static zb zb(String str) {
        return new zb(str, 1);
    }

    public static void zb() {
        File fileYcx = ycx();
        if (fileYcx.exists()) {
            fileYcx.delete();
        }
    }

    public static File ycx() {
        return com.bytedance.sdk.component.utils.ul.ycx(pmi.ycx(), pmi.ycx().getFilesDir(), "tt_ads_conf_sr");
    }

    private static zb ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        return new zb(jSONObject);
    }

    public static zb ycx(String str) {
        zb zbVar = ycx.get(str);
        return zbVar == null ? zb(str) : zbVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a5 A[ORIG_RETURN, RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(JSONArray jSONArray) throws Throwable {
        HashMap<String, zb> mapZb;
        FileWriter fileWriter;
        if (jSONArray == null) {
            return;
        }
        File fileYcx = ycx();
        File file = new File(fileYcx.getParent(), fileYcx.getName() + ".tmp");
        FileWriter fileWriter2 = null;
        try {
            try {
                if (file.exists()) {
                    file.delete();
                }
                fileWriter = new FileWriter(file);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e3) {
            e = e3;
        }
        try {
            fileWriter.write(jSONArray.toString());
            file.renameTo(fileYcx);
            if (file.exists()) {
                file.delete();
            }
            ry.ycx(fileWriter);
        } catch (Exception e11) {
            e = e11;
            fileWriter2 = fileWriter;
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "euoemQyoWsKUXt5TiwI=", "SO87kCK4WsuPXuNSoB6jKVc=", 139);
            Log.e("SdkSettings.AdSlot", "saveAdSlotToLocal: ", e);
            if (file.exists()) {
                file.delete();
            }
            ry.ycx(fileWriter2);
            mapZb = zb(jSONArray);
            if (mapZb.isEmpty()) {
            }
        } catch (Throwable th3) {
            th = th3;
            fileWriter2 = fileWriter;
            if (file.exists()) {
                file.delete();
            }
            ry.ycx(fileWriter2);
            throw th;
        }
        mapZb = zb(jSONArray);
        if (mapZb.isEmpty()) {
            for (Map.Entry<String, zb> entry : mapZb.entrySet()) {
                ycx.put(entry.getKey(), entry.getValue());
            }
        }
    }
}
