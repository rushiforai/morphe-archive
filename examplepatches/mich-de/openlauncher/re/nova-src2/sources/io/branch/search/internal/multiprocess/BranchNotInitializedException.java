package io.branch.search.internal.multiprocess;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006¨\u0006\u0007"}, d2 = {"Lio/branch/search/internal/multiprocess/BranchNotInitializedException;", "Ljava/lang/IllegalStateException;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "cause", b.f42142b, "(Ljava/lang/String;Ljava/lang/Throwable;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class BranchNotInitializedException extends IllegalStateException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BranchNotInitializedException(@NotNull String message, @Nullable Throwable th2) {
        super(message, th2);
        Intrinsics.g(message, "message");
    }

    public /* synthetic */ BranchNotInitializedException(String str, Throwable th2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : th2);
    }
}
