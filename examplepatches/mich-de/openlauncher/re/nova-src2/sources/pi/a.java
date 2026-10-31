package pi;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f82594a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f82595b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f82596c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f82597d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f82598e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ a[] f82599f;

    static {
        a aVar = new a("NOT_STARTED", 0);
        f82594a = aVar;
        a aVar2 = new a("INITIALIZING", 1);
        f82595b = aVar2;
        a aVar3 = new a("COMPLETE", 2);
        f82596c = aVar3;
        a aVar4 = new a("TIMED_OUT", 3);
        f82597d = aVar4;
        a aVar5 = new a("FAILED", 4);
        f82598e = aVar5;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5};
        f82599f = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a[] values() {
        return (a[]) f82599f.clone();
    }
}
