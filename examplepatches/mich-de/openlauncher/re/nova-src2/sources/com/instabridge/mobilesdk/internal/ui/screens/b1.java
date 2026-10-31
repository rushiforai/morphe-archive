package com.instabridge.mobilesdk.internal.ui.screens;

import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class b1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35625a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35626b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ List f35627c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35628d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35629e;

    public /* synthetic */ b1(String str, List list, Function0 function0, int i5, int i11) {
        this.f35625a = i11;
        this.f35626b = str;
        this.f35627c = list;
        this.f35628d = function0;
        this.f35629e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35625a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardTravelKt.TravelStatusLine$lambda$78(this.f35626b, this.f35627c, this.f35628d, this.f35629e, (p1.o) obj, iIntValue);
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                return DashboardTravelKt.TravelStatusLine$lambda$84(this.f35626b, this.f35627c, this.f35628d, this.f35629e, (p1.o) obj, iIntValue2);
            default:
                int iIntValue3 = ((Integer) obj2).intValue();
                return TravelPlansScreenKt.RegionCoverageSheet$lambda$39(this.f35626b, this.f35627c, this.f35628d, this.f35629e, (p1.o) obj, iIntValue3);
        }
    }
}
