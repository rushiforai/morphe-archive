package b10;

import android.content.Context;
import android.content.Intent;
import android.widget.EditText;
import android.widget.Toast;
import androidx.credentials.exceptions.GetCredentialException;
import com.google.android.gms.internal.measurement.v6;
import com.instabridge.ai.billing.BillingManager;
import com.instabridge.ai.billing.BillingProduct;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.v2.ToolCallCardViewHolderV2;
import com.instabridge.ai.proactive.AiInsightData;
import com.instabridge.ai.profile.PlanSelectorSheet;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.S;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.shoppay.ShopPayActivity;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import g0.w2;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.Executor;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import l1.g4;

/* loaded from: classes4.dex */
public final /* synthetic */ class d0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16623a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16624b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16625c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f16626d;

    public /* synthetic */ d0(int i5, Object obj, Object obj2, Object obj3) {
        this.f16623a = i5;
        this.f16626d = obj;
        this.f16625c = obj2;
        this.f16624b = obj3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:89:0x0357, code lost:
    
        if (r1.f56529g == false) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0359, code lost:
    
        r4 = r1.D();
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x035d, code lost:
    
        if (r4 == null) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0365, code lost:
    
        if (r1.E(r1.f56531i, r4) != true) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0368, code lost:
    
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x0369, code lost:
    
        if (r7 == 0) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x036b, code lost:
    
        r1.f56529g = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x036d, code lost:
    
        r2.f56753e = g0.g.B(r1, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x0375, code lost:
    
        return kotlin.Unit.f71706a;
     */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        int i5 = 2;
        int i11 = 0;
        int i12 = 1;
        Continuation continuation = null;
        switch (this.f16623a) {
            case 0:
                p0.b bVar = (p0.b) this.f16626d;
                FirstRunActivityCompose firstRunActivityCompose = (FirstRunActivityCompose) this.f16625c;
                t70.j0 j0Var = (t70.j0) this.f16624b;
                if (bVar.k() != firstRunActivityCompose.f45938p) {
                    t70.m0.t(j0Var, null, null, new e0(bVar, continuation, i11), 3);
                }
                return Unit.f71706a;
            case 1:
                t70.j0 j0Var2 = (t70.j0) this.f16624b;
                FirstRunActivityCompose firstRunActivityCompose2 = (FirstRunActivityCompose) this.f16625c;
                Context context = (Context) this.f16626d;
                zy.c cVar = zy.c.f98823a;
                h6.c1.A("choice", "accept", "auto_restore_click");
                a80.e eVar = t70.y0.f88884a;
                t70.m0.t(j0Var2, a80.d.f488c, null, new v0(context, continuation, i11), 2);
                Intent intent = new Intent();
                intent.setComponent(NovaShortcutHandler.f45670c);
                firstRunActivityCompose2.startActivity(intent);
                System.exit(0);
                throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
            case 2:
                t70.j0 j0Var3 = (t70.j0) this.f16624b;
                Context context2 = (Context) this.f16626d;
                p1.e1 e1Var = (p1.e1) this.f16625c;
                zy.c cVar2 = zy.c.f98823a;
                h6.c1.A("choice", "decline", "auto_restore_click");
                a80.e eVar2 = t70.y0.f88884a;
                t70.m0.t(j0Var3, a80.d.f488c, null, new v0(context2, continuation, i12), 2);
                int i13 = FirstRunActivityCompose.f45937s;
                e1Var.setValue(Boolean.FALSE);
                return Unit.f71706a;
            case 3:
                Function1 function1 = (Function1) this.f16626d;
                cy.m0 m0Var = (cy.m0) this.f16625c;
                Function0 function0 = (Function0) this.f16624b;
                function1.invoke(m0Var);
                function0.invoke();
                return Unit.f71706a;
            case 4:
                t70.m0.t((t70.j0) this.f16624b, null, null, new ar.a((k2) this.f16626d, (p1.e1) this.f16625c, continuation, 22), 3);
                return Unit.f71706a;
            case 5:
                return ToolCallCardViewHolderV2.bindAskClarification$lambda$3((EditText) this.f16626d, (ToolCallCardViewHolderV2) this.f16625c, (ChatItem.ToolCallCard) this.f16624b);
            case 6:
                return PlanSelectorSheet.refreshPlanCards$lambda$4((BillingManager) this.f16626d, (PlanSelectorSheet) this.f16625c, (BillingProduct) this.f16624b);
            case 7:
                return com.moloco.sdk.internal.ilrd.e.a((List) this.f16626d, (Context) this.f16625c, (com.moloco.sdk.internal.ilrd.e) this.f16624b);
            case 8:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.j.b((Context) this.f16626d, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k) this.f16625c, (S) this.f16624b);
            case 9:
                cw.a1 a1Var = (cw.a1) this.f16626d;
                bw.e eVar3 = (bw.e) this.f16625c;
                Context context3 = (Context) this.f16624b;
                cw.q qVar = a1Var.f48057a;
                if (qVar != null) {
                    ((h6.u0) qVar.f48268c).d("KEY_HAS_AUTOMATICALLY_LAUNCHED_CARD_SCAN", Boolean.TRUE);
                }
                eVar3.a(context3);
                return Unit.f71706a;
            case 10:
                ((p1.e1) this.f16624b).setValue(Boolean.valueOf(((w20.l) this.f16626d).a((Context) this.f16625c)));
                return Unit.f71706a;
            case 11:
                g0.g gVar = (g0.g) this.f16626d;
                w2 w2Var = (w2) this.f16625c;
                g0.c cVar3 = (g0.c) this.f16624b;
                v6 v6Var = gVar.f56527e;
                while (true) {
                    r1.e eVar4 = (r1.e) v6Var.f33136b;
                    int i14 = eVar4.f85079c;
                    if (i14 == 0) {
                        break;
                    } else {
                        if (i14 == 0) {
                            throw new NoSuchElementException("MutableVector is empty.");
                        }
                        h2.c cVar4 = (h2.c) ((g0.f) eVar4.f85077a[i14 - 1]).f56512a.invoke();
                        if (!(cVar4 == null ? true : gVar.E(gVar.f56531i, cVar4))) {
                            break;
                        } else {
                            r1.e eVar5 = (r1.e) v6Var.f33136b;
                            t70.m mVar = ((g0.f) eVar5.k(eVar5.f85079c - 1)).f56513b;
                            Unit unit = Unit.f71706a;
                            int i15 = Result.f71687b;
                            mVar.resumeWith(unit);
                        }
                    }
                }
            case 12:
                gx.q0 q0Var = (gx.q0) this.f16626d;
                gx.b0 b0Var = (gx.b0) this.f16625c;
                String str = (String) this.f16624b;
                q0Var.f58182w = true;
                t70.m0.t(q0Var.f58168g, null, null, new gx.j0(q0Var, continuation, i11), 3);
                b0Var.n.remove(str);
                return Unit.f71706a;
            case 13:
                Function1 function12 = (Function1) this.f16626d;
                p1.e1 e1Var2 = (p1.e1) this.f16625c;
                p1.e1 e1Var3 = (p1.e1) this.f16624b;
                String str2 = (String) e1Var2.getValue();
                kotlin.text.a.a(16);
                function12.invoke(Integer.valueOf(Integer.parseInt(str2, 16)));
                e1Var3.setValue(Boolean.FALSE);
                return Unit.f71706a;
            case 14:
                Function1 function13 = (Function1) this.f16626d;
                Function1 function14 = (Function1) this.f16625c;
                function13.invoke(Integer.valueOf(Integer.parseInt((String) ((p1.e1) this.f16624b).getValue())));
                function14.invoke(Boolean.FALSE);
                return Unit.f71706a;
            case 15:
                ((Function2) this.f16626d).invoke(u10.w.e((u10.w) this.f16625c, null, null, null, 11), (List) this.f16624b);
                return Unit.f71706a;
            case 16:
                String str3 = (String) this.f16626d;
                Function0 function02 = (Function0) this.f16625c;
                p1.e1 e1Var4 = (p1.e1) this.f16624b;
                ul.b.b0(str3, !((Boolean) e1Var4.getValue()).booleanValue());
                e1Var4.setValue(Boolean.valueOf(!((Boolean) e1Var4.getValue()).booleanValue()));
                function02.invoke();
                return Unit.f71706a;
            case 17:
                ((Function1) this.f16626d).invoke(b70.g.p1((List) this.f16625c, ((j00.a0) this.f16624b).f68448b));
                return Unit.f71706a;
            case 18:
                kv.c cVar5 = (kv.c) this.f16626d;
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f16625c;
                ou.c customerStateHolder = (ou.c) this.f16624b;
                ou.g2 savedPaymentMethodMutator = cVar5.A;
                Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
                Intrinsics.g(customerStateHolder, "customerStateHolder");
                Intrinsics.g(savedPaymentMethodMutator, "savedPaymentMethodMutator");
                xu.n nVar = new xu.n(new bo.c(customerStateHolder.f80805c, paymentMethodMetadata, cVar5.f72279p, savedPaymentMethodMutator.f80895q, savedPaymentMethodMutator.o, new bu.q(0, savedPaymentMethodMutator, ou.g2.class, "toggleEditing", "toggleEditing()V", 0, 18), new jv.e(cVar5, i11), new jv.f(savedPaymentMethodMutator, i11), new jv.e(cVar5, i12), savedPaymentMethodMutator.f80893m));
                xu.f fVar = cVar5.f72278m;
                fVar.getClass();
                s10.s sVar = new s10.s(13, fVar, nVar);
                if (!fVar.f96340e.getAndSet(true)) {
                    t70.m0.t(fVar.f96336a, null, null, new xu.e(sVar, fVar, null), 3);
                }
                return Unit.f71706a;
            case 19:
                p1.e1 e1Var5 = (p1.e1) this.f16626d;
                bo.c cVar6 = (bo.c) this.f16625c;
                ou.j jVar = (ou.j) this.f16624b;
                if (((jv.u) e1Var5.getValue()).f70173c) {
                    cVar6.a(new jv.x(jVar));
                    Unit unit2 = Unit.f71706a;
                } else {
                    cVar6.a(new jv.v(jVar));
                    Unit unit3 = Unit.f71706a;
                }
                return Unit.f71706a;
            case 20:
                u10.e0 e0Var = (u10.e0) this.f16626d;
                p6.t tVar = (p6.t) this.f16625c;
                Context context4 = (Context) this.f16624b;
                if ((e0Var instanceof u10.c) || (e0Var instanceof u10.w) || (e0Var instanceof u10.w0) || (e0Var instanceof u10.h0) || (e0Var instanceof u10.p0)) {
                    String str4 = e0Var.f90373a;
                    Regex regex = g00.j.f56824a;
                    p6.t.n(tVar, "CardDetailsTopLevel?cardKey=" + str4, null, 6);
                } else if (e0Var instanceof u10.c0) {
                    p6.t.n(tVar, "GamesCardSettings", null, 6);
                } else {
                    if (!(e0Var instanceof u10.m) && !(e0Var instanceof u10.z) && !(e0Var instanceof u10.q0) && !(e0Var instanceof u10.f) && !(e0Var instanceof u10.r0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    Toast.makeText(context4.getApplicationContext(), context4.getString(2132017605), 0).show();
                }
                return Unit.f71706a;
            case 21:
                ((Executor) this.f16626d).execute(new fa.l0(27, (f5.d) this.f16625c, this.f16624b));
                return Unit.f71706a;
            case 22:
                ((Executor) this.f16626d).execute(new fa.l0(28, (f5.d) this.f16625c, (f5.m) this.f16624b));
                return Unit.f71706a;
            case 23:
                ((Executor) this.f16626d).execute(new k5.e((f5.d) this.f16625c, (GetCredentialException) this.f16624b, i12));
                return Unit.f71706a;
            case 24:
                t70.j0 j0Var4 = (t70.j0) this.f16624b;
                Function1 function15 = (Function1) this.f16626d;
                AiInsightData aiInsightData = (AiInsightData) this.f16625c;
                a80.e eVar6 = t70.y0.f88884a;
                t70.m0.t(j0Var4, a80.d.f488c, null, new b.x1(i5, continuation, 26), 2);
                function15.invoke(aiInsightData);
                return Unit.f71706a;
            case 25:
                p1.e1 e1Var6 = (p1.e1) this.f16626d;
                String str5 = (String) this.f16625c;
                p1.e1 e1Var7 = (p1.e1) this.f16624b;
                e1Var6.setValue(str5);
                e1Var7.setValue(Boolean.FALSE);
                return Unit.f71706a;
            case 26:
                t70.j0 j0Var5 = (t70.j0) this.f16624b;
                lw.l lVar = (lw.l) this.f16626d;
                ShopPayActivity shopPayActivity = (ShopPayActivity) this.f16625c;
                int i16 = ShopPayActivity.f45009s;
                t70.m0.t(j0Var5, null, null, new g4(lVar, shopPayActivity, continuation, 14), 3);
                return Unit.f71706a;
            case 27:
                return new p0.m((Function4) ((p1.e1) this.f16626d).getValue(), (Function1) ((p1.e1) this.f16625c).getValue(), ((Number) ((Function0) this.f16624b).invoke()).intValue());
            case 28:
                Function1 function16 = (Function1) this.f16626d;
                Function0 function03 = (Function0) this.f16625c;
                function16.invoke((e10.b0) ((p1.e1) this.f16624b).getValue());
                function03.invoke();
                return Unit.f71706a;
            default:
                e10.b0 b0Var2 = (e10.b0) this.f16626d;
                p1.e1 e1Var8 = (p1.e1) this.f16625c;
                p1.e1 e1Var9 = (p1.e1) this.f16624b;
                e1Var8.setValue(b0Var2);
                e1Var9.setValue(Integer.valueOf(((Number) e1Var9.getValue()).intValue() + 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ d0(g2 g2Var, String str, t70.j0 j0Var, k2 k2Var, p1.e1 e1Var) {
        this.f16623a = 4;
        this.f16624b = j0Var;
        this.f16626d = k2Var;
        this.f16625c = e1Var;
    }

    public /* synthetic */ d0(t70.j0 j0Var, FirstRunActivityCompose firstRunActivityCompose, Context context) {
        this.f16623a = 1;
        this.f16624b = j0Var;
        this.f16625c = firstRunActivityCompose;
        this.f16626d = context;
    }

    public /* synthetic */ d0(t70.j0 j0Var, Object obj, Object obj2, int i5) {
        this.f16623a = i5;
        this.f16624b = j0Var;
        this.f16626d = obj;
        this.f16625c = obj2;
    }
}
