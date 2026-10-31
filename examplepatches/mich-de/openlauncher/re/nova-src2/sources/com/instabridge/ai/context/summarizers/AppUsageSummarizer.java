package com.instabridge.ai.context.summarizers;

import ab.e0;
import b.c0;
import b.u4;
import b70.c;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\t\u001a\u00020\u0005¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/summarizers/AppUsageSummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "entries", b.f42142b, "Lcom/instabridge/ai/context/summarizers/AppUsageEntry;", "syncTime", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AppUsageSummarizer {
    public static final int $stable = 0;
    private static final int MAX_ENTRIES = 20;

    @NotNull
    public final String summarize(@NotNull List<AppUsageEntry> entries, @NotNull String syncTime) {
        Intrinsics.g(entries, "entries");
        Intrinsics.g(syncTime, "syncTime");
        if (entries.isEmpty()) {
            return c1.m(')', "No app usage data (synced ", syncTime);
        }
        final long jCurrentTimeMillis = System.currentTimeMillis();
        List listD1 = g.D1(new Comparator() { // from class: com.instabridge.ai.context.summarizers.AppUsageSummarizer$summarize$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Double.valueOf(((AppUsageEntry) t9).combinedScore(jCurrentTimeMillis)), Double.valueOf(((AppUsageEntry) t6).combinedScore(jCurrentTimeMillis)));
            }
        }, entries);
        List<AppUsageEntry> listE1 = g.E1(listD1, 20);
        ArrayList arrayList = new ArrayList(c.u0(listE1, 10));
        for (AppUsageEntry appUsageEntry : listE1) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(appUsageEntry.getAppLabel());
            ArrayList arrayList2 = new ArrayList();
            if (appUsageEntry.getLaunchesPerWeek() > 0) {
                arrayList2.add(appUsageEntry.getLaunchesPerWeek() + "/week");
            }
            if (appUsageEntry.getForegroundMinutes() > 0) {
                arrayList2.add(appUsageEntry.getForegroundMinutes() + "min");
            }
            String strRecencyLabel = appUsageEntry.recencyLabel(jCurrentTimeMillis);
            if (strRecencyLabel != null) {
                arrayList2.add(strRecencyLabel);
            }
            if (!arrayList2.isEmpty()) {
                sb2.append(" (" + g.f1(arrayList2, ", ", null, null, 0, null, 62) + ')');
            }
            arrayList.add(sb2.toString());
        }
        return c0.q(u4.k("App usage (synced ", syncTime, "): "), g.f1(arrayList, ", ", null, null, 0, null, 62), listD1.size() > 20 ? " +" + (listD1.size() - 20) + " more" : b.f42142b);
    }
}
