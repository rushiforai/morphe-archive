package kotlin;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/DeprecationLevel;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class DeprecationLevel {

    /* renamed from: a, reason: collision with root package name */
    public static final DeprecationLevel f71671a;

    /* renamed from: b, reason: collision with root package name */
    public static final DeprecationLevel f71672b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ DeprecationLevel[] f71673c;

    static {
        DeprecationLevel deprecationLevel = new DeprecationLevel("WARNING", 0);
        f71671a = deprecationLevel;
        DeprecationLevel deprecationLevel2 = new DeprecationLevel("ERROR", 1);
        f71672b = deprecationLevel2;
        DeprecationLevel[] deprecationLevelArr = {deprecationLevel, deprecationLevel2, new DeprecationLevel("HIDDEN", 2)};
        f71673c = deprecationLevelArr;
        EnumEntriesKt.a(deprecationLevelArr);
    }

    public static DeprecationLevel valueOf(String str) {
        return (DeprecationLevel) Enum.valueOf(DeprecationLevel.class, str);
    }

    public static DeprecationLevel[] values() {
        return (DeprecationLevel[]) f71673c.clone();
    }
}
