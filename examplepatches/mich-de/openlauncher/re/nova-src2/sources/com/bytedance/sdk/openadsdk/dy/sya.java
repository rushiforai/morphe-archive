package com.bytedance.sdk.openadsdk.dy;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private static volatile boolean lud;
    private static volatile boolean sya;
    private static final HashMap<String, Integer> ycx = new HashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    private static volatile int f26796zb = 10000;

    /* renamed from: dj, reason: collision with root package name */
    private static volatile boolean f26795dj = true;

    public static void ycx() {
        String strYcx = lud.ycx("stats_control", b.f42142b);
        if (!TextUtils.isEmpty(strYcx)) {
            try {
                JSONObject jSONObject = new JSONObject(strYcx);
                f26796zb = jSONObject.optInt("sampling_def", 10000);
                String strOptString = jSONObject.optString("sampling");
                if (!TextUtils.isEmpty(strOptString)) {
                    JSONObject jSONObject2 = new JSONObject(strOptString);
                    Iterator<String> itKeys = jSONObject2.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        ycx.put(next, Integer.valueOf(jSONObject2.optInt(next, f26796zb)));
                    }
                }
            } catch (Exception unused) {
            }
        }
        f26795dj = false;
        sya = false;
        if (f26796zb == 10000 && ycx.isEmpty()) {
            f26795dj = true;
        } else if (f26796zb == 0 && ycx.isEmpty()) {
            sya = true;
        }
        lud = true;
    }

    public static boolean zb() {
        return sya;
    }

    public static int zb(String str, int i5) {
        if (sya) {
            return 0;
        }
        if (!lud) {
            return i5;
        }
        Integer numValueOf = ycx.get(str);
        if (numValueOf == null) {
            numValueOf = Integer.valueOf(i5);
        }
        return numValueOf.intValue();
    }

    public static boolean ycx(String str, int i5) {
        if (f26795dj || !lud) {
            return true;
        }
        if (sya) {
            return false;
        }
        if (i5 < 0) {
            i5 = f26796zb;
        }
        Integer numValueOf = ycx.get(str);
        if (numValueOf == null) {
            numValueOf = Integer.valueOf(i5);
        }
        if (numValueOf.intValue() <= 0) {
            return false;
        }
        return numValueOf.intValue() >= 10000 || ((int) ((Math.random() * 10000.0d) + 1.0d)) <= numValueOf.intValue();
    }
}
