package jo;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f69622a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f69623b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f69624c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f69625d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f69626e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ c[] f69627f;

    static {
        c cVar = new c("REGISTER", 0);
        f69622a = cVar;
        c cVar2 = new c("CALL_RECEIVED", 1);
        f69623b = cVar2;
        c cVar3 = new c("DISPATCH", 2);
        f69624c = cVar3;
        c cVar4 = new c("RESULT", 3);
        f69625d = cVar4;
        c cVar5 = new c("RENDER", 4);
        f69626e = cVar5;
        c[] cVarArr = {cVar, cVar2, cVar3, cVar4, cVar5};
        f69627f = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f69627f.clone();
    }
}
