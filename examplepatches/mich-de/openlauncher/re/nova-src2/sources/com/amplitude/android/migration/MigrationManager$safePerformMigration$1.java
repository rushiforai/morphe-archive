package com.amplitude.android.migration;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "com.amplitude.android.migration.MigrationManager", f = "MigrationManager.kt", l = {42, 46, 49}, m = "safePerformMigration$android_release")
/* loaded from: classes2.dex */
public final class MigrationManager$safePerformMigration$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ MigrationManager this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MigrationManager$safePerformMigration$1(MigrationManager migrationManager, Continuation<? super MigrationManager$safePerformMigration$1> continuation) {
        super(continuation);
        this.this$0 = migrationManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.safePerformMigration$android_release(this);
    }
}
