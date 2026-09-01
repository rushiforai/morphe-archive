package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d24 {
    public static final d24 HOME;
    public static final d24 POST;
    public static final /* synthetic */ d24[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static d24 valueOf(String str) {
        return (d24) Enum.valueOf(d24.class, str);
    }

    public static d24[] values() {
        return (d24[]) a.clone();
    }

    static {
        d24 d24Var = new d24(peNPu.NydEOCVSelR, 0);
        HOME = d24Var;
        d24 d24Var2 = new d24("POST", 1);
        POST = d24Var2;
        d24[] d24VarArr = {d24Var, d24Var2};
        a = d24VarArr;
        b = new i04(d24VarArr);
    }
}
