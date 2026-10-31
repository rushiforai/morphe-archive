package com.instabridge.mobilesdk.internal.ui;

import android.content.Intent;
import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35586a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MobileFlowViewModel f35587b;

    public /* synthetic */ d(MobileFlowViewModel mobileFlowViewModel, int i5) {
        this.f35586a = i5;
        this.f35587b = mobileFlowViewModel;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35586a) {
            case 0:
                return MobileFlowViewModel.C28761.invokeSuspend$lambda$0(this.f35587b, (Intent) obj);
            default:
                return MobileFlowViewModel.C28772.invokeSuspend$lambda$0(this.f35587b, (Intent) obj);
        }
    }
}
