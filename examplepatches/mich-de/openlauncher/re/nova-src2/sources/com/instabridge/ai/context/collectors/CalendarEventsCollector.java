package com.instabridge.ai.context.collectors;

import android.content.Context;
import android.database.Cursor;
import android.provider.CalendarContract;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bJ\u0016\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0002¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/collectors/CalendarEventsCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "Lcom/instabridge/ai/context/collectors/CalendarEvent;", "context", "Landroid/content/Context;", "queryEvents", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CalendarEventsCollector {
    public static final int $stable = 0;
    private static final int MAX_EVENTS = 20;

    private final List<CalendarEvent> queryEvents(Context context) throws IOException {
        Calendar calendar = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        calendar2.add(6, 3);
        Locale locale = Locale.US;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'", locale);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd", locale);
        simpleDateFormat2.setTimeZone(TimeZone.getTimeZone("UTC"));
        Cursor cursorQuery = context.getContentResolver().query(CalendarContract.Instances.CONTENT_URI.buildUpon().appendPath(String.valueOf(calendar.getTimeInMillis())).appendPath(String.valueOf(calendar2.getTimeInMillis())).build(), new String[]{"title", "begin", "end", "eventLocation", "allDay"}, null, null, "begin ASC");
        ArrayList arrayList = new ArrayList();
        if (cursorQuery == null) {
            return arrayList;
        }
        while (cursorQuery.moveToNext() && arrayList.size() < 20) {
            try {
                String string = cursorQuery.getString(0);
                if (string != null) {
                    long j11 = cursorQuery.getLong(1);
                    long j12 = cursorQuery.getLong(2);
                    String string2 = cursorQuery.getString(3);
                    if (string2 == null || r70.k.U0(string2)) {
                        string2 = null;
                    }
                    boolean z11 = cursorQuery.getInt(4) == 1;
                    String str = simpleDateFormat.format(new Date(j11));
                    Intrinsics.f(str, "format(...)");
                    String str2 = simpleDateFormat.format(new Date(j12));
                    Intrinsics.f(str2, "format(...)");
                    String str3 = simpleDateFormat2.format(new Date(j11));
                    Intrinsics.f(str3, "format(...)");
                    arrayList.add(new CalendarEvent(string, str, str2, string2, z11, str3));
                }
            } finally {
            }
        }
        Unit unit = Unit.f71706a;
        cursorQuery.close();
        return arrayList;
    }

    @NotNull
    public final List<CalendarEvent> collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        try {
            return queryEvents(context);
        } catch (SecurityException unused) {
            return EmptyList.f71733a;
        } catch (Exception unused2) {
            return EmptyList.f71733a;
        }
    }
}
