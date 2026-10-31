package io;

import com.instabridge.ai.consent.ConsentSettingsView;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes3.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66698t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ ConsentSettingsView f66699u;

    /* renamed from: v, reason: collision with root package name */
    public int f66700v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(ConsentSettingsView consentSettingsView, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66699u = consentSettingsView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66698t = obj;
        this.f66700v |= Integer.MIN_VALUE;
        return this.f66699u.j(false, this);
    }
}
