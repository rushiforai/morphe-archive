package com.instabridge.ai.context.summarizers;

import a00.a;
import b.c0;
import b.u4;
import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.ai.context.collectors.CalendarEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\t\u001a\u00020\u0005¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/summarizers/CalendarEventsSummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "Lcom/instabridge/ai/context/collectors/CalendarEvent;", "syncDateUtc", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CalendarEventsSummarizer {
    public static final int $stable = 0;
    private static final int MAX_PER_DAY = 8;

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence summarize$lambda$4$lambda$3(CalendarEvent event) {
        Intrinsics.g(event, "event");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(event.getTitle());
        if (!event.isAllDay()) {
            sb2.append(" " + event.getStartUtc());
        }
        String location = event.getLocation();
        if (location != null) {
            sb2.append(" @ ".concat(location));
        }
        return sb2.toString();
    }

    @NotNull
    public final String summarize(@NotNull List<CalendarEvent> events, @NotNull String syncDateUtc) {
        Intrinsics.g(events, "events");
        Intrinsics.g(syncDateUtc, "syncDateUtc");
        if (events.isEmpty()) {
            return c0.l("No upcoming calendar events (synced ", syncDateUtc, " UTC)");
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : events) {
            String eventDate = ((CalendarEvent) obj).getEventDate();
            Object arrayList = linkedHashMap.get(eventDate);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(eventDate, arrayList);
            }
            ((List) arrayList).add(obj);
        }
        ArrayList arrayList2 = new ArrayList(linkedHashMap.size());
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            List list = (List) entry.getValue();
            arrayList2.add(str + ": " + g.f1(g.E1(list, 8), "; ", null, null, 0, new a(23), 30) + (list.size() > 8 ? " +" + (list.size() - 8) + " more" : b.f42142b));
        }
        StringBuilder sbK = u4.k("Calendar events (synced ", syncDateUtc, " UTC):\n");
        sbK.append(g.f1(arrayList2, "\n", null, null, 0, null, 62));
        return sbK.toString();
    }
}
