package sd;

import android.util.SparseArray;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f87203a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ n0[] f87204b;

    static {
        n0 n0Var = new n0("DEFAULT", 0);
        f87203a = n0Var;
        n0 n0Var2 = new n0("UNMETERED_ONLY", 1);
        n0 n0Var3 = new n0("UNMETERED_OR_DAILY", 2);
        n0 n0Var4 = new n0("FAST_IF_RADIO_AWAKE", 3);
        n0 n0Var5 = new n0("NEVER", 4);
        n0 n0Var6 = new n0("UNRECOGNIZED", 5);
        f87204b = new n0[]{n0Var, n0Var2, n0Var3, n0Var4, n0Var5, n0Var6};
        SparseArray sparseArray = new SparseArray();
        sparseArray.put(0, n0Var);
        sparseArray.put(1, n0Var2);
        sparseArray.put(2, n0Var3);
        sparseArray.put(3, n0Var4);
        sparseArray.put(4, n0Var5);
        sparseArray.put(-1, n0Var6);
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f87204b.clone();
    }
}
