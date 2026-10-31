package io.branch.search.internal;

import android.app.job.JobInfo;
import io.branch.search.internal.services.model.BranchJob;
import java.util.ArrayList;
import kotlin.Lazy;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3164g8 {
    @Nullable
    JobInfo a(int i5);

    @Nullable
    Object a(long j11, long j12, boolean z11, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Unit a(boolean z11);

    void a(@NotNull C3282n8 c3282n8, @NotNull y40.u uVar, @NotNull Lazy<? extends y40.p> lazy);

    void a(@NotNull BranchJob branchJob, @NotNull Function1<? super InterfaceC3164g8, Boolean> function1);

    void a(@NotNull ArrayList arrayList);
}
