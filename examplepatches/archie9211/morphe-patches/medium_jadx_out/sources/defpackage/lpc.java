package defpackage;

import java.util.HashMap;
import java.util.Map;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lpc {
    public static final lpc PACKED;
    public static final lpc SPREAD;
    public static final lpc SPREAD_INSIDE;
    public static final /* synthetic */ lpc[] a;
    public static Map<String, lpc> chainMap;
    public static Map<String, Integer> valueMap;

    static {
        lpc lpcVar = new lpc("SPREAD", 0);
        SPREAD = lpcVar;
        lpc lpcVar2 = new lpc("SPREAD_INSIDE", 1);
        SPREAD_INSIDE = lpcVar2;
        lpc lpcVar3 = new lpc("PACKED", 2);
        PACKED = lpcVar3;
        a = new lpc[]{lpcVar, lpcVar2, lpcVar3};
        chainMap = new HashMap();
        valueMap = new HashMap();
        chainMap.put("packed", lpcVar3);
        chainMap.put("spread_inside", lpcVar2);
        chainMap.put("spread", lpcVar);
        valueMap.put("packed", 2);
        valueMap.put("spread_inside", 1);
        valueMap.put("spread", 0);
    }

    public static lpc getChainByString(String str) {
        if (chainMap.containsKey(str)) {
            return chainMap.get(str);
        }
        return null;
    }

    public static int getValueByString(String str) {
        if (valueMap.containsKey(str)) {
            return valueMap.get(str).intValue();
        }
        return -1;
    }

    public static lpc valueOf(String str) {
        return (lpc) Enum.valueOf(lpc.class, str);
    }

    public static lpc[] values() {
        return (lpc[]) a.clone();
    }
}
