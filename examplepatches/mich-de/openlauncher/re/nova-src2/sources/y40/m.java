package y40;

import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m {

    @NotNull
    public static final l Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final m f96675a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f96676b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ m[] f96677c;

    static {
        m mVar = new m("DEFAULT", 0);
        f96675a = mVar;
        m mVar2 = new m("APP_IS_DOZE_EXEMPT", 1);
        m mVar3 = new m("NO_TASK_WHEN_OFFLINE", 2);
        m mVar4 = new m("NO_WAKE_LOCK_HOLD", 3);
        f96676b = mVar4;
        f96677c = new m[]{mVar, mVar2, mVar3, mVar4};
        Companion = new l();
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f96677c.clone();
    }
}
