package f1;

import android.app.Application;
import android.content.Context;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.stripe.android.attestation.AttestationActivity;
import com.stripe.android.attestation.AttestationArgs;
import com.stripe.android.core.networking.SendAnalyticsRequestV2Worker;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import java.time.DayOfWeek;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Set;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kotlin.text.MatchResult;
import kotlinx.serialization.json.JsonBuilder;

/* loaded from: classes2.dex */
public final /* synthetic */ class o0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53813a;

    public /* synthetic */ o0(int i5) {
        this.f53813a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = 0;
        int i11 = 1;
        switch (this.f53813a) {
            case 0:
                j3.y.j((j3.b0) obj, 0);
                return Unit.f71706a;
            case 1:
                float f11 = u1.f54014a;
                return Boolean.TRUE;
            case 2:
                float f12 = androidx.compose.material.a.f14083a;
                return Boolean.TRUE;
            case 3:
                c0.p0 p0Var = (c0.p0) obj;
                p0Var.f18916a = 1332;
                p0Var.a(Float.valueOf(0.0f), 0).f18893b = i3.f53655b;
                p0Var.a(Float.valueOf(290.0f), TTAdConstant.STYLE_SIZE_RADIO_2_3);
                return Unit.f71706a;
            case 4:
                c0.p0 p0Var2 = (c0.p0) obj;
                p0Var2.f18916a = 1332;
                p0Var2.a(Float.valueOf(0.0f), TTAdConstant.STYLE_SIZE_RADIO_2_3).f18893b = i3.f53655b;
                p0Var2.a(Float.valueOf(290.0f), p0Var2.f18916a);
                return Unit.f71706a;
            case 5:
                ((b2) obj).getClass();
                return true;
            case 6:
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68863l;
                KProperty kProperty = j3.y.f68878a[5];
                a0Var.a((j3.b0) obj, Boolean.TRUE);
                return Unit.f71706a;
            case 7:
                return Unit.f71706a;
            case 8:
                return Unit.f71706a;
            case 9:
                return ((Enum) obj).name();
            case 10:
                k6.c initializer = (k6.c) obj;
                Intrinsics.g(initializer, "$this$initializer");
                int i12 = AttestationActivity.f42458q;
                AttestationArgs attestationArgs = (AttestationArgs) h6.y0.a(initializer).a("attestation_args");
                if (attestationArgs == null) {
                    throw new IllegalArgumentException() { // from class: com.stripe.android.attestation.AttestationViewModel$NoArgsException
                    };
                }
                Object objA = initializer.a(h6.i1.f59383d);
                Intrinsics.e(objA, "null cannot be cast to non-null type android.app.Application");
                Application application = (Application) objA;
                d00.t tVar = new d00.t(attestationArgs, 29);
                Set setN1 = b70.g.N1(attestationArgs.f42463b);
                setN1.getClass();
                br.a aVar = new br.a(0);
                s40.h hVarB = s40.c.b(new av.a(new br.c(), i11));
                s40.h hVarB2 = s40.c.b(new br.b(aVar, fq.d.f55571b, i5));
                s40.h hVarB3 = s40.c.b(fq.d.f55570a);
                xw.g gVarA = au.e.a(application);
                CoroutineContext coroutineContext = (CoroutineContext) hVarB.get();
                fr.l lVar = new fr.l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get());
                jt.a aVar2 = new jt.a(application, tVar, setN1);
                ir.c durationProvider = (ir.c) hVarB3.get();
                Intrinsics.g(durationProvider, "durationProvider");
                return new com.stripe.android.attestation.c(gVarA, coroutineContext, new fl.l(lVar, aVar2, durationProvider));
            case 11:
                fr.f it = (fr.f) obj;
                Intrinsics.g(it, "it");
                return it.toString();
            case 12:
                MatchResult it2 = (MatchResult) obj;
                Intrinsics.g(it2, "it");
                return "<b>" + it2.a().get(1) + "</b>";
            case 13:
                MatchResult it3 = (MatchResult) obj;
                Intrinsics.g(it3, "it");
                return "<b>" + it3.a().get(1) + "</b>";
            case 14:
                MatchResult it4 = (MatchResult) obj;
                Intrinsics.g(it4, "it");
                return "<a href=\"" + it4.a().get(2) + "\">" + it4.a().get(1) + "</a>";
            case 15:
                fr.a0 it5 = (fr.a0) obj;
                Intrinsics.g(it5, "it");
                return it5.toString();
            case 16:
                Context it6 = (Context) obj;
                cw.r rVar = SendAnalyticsRequestV2Worker.f42579f;
                Intrinsics.g(it6, "it");
                Context applicationContext = it6.getApplicationContext();
                Intrinsics.e(applicationContext, "null cannot be cast to non-null type android.app.Application");
                return new fl.l((Application) applicationContext);
            case 17:
                String name = (String) obj;
                Intrinsics.g(name, "name");
                String property = System.getProperty(name);
                return property == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : property;
            case 18:
                p1.z2 z2Var = AndroidCompositionLocals_androidKt.f14166b;
                p1.n1 n1Var = (p1.n1) obj;
                n1Var.getClass();
                if (((Context) p1.a0.h(n1Var, z2Var)).getPackageManager().hasSystemFeature("android.software.leanback")) {
                    return g0.e.f56499b;
                }
                g0.c.f56471a.getClass();
                return g0.b.f56464c;
            case 19:
                return Boolean.TRUE;
            case 20:
                ((Long) obj).longValue();
                return Unit.f71706a;
            case 21:
                ((Float) obj).floatValue();
                return Unit.f71706a;
            case 22:
                return ((DayOfWeek) obj).getDisplayName(TextStyle.SHORT, Locale.getDefault());
            case 23:
                return ((SimpleBluetoothDevice) obj).f45534a;
            case 24:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setIgnoreUnknownKeys(true);
                Json.setExplicitNulls(false);
                return Unit.f71706a;
            case 25:
                JsonBuilder Json2 = (JsonBuilder) obj;
                Intrinsics.g(Json2, "$this$Json");
                Json2.setIgnoreUnknownKeys(true);
                Json2.setExplicitNulls(false);
                return Unit.f71706a;
            case 26:
                return Boolean.TRUE;
            case 27:
                return gy.m0.f58430b.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (String) obj);
            case 28:
                return Boolean.valueOf(gy.m0.f58429a.f((String) obj));
            default:
                return gy.m0.f58433e.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (String) obj);
        }
    }

    public /* synthetic */ o0(c10.a aVar) {
        this.f53813a = 9;
    }
}
