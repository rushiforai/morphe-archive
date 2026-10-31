package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class sl0 {

    /* renamed from: b, reason: collision with root package name */
    public static final sl0 f9598b;

    /* renamed from: e, reason: collision with root package name */
    public static final sl0 f9599e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ sl0[] f9600f;

    /* renamed from: a, reason: collision with root package name */
    public final String f9601a;

    static {
        sl0 sl0Var = new sl0(0, "INTERNAL_ERROR", "Internal error.");
        f9598b = sl0Var;
        sl0 sl0Var2 = new sl0(1, "NO_FILL_ERROR", "No fill.");
        sl0 sl0Var3 = new sl0(2, "TIMEOUT_ERROR", "Operation timed out.");
        sl0 sl0Var4 = new sl0(3, "WEB_VIEW_DESTROYED_ERROR", "The system WebView required for this operation was terminated.");
        f9599e = sl0Var4;
        sl0[] sl0VarArr = {sl0Var, sl0Var2, sl0Var3, sl0Var4};
        f9600f = sl0VarArr;
        EnumEntriesKt.a(sl0VarArr);
    }

    public sl0(int i5, String str, String str2) {
        this.f9601a = str2;
    }

    public static sl0[] values() {
        return (sl0[]) f9600f.clone();
    }

    public final String a() {
        return this.f9601a;
    }
}
