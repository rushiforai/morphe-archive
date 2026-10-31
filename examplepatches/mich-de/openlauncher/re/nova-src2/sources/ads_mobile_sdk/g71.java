package ads_mobile_sdk;

import c80.d;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g71 {

    /* renamed from: a, reason: collision with root package name */
    public final sb f3658a;

    /* renamed from: b, reason: collision with root package name */
    public final ci3 f3659b;

    public g71(sb adapterInitializer, ci3 traceLogger) {
        Intrinsics.g(adapterInitializer, "adapterInitializer");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f3658a = adapterInitializer;
        this.f3659b = traceLogger;
        new d();
    }

    public static com.google.gson.r a(String str, va vaVar, ti.c cVar) {
        String str2;
        String str3;
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("adapterClassName", str);
        String str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (cVar == null || (str2 = cVar.adapterVersion) == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        rVar.s("version", str2);
        if (cVar != null && (str3 = cVar.sdkVersion) != null) {
            str4 = str3;
        }
        rVar.s("sdkVersion", str4);
        rVar.q(Integer.valueOf(vaVar.getInitializationState() == pi.a.f82596c ? 1 : 0), "status");
        rVar.s(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, vaVar.getDescription());
        rVar.q(Integer.valueOf(vaVar.getLatency()), "initializationLatencyMillis");
        rVar.r("supportsInitialization", Boolean.valueOf(cVar != null));
        return rVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(g71 g71Var, ContinuationImpl continuationImpl) {
        f71 f71Var;
        com.google.gson.m mVar;
        Object objA;
        if (continuationImpl instanceof f71) {
            f71Var = (f71) continuationImpl;
            int i5 = f71Var.f3232e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f71Var.f3232e = i5 - Integer.MIN_VALUE;
            } else {
                f71Var = new f71(g71Var, continuationImpl);
            }
        }
        Object obj = f71Var.f3230c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f71Var.f3232e;
        if (i11 == 0) {
            ResultKt.b(obj);
            mVar = new com.google.gson.m();
            sb sbVar = g71Var.f3658a;
            f71Var.f3228a = g71Var;
            f71Var.f3229b = mVar;
            f71Var.f3232e = 1;
            sbVar.getClass();
            objA = sb.a(sbVar, f71Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            com.google.gson.m mVar2 = f71Var.f3229b;
            g71 g71Var2 = f71Var.f3228a;
            ResultKt.b(obj);
            mVar = mVar2;
            g71Var = g71Var2;
            objA = obj;
        }
        for (Map.Entry entry : ((Map) objA).entrySet()) {
            String str = (String) entry.getKey();
            ma maVar = (ma) entry.getValue();
            try {
                va vaVar = maVar.f7059a;
                ti.c cVar = maVar.f7060b;
                g71Var.getClass();
                mVar.p(a(str, vaVar, cVar));
            } catch (Exception e3) {
                g71Var.f3659b.a("InspectorAdapterInfo.updateAdapters", (Throwable) e3);
            }
        }
        return mVar;
    }
}
