package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ w0[] f56067a;

    static {
        w0[] w0VarArr = {new w0("EMAIL", 0, "EMAIL"), new w0("SMS", 1, "SMS")};
        f56067a = w0VarArr;
        EnumEntriesKt.a(w0VarArr);
    }

    public w0(String str, int i5, String str2) {
    }

    public static w0 valueOf(String str) {
        return (w0) Enum.valueOf(w0.class, str);
    }

    public static w0[] values() {
        return (w0[]) f56067a.clone();
    }
}
