package defpackage;

import scalapb.options.hI.AEVqIoD;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zi7 {
    public static final zi7 MASK_MODE_ADD;
    public static final zi7 MASK_MODE_INTERSECT;
    public static final zi7 MASK_MODE_NONE;
    public static final zi7 MASK_MODE_SUBTRACT;
    public static final /* synthetic */ zi7[] a;

    public static zi7 valueOf(String str) {
        return (zi7) Enum.valueOf(zi7.class, str);
    }

    public static zi7[] values() {
        return (zi7[]) a.clone();
    }

    static {
        zi7 zi7Var = new zi7("MASK_MODE_ADD", 0);
        MASK_MODE_ADD = zi7Var;
        zi7 zi7Var2 = new zi7("MASK_MODE_SUBTRACT", 1);
        MASK_MODE_SUBTRACT = zi7Var2;
        zi7 zi7Var3 = new zi7(AEVqIoD.nbtQYrCukWlZYM, 2);
        MASK_MODE_INTERSECT = zi7Var3;
        zi7 zi7Var4 = new zi7("MASK_MODE_NONE", 3);
        MASK_MODE_NONE = zi7Var4;
        a = new zi7[]{zi7Var, zi7Var2, zi7Var3, zi7Var4};
    }
}
