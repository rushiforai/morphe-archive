package com.fyber.inneractive.sdk.metrics;

import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f28532a;

    public a(String str) {
        this.f28532a = str;
    }

    public static boolean a(int i5, int i11, JSONArray jSONArray, CopyOnWriteArrayList copyOnWriteArrayList) {
        if (i5 > 0 && i11 > 0) {
            long jCurrentTimeMillis = System.currentTimeMillis() - TimeUnit.HOURS.toMillis(i5);
            int i12 = 0;
            for (int i13 = 0; i13 < jSONArray.length(); i13++) {
                long jOptLong = jSONArray.optLong(i13, 0L);
                if (jOptLong > jCurrentTimeMillis) {
                    i12++;
                    copyOnWriteArrayList.add(Long.valueOf(jOptLong));
                }
            }
            if (i12 >= i11) {
                return true;
            }
        }
        return false;
    }
}
