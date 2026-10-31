package com.bytedance.adsdk.ugeno.ycx;

import android.text.TextUtils;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import com.bytedance.adsdk.ugeno.ycx.sya;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {
    private static String dj(String str, JSONObject jSONObject) {
        String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(str, jSONObject);
        return sya(strYcx) ? Arrays.toString(zb(strYcx, jSONObject)) : com.bytedance.adsdk.ugeno.dj.zb.ycx(strYcx, jSONObject);
    }

    public static boolean sya(String str) {
        JSONArray jSONArrayYcx = com.bytedance.adsdk.ugeno.fby.zb.ycx(str, (JSONArray) null);
        return jSONArrayYcx != null && jSONArrayYcx.length() > 0;
    }

    public static int ycx(int i5) {
        if (i5 < 0) {
            return -1;
        }
        if (i5 == 0) {
            return Integer.MIN_VALUE;
        }
        return i5 - 1;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterative(DepthRegionTraversal.java:31)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visit(SwitchOverStringVisitor.java:60)
     */
    public static Interpolator zb(String str) {
        switch (str.hashCode()) {
            case -1965072618:
                if (str.equals("ease_in")) {
                    return new AccelerateInterpolator();
                }
                break;
            case -1102672091:
                str.equals("linear");
                break;
            case -787702915:
                if (str.equals("ease_out")) {
                    return new DecelerateInterpolator();
                }
                break;
            case 1065009829:
                if (str.equals("ease_in_out")) {
                    return new AccelerateDecelerateInterpolator();
                }
                break;
        }
        return new LinearInterpolator();
    }

    public static List<sya> ycx(String str, JSONObject jSONObject) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = new JSONArray(str);
            if (jSONArray.length() <= 0) {
                return null;
            }
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    arrayList.add(ycx(jSONObjectOptJSONObject, jSONObject));
                }
            }
            return arrayList;
        } catch (JSONException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static sya.ycx sya(String str, JSONObject jSONObject) {
        JSONArray jSONArrayYcx;
        if (TextUtils.isEmpty(str) || (jSONArrayYcx = com.bytedance.adsdk.ugeno.fby.zb.ycx(jSONObject, str, null)) == null || jSONArrayYcx.length() != 2) {
            return null;
        }
        sya.ycx ycxVar = new sya.ycx();
        ycxVar.ycx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONArrayYcx.optString(0), jSONObject);
        ycxVar.f22549zb = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONArrayYcx.optString(1), jSONObject);
        return ycxVar;
    }

    public static float[] zb(String str, JSONObject jSONObject) {
        float[] fArr = {0.0f, 0.0f};
        JSONArray jSONArrayYcx = com.bytedance.adsdk.ugeno.fby.zb.ycx(jSONObject, str, null);
        if (jSONArrayYcx != null && jSONArrayYcx.length() == 2) {
            fArr[0] = (float) com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONArrayYcx.optString(0), jSONObject), 0.0d);
            fArr[1] = (float) com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONArrayYcx.optString(1), jSONObject), 0.0d);
        }
        return fArr;
    }

    public static sya ycx(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject == null) {
            return null;
        }
        sya syaVar = new sya();
        syaVar.zb(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("delay"), jSONObject2), 0L));
        syaVar.sya(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString(PendingUpgradeStore.KEY_NAME), jSONObject2));
        syaVar.zb(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("playState"), jSONObject2), 1));
        syaVar.ycx(Math.max(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("duration"), jSONObject2), 0L), 0L));
        syaVar.ycx(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("playCount"), jSONObject2), 1));
        syaVar.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("playDirection"), jSONObject2));
        syaVar.ycx(sya(jSONObject.optString("transformOrigin"), jSONObject2));
        syaVar.zb(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("timingFunction", "linear"), jSONObject2));
        syaVar.ycx(jSONObject.optJSONObject("effect"));
        syaVar.ycx(ycx(jSONObject.optJSONArray("keyframes"), jSONObject2));
        return syaVar;
    }

    public static Map<String, TreeMap<Float, String>> ycx(JSONArray jSONArray, JSONObject jSONObject) {
        if (jSONArray == null || jSONArray.length() <= 0) {
            return null;
        }
        HashMap map = new HashMap();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
            if (jSONObjectOptJSONObject != null) {
                float fOptDouble = (float) jSONObjectOptJSONObject.optDouble("offset");
                Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    if (!TextUtils.equals(next, "offset")) {
                        TreeMap treeMap = (TreeMap) map.get(next);
                        if (treeMap == null) {
                            treeMap = new TreeMap();
                            map.put(next, treeMap);
                        }
                        treeMap.put(Float.valueOf(fOptDouble), dj(jSONObjectOptJSONObject.optString(next), jSONObject));
                    }
                }
            }
        }
        return map;
    }

    public static int ycx(String str) {
        int iHashCode = str.hashCode();
        if (iHashCode == -1408024454) {
            return str.equals("alternate") ? 2 : 1;
        }
        if (iHashCode != -1039745817) {
            return 1;
        }
        str.equals("normal");
        return 1;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static int ycx(String str, int i5) {
        int i11 = i5 / 2;
        if (!TextUtils.isEmpty(str)) {
            str.getClass();
            switch (str) {
                case "bottom":
                case "right":
                    return i5;
                case "center":
                    break;
                case "top":
                case "left":
                    return 0;
                default:
                    if (str.endsWith("%")) {
                        try {
                            return (int) ((i5 * Float.parseFloat(str.substring(0, str.length() - 1))) / 100.0f);
                        } catch (NumberFormatException unused) {
                            break;
                        }
                    } else {
                        try {
                            return Integer.parseInt(str);
                        } catch (NumberFormatException unused2) {
                            return i11;
                        }
                    }
            }
        }
        return i11;
    }
}
