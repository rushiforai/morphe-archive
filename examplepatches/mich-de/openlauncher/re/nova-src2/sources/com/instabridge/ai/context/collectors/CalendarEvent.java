package com.instabridge.ai.context.collectors;

import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0014\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\u0003¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\bHÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003JG\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\b2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\rR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u0011R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/context/collectors/CalendarEvent;", b.f42142b, "title", b.f42142b, "startUtc", "endUtc", "location", "isAllDay", b.f42142b, "eventDate", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V", "getTitle", "()Ljava/lang/String;", "getStartUtc", "getEndUtc", "getLocation", "()Z", "getEventDate", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class CalendarEvent {
    public static final int $stable = 0;

    @NotNull
    private final String endUtc;

    @NotNull
    private final String eventDate;
    private final boolean isAllDay;

    @Nullable
    private final String location;

    @NotNull
    private final String startUtc;

    @NotNull
    private final String title;

    public CalendarEvent(@NotNull String title, @NotNull String startUtc, @NotNull String endUtc, @Nullable String str, boolean z11, @NotNull String eventDate) {
        Intrinsics.g(title, "title");
        Intrinsics.g(startUtc, "startUtc");
        Intrinsics.g(endUtc, "endUtc");
        Intrinsics.g(eventDate, "eventDate");
        this.title = title;
        this.startUtc = startUtc;
        this.endUtc = endUtc;
        this.location = str;
        this.isAllDay = z11;
        this.eventDate = eventDate;
    }

    public static /* synthetic */ CalendarEvent copy$default(CalendarEvent calendarEvent, String str, String str2, String str3, String str4, boolean z11, String str5, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = calendarEvent.title;
        }
        if ((i5 & 2) != 0) {
            str2 = calendarEvent.startUtc;
        }
        if ((i5 & 4) != 0) {
            str3 = calendarEvent.endUtc;
        }
        if ((i5 & 8) != 0) {
            str4 = calendarEvent.location;
        }
        if ((i5 & 16) != 0) {
            z11 = calendarEvent.isAllDay;
        }
        if ((i5 & 32) != 0) {
            str5 = calendarEvent.eventDate;
        }
        boolean z12 = z11;
        String str6 = str5;
        return calendarEvent.copy(str, str2, str3, str4, z12, str6);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getStartUtc() {
        return this.startUtc;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getEndUtc() {
        return this.endUtc;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getLocation() {
        return this.location;
    }

    /* renamed from: component5, reason: from getter */
    public final boolean getIsAllDay() {
        return this.isAllDay;
    }

    @NotNull
    /* renamed from: component6, reason: from getter */
    public final String getEventDate() {
        return this.eventDate;
    }

    @NotNull
    public final CalendarEvent copy(@NotNull String title, @NotNull String startUtc, @NotNull String endUtc, @Nullable String location, boolean isAllDay, @NotNull String eventDate) {
        Intrinsics.g(title, "title");
        Intrinsics.g(startUtc, "startUtc");
        Intrinsics.g(endUtc, "endUtc");
        Intrinsics.g(eventDate, "eventDate");
        return new CalendarEvent(title, startUtc, endUtc, location, isAllDay, eventDate);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CalendarEvent)) {
            return false;
        }
        CalendarEvent calendarEvent = (CalendarEvent) other;
        return Intrinsics.b(this.title, calendarEvent.title) && Intrinsics.b(this.startUtc, calendarEvent.startUtc) && Intrinsics.b(this.endUtc, calendarEvent.endUtc) && Intrinsics.b(this.location, calendarEvent.location) && this.isAllDay == calendarEvent.isAllDay && Intrinsics.b(this.eventDate, calendarEvent.eventDate);
    }

    @NotNull
    public final String getEndUtc() {
        return this.endUtc;
    }

    @NotNull
    public final String getEventDate() {
        return this.eventDate;
    }

    @Nullable
    public final String getLocation() {
        return this.location;
    }

    @NotNull
    public final String getStartUtc() {
        return this.startUtc;
    }

    @NotNull
    public final String getTitle() {
        return this.title;
    }

    public int hashCode() {
        int iE = c0.e(c0.e(this.title.hashCode() * 31, 31, this.startUtc), 31, this.endUtc);
        String str = this.location;
        return this.eventDate.hashCode() + c9.f((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.isAllDay);
    }

    public final boolean isAllDay() {
        return this.isAllDay;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("CalendarEvent(title=");
        sb2.append(this.title);
        sb2.append(", startUtc=");
        sb2.append(this.startUtc);
        sb2.append(", endUtc=");
        sb2.append(this.endUtc);
        sb2.append(", location=");
        sb2.append(this.location);
        sb2.append(", isAllDay=");
        sb2.append(this.isAllDay);
        sb2.append(", eventDate=");
        return c1.t(sb2, this.eventDate, ')');
    }
}
