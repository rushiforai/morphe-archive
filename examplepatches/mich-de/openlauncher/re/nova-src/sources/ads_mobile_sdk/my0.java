package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class my0 {

    /* renamed from: b, reason: collision with root package name */
    public static final my0 f7373b;

    /* renamed from: c, reason: collision with root package name */
    public static final my0 f7374c;

    /* renamed from: d, reason: collision with root package name */
    public static final my0 f7375d;

    /* renamed from: e, reason: collision with root package name */
    public static final my0 f7376e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ my0[] f7377f;

    /* renamed from: a, reason: collision with root package name */
    public final int f7378a;

    static {
        my0 my0Var = new my0("UNKNOWN", 0, 0);
        f7373b = my0Var;
        my0 my0Var2 = new my0("PLAYING", 1, 1);
        f7374c = my0Var2;
        my0 my0Var3 = new my0("PAUSED", 2, 2);
        f7375d = my0Var3;
        my0 my0Var4 = new my0("ENDED", 3, 3);
        f7376e = my0Var4;
        my0[] my0VarArr = {my0Var, my0Var2, my0Var3, my0Var4, new my0("READY", 4, 5)};
        f7377f = my0VarArr;
        EnumEntriesKt.a(my0VarArr);
    }

    public my0(String str, int i5, int i11) {
        this.f7378a = i11;
    }

    public static my0[] values() {
        return (my0[]) f7377f.clone();
    }
}
