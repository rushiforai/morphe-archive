package com.instabridge.ai.context.collectors;

import a2.c;
import ab.e0;
import android.annotation.SuppressLint;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.provider.Telephony;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.context.summarizers.SmsEntry;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0007\u0018\u0000 \r2\u00020\u0001:\u0001\rB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0007J\u0016\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0003J\u001a\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000bH\u0002¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/context/collectors/SmsHistoryCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "Lcom/instabridge/ai/context/summarizers/SmsEntry;", "context", "Landroid/content/Context;", "querySmsHistory", "resolveContactName", b.f42142b, "phoneNumber", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class SmsHistoryCollector {
    public static final int $stable = 0;
    private static final long LOOKBACK_DAYS = 7;

    @SuppressLint({"MissingPermission"})
    private final List<SmsEntry> querySmsHistory(Context context) throws IOException {
        long jCurrentTimeMillis = System.currentTimeMillis() - TimeUnit.DAYS.toMillis(LOOKBACK_DAYS);
        long jCurrentTimeMillis2 = System.currentTimeMillis();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Cursor cursorQuery = context.getContentResolver().query(Telephony.Sms.CONTENT_URI, new String[]{PlaceTypes.ADDRESS, "date"}, "date >= ?", new String[]{String.valueOf(jCurrentTimeMillis)}, null);
        if (cursorQuery != null) {
            while (cursorQuery.moveToNext()) {
                try {
                    String string = cursorQuery.getString(0);
                    if (string != null) {
                        long j11 = cursorQuery.getLong(1);
                        Object obj = linkedHashMap.get(string);
                        if (obj == null) {
                            Accumulator accumulator = new Accumulator(0, 0L, 3, null);
                            linkedHashMap.put(string, accumulator);
                            obj = accumulator;
                        }
                        Accumulator accumulator2 = (Accumulator) obj;
                        accumulator2.setMessageCount(accumulator2.getMessageCount() + 1);
                        if (j11 > accumulator2.getLastMessageMs()) {
                            accumulator2.setLastMessageMs(j11);
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            Accumulator accumulator3 = (Accumulator) entry.getValue();
            String strResolveContactName = resolveContactName(context, str);
            if (strResolveContactName != null) {
                str = strResolveContactName;
            }
            Object obj2 = linkedHashMap2.get(str);
            if (obj2 == null) {
                Merged merged = new Merged(0, 0L, 3, null);
                linkedHashMap2.put(str, merged);
                obj2 = merged;
            }
            Merged merged2 = (Merged) obj2;
            merged2.setMessageCount(accumulator3.getMessageCount() + merged2.getMessageCount());
            if (accumulator3.getLastMessageMs() > merged2.getLastMessageMs()) {
                merged2.setLastMessageMs(accumulator3.getLastMessageMs());
            }
        }
        ArrayList arrayList = new ArrayList(linkedHashMap2.size());
        for (Map.Entry entry2 : linkedHashMap2.entrySet()) {
            String str2 = (String) entry2.getKey();
            Merged merged3 = (Merged) entry2.getValue();
            arrayList.add(new SmsEntry(str2, merged3.getMessageCount(), (int) TimeUnit.MILLISECONDS.toDays(jCurrentTimeMillis2 - merged3.getLastMessageMs())));
        }
        return g.D1(new Comparator() { // from class: com.instabridge.ai.context.collectors.SmsHistoryCollector$querySmsHistory$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Integer.valueOf(((SmsEntry) t9).getMessageCount()), Integer.valueOf(((SmsEntry) t6).getMessageCount()));
            }
        }, arrayList);
    }

    private final String resolveContactName(Context context, String phoneNumber) throws IOException {
        try {
            Cursor cursorQuery = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(phoneNumber)), new String[]{"display_name"}, null, null, null);
            if (cursorQuery != null) {
                try {
                    String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                    cursorQuery.close();
                    return string;
                } finally {
                }
            }
        } catch (Exception unused) {
        }
        return null;
    }

    @SuppressLint({"MissingPermission"})
    @NotNull
    public final List<SmsEntry> collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        try {
            return querySmsHistory(context);
        } catch (SecurityException unused) {
            return EmptyList.f71733a;
        } catch (Exception unused2) {
            return EmptyList.f71733a;
        }
    }

    @Metadata(d1 = {"\u0000'\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\"\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"com/instabridge/ai/context/collectors/SmsHistoryCollector$querySmsHistory$Accumulator", b.f42142b, "messageCount", b.f42142b, "lastMessageMs", b.f42142b, "<init>", "(IJ)V", "getMessageCount", "()I", "setMessageCount", "(I)V", "getLastMessageMs", "()J", "setLastMessageMs", "(J)V", "component1", "component2", "copy", "(IJ)Lcom/instabridge/ai/context/collectors/SmsHistoryCollector$querySmsHistory$Accumulator;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Accumulator {
        private long lastMessageMs;
        private int messageCount;

        public Accumulator(int i5, long j11) {
            this.messageCount = i5;
            this.lastMessageMs = j11;
        }

        public static /* synthetic */ Accumulator copy$default(Accumulator accumulator, int i5, long j11, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = accumulator.messageCount;
            }
            if ((i11 & 2) != 0) {
                j11 = accumulator.lastMessageMs;
            }
            return accumulator.copy(i5, j11);
        }

        /* renamed from: component1, reason: from getter */
        public final int getMessageCount() {
            return this.messageCount;
        }

        /* renamed from: component2, reason: from getter */
        public final long getLastMessageMs() {
            return this.lastMessageMs;
        }

        public final Accumulator copy(int messageCount, long lastMessageMs) {
            return new Accumulator(messageCount, lastMessageMs);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Accumulator)) {
                return false;
            }
            Accumulator accumulator = (Accumulator) other;
            return this.messageCount == accumulator.messageCount && this.lastMessageMs == accumulator.lastMessageMs;
        }

        public final long getLastMessageMs() {
            return this.lastMessageMs;
        }

        public final int getMessageCount() {
            return this.messageCount;
        }

        public int hashCode() {
            return Long.hashCode(this.lastMessageMs) + (Integer.hashCode(this.messageCount) * 31);
        }

        public final void setLastMessageMs(long j11) {
            this.lastMessageMs = j11;
        }

        public final void setMessageCount(int i5) {
            this.messageCount = i5;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Accumulator(messageCount=");
            sb2.append(this.messageCount);
            sb2.append(", lastMessageMs=");
            return c.n(sb2, this.lastMessageMs, ')');
        }

        public /* synthetic */ Accumulator(int i5, long j11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this((i11 & 1) != 0 ? 0 : i5, (i11 & 2) != 0 ? 0L : j11);
        }
    }

    @Metadata(d1 = {"\u0000'\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\"\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"com/instabridge/ai/context/collectors/SmsHistoryCollector$querySmsHistory$Merged", b.f42142b, "messageCount", b.f42142b, "lastMessageMs", b.f42142b, "<init>", "(IJ)V", "getMessageCount", "()I", "setMessageCount", "(I)V", "getLastMessageMs", "()J", "setLastMessageMs", "(J)V", "component1", "component2", "copy", "(IJ)Lcom/instabridge/ai/context/collectors/SmsHistoryCollector$querySmsHistory$Merged;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Merged {
        private long lastMessageMs;
        private int messageCount;

        public Merged(int i5, long j11) {
            this.messageCount = i5;
            this.lastMessageMs = j11;
        }

        public static /* synthetic */ Merged copy$default(Merged merged, int i5, long j11, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = merged.messageCount;
            }
            if ((i11 & 2) != 0) {
                j11 = merged.lastMessageMs;
            }
            return merged.copy(i5, j11);
        }

        /* renamed from: component1, reason: from getter */
        public final int getMessageCount() {
            return this.messageCount;
        }

        /* renamed from: component2, reason: from getter */
        public final long getLastMessageMs() {
            return this.lastMessageMs;
        }

        public final Merged copy(int messageCount, long lastMessageMs) {
            return new Merged(messageCount, lastMessageMs);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Merged)) {
                return false;
            }
            Merged merged = (Merged) other;
            return this.messageCount == merged.messageCount && this.lastMessageMs == merged.lastMessageMs;
        }

        public final long getLastMessageMs() {
            return this.lastMessageMs;
        }

        public final int getMessageCount() {
            return this.messageCount;
        }

        public int hashCode() {
            return Long.hashCode(this.lastMessageMs) + (Integer.hashCode(this.messageCount) * 31);
        }

        public final void setLastMessageMs(long j11) {
            this.lastMessageMs = j11;
        }

        public final void setMessageCount(int i5) {
            this.messageCount = i5;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Merged(messageCount=");
            sb2.append(this.messageCount);
            sb2.append(", lastMessageMs=");
            return c.n(sb2, this.lastMessageMs, ')');
        }

        public /* synthetic */ Merged(int i5, long j11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this((i11 & 1) != 0 ? 0 : i5, (i11 & 2) != 0 ? 0L : j11);
        }
    }
}
