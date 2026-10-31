package com.facebook.ads.redexgen.X;

import java.util.Iterator;
import javax.annotation.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.aF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1428aF {
    public static String[] A00 = {"OYqwHlihVMxQOTlDB2wo5cgOdPrlMGlW", "T1eh4CMZduYba8apMuSOXCCbquKH", "0tuUhf3hQpyWioPakUTqf6tXEL8R9lZP", "1BWgCT1HIg0IUvJJfiG6SDytJXNyG8Jb", "7wbNHwTc8I", "pZ4jIBnlNxD99qUdgxqwJD6zqbci", "HrHpXYU72KMMy2vFLGWAH9yKZkIU", "YbFtQi0BfJN5RJ9hmknGsnf8ewj5AB"};

    public static boolean A00(@Nullable JSONArray jSONArray, @Nullable JSONArray jSONArray2) {
        if (jSONArray == null || jSONArray2 == null) {
            return jSONArray == jSONArray2;
        }
        if (jSONArray.length() != jSONArray2.length()) {
            return false;
        }
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            EnumC1429aG enumC1429aGA00 = EnumC1429aG.A00(jSONArray, i5);
            if (enumC1429aGA00 != EnumC1429aG.A00(jSONArray2, i5) || !enumC1429aGA00.A06(jSONArray, jSONArray2, i5)) {
                return false;
            }
        }
        return true;
    }

    public static boolean A02(@Nullable JSONObject jSONObject, @Nullable JSONObject jSONObject2) {
        EnumC1429aG enumC1429aGA01;
        if (jSONObject == null || jSONObject2 == null) {
            return jSONObject == jSONObject2;
        }
        if (jSONObject.length() != jSONObject2.length()) {
            return false;
        }
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!jSONObject2.has(next) || (enumC1429aGA01 = EnumC1429aG.A01(jSONObject, next)) != EnumC1429aG.A01(jSONObject2, next)) {
                return false;
            }
            boolean zA08 = enumC1429aGA01.A08(jSONObject, jSONObject2, next);
            if (A00[3].charAt(17) != 'i') {
                throw new RuntimeException();
            }
            A00[5] = "m3OiOmRnKxmEGnjBOVE11A4zbLg3";
            if (!zA08) {
                return false;
            }
        }
        return true;
    }
}
