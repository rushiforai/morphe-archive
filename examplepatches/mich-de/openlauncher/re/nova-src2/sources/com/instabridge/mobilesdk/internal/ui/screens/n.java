package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class n implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35792a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f35793b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35794c;

    public /* synthetic */ n(Function0 function0, int i5, int i11) {
        this.f35792a = i11;
        this.f35793b = function0;
        this.f35794c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35792a) {
            case 0:
                int iIntValue = num.intValue();
                break;
            case 1:
                int iIntValue2 = num.intValue();
                break;
            case 2:
                int iIntValue3 = num.intValue();
                break;
            case 3:
                int iIntValue4 = num.intValue();
                break;
            case 4:
                int iIntValue5 = num.intValue();
                break;
            case 5:
                int iIntValue6 = num.intValue();
                break;
            case 6:
                num.intValue();
                p7.u.t(this.f35793b, oVar, p1.a0.l(this.f35794c | 1));
                break;
            case 7:
                num.getClass();
                jv.g1.e(this.f35793b, oVar, p1.a0.l(this.f35794c | 1));
                break;
            case 8:
                num.intValue();
                jv.g1.a(this.f35793b, oVar, p1.a0.l(this.f35794c | 1));
                break;
            case 9:
                num.intValue();
                ps.k.d(this.f35793b, oVar, p1.a0.l(this.f35794c | 1));
                break;
            default:
                num.intValue();
                p6.f.d(this.f35793b, oVar, p1.a0.l(this.f35794c | 1));
                break;
        }
        return Unit.f71706a;
    }
}
