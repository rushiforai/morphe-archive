package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class c2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35640a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f35641b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35642c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35643d;

    public /* synthetic */ c2(Object obj, int i5, int i11, int i12) {
        this.f35640a = i12;
        this.f35641b = i5;
        this.f35643d = obj;
        this.f35642c = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35640a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return TravelPlansScreenKt.CoverageChip$lambda$38(this.f35641b, (Function0) this.f35643d, this.f35642c, (p1.o) obj, iIntValue);
            default:
                ((Integer) obj2).intValue();
                int iL = p1.a0.l(this.f35642c | 1);
                p10.y1.s(this.f35641b, (p10.z1) this.f35643d, (p1.o) obj, iL);
                return Unit.f71706a;
        }
    }
}
