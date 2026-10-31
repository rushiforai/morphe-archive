package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.theme.MobileThemeKt;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class m implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35776a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f35777b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35778c;

    public /* synthetic */ m(int i5, int i11, Function2 function2) {
        this.f35776a = i11;
        this.f35777b = function2;
        this.f35778c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35776a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return CarrierLockedScreenKt.CarrierLockCard$lambda$12(this.f35777b, this.f35778c, oVar, iIntValue);
            case 1:
                return CheckoutScreenKt.Card$lambda$50(this.f35777b, this.f35778c, oVar, iIntValue);
            default:
                return MobileThemeKt.MobileTheme$lambda$4(this.f35777b, this.f35778c, oVar, iIntValue);
        }
    }
}
