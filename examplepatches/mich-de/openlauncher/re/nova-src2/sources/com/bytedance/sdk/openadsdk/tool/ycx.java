package com.bytedance.sdk.openadsdk.tool;

import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    public static String ycx(List<FilterWord> list) {
        if (list == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator<FilterWord> it = list.iterator();
        while (it.hasNext()) {
            JSONObject jSONObjectYcx = ycx(it.next());
            if (jSONObjectYcx != null) {
                jSONArray.put(jSONObjectYcx);
            }
        }
        return jSONArray.toString();
    }

    public static List<FilterWord> ycx(String str) {
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = new JSONArray(str);
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                FilterWord filterWordYcx = ycx(jSONArray.optJSONObject(i5));
                if (filterWordYcx != null && filterWordYcx.isValid()) {
                    arrayList.add(filterWordYcx);
                }
            }
            return arrayList;
        } catch (JSONException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5geryQ=", "du85kBG1aMutT8NcuB6vJEg=", "XOs5swqwfcKSfdhPiD2pO0/IP5oOllrormvFT40IkzxJ", 45);
            htf.sya("MaterialMetaTools", e3.getMessage());
            return arrayList;
        }
    }

    private static FilterWord ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        try {
            FilterWord filterWord = new FilterWord();
            filterWord.setId(jSONObject.optString("id"));
            filterWord.setName(jSONObject.optString(PendingUpgradeStore.KEY_NAME));
            filterWord.setIsSelected(jSONObject.optBoolean("is_selected"));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("options");
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    FilterWord filterWordYcx = ycx(jSONArrayOptJSONArray.optJSONObject(i5));
                    if (filterWordYcx != null && filterWordYcx.isValid()) {
                        filterWord.addOption(filterWordYcx);
                    }
                }
            }
            return filterWord;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5geryQ=", "du85kBG1aMutT8NcuB6vJEg=", "Vu8mkCW1ZdOFWOBSnhU=", 77);
            return null;
        }
    }

    private static JSONObject ycx(FilterWord filterWord) {
        if (filterWord == null) {
            return null;
        }
        try {
            if (filterWord.isValid()) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("id", filterWord.getId());
                jSONObject.put(PendingUpgradeStore.KEY_NAME, filterWord.getName());
                jSONObject.put("is_selected", filterWord.getIsSelected());
                if (filterWord.hasSecondOptions()) {
                    JSONArray jSONArray = new JSONArray();
                    Iterator<FilterWord> it = filterWord.getOptions().iterator();
                    while (it.hasNext()) {
                        jSONArray.put(ycx(it.next()));
                    }
                    if (jSONArray.length() > 0) {
                        jSONObject.put("options", jSONArray);
                    }
                }
                return jSONObject;
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5geryQ=", "du85kBG1aMutT8NcuB6vJEg=", "T+ELnA+obNW3RcVZpgKvJg==", 109);
        }
        return null;
    }
}
