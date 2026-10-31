package r80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public static final z f85741a;

    /* renamed from: b, reason: collision with root package name */
    public static final z f85742b;

    /* renamed from: c, reason: collision with root package name */
    public static final z f85743c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ z[] f85744d;

    static {
        z zVar = new z("RECENCY", 0);
        f85741a = zVar;
        z zVar2 = new z("PLAIN_REQUENCY", 1);
        f85742b = zVar2;
        z zVar3 = new z("GHOST_REQUENCY", 2);
        f85743c = zVar3;
        z[] zVarArr = {zVar, zVar2, zVar3};
        f85744d = zVarArr;
        EnumEntriesKt.a(zVarArr);
    }

    public static z valueOf(String str) {
        return (z) Enum.valueOf(z.class, str);
    }

    public static z[] values() {
        return (z[]) f85744d.clone();
    }
}
