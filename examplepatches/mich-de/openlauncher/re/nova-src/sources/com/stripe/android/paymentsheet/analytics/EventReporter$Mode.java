package com.stripe.android.paymentsheet.analytics;

import androidx.annotation.Keep;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001J\u000f\u0010\u0004\u001a\u00020\u0003H\u0017¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"com/stripe/android/paymentsheet/analytics/EventReporter$Mode", b.f42142b, "Lcom/stripe/android/paymentsheet/analytics/EventReporter$Mode;", b.f42142b, "toString", "()Ljava/lang/String;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class EventReporter$Mode {

    /* renamed from: b, reason: collision with root package name */
    public static final EventReporter$Mode f44777b;

    /* renamed from: c, reason: collision with root package name */
    public static final EventReporter$Mode f44778c;

    /* renamed from: d, reason: collision with root package name */
    public static final EventReporter$Mode f44779d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EventReporter$Mode[] f44780e;

    /* renamed from: a, reason: collision with root package name */
    public final String f44781a;

    static {
        EventReporter$Mode eventReporter$Mode = new EventReporter$Mode("Complete", 0, "complete");
        f44777b = eventReporter$Mode;
        EventReporter$Mode eventReporter$Mode2 = new EventReporter$Mode("Custom", 1, "custom");
        f44778c = eventReporter$Mode2;
        EventReporter$Mode eventReporter$Mode3 = new EventReporter$Mode("Embedded", 2, "embedded");
        f44779d = eventReporter$Mode3;
        EventReporter$Mode[] eventReporter$ModeArr = {eventReporter$Mode, eventReporter$Mode2, eventReporter$Mode3};
        f44780e = eventReporter$ModeArr;
        EnumEntriesKt.a(eventReporter$ModeArr);
    }

    public EventReporter$Mode(String str, int i5, String str2) {
        this.f44781a = str2;
    }

    public static EventReporter$Mode valueOf(String str) {
        return (EventReporter$Mode) Enum.valueOf(EventReporter$Mode.class, str);
    }

    public static EventReporter$Mode[] values() {
        return (EventReporter$Mode[]) f44780e.clone();
    }

    @Override // java.lang.Enum
    @Keep
    @NotNull
    public String toString() {
        return this.f44781a;
    }
}
