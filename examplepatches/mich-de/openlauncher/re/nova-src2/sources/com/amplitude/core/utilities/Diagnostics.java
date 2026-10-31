package com.amplitude.core.utilities;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\u0018\u0000 \u00102\u00020\u0001:\u0001\u0010B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0005J\u000e\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u0005J\b\u0010\r\u001a\u0004\u0018\u00010\u0005J\u0006\u0010\u000e\u001a\u00020\u000fR\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/utilities/Diagnostics;", b.f42142b, "()V", "errorLogs", b.f42142b, b.f42142b, "malformedEvents", b.f42142b, "addErrorLog", b.f42142b, "log", "addMalformedEvent", DatabaseConstants.EVENT_FIELD, "extractDiagnostics", "hasDiagnostics", b.f42142b, k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class Diagnostics {
    private static final int MAX_ERROR_LOGS = 10;

    @NotNull
    private Set<String> errorLogs;

    @Nullable
    private List<String> malformedEvents;

    public Diagnostics() {
        Set<String> setSynchronizedSet = Collections.synchronizedSet(new LinkedHashSet());
        Intrinsics.f(setSynchronizedSet, "synchronizedSet(...)");
        this.errorLogs = setSynchronizedSet;
    }

    public final void addErrorLog(@NotNull String log) {
        Intrinsics.g(log, "log");
        this.errorLogs.add(log);
        while (this.errorLogs.size() > 10) {
            Set<String> set = this.errorLogs;
            set.remove(g.V0(set));
        }
    }

    public final void addMalformedEvent(@NotNull String event) {
        Intrinsics.g(event, "event");
        if (this.malformedEvents == null) {
            this.malformedEvents = Collections.synchronizedList(new ArrayList());
        }
        List<String> list = this.malformedEvents;
        if (list != null) {
            list.add(event);
        }
    }

    @Nullable
    public final String extractDiagnostics() {
        if (!hasDiagnostics()) {
            return null;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        List<String> list = this.malformedEvents;
        if (list != null) {
            Intrinsics.d(list);
            if (!list.isEmpty()) {
                List<String> list2 = this.malformedEvents;
                Intrinsics.d(list2);
                linkedHashMap.put("malformed_events", list2);
            }
        }
        if (!this.errorLogs.isEmpty()) {
            linkedHashMap.put("error_logs", g.I1(this.errorLogs));
        }
        String strValueOf = String.valueOf(JSONKt.toJSONObject(linkedHashMap));
        List<String> list3 = this.malformedEvents;
        if (list3 != null) {
            list3.clear();
        }
        this.errorLogs.clear();
        return strValueOf;
    }

    public final boolean hasDiagnostics() {
        List<String> list = this.malformedEvents;
        if (list != null) {
            Intrinsics.d(list);
            if (!list.isEmpty()) {
                return true;
            }
        }
        return !this.errorLogs.isEmpty();
    }
}
