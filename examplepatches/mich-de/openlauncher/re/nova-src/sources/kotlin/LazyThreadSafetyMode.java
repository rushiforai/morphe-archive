package kotlin;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/LazyThreadSafetyMode;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyThreadSafetyMode {

    /* renamed from: a, reason: collision with root package name */
    public static final LazyThreadSafetyMode f71679a;

    /* renamed from: b, reason: collision with root package name */
    public static final LazyThreadSafetyMode f71680b;

    /* renamed from: c, reason: collision with root package name */
    public static final LazyThreadSafetyMode f71681c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ LazyThreadSafetyMode[] f71682d;

    static {
        LazyThreadSafetyMode lazyThreadSafetyMode = new LazyThreadSafetyMode("SYNCHRONIZED", 0);
        f71679a = lazyThreadSafetyMode;
        LazyThreadSafetyMode lazyThreadSafetyMode2 = new LazyThreadSafetyMode("PUBLICATION", 1);
        f71680b = lazyThreadSafetyMode2;
        LazyThreadSafetyMode lazyThreadSafetyMode3 = new LazyThreadSafetyMode("NONE", 2);
        f71681c = lazyThreadSafetyMode3;
        LazyThreadSafetyMode[] lazyThreadSafetyModeArr = {lazyThreadSafetyMode, lazyThreadSafetyMode2, lazyThreadSafetyMode3};
        f71682d = lazyThreadSafetyModeArr;
        EnumEntriesKt.a(lazyThreadSafetyModeArr);
    }

    public static LazyThreadSafetyMode valueOf(String str) {
        return (LazyThreadSafetyMode) Enum.valueOf(LazyThreadSafetyMode.class, str);
    }

    public static LazyThreadSafetyMode[] values() {
        return (LazyThreadSafetyMode[]) f71682d.clone();
    }
}
