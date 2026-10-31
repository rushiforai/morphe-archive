package io.branch.search.ui;

import io.branch.search.internal.C3283n9;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class s0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ BranchEntity.HeroV2 f66512j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(BranchEntity.HeroV2 heroV2) {
        super(0);
        this.f66512j = heroV2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return C3283n9.a(this.f66512j.f66428b);
    }
}
