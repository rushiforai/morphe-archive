package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.data.repo.TravelCountry;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class x1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35931a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f35932b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ TravelCountry f35933c;

    public /* synthetic */ x1(Function1 function1, TravelCountry travelCountry, int i5) {
        this.f35931a = i5;
        this.f35932b = function1;
        this.f35933c = travelCountry;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35931a) {
            case 0:
                return TravelDestinationsPickerKt$TravelDestinationsPicker$5$2.invoke$lambda$2$lambda$1$lambda$0(this.f35932b, this.f35933c);
            default:
                return TravelDestinationsPickerKt$TravelDestinationsPicker$5$3.invoke$lambda$2$lambda$1$lambda$0(this.f35932b, this.f35933c);
        }
    }
}
