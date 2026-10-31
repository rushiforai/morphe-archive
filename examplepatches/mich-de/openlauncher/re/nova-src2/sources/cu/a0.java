package cu;

import h6.f1;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import t70.k0;

/* loaded from: classes4.dex */
public final class a0 extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final a f47919a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f47920b;

    public a0(a aVar, j0 customViewModelScope) {
        Intrinsics.g(customViewModelScope, "customViewModelScope");
        this.f47919a = aVar;
        this.f47920b = customViewModelScope;
    }

    @Override // h6.f1
    public final void onCleared() {
        k0.c(this.f47920b, null);
    }
}
