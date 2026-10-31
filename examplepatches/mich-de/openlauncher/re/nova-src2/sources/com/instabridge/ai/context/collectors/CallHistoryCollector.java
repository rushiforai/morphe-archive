package com.instabridge.ai.context.collectors;

import a2.c;
import ab.e0;
import android.annotation.SuppressLint;
import android.content.Context;
import android.database.Cursor;
import android.provider.CallLog;
import b.c0;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.context.summarizers.CallEntry;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
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

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0007J\u0016\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0003¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/collectors/CallHistoryCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "Lcom/instabridge/ai/context/summarizers/CallEntry;", "context", "Landroid/content/Context;", "queryCallHistory", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CallHistoryCollector {
    public static final int $stable = 0;
    private static final long LOOKBACK_DAYS = 7;

    @SuppressLint({"MissingPermission"})
    private final List<CallEntry> queryCallHistory(Context context) throws IOException {
        long jCurrentTimeMillis = System.currentTimeMillis() - TimeUnit.DAYS.toMillis(LOOKBACK_DAYS);
        long jCurrentTimeMillis2 = System.currentTimeMillis();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Cursor cursorQuery = context.getContentResolver().query(CallLog.Calls.CONTENT_URI, new String[]{PendingUpgradeStore.KEY_NAME, "duration", "date"}, "date >= ? AND name IS NOT NULL", new String[]{String.valueOf(jCurrentTimeMillis)}, null);
        if (cursorQuery != null) {
            while (cursorQuery.moveToNext()) {
                try {
                    int i5 = 0;
                    String string = cursorQuery.getString(0);
                    if (string != null) {
                        while (true) {
                            if (i5 >= string.length()) {
                                break;
                            }
                            if (Character.isLetter(string.charAt(i5))) {
                                long j11 = cursorQuery.getLong(1);
                                long j12 = cursorQuery.getLong(2);
                                Object obj = linkedHashMap.get(string);
                                if (obj == null) {
                                    Accumulator accumulator = new Accumulator(0, 0L, 0L, 7, null);
                                    linkedHashMap.put(string, accumulator);
                                    obj = accumulator;
                                }
                                Accumulator accumulator2 = (Accumulator) obj;
                                accumulator2.setCallCount(accumulator2.getCallCount() + 1);
                                accumulator2.setTotalDurationSeconds(accumulator2.getTotalDurationSeconds() + j11);
                                if (j12 > accumulator2.getLastCallMs()) {
                                    accumulator2.setLastCallMs(j12);
                                }
                            } else {
                                i5++;
                            }
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
        }
        ArrayList arrayList = new ArrayList(linkedHashMap.size());
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            Accumulator accumulator3 = (Accumulator) entry.getValue();
            arrayList.add(new CallEntry(str, accumulator3.getCallCount(), (int) (accumulator3.getTotalDurationSeconds() / 60), (int) TimeUnit.MILLISECONDS.toDays(jCurrentTimeMillis2 - accumulator3.getLastCallMs())));
        }
        return g.D1(new Comparator() { // from class: com.instabridge.ai.context.collectors.CallHistoryCollector$queryCallHistory$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Integer.valueOf(((CallEntry) t9).getCallCount()), Integer.valueOf(((CallEntry) t6).getCallCount()));
            }
        }, arrayList);
    }

    @SuppressLint({"MissingPermission"})
    @NotNull
    public final List<CallEntry> collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        try {
            return queryCallHistory(context);
        } catch (SecurityException unused) {
            return EmptyList.f71733a;
        } catch (Exception unused2) {
            return EmptyList.f71733a;
        }
    }

    @Metadata(d1 = {"\u0000'\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B%\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J,\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u0010\u0017J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0006\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u000e\"\u0004\b\u0012\u0010\u0010¨\u0006\u001e"}, d2 = {"com/instabridge/ai/context/collectors/CallHistoryCollector$queryCallHistory$Accumulator", b.f42142b, "callCount", b.f42142b, "totalDurationSeconds", b.f42142b, "lastCallMs", "<init>", "(IJJ)V", "getCallCount", "()I", "setCallCount", "(I)V", "getTotalDurationSeconds", "()J", "setTotalDurationSeconds", "(J)V", "getLastCallMs", "setLastCallMs", "component1", "component2", "component3", "copy", "(IJJ)Lcom/instabridge/ai/context/collectors/CallHistoryCollector$queryCallHistory$Accumulator;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Accumulator {
        private int callCount;
        private long lastCallMs;
        private long totalDurationSeconds;

        public Accumulator(int i5, long j11, long j12) {
            this.callCount = i5;
            this.totalDurationSeconds = j11;
            this.lastCallMs = j12;
        }

        public static /* synthetic */ Accumulator copy$default(Accumulator accumulator, int i5, long j11, long j12, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = accumulator.callCount;
            }
            if ((i11 & 2) != 0) {
                j11 = accumulator.totalDurationSeconds;
            }
            if ((i11 & 4) != 0) {
                j12 = accumulator.lastCallMs;
            }
            return accumulator.copy(i5, j11, j12);
        }

        /* renamed from: component1, reason: from getter */
        public final int getCallCount() {
            return this.callCount;
        }

        /* renamed from: component2, reason: from getter */
        public final long getTotalDurationSeconds() {
            return this.totalDurationSeconds;
        }

        /* renamed from: component3, reason: from getter */
        public final long getLastCallMs() {
            return this.lastCallMs;
        }

        public final Accumulator copy(int callCount, long totalDurationSeconds, long lastCallMs) {
            return new Accumulator(callCount, totalDurationSeconds, lastCallMs);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Accumulator)) {
                return false;
            }
            Accumulator accumulator = (Accumulator) other;
            return this.callCount == accumulator.callCount && this.totalDurationSeconds == accumulator.totalDurationSeconds && this.lastCallMs == accumulator.lastCallMs;
        }

        public final int getCallCount() {
            return this.callCount;
        }

        public final long getLastCallMs() {
            return this.lastCallMs;
        }

        public final long getTotalDurationSeconds() {
            return this.totalDurationSeconds;
        }

        public int hashCode() {
            return Long.hashCode(this.lastCallMs) + c0.d(Integer.hashCode(this.callCount) * 31, 31, this.totalDurationSeconds);
        }

        public final void setCallCount(int i5) {
            this.callCount = i5;
        }

        public final void setLastCallMs(long j11) {
            this.lastCallMs = j11;
        }

        public final void setTotalDurationSeconds(long j11) {
            this.totalDurationSeconds = j11;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Accumulator(callCount=");
            sb2.append(this.callCount);
            sb2.append(", totalDurationSeconds=");
            sb2.append(this.totalDurationSeconds);
            sb2.append(", lastCallMs=");
            return c.n(sb2, this.lastCallMs, ')');
        }

        public /* synthetic */ Accumulator(int i5, long j11, long j12, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this((i11 & 1) != 0 ? 0 : i5, (i11 & 2) != 0 ? 0L : j11, (i11 & 4) != 0 ? 0L : j12);
        }
    }
}
