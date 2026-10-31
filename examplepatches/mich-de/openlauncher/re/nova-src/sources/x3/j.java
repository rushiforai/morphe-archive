package x3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f95016a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f95017b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ j[] f95018c;

    static {
        j jVar = new j("Ltr", 0);
        f95016a = jVar;
        j jVar2 = new j("Rtl", 1);
        f95017b = jVar2;
        j[] jVarArr = {jVar, jVar2};
        f95018c = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f95018c.clone();
    }
}
