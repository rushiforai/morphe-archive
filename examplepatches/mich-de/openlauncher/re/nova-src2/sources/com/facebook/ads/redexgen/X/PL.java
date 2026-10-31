package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class PL {
    public static byte[] A01;
    public static String[] A02 = {"T1WONoMoNswt", "h95A9DDID2vy51YJ5wTrOXhJwWEWA5M6", "BNh", "qYCUhreSRwGU8bTsLEFLm0uZ8opPUzs2", "o2FupUf2MvleyHmS", "1Ictx1ghV5lK6qxO9G", "z6g5eCQjfqntXruTrk2yHJwNc84H20ye", "RpoIaAfZP"};
    public final Map<Integer, PK> A00 = new HashMap();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A02[2].length() != 3) {
                throw new RuntimeException();
            }
            A02[4] = "TfJQcclkNqpSqrpu";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 9);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{41, 10, 24, 14, 39, 10, 31, 14, 5, 8, 18, 8, 43, 54, 54, 39, 48, 19, 44, 48, 42, 55, 42, 44, 45, 65, 115, AbstractJsonLexerKt.TC_INVALID, 98, 126, 123, 124, 117, 64, 115, 102, 119};
    }

    static {
        A01();
    }

    public PL(String str) throws JSONException {
        if (str != null) {
            try {
                if (!str.isEmpty()) {
                    JSONArray jSONArray = new JSONArray(str);
                    for (int jitter = 0; jitter < jSONArray.length(); jitter++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(jitter);
                        int i5 = jSONObject.getInt(A00(17, 8, 74));
                        int samplingRate = jSONObject.getInt(A00(0, 11, 98));
                        int position = jSONObject.getInt(A00(11, 6, 75));
                        this.A00.put(Integer.valueOf(i5), new PK(this, samplingRate, position, jSONObject.getInt(A00(25, 12, 27))));
                    }
                }
            } catch (Exception unused) {
            }
        }
    }

    public final PK A02() {
        if (this.A00.containsKey(0)) {
            return this.A00.get(0);
        }
        return null;
    }
}
