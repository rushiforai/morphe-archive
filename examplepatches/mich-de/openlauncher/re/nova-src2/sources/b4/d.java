package b4;

import ads_mobile_sdk.g1;
import ads_mobile_sdk.pe2;
import ads_mobile_sdk.ue2;
import ads_mobile_sdk.wk0;
import android.content.Context;
import android.os.Build;
import androidx.compose.ui.node.LayoutNode;
import b.r2;
import c3.d4;
import c3.e4;
import c3.h1;
import c3.x0;
import c3.y0;
import c3.z0;
import i2.w0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import t5.e1;
import t5.z;
import z2.i1;

/* loaded from: classes.dex */
public final class d extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17454j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f17455k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f17456l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, Object obj, Object obj2) {
        super(1);
        this.f17454j = i5;
        this.f17455k = obj;
        this.f17456l = obj2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Unit unit;
        switch (this.f17454j) {
            case 0:
                ((LayoutNode) this.f17455k).setModifier(((b2.t) obj).then((b2.t) this.f17456l));
                return Unit.f71706a;
            case 1:
                g1 manifest = (g1) obj;
                Intrinsics.g(manifest, "manifest");
                pe2 pe2Var = (pe2) this.f17455k;
                ue2 ue2Var = (ue2) this.f17456l;
                String strName = ue2Var.f10325b.name();
                String str = ue2Var.f10326c;
                String str2 = ue2Var.f10324a;
                pe2Var.getClass();
                return pe2.a(manifest, strName, str, str2);
            case 2:
                g1 currentManifest = (g1) obj;
                Intrinsics.g(currentManifest, "currentManifest");
                wk0 wk0Var = (wk0) this.f17455k;
                String value = (String) this.f17456l;
                r2 r2Var = (r2) currentManifest.n();
                String str3 = wk0Var.f11313a;
                r2Var.b();
                ((g1) r2Var.f1095b).d(str3);
                long j11 = wk0Var.f11314b;
                r2Var.b();
                g1 g1Var = (g1) r2Var.f1095b;
                g1Var.bitField0_ |= 2;
                g1Var.versionCode_ = j11;
                String value2 = Build.MODEL;
                Intrinsics.g(value2, "value");
                r2Var.b();
                ((g1) r2Var.f1095b).c(value2);
                int i5 = wk0Var.f11315d;
                r2Var.b();
                g1 g1Var2 = (g1) r2Var.f1095b;
                g1Var2.bitField0_ |= 8;
                g1Var2.androidApiVersion_ = i5;
                Intrinsics.g(value, "value");
                r2Var.b();
                ((g1) r2Var.f1095b).b(value);
                return (g1) r2Var.a();
            case 3:
                Context context = (Context) this.f17455k;
                Context applicationContext = context.getApplicationContext();
                y0 y0Var = (y0) this.f17456l;
                applicationContext.registerComponentCallbacks(y0Var);
                return new x0(context, y0Var, 0);
            case 4:
                Context context2 = (Context) this.f17455k;
                Context applicationContext2 = context2.getApplicationContext();
                z0 z0Var = (z0) this.f17456l;
                applicationContext2.registerComponentCallbacks(z0Var);
                return new x0(context2, z0Var, 1);
            case 5:
                c3.g1 g1Var3 = (c3.g1) this.f17455k;
                h1 h1Var = (h1) this.f17456l;
                synchronized (g1Var3.f19290e) {
                    g1Var3.f19292g.remove(h1Var);
                }
                return Unit.f71706a;
            case 6:
                c3.o oVar = (c3.o) obj;
                Function2 function2 = (Function2) this.f17456l;
                e4 e4Var = (e4) this.f17455k;
                if (!e4Var.f19273c) {
                    h6.u lifecycle = oVar.f19392a.getLifecycle();
                    e4Var.f19275e = function2;
                    if (e4Var.f19274d == null) {
                        e4Var.f19274d = lifecycle;
                        lifecycle.a(e4Var);
                    } else if (lifecycle.b().compareTo(h6.t.f59442c) >= 0) {
                        e4Var.f19272b.B(new x1.e(new d4(e4Var, function2, 1), true, 1330788943));
                    }
                }
                return Unit.f71706a;
            case 7:
                z2.h1.t((z2.h1) obj, (i1) this.f17455k, 0, 0, ((i2.o) this.f17456l).f61131a, 4);
                return Unit.f71706a;
            case 8:
                z2.h1.t((z2.h1) obj, (i1) this.f17455k, 0, 0, ((w0) this.f17456l).f61188m, 4);
                return Unit.f71706a;
            default:
                Throwable th2 = (Throwable) obj;
                ((androidx.fragment.app.p) this.f17455k).invoke(th2);
                v70.i iVar = ((e1) this.f17456l).f88579c;
                iVar.g(false, th2);
                do {
                    Object objA = v70.r.a(iVar.n());
                    if (objA != null) {
                        z.f88756j.invoke(objA, th2);
                        unit = Unit.f71706a;
                    } else {
                        unit = null;
                    }
                } while (unit != null);
                return Unit.f71706a;
        }
    }
}
