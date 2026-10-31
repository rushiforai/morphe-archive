package io.branch.search.internal.multiprocess;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002B\u0005¢\u0006\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/multiprocess/BranchNotUserUnlockedException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class BranchNotUserUnlockedException extends Exception {
    public BranchNotUserUnlockedException() {
        super("User must first be unlocked");
    }
}
