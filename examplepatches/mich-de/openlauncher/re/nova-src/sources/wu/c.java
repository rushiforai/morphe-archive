package wu;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static final c f94689b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f94690c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f94691d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ c[] f94692e;

    /* renamed from: a, reason: collision with root package name */
    public final ft.d f94693a;

    static {
        c cVar = new c(0, ft.d.f55925c, "RequestReuse");
        f94689b = cVar;
        c cVar2 = new c(1, ft.d.f55926d, "RequestNoReuse");
        f94690c = cVar2;
        c cVar3 = new c(2, null, "NoRequest");
        f94691d = cVar3;
        c[] cVarArr = {cVar, cVar2, cVar3};
        f94692e = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public c(int i5, ft.d dVar, String str) {
        this.f94693a = dVar;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f94692e.clone();
    }
}
