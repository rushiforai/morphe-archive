package io.branch.search.internal;

import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Id {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap f62688a = new ConcurrentHashMap();

    @NotNull
    public final I7 a(@NotNull String sessionId) {
        I7 i72;
        Intrinsics.g(sessionId, "sessionId");
        synchronized (this.f62688a) {
            try {
                ConcurrentHashMap concurrentHashMap = this.f62688a;
                Object j72 = concurrentHashMap.get(sessionId);
                if (j72 == null) {
                    j72 = new J7();
                    concurrentHashMap.put(sessionId, j72);
                }
                i72 = (I7) j72;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return i72;
    }
}
