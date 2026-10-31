package bn;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class w implements im.f {

    /* renamed from: b, reason: collision with root package name */
    public static final w f18303b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ w[] f18304c;

    /* renamed from: a, reason: collision with root package name */
    public final int f18305a;

    static {
        w wVar = new w("LOG_ENVIRONMENT_UNKNOWN", 0, 0);
        w wVar2 = new w("LOG_ENVIRONMENT_AUTOPUSH", 1, 1);
        w wVar3 = new w("LOG_ENVIRONMENT_STAGING", 2, 2);
        w wVar4 = new w("LOG_ENVIRONMENT_PROD", 3, 3);
        f18303b = wVar4;
        w[] wVarArr = {wVar, wVar2, wVar3, wVar4};
        f18304c = wVarArr;
        EnumEntriesKt.a(wVarArr);
    }

    public w(String str, int i5, int i11) {
        this.f18305a = i11;
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) f18304c.clone();
    }

    @Override // im.f
    public final int getNumber() {
        return this.f18305a;
    }
}
