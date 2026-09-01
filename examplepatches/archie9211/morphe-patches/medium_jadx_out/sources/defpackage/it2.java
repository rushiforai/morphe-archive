package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class it2 implements gm8 {
    public static final it2 COLLECTION_DISABLED;
    public static final it2 COLLECTION_DISABLED_REMOTE;
    public static final it2 COLLECTION_ENABLED;
    public static final it2 COLLECTION_SAMPLED;
    public static final it2 COLLECTION_SDK_NOT_INSTALLED;
    public static final it2 COLLECTION_UNKNOWN;
    public static final /* synthetic */ it2[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        it2 it2Var = new it2("COLLECTION_UNKNOWN", 0, 0);
        COLLECTION_UNKNOWN = it2Var;
        it2 it2Var2 = new it2("COLLECTION_SDK_NOT_INSTALLED", 1, 1);
        COLLECTION_SDK_NOT_INSTALLED = it2Var2;
        it2 it2Var3 = new it2("COLLECTION_ENABLED", 2, 2);
        COLLECTION_ENABLED = it2Var3;
        it2 it2Var4 = new it2("COLLECTION_DISABLED", 3, 3);
        COLLECTION_DISABLED = it2Var4;
        it2 it2Var5 = new it2("COLLECTION_DISABLED_REMOTE", 4, 4);
        COLLECTION_DISABLED_REMOTE = it2Var5;
        it2 it2Var6 = new it2("COLLECTION_SAMPLED", 5, 5);
        COLLECTION_SAMPLED = it2Var6;
        it2[] it2VarArr = {it2Var, it2Var2, it2Var3, it2Var4, it2Var5, it2Var6};
        b = it2VarArr;
        c = new i04(it2VarArr);
    }

    public it2(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static it2 valueOf(String str) {
        return (it2) Enum.valueOf(it2.class, str);
    }

    public static it2[] values() {
        return (it2[]) b.clone();
    }

    @Override // defpackage.gm8
    public int getNumber() {
        return this.a;
    }
}
