package io.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n¢\u0006\u0002\b\u0004"}, d2 = {"<anonymous>", "Lio/branch/engage/sesame_lite/internal/LinkEntity;", "readView", "Lio/branch/engage/sesame_lite/internal/DbView;", "invoke"}, k = 3, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class SesameLiteImpl$ingestIntegration$appLink$1 extends Lambda implements Function1<DbView, LinkEntity> {
    final /* synthetic */ v40.a $integration;
    final /* synthetic */ long $userSerial;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SesameLiteImpl$ingestIntegration$appLink$1(v40.a aVar, long j11) {
        super(1);
        this.$userSerial = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    @Nullable
    public final LinkEntity invoke(@NotNull DbView readView) {
        Intrinsics.g(readView, "readView");
        readView.getLinkStore();
        throw null;
    }
}
