package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.b3, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0389b3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Throwable f20499a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0389b3(Throwable th2) {
        super(0);
        this.f20499a = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Error creating diagnostics snapshot: " + this.f20499a;
    }
}
