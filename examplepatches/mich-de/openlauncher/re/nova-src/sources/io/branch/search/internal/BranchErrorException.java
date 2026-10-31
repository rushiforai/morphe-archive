package io.branch.search.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import kotlin.Metadata;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\u0018\u00002\u00020\u0001B\u0019\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0001¢\u0006\u0002\u0010\u0005R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lio/branch/search/internal/BranchErrorException;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PglCryptUtils.KEY_MESSAGE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "orig", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "getOrig", "()Ljava/lang/Throwable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class BranchErrorException extends Throwable {

    @Nullable
    private final Throwable orig;

    public BranchErrorException(@Nullable String str, @Nullable Throwable th2) {
        super(str);
        this.orig = th2;
    }

    @Nullable
    public final Throwable getOrig() {
        return this.orig;
    }
}
