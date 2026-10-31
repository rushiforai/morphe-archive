package c0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f18834a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f18835b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ j[] f18836c;

    static {
        j jVar = new j("BoundReached", 0);
        f18834a = jVar;
        j jVar2 = new j("Finished", 1);
        f18835b = jVar2;
        j[] jVarArr = {jVar, jVar2};
        f18836c = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f18836c.clone();
    }
}
