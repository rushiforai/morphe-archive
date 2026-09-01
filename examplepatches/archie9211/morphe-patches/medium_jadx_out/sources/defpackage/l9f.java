package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l9f {
    public static final l9f Binary;
    public static final l9f Text;
    public static final /* synthetic */ l9f[] a;
    public static final /* synthetic */ i04 b;

    static {
        l9f l9fVar = new l9f("Text", 0);
        Text = l9fVar;
        l9f l9fVar2 = new l9f("Binary", 1);
        Binary = l9fVar2;
        l9f[] l9fVarArr = {l9fVar, l9fVar2};
        a = l9fVarArr;
        b = new i04(l9fVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static l9f valueOf(String str) {
        return (l9f) Enum.valueOf(l9f.class, str);
    }

    public static l9f[] values() {
        return (l9f[]) a.clone();
    }
}
