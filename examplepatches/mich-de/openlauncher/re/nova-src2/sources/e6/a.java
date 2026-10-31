package e6;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f52197a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f52198b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f52199c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f52200d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f52201e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f52202f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f52203g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f52204h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f52205i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ a[] f52206j;

    static {
        a aVar = new a("PENALTY_LOG", 0);
        f52197a = aVar;
        a aVar2 = new a("PENALTY_DEATH", 1);
        f52198b = aVar2;
        a aVar3 = new a("DETECT_FRAGMENT_REUSE", 2);
        f52199c = aVar3;
        a aVar4 = new a("DETECT_FRAGMENT_TAG_USAGE", 3);
        f52200d = aVar4;
        a aVar5 = new a("DETECT_WRONG_NESTED_HIERARCHY", 4);
        f52201e = aVar5;
        a aVar6 = new a("DETECT_RETAIN_INSTANCE_USAGE", 5);
        f52202f = aVar6;
        a aVar7 = new a("DETECT_SET_USER_VISIBLE_HINT", 6);
        f52203g = aVar7;
        a aVar8 = new a("DETECT_TARGET_FRAGMENT_USAGE", 7);
        f52204h = aVar8;
        a aVar9 = new a("DETECT_WRONG_FRAGMENT_CONTAINER", 8);
        f52205i = aVar9;
        f52206j = new a[]{aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9};
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f52206j.clone();
    }
}
