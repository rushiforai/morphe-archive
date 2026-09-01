package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e7b {
    public static final e7b AI_GENERATED_CONTENT;
    public static final e7b HARASSMENT;
    public static final e7b RULES_VIOLATION;
    public static final e7b SPAM;
    public static final /* synthetic */ e7b[] a;
    public static final /* synthetic */ i04 b;

    static {
        e7b e7bVar = new e7b("HARASSMENT", 0);
        HARASSMENT = e7bVar;
        e7b e7bVar2 = new e7b("RULES_VIOLATION", 1);
        RULES_VIOLATION = e7bVar2;
        e7b e7bVar3 = new e7b("SPAM", 2);
        SPAM = e7bVar3;
        e7b e7bVar4 = new e7b("AI_GENERATED_CONTENT", 3);
        AI_GENERATED_CONTENT = e7bVar4;
        e7b[] e7bVarArr = {e7bVar, e7bVar2, e7bVar3, e7bVar4};
        a = e7bVarArr;
        b = new i04(e7bVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static e7b valueOf(String str) {
        return (e7b) Enum.valueOf(e7b.class, str);
    }

    public static e7b[] values() {
        return (e7b[]) a.clone();
    }
}
