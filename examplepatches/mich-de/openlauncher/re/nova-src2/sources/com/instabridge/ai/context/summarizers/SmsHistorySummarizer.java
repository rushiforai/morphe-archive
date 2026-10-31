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

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001e\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\b\b\u0002\u0010\t\u001a\u00020\u0005¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/summarizers/SmsHistorySummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "entries", b.f42142b, "Lcom/instabridge/ai/context/summarizers/SmsEntry;", "periodLabel", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class SmsHistorySummarizer {
    public static final int $stable = 0;
    private static final int MAX_ENTRIES = 10;

    public static /* synthetic */ String summarize$default(SmsHistorySummarizer smsHistorySummarizer, List list, String str, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str = "last 7 days";
        }
        return smsHistorySummarizer.summarize(list, str);
    }

    @NotNull
    public final String summarize(@NotNull List<SmsEntry> entries, @NotNull String periodLabel) {
        Intrinsics.g(entries, "entries");
        Intrinsics.g(periodLabel, "periodLabel");
        if (entries.isEmpty()) {
            return c1.m(')', "No SMS activity (", periodLabel);
        }
        List listD1 = g.D1(new Comparator() { // from class: com.instabridge.ai.context.summarizers.SmsHistorySummarizer$summarize$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Integer.valueOf(((SmsEntry) t9).getMessageCount()), Integer.valueOf(((SmsEntry) t6).getMessageCount()));
            }
        }, entries);
        List<SmsEntry> listE1 = g.E1(listD1, 10);
        ArrayList arrayList = new ArrayList(c.u0(listE1, 10));
        for (SmsEntry smsEntry : listE1) {
            arrayList.add(smsEntry.getContactName() + ": " + smsEntry.getMessageCount() + " messages");
        }
        return c0.q(u4.k("SMS activity (", periodLabel, "): "), g.f1(arrayList, "; ", null, null, 0, null, 62), listD1.size() > 10 ? " ...and " + (listD1.size() - 10) + " more" : b.f42142b);
    }
}
