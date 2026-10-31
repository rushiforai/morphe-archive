package bu;

import h6.f1;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import t70.k0;

/* loaded from: classes4.dex */
public final class z extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final b f18610a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f18611b;

    public z(b bVar, j0 customViewModelScope) {
        Intrinsics.g(customViewModelScope, "customViewModelScope");
        this.f18610a = bVar;
        this.f18611b = customViewModelScope;
    }

    @Override // h6.f1
    public final void onCleared() {
        k0.c(this.f18611b, null);
    }
}
