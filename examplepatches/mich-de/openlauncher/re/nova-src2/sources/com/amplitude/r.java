package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Reflection;

/* loaded from: classes2.dex */
public final class r extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0519u f20734a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(C0519u c0519u) {
        super(0);
        this.f20734a = c0519u;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("View is not visible. Skipping. ", Reflection.f71864a.getOrCreateKotlinClass(this.f20734a.f20768a.getClass()).getSimpleName());
    }
}
