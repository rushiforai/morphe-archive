package com.bytedance.adsdk.ycx;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Number ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length < 3) {
            return null;
        }
        Number numberYcx = ycx(objArr[0]);
        int iYcx = ycx(objArr[1], 0);
        boolean zYcx = ycx(objArr[2], false);
        if (numberYcx == null) {
            return null;
        }
        return ycx(numberYcx, iYcx, zYcx);
    }

    public Number ycx(Number number, int i5, boolean z11) {
        if (number == null) {
            return null;
        }
        int iMax = Math.max(i5, 0);
        BigDecimal bigDecimalValueOf = BigDecimal.valueOf(number.doubleValue());
        BigDecimal scale = z11 ? bigDecimalValueOf.setScale(iMax, RoundingMode.HALF_UP) : bigDecimalValueOf.setScale(iMax, RoundingMode.DOWN);
        if (iMax != 0) {
            if ((scale.signum() == 0 ? new BigDecimal(BigInteger.ZERO, 0) : scale.stripTrailingZeros()).scale() > 0) {
                return Double.valueOf(scale.doubleValue());
            }
        }
        return Long.valueOf(scale.longValue());
    }

    private Number ycx(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Number) {
            return (Number) obj;
        }
        if (obj instanceof String) {
            try {
                return Double.valueOf(Double.parseDouble((String) obj));
            } catch (NumberFormatException unused) {
            }
        }
        return null;
    }

    private int ycx(Object obj, int i5) {
        if (obj instanceof Number) {
            return ((Number) obj).intValue();
        }
        if (obj instanceof String) {
            try {
                return Integer.parseInt((String) obj);
            } catch (NumberFormatException unused) {
            }
        }
        return i5;
    }

    private boolean ycx(Object obj, boolean z11) {
        if (obj instanceof Boolean) {
            return ((Boolean) obj).booleanValue();
        }
        return obj instanceof String ? Boolean.parseBoolean((String) obj) : z11;
    }
}
