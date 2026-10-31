package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class I extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Exception f20266a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public I(Exception exc) {
        super(0);
        this.f20266a = exc;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("Compose draw error: ", this.f20266a.getMessage());
    }
}
