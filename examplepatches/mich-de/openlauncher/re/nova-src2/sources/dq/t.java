package dq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ t[] f49369a;

    static {
        t[] tVarArr = {new t("WeChatPayV1", 0)};
        f49369a = tVarArr;
        EnumEntriesKt.a(tVarArr);
    }

    public static t valueOf(String str) {
        return (t) Enum.valueOf(t.class, str);
    }

    public static t[] values() {
        return (t[]) f49369a.clone();
    }
}
