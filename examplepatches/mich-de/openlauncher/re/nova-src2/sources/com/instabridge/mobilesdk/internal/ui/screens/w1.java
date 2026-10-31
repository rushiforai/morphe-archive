package com.instabridge.mobilesdk.internal.ui.screens;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.B;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class w1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35916a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35917b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f35918c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35919d;

    public /* synthetic */ w1(String str, Function2 function2, int i5, int i11) {
        this.f35916a = i11;
        this.f35917b = str;
        this.f35918c = function2;
        this.f35919d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35916a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return TravelDestinationsPickerKt.DestinationSection$lambda$22(this.f35917b, this.f35918c, this.f35919d, oVar, iIntValue);
            case 1:
                return B.a(this.f35917b, this.f35918c, this.f35919d, oVar, iIntValue);
            default:
                return B.b(this.f35917b, this.f35918c, this.f35919d, oVar, iIntValue);
        }
    }
}
