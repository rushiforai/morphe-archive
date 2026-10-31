package com.instabridge.mobilesdk.internal.ui;

import b0.r;
import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.internal.ui.MobileFlowActivity;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35580a;

    public /* synthetic */ a(int i5) {
        this.f35580a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35580a) {
            case 0:
                return MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$6$lambda$5((r) obj);
            case 1:
                return Integer.valueOf(MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$6$lambda$5$lambda$3(((Integer) obj).intValue()));
            case 2:
                return Integer.valueOf(MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$6$lambda$5$lambda$4(((Integer) obj).intValue()));
            case 3:
                return Integer.valueOf(MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$6$lambda$5$lambda$1(((Integer) obj).intValue()));
            case 4:
                return Integer.valueOf(MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$6$lambda$5$lambda$2(((Integer) obj).intValue()));
            case 5:
                return Boolean.valueOf(MobileFlowViewModel.preservingLocalCancellations$lambda$55((PurchasedPackage) obj));
            default:
                return Long.valueOf(MobileFlowViewModel.preservingLocalCancellations$lambda$56((PurchasedPackage) obj));
        }
    }
}
