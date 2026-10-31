package com.bytedance.sdk.openadsdk.tn;

import java.util.Map;

/* loaded from: classes2.dex */
public final class dy {
    public zb ycx(String str, int i5, int i11, Map<lt, ?> map) throws htf, NumberFormatException {
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        }
        if (i5 < 0 || i11 < 0) {
            throw new IllegalArgumentException("Requested dimensions are too small: " + i5 + 'x' + i11);
        }
        fby fbyVarValueOf = fby.L;
        int i12 = 4;
        if (map != null) {
            lt ltVar = lt.ERROR_CORRECTION;
            if (map.containsKey(ltVar)) {
                fbyVarValueOf = fby.valueOf(map.get(ltVar).toString());
            }
            lt ltVar2 = lt.MARGIN;
            if (map.containsKey(ltVar2)) {
                i12 = Integer.parseInt(map.get(ltVar2).toString());
            }
        }
        return ycx(ul.ycx(str, fbyVarValueOf, map), i5, i11, i12);
    }

    private static zb ycx(syc sycVar, int i5, int i11, int i12) {
        sya syaVarYcx = sycVar.ycx();
        if (syaVarYcx != null) {
            int iZb = syaVarYcx.zb();
            int iYcx = syaVarYcx.ycx();
            int i13 = i12 * 2;
            int i14 = iZb + i13;
            int i15 = i13 + iYcx;
            int iMax = Math.max(i5, i14);
            int iMax2 = Math.max(i11, i15);
            int iMin = Math.min(iMax / i14, iMax2 / i15);
            int i16 = (iMax - (iZb * iMin)) / 2;
            int i17 = (iMax2 - (iYcx * iMin)) / 2;
            zb zbVar = new zb(iMax, iMax2);
            int i18 = 0;
            while (i18 < iYcx) {
                int i19 = 0;
                int i21 = i16;
                while (i19 < iZb) {
                    if (syaVarYcx.ycx(i19, i18) == 1) {
                        zbVar.ycx(i21, i17, iMin, iMin);
                    }
                    i19++;
                    i21 += iMin;
                }
                i18++;
                i17 += iMin;
            }
            return zbVar;
        }
        throw new IllegalStateException();
    }
}
