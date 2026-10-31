package com.bytedance.sdk.openadsdk.core;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class dwi {
    private static volatile dwi ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Map<String, Map<String, String>> f25352zb = new ConcurrentHashMap();

    private dwi() {
    }

    public static dwi ycx() {
        if (ycx == null) {
            synchronized (dwi.class) {
                try {
                    if (ycx == null) {
                        ycx = new dwi();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public boolean sya(String str, String str2) {
        Map<String, String> map;
        Map<String, Map<String, String>> map2 = this.f25352zb;
        if (map2 == null || !map2.containsKey(str) || (map = this.f25352zb.get(str)) == null) {
            return false;
        }
        map.remove(str2);
        return true;
    }

    public boolean zb(String str, String str2) {
        Map<String, String> map;
        Map<String, Map<String, String>> map2 = this.f25352zb;
        if (map2 == null || !map2.containsKey(str) || (map = this.f25352zb.get(str)) == null) {
            return false;
        }
        return map.containsKey(str2);
    }

    public void ycx(String str, String str2, String str3) {
        Map<String, Map<String, String>> map = this.f25352zb;
        if (map == null) {
            return;
        }
        Map<String, String> map2 = map.get(str);
        if (map2 != null) {
            map2.put(str2, str3);
            return;
        }
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        concurrentHashMap.put(str2, str3);
        this.f25352zb.put(str, concurrentHashMap);
    }

    public String ycx(String str, String str2) {
        Map<String, String> map;
        Map<String, Map<String, String>> map2 = this.f25352zb;
        if (map2 == null || !map2.containsKey(str) || (map = this.f25352zb.get(str)) == null) {
            return null;
        }
        return map.get(str2);
    }

    public void ycx(String str) {
        Map<String, Map<String, String>> map = this.f25352zb;
        if (map != null && map.containsKey(str)) {
            Map<String, String> map2 = this.f25352zb.get(str);
            if (map2 != null) {
                map2.clear();
            }
            this.f25352zb.remove(str);
        }
    }
}
