package io.branch.search;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0006\u0018\u00002\u00060\u0001j\u0002`\u0002B!\b\u0000\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bB\u0011\b\u0010\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\tB\u0011\b\u0010\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\n¨\u0006\u000b"}, d2 = {"io/branch/search/BranchNavigatorCore$Exception", "Ljava/lang/Exception;", "Lkotlin/Exception;", b.f42142b, "msg", b.f42142b, "throwable", "<init>", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "(Ljava/lang/String;)V", "(Ljava/lang/Throwable;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class BranchNavigatorCore$Exception extends Exception {
    /* JADX WARN: Multi-variable type inference failed */
    public BranchNavigatorCore$Exception() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public /* synthetic */ BranchNavigatorCore$Exception(String str, Throwable th2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : th2);
    }

    public BranchNavigatorCore$Exception(@Nullable String str, @Nullable Throwable th2) {
        super(str, th2);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public BranchNavigatorCore$Exception(@NotNull String msg) {
        this(msg, null);
        Intrinsics.g(msg, "msg");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public BranchNavigatorCore$Exception(@NotNull Throwable throwable) {
        this(null, throwable);
        Intrinsics.g(throwable, "throwable");
    }
}
