package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class thx {
    private static final Map<Integer, ycx<?, ?>> ycx = new ConcurrentHashMap();

    public static ycx<?, ?> ycx(Context context, int i5) {
        ycx<?, ?> ycxVarZb;
        Map<Integer, ycx<?, ?>> map = ycx;
        ycx<?, ?> ycxVar = map.get(Integer.valueOf(i5));
        if (ycxVar != null) {
            return ycxVar;
        }
        synchronized (thx.class) {
            try {
                ycxVarZb = map.get(Integer.valueOf(i5));
                if (ycxVarZb == null) {
                    ycxVarZb = zb(context, i5);
                    map.put(Integer.valueOf(i5), ycxVarZb);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return ycxVarZb;
    }

    private static ycx<?, ?> zb(Context context, int i5) {
        if (i5 == 7) {
            return new pmi(context);
        }
        if (i5 == 8) {
            return new ul(context);
        }
        throw new IllegalArgumentException("Unsupported ad type: ".concat(String.valueOf(i5)));
    }
}
