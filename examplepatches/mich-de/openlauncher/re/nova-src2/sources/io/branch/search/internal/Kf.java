package io.branch.search.internal;

import io.branch.search.internal.Jf;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Kf extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Jf.b f62804a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Kf(Jf.b bVar) {
        super(0);
        this.f62804a = bVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Drop task ".concat(this.f62804a.getClass().getSimpleName());
    }
}
