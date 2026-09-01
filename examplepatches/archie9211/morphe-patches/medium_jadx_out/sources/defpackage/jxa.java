package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jxa {
    public static final jxa ALLOW;
    public static final jxa PREVENT;
    public static final jxa PREVENT_WHEN_EMPTY;
    public static final /* synthetic */ jxa[] a;

    public static jxa valueOf(String str) {
        return (jxa) Enum.valueOf(jxa.class, str);
    }

    public static jxa[] values() {
        return (jxa[]) a.clone();
    }

    static {
        jxa jxaVar = new jxa(uuLAxLN.tvpsP, 0);
        ALLOW = jxaVar;
        jxa jxaVar2 = new jxa("PREVENT_WHEN_EMPTY", 1);
        PREVENT_WHEN_EMPTY = jxaVar2;
        jxa jxaVar3 = new jxa("PREVENT", 2);
        PREVENT = jxaVar3;
        a = new jxa[]{jxaVar, jxaVar2, jxaVar3};
    }
}
