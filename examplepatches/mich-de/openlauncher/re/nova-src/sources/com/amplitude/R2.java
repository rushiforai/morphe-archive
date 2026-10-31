package com.amplitude;

import kotlin.Result;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class R2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Result f20378a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f20379b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public R2(Result result, long j11) {
        super(0);
        this.f20378a = result;
        this.f20379b = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        Throwable thA = Result.a(this.f20378a.f71688a);
        return "snapshot " + (thA != null ? thA.getMessage() : null) + " @ " + this.f20379b + " ms";
    }
}
