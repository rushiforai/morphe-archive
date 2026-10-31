package k5;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.net.Uri;
import aosp.androidx.core.content.FileProvider;
import b3.h0;
import c0.r0;
import cl.k0;
import com.instabridge.ai.proactive.AiInsightAction;
import com.instabridge.ai.prompts.AiPrompt;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.b1;
import com.stripe.android.paymentsheet.k;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.appwidget.WidgetsPeekingSheet;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.vungle.ads.internal.protos.Sdk;
import e10.e2;
import e10.y2;
import f5.m;
import gy.n0;
import h10.y0;
import h6.c1;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.ranges.IntRange;
import kotlin.text.Regex;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonNamingStrategy;
import kotlinx.serialization.json.internal.JsonNamesMapKt;
import kw.s3;
import kw.u2;
import l00.o;
import m00.j0;
import mx.s0;
import mx.x0;
import ou.f1;
import ou.g1;
import ou.v0;
import ox.j;
import p0.n;
import p0.y;
import p1.e1;
import p1.i0;
import p1.s2;
import p10.f0;
import p10.m0;
import p10.o0;
import p10.u0;
import qx.r;
import qx.w0;
import r10.b0;
import uy.d0;
import w70.i2;
import w70.o1;
import xu.l;
import zz.g;

/* loaded from: classes2.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71106a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f71107b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f71108c;

    public /* synthetic */ d(int i5, Object obj, Object obj2) {
        this.f71106a = i5;
        this.f71107b = obj;
        this.f71108c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01db  */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        MediaMetadata metadata;
        MediaController.TransportControls transportControls;
        Object value;
        int i5 = this.f71106a;
        Object[] objArr = 0;
        Object obj = this.f71108c;
        Object obj2 = this.f71107b;
        switch (i5) {
            case 0:
                ((Executor) obj2).execute(new j5.b((f5.d) obj, 7));
                return Unit.f71706a;
            case 1:
                return JsonNamesMapKt.buildDeserializationNamesMap((SerialDescriptor) obj2, (Json) obj);
            case 2:
                return JsonNamesMapKt.serializationNamesIndices$lambda$4((SerialDescriptor) obj2, (JsonNamingStrategy) obj);
            case 3:
                ((Function1) obj2).invoke((u2) obj);
                return Unit.f71706a;
            case 4:
                o oVar = (o) obj;
                if (k0.C(((a00.b) obj2).f64e)) {
                    g gVarM = oVar.m();
                    float fFloatValue = ((Number) ((s2) oVar.f72976i).getValue()).floatValue();
                    MediaController mediaController = gVarM.f98846e;
                    if (mediaController != null && (metadata = mediaController.getMetadata()) != null) {
                        long j11 = metadata.getLong("android.media.metadata.DURATION");
                        MediaController mediaController2 = gVarM.f98846e;
                        if (mediaController2 != null && (transportControls = mediaController2.getTransportControls()) != null) {
                            transportControls.seekTo(MathKt.c(fFloatValue * j11));
                        }
                    }
                }
                ((s2) oVar.f72974g).setValue(Boolean.FALSE);
                return Unit.f71706a;
            case 5:
                a00.b bVar = (a00.b) obj2;
                Function0 function0 = (Function0) obj;
                if (bVar != null) {
                    y2.f51877a.J0().i(new xz.d(bVar.f67h, bVar.f63d));
                } else {
                    y2.f51877a.J0().a();
                }
                function0.invoke();
                return Unit.f71706a;
            case 6:
                l5.b bVar2 = (l5.b) obj2;
                bVar2.e().execute(new kz.c(4, bVar2, (m) obj));
                return Unit.f71706a;
            case 7:
                ((Function1) obj2).invoke((List) ((j0) obj).n.getValue());
                return Unit.f71706a;
            case 8:
                ((Function1) obj2).invoke((AiInsightAction) obj);
                return Unit.f71706a;
            case 9:
                ((Function1) obj2).invoke((AiPrompt) obj);
                return Unit.f71706a;
            case 10:
                ((e1) obj).setValue(Boolean.TRUE);
                ((r0) obj2).k(Boolean.FALSE);
                return Unit.f71706a;
            case 11:
                NovaLauncher novaLauncher = (NovaLauncher) obj2;
                ComponentName componentName = NovaLauncher.f45646r1;
                int i11 = WidgetsPeekingSheet.f45705j0;
                t2.c.K(novaLauncher).R = (s0) obj;
                novaLauncher.O.x0();
                o10.b.a("home_page_added", novaLauncher);
                return Unit.f71706a;
            case 12:
                ((d0) obj2).s((x0) obj);
                return Unit.f71706a;
            case 13:
                Context context = (Context) obj2;
                Uri uri = (Uri) obj;
                Intent intent = new Intent("android.intent.action.SEND");
                if (!Intrinsics.b(uri.getScheme(), "file")) {
                    throw new IllegalArgumentException(c1.p(uri, "Uri lacks 'file' scheme: ").toString());
                }
                String path = uri.getPath();
                if (path == null) {
                    throw new IllegalArgumentException(c1.p(uri, "Uri path is null: ").toString());
                }
                intent.putExtra("android.intent.extra.STREAM", FileProvider.a(context, "com.teslacoilsw.launcher.fileprovider").c(new File(path)));
                intent.setType("application/octet-stream");
                context.startActivity(Intent.createChooser(intent, "Share supportDetails.txt via..."));
                return Unit.f71706a;
            case 14:
                k kVar = (k) obj2;
                ru.d dVar = (ru.d) obj;
                PaymentSelection paymentSelection = (PaymentSelection) kVar.f72279p.f93973a.getValue();
                if (paymentSelection != null) {
                    ((ru.a) dVar).q(paymentSelection);
                }
                kVar.u();
                return Unit.f71706a;
            case 15:
                b1 b1Var = (b1) obj2;
                su.a aVar = b1Var.G;
                ru.d dVar2 = (ru.d) obj;
                o1 o1Var = b1Var.f72279p;
                PaymentSelection paymentSelection2 = (PaymentSelection) o1Var.f93973a.getValue();
                if (paymentSelection2 != null) {
                    ((ru.a) dVar2).q(paymentSelection2);
                }
                PaymentSelection paymentSelection3 = (PaymentSelection) o1Var.f93973a.getValue();
                if (paymentSelection3 instanceof PaymentSelection.Saved) {
                    PaymentMethod paymentMethod = ((PaymentSelection.Saved) paymentSelection3).f44846a;
                    PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) b1Var.f72277l.getValue();
                    if (paymentMethodMetadata != null) {
                        if (((su.b) aVar).c(paymentMethodMetadata.f43092a, paymentMethod)) {
                            if (((b1Var.i() == v0.f80991a || (b1Var.f72278m.f96342g.f91586b.invoke() instanceof l)) ? 0 : 1) != 0) {
                                ((su.b) aVar).b(paymentMethod, new f1(b1Var, 2));
                            }
                        } else {
                            b1Var.w(paymentSelection3, g1.f80879b);
                        }
                    }
                }
                return Unit.f71706a;
            case 16:
                ox.l lVar = (ox.l) obj2;
                y0 y0Var = (y0) obj;
                e1 e1Var = lVar.f81089a;
                if (!((Boolean) ((s2) e1Var).getValue()).booleanValue()) {
                    ((s2) e1Var).setValue(Boolean.TRUE);
                    lVar.setVisibility(0);
                    lVar.post(new j(y0Var, lVar, i));
                }
                return Unit.f71706a;
            case 17:
                y yVar = (y) obj;
                p0.m mVar = (p0.m) ((i0) obj2).getValue();
                return new n(yVar, mVar, new androidx.compose.foundation.lazy.layout.e((IntRange) ((n0.i0) yVar.f81230d.f81106f).getValue(), mVar));
            case 18:
                o0 o0Var = (o0) obj2;
                Activity activity = (Activity) obj;
                i2 i2Var = o0Var.f81862f;
                if (((m0) i2Var.getValue()).f81844h != f0.f81756c) {
                    do {
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, m0.a((m0) value, 0L, 0L, 0L, 0, 0L, 0, f0.f81756c, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)));
                    zy.c cVar = zy.c.f98823a;
                    zy.c.i("rewards_onboarding_watch_tap", null);
                    yx.b bVar3 = yx.b.f97678a;
                    yx.b.g("rewards_onboarding_watch_tap", null);
                    t70.m0.t(o0Var.f81861e, null, null, new s3((Object) o0Var, (Object) activity, (Continuation) (objArr == true ? 1 : 0), 27), 3);
                }
                return Unit.f71706a;
            case 19:
                zy.c cVar2 = zy.c.f98823a;
                zy.c.i("rewards_card_hidden", null);
                yx.b bVar4 = yx.b.f97678a;
                yx.b.g("rewards_card_hidden", null);
                y2.f51877a.getClass();
                y2.k1().i(Boolean.FALSE);
                com.google.android.gms.internal.consent_sdk.k0.x((Context) obj2, (String) obj, 0).show();
                return Unit.f71706a;
            case 20:
                ((e1) obj).setValue(((u0) obj2).f81929a);
                return Unit.f71706a;
            case 21:
                Context context2 = (Context) obj2;
                Function1 function1 = (Function1) obj;
                Activity activity2 = context2 instanceof Activity ? (Activity) context2 : null;
                if (activity2 != null) {
                    function1.invoke(activity2);
                }
                return Unit.f71706a;
            case 22:
                ((Function1) obj2).invoke((ew.e) obj);
                return Unit.f71706a;
            case 23:
                ((e1) obj).setValue((n0) obj2);
                return Unit.f71706a;
            case 24:
                w0 w0Var = (w0) obj;
                Iterator it = ((ArrayList) obj2).iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    w0Var.d((qx.x0) pair.f71683a, (r) pair.f71684b);
                }
                return Unit.f71706a;
            case 25:
                r00.m mVar2 = (r00.m) obj2;
                mVar2.c(e10.i0.c(mVar2.b(), null, (e2) obj, false, 0, false, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
                return Unit.f71706a;
            case 26:
                h0 h0Var = AppSearchResultsView.f46177o0;
                ((AppSearchResultsView) obj2).getContext().startActivity(k00.c.c((String) obj));
                return Unit.f71706a;
            case 27:
                NovaLauncher novaLauncher2 = (NovaLauncher) obj;
                ((b0) obj2).f85241a.a(novaLauncher2, novaLauncher2.V);
                return Unit.f71706a;
            case 28:
                Regex.Companion companion = Regex.f72026b;
                return ((Regex) obj2).b((CharSequence) obj);
            default:
                ((h.k) obj2).a((String) obj, null);
                return Unit.f71706a;
        }
    }
}
