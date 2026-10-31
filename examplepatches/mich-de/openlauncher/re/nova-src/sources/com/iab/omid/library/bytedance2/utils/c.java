package com.iab.omid.library.bytedance2.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.view.WindowManager;
import com.iab.omid.library.bytedance2.adsession.OutputDeviceStatus;
import com.iab.omid.library.bytedance2.walking.a;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class c {

    /* renamed from: a, reason: collision with root package name */
    private static WindowManager f35097a;

    /* renamed from: b, reason: collision with root package name */
    private static String[] f35098b = {"x", "y", "width", "height"};

    /* renamed from: c, reason: collision with root package name */
    static float f35099c = Resources.getSystem().getDisplayMetrics().density;

    public static /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        static final /* synthetic */ int[] f35100a;

        static {
            int[] iArr = new int[OutputDeviceStatus.values().length];
            f35100a = iArr;
            try {
                iArr[OutputDeviceStatus.NOT_DETECTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
        }
    }

    public static class b {

        /* renamed from: a, reason: collision with root package name */
        final float f35101a;

        /* renamed from: b, reason: collision with root package name */
        final float f35102b;

        public b(float f11, float f12) {
            this.f35101a = f11;
            this.f35102b = f12;
        }
    }

    public static float a(int i5) {
        return i5 / f35099c;
    }

    public static void b(JSONObject jSONObject) throws JSONException {
        b bVarA = a(jSONObject);
        try {
            jSONObject.put("width", bVarA.f35101a);
            jSONObject.put("height", bVarA.f35102b);
        } catch (JSONException unused) {
        }
    }

    private static boolean c(JSONObject jSONObject, JSONObject jSONObject2) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("isFriendlyObstructionFor");
        JSONArray jSONArrayOptJSONArray2 = jSONObject2.optJSONArray("isFriendlyObstructionFor");
        if (jSONArrayOptJSONArray == null && jSONArrayOptJSONArray2 == null) {
            return true;
        }
        if (!a(jSONArrayOptJSONArray, jSONArrayOptJSONArray2)) {
            return false;
        }
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            if (!jSONArrayOptJSONArray.optString(i5, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals(jSONArrayOptJSONArray2.optString(i5, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                return false;
            }
        }
        return true;
    }

    private static boolean d(JSONObject jSONObject, JSONObject jSONObject2) {
        return Boolean.valueOf(jSONObject.optBoolean("hasWindowFocus")).equals(Boolean.valueOf(jSONObject2.optBoolean("hasWindowFocus")));
    }

    private static boolean e(JSONObject jSONObject, JSONObject jSONObject2) {
        return Boolean.valueOf(jSONObject.optBoolean("noOutputDevice")).equals(Boolean.valueOf(jSONObject2.optBoolean("noOutputDevice")));
    }

    private static boolean f(JSONObject jSONObject, JSONObject jSONObject2) {
        for (String str : f35098b) {
            if (jSONObject.optDouble(str) != jSONObject2.optDouble(str)) {
                return false;
            }
        }
        return true;
    }

    private static boolean g(JSONObject jSONObject, JSONObject jSONObject2) {
        return jSONObject.optString("adSessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals(jSONObject2.optString("adSessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
    }

    public static boolean h(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject == null && jSONObject2 == null) {
            return true;
        }
        return jSONObject != null && jSONObject2 != null && f(jSONObject, jSONObject2) && g(jSONObject, jSONObject2) && e(jSONObject, jSONObject2) && d(jSONObject, jSONObject2) && c(jSONObject, jSONObject2) && b(jSONObject, jSONObject2);
    }

    private static b a(JSONObject jSONObject) {
        float fA;
        float fA2;
        if (f35097a != null) {
            Point point = new Point(0, 0);
            f35097a.getDefaultDisplay().getRealSize(point);
            fA = a(point.x);
            fA2 = a(point.y);
        } else {
            fA = 0.0f;
            fA2 = 0.0f;
        }
        return new b(fA, fA2);
    }

    public static void b(JSONObject jSONObject, String str) throws JSONException {
        try {
            jSONObject.put("notVisibleReason", str);
        } catch (JSONException e3) {
            d.a("Error with setting not visible reason", e3);
        }
    }

    public static JSONObject a(int i5, int i11, int i12, int i13) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("x", a(i5));
            jSONObject.put("y", a(i11));
            jSONObject.put("width", a(i12));
            jSONObject.put("height", a(i13));
            return jSONObject;
        } catch (JSONException e3) {
            d.a("Error with creating viewStateObject", e3);
            return jSONObject;
        }
    }

    private static boolean b(JSONObject jSONObject, JSONObject jSONObject2) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childViews");
        JSONArray jSONArrayOptJSONArray2 = jSONObject2.optJSONArray("childViews");
        if (jSONArrayOptJSONArray == null && jSONArrayOptJSONArray2 == null) {
            return true;
        }
        if (!a(jSONArrayOptJSONArray, jSONArrayOptJSONArray2)) {
            return false;
        }
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            if (!h(jSONArrayOptJSONArray.optJSONObject(i5), jSONArrayOptJSONArray2.optJSONObject(i5))) {
                return false;
            }
        }
        return true;
    }

    public static void a(Context context) {
        if (context != null) {
            f35099c = context.getResources().getDisplayMetrics().density;
            f35097a = (WindowManager) context.getSystemService("window");
        }
    }

    public static void a(JSONObject jSONObject, OutputDeviceStatus outputDeviceStatus) throws JSONException {
        try {
            jSONObject.put("noOutputDevice", a(outputDeviceStatus));
        } catch (JSONException e3) {
            d.a("Error with setting output device status", e3);
        }
    }

    public static void a(JSONObject jSONObject, a.C0124a c0124a) throws JSONException {
        com.iab.omid.library.bytedance2.internal.e eVarA = c0124a.a();
        JSONArray jSONArray = new JSONArray();
        Iterator<String> it = c0124a.b().iterator();
        while (it.hasNext()) {
            jSONArray.put(it.next());
        }
        try {
            jSONObject.put("isFriendlyObstructionFor", jSONArray);
            jSONObject.put("friendlyObstructionClass", eVarA.d());
            jSONObject.put("friendlyObstructionPurpose", eVarA.b());
            jSONObject.put("friendlyObstructionReason", eVarA.a());
        } catch (JSONException e3) {
            d.a("Error with setting friendly obstruction", e3);
        }
    }

    public static void a(JSONObject jSONObject, Boolean bool) throws JSONException {
        try {
            jSONObject.put("hasWindowFocus", bool);
        } catch (JSONException e3) {
            d.a("Error with setting has window focus", e3);
        }
    }

    public static void a(JSONObject jSONObject, String str) throws JSONException {
        try {
            jSONObject.put("adSessionId", str);
        } catch (JSONException e3) {
            d.a("Error with setting ad session id", e3);
        }
    }

    public static void a(JSONObject jSONObject, String str, Object obj) throws JSONException {
        try {
            jSONObject.put(str, obj);
        } catch (NullPointerException | JSONException e3) {
            d.a("JSONException during JSONObject.put for name [" + str + "]", e3);
        }
    }

    public static void a(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childViews");
            if (jSONArrayOptJSONArray == null) {
                jSONArrayOptJSONArray = new JSONArray();
                jSONObject.put("childViews", jSONArrayOptJSONArray);
            }
            jSONArrayOptJSONArray.put(jSONObject2);
        } catch (JSONException unused) {
        }
    }

    private static boolean a(OutputDeviceStatus outputDeviceStatus) {
        return a.f35100a[outputDeviceStatus.ordinal()] == 1;
    }

    private static boolean a(JSONArray jSONArray, JSONArray jSONArray2) {
        if (jSONArray == null && jSONArray2 == null) {
            return true;
        }
        return (jSONArray == null || jSONArray2 == null || jSONArray.length() != jSONArray2.length()) ? false : true;
    }
}
