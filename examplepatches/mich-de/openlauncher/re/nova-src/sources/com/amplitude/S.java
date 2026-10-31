package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class S extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Exception f20381a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public S(Exception exc) {
        super(0);
        this.f20381a = exc;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Error updating config from storage: " + this.f20381a;
    }
}
