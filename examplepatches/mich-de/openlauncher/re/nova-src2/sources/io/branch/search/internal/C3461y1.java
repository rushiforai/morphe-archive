package io.branch.search.internal;

import io.branch.search.internal.client.ads.IconAd;
import io.branch.search.ui.BranchEntity;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.y1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3461y1 implements InterfaceC3444x1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3273n f66303a;

    public C3461y1(@NotNull C3273n adsBlacklistRepository) {
        Intrinsics.g(adsBlacklistRepository, "adsBlacklistRepository");
        this.f66303a = adsBlacklistRepository;
    }

    @Override // io.branch.search.internal.InterfaceC3444x1
    @Nullable
    public final Unit a(@NotNull IconAd iconAd) {
        C3273n c3273n = this.f66303a;
        BranchEntity.App branchEntity = iconAd.getAd();
        c3273n.getClass();
        Intrinsics.g(branchEntity, "branchEntity");
        c3273n.f65296a.b(new C3256m(c3273n, branchEntity));
        return Unit.f71706a;
    }
}
