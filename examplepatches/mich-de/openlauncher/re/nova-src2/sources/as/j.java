package as;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j {

    /* renamed from: b, reason: collision with root package name */
    public static final j f15611b;

    /* renamed from: c, reason: collision with root package name */
    public static final j f15612c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ j[] f15613d;

    /* renamed from: a, reason: collision with root package name */
    public final int f15614a;

    static {
        j jVar = new j("Production", 0, 1);
        f15611b = jVar;
        j jVar2 = new j("Test", 1, 3);
        f15612c = jVar2;
        j[] jVarArr = {jVar, jVar2};
        f15613d = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public j(String str, int i5, int i11) {
        this.f15614a = i11;
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f15613d.clone();
    }
}
