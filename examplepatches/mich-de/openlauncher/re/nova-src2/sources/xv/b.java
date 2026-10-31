package xv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final w.a f96418b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f96419c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ b[] f96420d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f96421e;

    /* renamed from: a, reason: collision with root package name */
    public final String f96422a;

    static {
        b bVar = new b("ThreeDsSdk", 0, "C");
        f96419c = bVar;
        b[] bVarArr = {bVar, new b("ThreeDsServer", 1, "S"), new b("DirectoryServer", 2, "D"), new b("Acs", 3, "A")};
        f96420d = bVarArr;
        f96421e = EnumEntriesKt.a(bVarArr);
        f96418b = new w.a();
    }

    public b(String str, int i5, String str2) {
        this.f96422a = str2;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f96420d.clone();
    }
}
