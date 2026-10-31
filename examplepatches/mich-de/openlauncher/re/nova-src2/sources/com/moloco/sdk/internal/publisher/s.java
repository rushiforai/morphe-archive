package com.moloco.sdk.internal.publisher;

import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public interface s {

    public static final class a {
        public static void a(@NotNull s sVar, long j11, long j12) {
            sVar.mo267setCreateAdObjectDurationLRDsOJo(DurationKt.h(j12 - j11, DurationUnit.f72045d));
        }
    }

    void a(long j11, long j12);

    /* renamed from: getCreateAdObjectDuration-UwyO8pc */
    long mo266getCreateAdObjectDurationUwyO8pc();

    /* renamed from: setCreateAdObjectDuration-LRDsOJo */
    void mo267setCreateAdObjectDurationLRDsOJo(long j11);
}
