package fr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class s0 {

    /* renamed from: b, reason: collision with root package name */
    public static final s0 f55700b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ s0[] f55701c;

    /* renamed from: a, reason: collision with root package name */
    public final String f55702a;

    static {
        s0 s0Var = new s0("Form", 0, "application/x-www-form-urlencoded");
        f55700b = s0Var;
        s0[] s0VarArr = {s0Var, new s0("MultipartForm", 1, "multipart/form-data"), new s0("Json", 2, "application/json")};
        f55701c = s0VarArr;
        EnumEntriesKt.a(s0VarArr);
    }

    public s0(String str, int i5, String str2) {
        this.f55702a = str2;
    }

    public static s0 valueOf(String str) {
        return (s0) Enum.valueOf(s0.class, str);
    }

    public static s0[] values() {
        return (s0[]) f55701c.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f55702a;
    }
}
