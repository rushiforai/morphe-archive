package kr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ i[] f72141a;

    static {
        i[] iVarArr = {new i("Add", 0), new i("Edit", 1)};
        f72141a = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f72141a.clone();
    }
}
