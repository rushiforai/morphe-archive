package com.moloco.sdk.internal.publisher.nativead.ui;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import hv.i0;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kw.e3;
import kw.u0;
import r70.k;
import w70.m;
import z2.i1;
import z2.q0;
import z2.t0;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f37431a;

    public /* synthetic */ i(int i5) {
        this.f37431a = i5;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f37431a) {
            case 0:
                return f.a((Context) obj, (m) obj2, (m) obj3);
            case 1:
                return g.a((Context) obj, (m) obj2, (m) obj3);
            case 2:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.m.a((String) obj, (String) obj2, (String) obj3);
            case 3:
                e3 fieldState = (e3) obj;
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
                Intrinsics.g(fieldState, "fieldState");
                return Boolean.valueOf(fieldState.b(zBooleanValue, zBooleanValue2));
            case 4:
                e3 fieldState2 = (e3) obj;
                boolean zBooleanValue3 = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue4 = ((Boolean) obj3).booleanValue();
                Intrinsics.g(fieldState2, "fieldState");
                return Boolean.valueOf(fieldState2.b(zBooleanValue3, zBooleanValue4));
            case 5:
                return Boolean.valueOf(((Boolean) obj).booleanValue() || ((Boolean) obj2).booleanValue() || ((Boolean) obj3).booleanValue());
            case 6:
                return i0.a((PaymentSelection) obj, (PaymentMethod) obj2, (List) obj3);
            case 7:
                Pair pair = (Pair) obj;
                boolean zBooleanValue5 = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue6 = ((Boolean) obj3).booleanValue();
                Intrinsics.g(pair, "<destruct>");
                String str = (String) pair.f71683a;
                boolean zBooleanValue7 = ((Boolean) pair.f71684b).booleanValue();
                boolean z11 = zBooleanValue6 && !zBooleanValue7;
                if ((k.U0(str) || zBooleanValue7 || zBooleanValue5) && !z11) {
                    return null;
                }
                return new u0(2132019803, null);
            case 8:
                e3 fieldState3 = (e3) obj;
                boolean zBooleanValue8 = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue9 = ((Boolean) obj3).booleanValue();
                Intrinsics.g(fieldState3, "fieldState");
                return Boolean.valueOf(fieldState3.b(zBooleanValue8, zBooleanValue9));
            case 9:
                ((Boolean) obj3).booleanValue();
                Intent intent = new Intent("android.intent.action.CREATE_REMINDER");
                intent.putExtra("android.intent.extra.TEXT", (String) obj);
                intent.putExtra("android.intent.extra.EPOCH_TIME", (Long) obj2);
                return intent;
            default:
                y3.a aVar = (y3.a) obj3;
                int i5 = y3.a.i(aVar.f96596a);
                long j11 = aVar.f96596a;
                i1 i1VarH = ((q0) obj2).H(y3.b.a(i5, y3.a.g(j11), y3.a.j(j11), y3.a.h(j11)));
                return ((t0) obj).y(i1VarH.f98082b, i1VarH.f98081a, b70.h.f17594a, new d1.k(i1VarH, 7));
        }
    }
}
