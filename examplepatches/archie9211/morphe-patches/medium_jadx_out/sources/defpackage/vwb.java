package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vwb {
    public static final vwb EditableText;
    public static final vwb StaticText;
    public static final /* synthetic */ vwb[] a;
    public static final /* synthetic */ i04 b;

    static {
        vwb vwbVar = new vwb("EditableText", 0);
        EditableText = vwbVar;
        vwb vwbVar2 = new vwb("StaticText", 1);
        StaticText = vwbVar2;
        vwb[] vwbVarArr = {vwbVar, vwbVar2};
        a = vwbVarArr;
        b = new i04(vwbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static vwb valueOf(String str) {
        return (vwb) Enum.valueOf(vwb.class, str);
    }

    public static vwb[] values() {
        return (vwb[]) a.clone();
    }
}
