package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class V extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Exception f20400a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V(Exception exc) {
        super(0);
        this.f20400a = exc;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Error updating config from remote: " + this.f20400a;
    }
}
