package ao;

import android.content.res.Resources;
import android.graphics.Point;
import android.view.WindowManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import p10.c0;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static WindowManager f15358a;

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f15359b = {"x", "y", "width", "height"};

    /* renamed from: c, reason: collision with root package name */
    public static float f15360c = Resources.getSystem().getDisplayMetrics().density;

    public static JSONObject a(int i5, int i11, int i12, int i13) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("x", i5 / f15360c);
            jSONObject.put("y", i11 / f15360c);
            jSONObject.put("width", i12 / f15360c);
            jSONObject.put("height", i13 / f15360c);
            return jSONObject;
        } catch (JSONException e3) {
            c0.n("Error with creating viewStateObject", e3);
            return jSONObject;
        }
    }

    public static void b(JSONObject jSONObject, String str, Object obj) throws JSONException {
        try {
            jSONObject.put(str, obj);
        } catch (NullPointerException | JSONException e3) {
            c0.n("JSONException during JSONObject.put for name [" + str + "]", e3);
        }
    }

    public static void c(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childViews");
            if (jSONArrayOptJSONArray == null) {
                jSONArrayOptJSONArray = new JSONArray();
                jSONObject.put("childViews", jSONArrayOptJSONArray);
            }
            jSONArrayOptJSONArray.put(jSONObject2);
        } catch (JSONException e3) {
            e3.printStackTrace();
        }
    }

    public static void d(JSONObject jSONObject) throws JSONException {
        float f11;
        float f12;
        if (f15358a != null) {
            Point point = new Point(0, 0);
            f15358a.getDefaultDisplay().getRealSize(point);
            float f13 = point.x;
            float f14 = f15360c;
            f11 = f13 / f14;
            f12 = point.y / f14;
        } else {
            f11 = 0.0f;
            f12 = 0.0f;
        }
        try {
            jSONObject.put("width", f11);
            jSONObject.put("height", f12);
        } catch (JSONException e3) {
            e3.printStackTrace();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e5 A[ORIG_RETURN, RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean e(JSONObject jSONObject, JSONObject jSONObject2) {
        JSONArray jSONArrayOptJSONArray;
        boolean z11;
        int i5;
        if (jSONObject == null && jSONObject2 == null) {
            return true;
        }
        if (jSONObject != null && jSONObject2 != null) {
            int i11 = 0;
            while (true) {
                if (i11 < 4) {
                    String str = f15359b[i11];
                    if (jSONObject.optDouble(str) != jSONObject2.optDouble(str)) {
                        break;
                    }
                    i11++;
                } else if (jSONObject.optString("adSessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals(jSONObject2.optString("adSessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) && Boolean.valueOf(jSONObject.optBoolean("noOutputDevice")).equals(Boolean.valueOf(jSONObject2.optBoolean("noOutputDevice"))) && Boolean.valueOf(jSONObject.optBoolean("hasWindowFocus")).equals(Boolean.valueOf(jSONObject2.optBoolean("hasWindowFocus")))) {
                    JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray("isFriendlyObstructionFor");
                    JSONArray jSONArrayOptJSONArray3 = jSONObject2.optJSONArray("isFriendlyObstructionFor");
                    if (jSONArrayOptJSONArray2 == null && jSONArrayOptJSONArray3 == null) {
                        jSONArrayOptJSONArray = jSONObject.optJSONArray("childViews");
                        JSONArray jSONArrayOptJSONArray4 = jSONObject2.optJSONArray("childViews");
                        if (jSONArrayOptJSONArray != null) {
                            z11 = false;
                            if (jSONArrayOptJSONArray == null) {
                                while (i5 < jSONArrayOptJSONArray.length()) {
                                }
                                z11 = true;
                                if (!z11) {
                                    break;
                                }
                            } else {
                                while (i5 < jSONArrayOptJSONArray.length()) {
                                }
                                z11 = true;
                                if (!z11) {
                                }
                            }
                        }
                    } else if ((jSONArrayOptJSONArray2 == null && jSONArrayOptJSONArray3 == null) || (jSONArrayOptJSONArray2 != null && jSONArrayOptJSONArray3 != null && jSONArrayOptJSONArray2.length() == jSONArrayOptJSONArray3.length())) {
                        for (int i12 = 0; i12 < jSONArrayOptJSONArray2.length(); i12++) {
                            if (!jSONArrayOptJSONArray2.optString(i12, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals(jSONArrayOptJSONArray3.optString(i12, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                                break;
                            }
                        }
                        jSONArrayOptJSONArray = jSONObject.optJSONArray("childViews");
                        JSONArray jSONArrayOptJSONArray42 = jSONObject2.optJSONArray("childViews");
                        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray42 == null) {
                            z11 = true;
                            if (!z11) {
                                break;
                            }
                        } else {
                            z11 = false;
                            if ((jSONArrayOptJSONArray == null && jSONArrayOptJSONArray42 == null) || (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray42 != null && jSONArrayOptJSONArray.length() == jSONArrayOptJSONArray42.length())) {
                                for (i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                                    if (!e(jSONArrayOptJSONArray.optJSONObject(i5), jSONArrayOptJSONArray42.optJSONObject(i5))) {
                                        break;
                                    }
                                }
                                z11 = true;
                            }
                            if (!z11) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
}
