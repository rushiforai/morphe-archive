package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class lj3 {
    public static final lj3 DOWNLOADED;
    public static final lj3 DOWNLOADED_DISABLED;
    public static final lj3 DOWNLOADING;
    public static final lj3 NOT_DOWNLOADED;
    public static final lj3 NOT_DOWNLOADED_DISABLED;
    public static final /* synthetic */ lj3[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static lj3 valueOf(String str) {
        return (lj3) Enum.valueOf(lj3.class, str);
    }

    public static lj3[] values() {
        return (lj3[]) a.clone();
    }

    static {
        lj3 lj3Var = new lj3("NOT_DOWNLOADED", 0);
        NOT_DOWNLOADED = lj3Var;
        lj3 lj3Var2 = new lj3(uuLAxLN.jRFaLlvS, 1);
        NOT_DOWNLOADED_DISABLED = lj3Var2;
        lj3 lj3Var3 = new lj3("DOWNLOADING", 2);
        DOWNLOADING = lj3Var3;
        lj3 lj3Var4 = new lj3("DOWNLOADED", 3);
        DOWNLOADED = lj3Var4;
        lj3 lj3Var5 = new lj3("DOWNLOADED_DISABLED", 4);
        DOWNLOADED_DISABLED = lj3Var5;
        lj3[] lj3VarArr = {lj3Var, lj3Var2, lj3Var3, lj3Var4, lj3Var5};
        a = lj3VarArr;
        b = new i04(lj3VarArr);
    }
}
