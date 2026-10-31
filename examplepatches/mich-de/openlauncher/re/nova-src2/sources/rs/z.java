package rs;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public static final z f86331a;

    /* renamed from: b, reason: collision with root package name */
    public static final z f86332b;

    /* renamed from: c, reason: collision with root package name */
    public static final z f86333c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ z[] f86334d;

    static {
        z zVar = new z("Email", 0);
        f86331a = zVar;
        z zVar2 = new z("Phone", 1);
        f86332b = zVar2;
        z zVar3 = new z("Name", 2);
        f86333c = zVar3;
        z[] zVarArr = {zVar, zVar2, zVar3};
        f86334d = zVarArr;
        EnumEntriesKt.a(zVarArr);
    }

    public static z valueOf(String str) {
        return (z) Enum.valueOf(z.class, str);
    }

    public static z[] values() {
        return (z[]) f86334d.clone();
    }
}
