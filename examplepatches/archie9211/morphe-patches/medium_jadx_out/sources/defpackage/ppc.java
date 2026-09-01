package defpackage;

import java.util.HashMap;
import java.util.Map;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ppc {
    public static final ppc ALIGNED;
    public static final ppc CHAIN;
    public static final ppc NONE;
    public static final /* synthetic */ ppc[] a;
    public static Map<String, Integer> valueMap;
    public static Map<String, ppc> wrapMap;

    static {
        ppc ppcVar = new ppc("NONE", 0);
        NONE = ppcVar;
        ppc ppcVar2 = new ppc("CHAIN", 1);
        CHAIN = ppcVar2;
        ppc ppcVar3 = new ppc("ALIGNED", 2);
        ALIGNED = ppcVar3;
        a = new ppc[]{ppcVar, ppcVar2, ppcVar3};
        wrapMap = new HashMap();
        valueMap = new HashMap();
        wrapMap.put("none", ppcVar);
        wrapMap.put("chain", ppcVar2);
        wrapMap.put("aligned", ppcVar3);
        valueMap.put("none", 0);
        valueMap.put("chain", 3);
        valueMap.put("aligned", 2);
    }

    public static ppc getChainByString(String str) {
        if (wrapMap.containsKey(str)) {
            return wrapMap.get(str);
        }
        return null;
    }

    public static int getValueByString(String str) {
        if (valueMap.containsKey(str)) {
            return valueMap.get(str).intValue();
        }
        return -1;
    }

    public static ppc valueOf(String str) {
        return (ppc) Enum.valueOf(ppc.class, str);
    }

    public static ppc[] values() {
        return (ppc[]) a.clone();
    }
}
