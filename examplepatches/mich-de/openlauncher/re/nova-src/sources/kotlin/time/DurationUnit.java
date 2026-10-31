package kotlin.time;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.WasExperimental;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@SinceKotlin
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/time/DurationUnit;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes.dex */
public final class DurationUnit {

    /* renamed from: b, reason: collision with root package name */
    public static final DurationUnit f72043b;

    /* renamed from: c, reason: collision with root package name */
    public static final DurationUnit f72044c;

    /* renamed from: d, reason: collision with root package name */
    public static final DurationUnit f72045d;

    /* renamed from: e, reason: collision with root package name */
    public static final DurationUnit f72046e;

    /* renamed from: f, reason: collision with root package name */
    public static final DurationUnit f72047f;

    /* renamed from: g, reason: collision with root package name */
    public static final DurationUnit f72048g;

    /* renamed from: h, reason: collision with root package name */
    public static final DurationUnit f72049h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ DurationUnit[] f72050i;

    /* renamed from: a, reason: collision with root package name */
    public final TimeUnit f72051a;

    static {
        DurationUnit durationUnit = new DurationUnit("NANOSECONDS", 0, TimeUnit.NANOSECONDS);
        f72043b = durationUnit;
        DurationUnit durationUnit2 = new DurationUnit("MICROSECONDS", 1, TimeUnit.MICROSECONDS);
        f72044c = durationUnit2;
        DurationUnit durationUnit3 = new DurationUnit("MILLISECONDS", 2, TimeUnit.MILLISECONDS);
        f72045d = durationUnit3;
        DurationUnit durationUnit4 = new DurationUnit("SECONDS", 3, TimeUnit.SECONDS);
        f72046e = durationUnit4;
        DurationUnit durationUnit5 = new DurationUnit("MINUTES", 4, TimeUnit.MINUTES);
        f72047f = durationUnit5;
        DurationUnit durationUnit6 = new DurationUnit("HOURS", 5, TimeUnit.HOURS);
        f72048g = durationUnit6;
        DurationUnit durationUnit7 = new DurationUnit("DAYS", 6, TimeUnit.DAYS);
        f72049h = durationUnit7;
        DurationUnit[] durationUnitArr = {durationUnit, durationUnit2, durationUnit3, durationUnit4, durationUnit5, durationUnit6, durationUnit7};
        f72050i = durationUnitArr;
        EnumEntriesKt.a(durationUnitArr);
    }

    public DurationUnit(String str, int i5, TimeUnit timeUnit) {
        this.f72051a = timeUnit;
    }

    public static DurationUnit valueOf(String str) {
        return (DurationUnit) Enum.valueOf(DurationUnit.class, str);
    }

    public static DurationUnit[] values() {
        return (DurationUnit[]) f72050i.clone();
    }
}
