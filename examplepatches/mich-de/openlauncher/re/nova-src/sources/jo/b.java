package jo;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f69616a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f69617b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f69618c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f69619d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f69620e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ b[] f69621f;

    static {
        b bVar = new b("OK", 0);
        f69616a = bVar;
        b bVar2 = new b("ERROR", 1);
        f69617b = bVar2;
        b bVar3 = new b("NEEDS_INPUT", 2);
        f69618c = bVar3;
        b bVar4 = new b("NO_HANDLER", 3);
        f69619d = bVar4;
        b bVar5 = new b("PERMISSION_DENIED", 4);
        b bVar6 = new b("TIMEOUT", 5);
        b bVar7 = new b("BACKGROUND_BLOCKED", 6);
        f69620e = bVar7;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5, bVar6, bVar7};
        f69621f = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f69621f.clone();
    }
}
