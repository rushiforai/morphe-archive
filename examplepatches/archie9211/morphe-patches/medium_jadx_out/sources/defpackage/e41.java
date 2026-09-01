package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e41 {
    public static final e41 DECLARATION;
    public static final e41 DELEGATION;
    public static final e41 FAKE_OVERRIDE;
    public static final e41 SYNTHESIZED;
    public static final /* synthetic */ e41[] a;

    static {
        e41 e41Var = new e41("DECLARATION", 0);
        DECLARATION = e41Var;
        e41 e41Var2 = new e41("FAKE_OVERRIDE", 1);
        FAKE_OVERRIDE = e41Var2;
        e41 e41Var3 = new e41("DELEGATION", 2);
        DELEGATION = e41Var3;
        e41 e41Var4 = new e41("SYNTHESIZED", 3);
        SYNTHESIZED = e41Var4;
        a = new e41[]{e41Var, e41Var2, e41Var3, e41Var4};
    }

    public static e41 valueOf(String str) {
        return (e41) Enum.valueOf(e41.class, str);
    }

    public static e41[] values() {
        return (e41[]) a.clone();
    }

    public boolean isReal() {
        return this != FAKE_OVERRIDE;
    }
}
