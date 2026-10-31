package dq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final f f49325b;

    /* renamed from: c, reason: collision with root package name */
    public static final f f49326c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ f[] f49327d;

    /* renamed from: a, reason: collision with root package name */
    public final String f49328a;

    static {
        f fVar = new f("Launcher", 0, "android/stripe-launcher");
        f49325b = fVar;
        f fVar2 = new f("Manual", 1, "android/stripe-manual-api");
        f fVar3 = new f("Elements", 2, "android/stripe-elements");
        f49326c = fVar3;
        f[] fVarArr = {fVar, fVar2, fVar3};
        f49327d = fVarArr;
        EnumEntriesKt.a(fVarArr);
    }

    public f(String str, int i5, String str2) {
        this.f49328a = str2;
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f49327d.clone();
    }
}
