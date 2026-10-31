package io.branch.search.logger;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.P6;
import java.util.Set;
import kotlin.Metadata;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/logger/BranchLogFilter;", b.f42142b, k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
@Serializable
/* loaded from: classes4.dex */
public final class BranchLogFilter {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion();

    /* renamed from: a, reason: collision with root package name */
    public final P6 f66387a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f66388b;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001J\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lio/branch/search/logger/BranchLogFilter$Companion;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/logger/BranchLogFilter;", "serializer", "()Lkotlinx/serialization/KSerializer;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        @NotNull
        public final KSerializer<BranchLogFilter> serializer() {
            return BranchLogFilter$$serializer.INSTANCE;
        }
    }

    public /* synthetic */ BranchLogFilter(int i5, P6 p62, Set set) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, BranchLogFilter$$serializer.INSTANCE.getDescriptor());
        }
        this.f66387a = p62;
        this.f66388b = set;
    }
}
