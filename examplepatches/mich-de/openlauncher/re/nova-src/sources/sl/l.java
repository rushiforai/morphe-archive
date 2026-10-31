package sl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public static final l f87516a;

    /* renamed from: b, reason: collision with root package name */
    public static final l f87517b;

    /* renamed from: c, reason: collision with root package name */
    public static final l f87518c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ l[] f87519d;

    /* JADX INFO: Fake field, exist only in values array */
    l EF0;

    static {
        l lVar = new l("SHA1", 0);
        l lVar2 = new l("SHA224", 1);
        l lVar3 = new l("SHA256", 2);
        f87516a = lVar3;
        l lVar4 = new l("SHA384", 3);
        f87517b = lVar4;
        l lVar5 = new l("SHA512", 4);
        f87518c = lVar5;
        f87519d = new l[]{lVar, lVar2, lVar3, lVar4, lVar5};
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f87519d.clone();
    }
}
