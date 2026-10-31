package com.moloco.sdk.acm;

import java.util.List;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public interface c {
    @NotNull
    List<EventTag> getEventTags();

    @NotNull
    String getName();

    @NotNull
    c withTag(@NotNull String str, @NotNull String str2);
}
