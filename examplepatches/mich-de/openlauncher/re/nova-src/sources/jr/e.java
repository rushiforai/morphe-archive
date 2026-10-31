package jr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ e[] f69656a;

    static {
        e[] eVarArr = {new e("CustomerAdapter", 0), new e("CustomerSession", 1)};
        f69656a = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f69656a.clone();
    }
}
