package com.moloco.sdk.acm.http;

import aa.n;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.Process;
import androidx.activity.result.ActivityResult;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.teslacoilsw.launcher.NovaLauncher;
import com.vungle.ads.internal.protos.Sdk;
import cw.r3;
import e00.c3;
import e00.j3;
import e00.m2;
import f1.r0;
import f1.s0;
import g20.w;
import i2.h;
import i2.s;
import j00.h0;
import k2.j;
import k2.k;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kw.e3;
import m0.u;
import m3.o0;
import mx.k0;
import p1.e1;
import p1.y2;
import q00.l;
import r3.z;
import t00.q;
import t70.j0;
import t70.m0;

/* loaded from: classes3.dex */
public final /* synthetic */ class g implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f36146a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f36147b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f36148c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f36149d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f36150e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f36151f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f36152g;

    public /* synthetic */ g(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, int i5) {
        this.f36146a = i5;
        this.f36147b = obj;
        this.f36148c = obj2;
        this.f36149d = obj3;
        this.f36150e = obj4;
        this.f36151f = obj5;
        this.f36152g = obj6;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        e3 e3VarR;
        int i5 = this.f36146a;
        Object obj2 = this.f36152g;
        Object obj3 = this.f36151f;
        Object obj4 = this.f36150e;
        Object obj5 = this.f36149d;
        Object obj6 = this.f36148c;
        Object obj7 = this.f36147b;
        switch (i5) {
            case 0:
                break;
            case 1:
                j0 j0Var = (j0) obj7;
                m0.t(j0Var, null, null, new j3((c3) obj6, (ActivityResult) obj, (e1) obj5, j0Var, (e1) obj4, (w) obj3, (Context) obj2, (Continuation) null), 3);
                break;
            case 2:
                r0 r0Var = (r0) obj7;
                y2 y2Var = (y2) obj4;
                y2 y2Var2 = (y2) obj3;
                y2 y2Var3 = (y2) obj2;
                k2.f fVar = (k2.f) obj;
                float fFloor = (float) Math.floor(fVar.mo102toPx0680j_4(s0.f53941d));
                long j11 = ((s) ((y2) obj6).getValue()).f61148a;
                long j12 = ((s) ((y2) obj5).getValue()).f61148a;
                float fMo102toPx0680j_4 = fVar.mo102toPx0680j_4(s0.f53942e);
                float f11 = fFloor / 2.0f;
                k kVar = new k(fFloor, 0.0f, 0, 0, 30);
                float fIntBitsToFloat = Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32));
                int i11 = s.n;
                boolean zA = ULong.a(j11, j12);
                j jVar = j.f70871a;
                if (zA) {
                    fVar.mo92drawRoundRectuAw5IA(j11, (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 2) != 0 ? 0L : 0L, (Float.floatToRawIntBits(fIntBitsToFloat) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat) & 4294967295L), (Float.floatToRawIntBits(fMo102toPx0680j_4) << 32) | (Float.floatToRawIntBits(fMo102toPx0680j_4) & 4294967295L), (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 16) != 0 ? j.f70871a : jVar, 1.0f, null, 3);
                } else {
                    float f12 = fIntBitsToFloat - (2 * fFloor);
                    long jFloatToRawIntBits = (Float.floatToRawIntBits(f12) << 32) | (Float.floatToRawIntBits(f12) & 4294967295L);
                    float fMax = Math.max(0.0f, fMo102toPx0680j_4 - fFloor);
                    fVar.mo92drawRoundRectuAw5IA(j11, (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 2) != 0 ? 0L : (Float.floatToRawIntBits(fFloor) << 32) | (Float.floatToRawIntBits(fFloor) & 4294967295L), jFloatToRawIntBits, (Float.floatToRawIntBits(fMax) << 32) | (Float.floatToRawIntBits(fMax) & 4294967295L), (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 16) != 0 ? j.f70871a : jVar, 1.0f, null, 3);
                    float f13 = fIntBitsToFloat - fFloor;
                    float f14 = fMo102toPx0680j_4 - f11;
                    fVar.mo92drawRoundRectuAw5IA(j12, (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 2) != 0 ? 0L : (Float.floatToRawIntBits(f11) << 32) | (Float.floatToRawIntBits(f11) & 4294967295L), (Float.floatToRawIntBits(f13) << 32) | (Float.floatToRawIntBits(f13) & 4294967295L), (Float.floatToRawIntBits(f14) << 32) | (Float.floatToRawIntBits(f14) & 4294967295L), (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 16) != 0 ? j.f70871a : kVar, 1.0f, null, 3);
                }
                long j13 = ((s) y2Var.getValue()).f61148a;
                float fFloatValue = ((Number) y2Var2.getValue()).floatValue();
                float fFloatValue2 = ((Number) y2Var3.getValue()).floatValue();
                k kVar2 = new k(fFloor, 0.0f, 2, 0, 26);
                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32));
                float fD0 = bh.g.d0(0.4f, 0.5f, fFloatValue2);
                float fD02 = bh.g.d0(0.7f, 0.5f, fFloatValue2);
                float fD03 = bh.g.d0(0.5f, 0.5f, fFloatValue2);
                float fD04 = bh.g.d0(0.3f, 0.5f, fFloatValue2);
                r0Var.f53913a.e();
                h hVar = r0Var.f53913a;
                hVar.f61117a.moveTo(0.2f * fIntBitsToFloat2, fD03 * fIntBitsToFloat2);
                hVar.c(fD0 * fIntBitsToFloat2, fD02 * fIntBitsToFloat2);
                hVar.c(0.8f * fIntBitsToFloat2, fIntBitsToFloat2 * fD04);
                i2.j jVar2 = r0Var.f53914b;
                jVar2.c(hVar);
                h hVar2 = r0Var.f53915c;
                hVar2.e();
                jVar2.b(0.0f, jVar2.f61124a.getLength() * fFloatValue, hVar2);
                k2.f.e(fVar, r0Var.f53915c, j13, 0.0f, kVar2, 52);
                break;
            case 3:
                ((m0.g) ((u) obj)).g(new x1.e(new m2((h0) obj7, (Context) obj6, (j0) obj5, (PackageManager) obj4, (y2) obj3, (y2) obj2), true, 283519781));
                break;
            case 4:
                kw.y2 y2Var4 = (kw.y2) obj7;
                Function1 function1 = (Function1) obj6;
                e1 e1Var = (e1) obj4;
                e1 e1Var2 = (e1) obj3;
                e1 e1Var3 = (e1) obj2;
                z newValue = (z) obj;
                Intrinsics.g(newValue, "newValue");
                String str = newValue.f85471a.f75880b;
                boolean zA2 = wh.f.A((e3) ((e1) obj5).getValue(), (String) e1Var.getValue(), str);
                if (str.equals((String) e1Var.getValue()) || zA2) {
                    e1Var2.setValue(new o0(newValue.f85472b));
                    e1Var3.setValue(newValue.f85473c);
                }
                if (zA2 && (e3VarR = y2Var4.r(str)) != null) {
                    function1.invoke(e3VarR);
                }
                break;
            case 5:
                mx.f fVar2 = (mx.f) obj7;
                fz.d dVar = (fz.d) obj6;
                Drawable nVar = (Drawable) obj5;
                k0 k0Var = (k0) obj4;
                ComponentName componentName = (ComponentName) obj3;
                e1 e1Var4 = (e1) obj2;
                DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) obj;
                doubleShadowBubbleTextView.r(fVar2);
                Drawable drawable = doubleShadowBubbleTextView.getCompoundDrawables()[1];
                if (!Intrinsics.b(dVar, (fz.d) e1Var4.getValue())) {
                    if (nVar instanceof com.teslacoilsw.launcher.icon.a) {
                        q.i(nVar, dVar);
                        ((com.teslacoilsw.launcher.icon.a) nVar).o = dVar.d();
                    } else {
                        nVar = new n(k0Var.d(nVar, Process.myUserHandle(), false).f21151a, 0, false);
                    }
                    e1Var4.setValue(dVar);
                    drawable = nVar;
                }
                doubleShadowBubbleTextView.t(drawable);
                if (Intrinsics.b(componentName, NovaLauncher.f45646r1)) {
                    doubleShadowBubbleTextView.setText(fVar2.f77069b.f77129g ? "Nova Launcher" : "Nova\nLauncher");
                }
                break;
            case 6:
                tz.u uVar = (tz.u) obj;
                p6.f.r((l10.w) obj5, (String) obj7, (tz.k) obj4, (l) obj3, (l) obj2, uVar, tz.n.b(uVar.f90171b));
                ((r3) obj6).invoke();
                break;
            case 7:
                p6.f.r((l10.w) obj5, (String) obj7, (tz.k) obj4, (l) obj3, (l) obj2, (tz.u) obj6, 255 - MathKt.b(255 * ((Float) obj).floatValue()));
                break;
            default:
                ConsumerPaymentDetails.PaymentDetails it = (ConsumerPaymentDetails.PaymentDetails) obj;
                Intrinsics.g(it, "it");
                ((Function1) obj7).invoke(new x1.e(new ys.k0(it, (j0) obj6, (Function1) obj5, (Function1) obj4, (Function1) obj3, (Function1) obj2), true, 1852234147));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ g(Object obj, l10.w wVar, String str, tz.k kVar, l lVar, l lVar2, int i5) {
        this.f36146a = i5;
        this.f36148c = obj;
        this.f36149d = wVar;
        this.f36147b = str;
        this.f36150e = kVar;
        this.f36151f = lVar;
        this.f36152g = lVar2;
    }
}
