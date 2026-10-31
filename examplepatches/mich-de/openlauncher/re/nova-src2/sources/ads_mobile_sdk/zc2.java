package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class zc2 {

    /* renamed from: a, reason: collision with root package name */
    public static final zc2 f12516a;

    /* renamed from: b, reason: collision with root package name */
    public static final zc2 f12517b;

    /* renamed from: c, reason: collision with root package name */
    public static final zc2 f12518c;

    /* renamed from: d, reason: collision with root package name */
    public static final zc2 f12519d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ zc2[] f12520e;

    static {
        zc2 zc2Var = new zc2("SUCCESS", 0);
        f12516a = zc2Var;
        zc2 zc2Var2 = new zc2("FAILURE", 1);
        f12517b = zc2Var2;
        zc2 zc2Var3 = new zc2("RETRY", 2);
        f12518c = zc2Var3;
        zc2 zc2Var4 = new zc2("CACHE_DISABLED", 3);
        f12519d = zc2Var4;
        zc2[] zc2VarArr = {zc2Var, zc2Var2, zc2Var3, zc2Var4};
        f12520e = zc2VarArr;
        EnumEntriesKt.a(zc2VarArr);
    }

    public static zc2[] values() {
        return (zc2[]) f12520e.clone();
    }
}
