package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w9e {
    public static final w9e ALL_ACTIVITIES;
    public static final w9e CLAPS;
    public static final w9e HIGHLIGHTS;
    public static final w9e RESPONSES;
    public static final /* synthetic */ w9e[] a;
    public static final /* synthetic */ i04 b;

    static {
        w9e w9eVar = new w9e("ALL_ACTIVITIES", 0);
        ALL_ACTIVITIES = w9eVar;
        w9e w9eVar2 = new w9e("CLAPS", 1);
        CLAPS = w9eVar2;
        w9e w9eVar3 = new w9e("RESPONSES", 2);
        RESPONSES = w9eVar3;
        w9e w9eVar4 = new w9e("HIGHLIGHTS", 3);
        HIGHLIGHTS = w9eVar4;
        w9e[] w9eVarArr = {w9eVar, w9eVar2, w9eVar3, w9eVar4};
        a = w9eVarArr;
        b = new i04(w9eVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static w9e valueOf(String str) {
        return (w9e) Enum.valueOf(w9e.class, str);
    }

    public static w9e[] values() {
        return (w9e[]) a.clone();
    }
}
