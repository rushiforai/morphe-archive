package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class G extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ J f20240a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G(J j11) {
        super(0);
        this.f20240a = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("Using software rendering for bitmap: ", this.f20240a.f20281a);
    }
}
