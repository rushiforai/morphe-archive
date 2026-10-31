package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final s f9366b;

    /* renamed from: c, reason: collision with root package name */
    public static final s f9367c;

    /* renamed from: d, reason: collision with root package name */
    public static final s f9368d;

    /* renamed from: e, reason: collision with root package name */
    public static final s f9369e;

    /* renamed from: f, reason: collision with root package name */
    public static final s f9370f;

    /* renamed from: g, reason: collision with root package name */
    public static final s f9371g;

    /* renamed from: h, reason: collision with root package name */
    public static final s f9372h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ s[] f9373i;

    /* renamed from: a, reason: collision with root package name */
    public final int f9374a;

    static {
        s sVar = new s("NONE", 0, -2);
        f9366b = sVar;
        s sVar2 = new s("STOPPED", 1, -1);
        f9367c = sVar2;
        s sVar3 = new s("PAUSED", 2, 0);
        f9368d = sVar3;
        s sVar4 = new s("CREATED", 3, 1);
        f9369e = sVar4;
        s sVar5 = new s("INITIAL", 4, 2);
        f9370f = sVar5;
        s sVar6 = new s("STARTED", 5, 3);
        f9371g = sVar6;
        s sVar7 = new s("RESUMED", 6, 4);
        f9372h = sVar7;
        s[] sVarArr = {sVar, sVar2, sVar3, sVar4, sVar5, sVar6, sVar7};
        f9373i = sVarArr;
        EnumEntriesKt.a(sVarArr);
    }

    public s(String str, int i5, int i11) {
        this.f9374a = i11;
    }

    public static s[] values() {
        return (s[]) f9373i.clone();
    }
}
