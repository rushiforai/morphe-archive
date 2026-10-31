package kt;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f72208a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ j[] f72209b;

    static {
        j jVar = new j("Continue", 0);
        j jVar2 = new j("Confirm", 1);
        f72208a = jVar2;
        j[] jVarArr = {jVar, jVar2};
        f72209b = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f72209b.clone();
    }
}
