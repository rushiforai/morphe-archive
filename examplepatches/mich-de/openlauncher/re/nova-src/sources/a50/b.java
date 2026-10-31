package a50;

import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    @NotNull
    public static final a Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final b f400a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f401b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f402c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f403d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b[] f404e;

    static {
        b bVar = new b("DEBUG", 0);
        f400a = bVar;
        b bVar2 = new b("INFO", 1);
        f401b = bVar2;
        b bVar3 = new b("WARN", 2);
        f402c = bVar3;
        b bVar4 = new b("ERROR", 3);
        f403d = bVar4;
        f404e = new b[]{bVar, bVar2, bVar3, bVar4};
        Companion = new a();
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f404e.clone();
    }
}
