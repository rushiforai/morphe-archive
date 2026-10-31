package i2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ m0[] f61128a;

    static {
        m0[] m0VarArr = {new m0("CounterClockwise", 0), new m0("Clockwise", 1)};
        f61128a = m0VarArr;
        EnumEntriesKt.a(m0VarArr);
    }

    public static m0 valueOf(String str) {
        return (m0) Enum.valueOf(m0.class, str);
    }

    public static m0[] values() {
        return (m0[]) f61128a.clone();
    }
}
