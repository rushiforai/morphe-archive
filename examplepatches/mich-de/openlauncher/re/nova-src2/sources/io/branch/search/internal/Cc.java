package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import java.util.ArrayList;
import java.util.List;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public interface Cc {
    void a(@NotNull JobInfoRaw jobInfoRaw);

    void a(@NotNull ArrayList arrayList, @NotNull ArrayList arrayList2);

    void b(@NotNull JobInfoRaw jobInfoRaw);

    @NotNull
    List<JobInfoRaw> load();
}
