package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public /* synthetic */ class AccountDeletedDetector$onAccountDeleted$1 extends FunctionReferenceImpl implements Function0<Unit> {
    public AccountDeletedDetector$onAccountDeleted$1(Object obj) {
        super(0, 0, AccountDeletedDetector.class, obj, "invalidateSdkSession", "invalidateSdkSession()V");
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* synthetic */ Object invoke() {
        m162invoke();
        return Unit.f71706a;
    }

    /* renamed from: invoke, reason: collision with other method in class */
    public final void m162invoke() {
        ((AccountDeletedDetector) this.receiver).invalidateSdkSession();
    }
}
