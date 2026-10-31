package bn;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class o implements im.f {

    /* renamed from: b, reason: collision with root package name */
    public static final o f18253b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o[] f18254c;

    /* renamed from: a, reason: collision with root package name */
    public final int f18255a;

    static {
        o oVar = new o("EVENT_TYPE_UNKNOWN", 0, 0);
        o oVar2 = new o("SESSION_START", 1, 1);
        f18253b = oVar2;
        o[] oVarArr = {oVar, oVar2};
        f18254c = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public o(String str, int i5, int i11) {
        this.f18255a = i11;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f18254c.clone();
    }

    @Override // im.f
    public final int getNumber() {
        return this.f18255a;
    }
}
