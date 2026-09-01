package defpackage;

import androidx.work.impl.yX.VrhD;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vvd {
    public static final vvd CHECK_ONLY_LOWER;
    public static final vvd CHECK_SUBTYPE_AND_LOWER;
    public static final vvd SKIP_LOWER;
    public static final /* synthetic */ vvd[] a;

    public static vvd valueOf(String str) {
        return (vvd) Enum.valueOf(vvd.class, str);
    }

    public static vvd[] values() {
        return (vvd[]) a.clone();
    }

    static {
        vvd vvdVar = new vvd("CHECK_ONLY_LOWER", 0);
        CHECK_ONLY_LOWER = vvdVar;
        vvd vvdVar2 = new vvd("CHECK_SUBTYPE_AND_LOWER", 1);
        CHECK_SUBTYPE_AND_LOWER = vvdVar2;
        vvd vvdVar3 = new vvd(VrhD.IIlPFmVq, 2);
        SKIP_LOWER = vvdVar3;
        a = new vvd[]{vvdVar, vvdVar2, vvdVar3};
    }
}
