package ads_mobile_sdk;

import b.c0;
import c80.d;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import r70.f;

/* loaded from: classes2.dex */
public final class ax2 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final d f1184a = new d();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f1185b = new HashMap();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        xw2 xw2Var;
        String str;
        ax2 ax2Var;
        String str2;
        String str3;
        Map map2;
        d dVar;
        if (continuation instanceof xw2) {
            xw2Var = (xw2) continuation;
            int i5 = xw2Var.f11878i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xw2Var.f11878i = i5 - Integer.MIN_VALUE;
            } else {
                xw2Var = new xw2(this, continuation);
            }
        }
        Object obj = xw2Var.f11876g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xw2Var.f11878i;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str4 = (String) map.get("id");
            if (str4 == null) {
                return Unit.f71706a;
            }
            str = (String) map.get("fail");
            String str5 = (String) map.get("result");
            xw2Var.f11870a = this;
            xw2Var.f11871b = map;
            xw2Var.f11872c = str4;
            xw2Var.f11873d = str;
            xw2Var.f11874e = str5;
            d dVar2 = this.f1184a;
            xw2Var.f11875f = dVar2;
            xw2Var.f11878i = 1;
            if (dVar2.e(xw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ax2Var = this;
            str2 = str4;
            str3 = str5;
            map2 = map;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = xw2Var.f11875f;
            str3 = xw2Var.f11874e;
            str = xw2Var.f11873d;
            str2 = xw2Var.f11872c;
            map2 = xw2Var.f11871b;
            ax2Var = xw2Var.f11870a;
            ResultKt.b(obj);
        }
        try {
            t70.r rVar = (t70.r) ax2Var.f1185b.remove(str2);
            if (rVar == null) {
                return Unit.f71706a;
            }
            String str6 = (String) map2.get("fail_stack");
            String str7 = (String) map2.get("fail_reason");
            if (str6 == null || str6.length() == 0) {
                str7 = "Unknown Fail Reason.";
            }
            String strO0 = (str6 == null || str6.length() == 0) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : f.o0(str6);
            if (str != null && str.length() != 0) {
                rVar.c(new CancellationException(c0.E(str7, strO0)));
                zi3.a(6, str7 + strO0, null);
                return Unit.f71706a;
            }
            if (str3 == null) {
                ((t70.s) rVar).X(null);
                return Unit.f71706a;
            }
            try {
                ((t70.s) rVar).X((com.google.gson.r) new Gson().fromJson(str3, com.google.gson.r.class));
            } catch (JsonSyntaxException e3) {
                CancellationException cancellationException = new CancellationException(e3.toString());
                cancellationException.initCause(e3);
                rVar.c(cancellationException);
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.gb
    public final int b() {
        return 3;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.r rVar, ContinuationImpl continuationImpl) throws IOException {
        yw2 yw2Var;
        String strA;
        ax2 ax2Var;
        String str;
        com.google.gson.r rVar2;
        com.google.gson.r rVar3;
        d dVar;
        if (continuationImpl instanceof yw2) {
            yw2Var = (yw2) continuationImpl;
            int i5 = yw2Var.f12339i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yw2Var.f12339i = i5 - Integer.MIN_VALUE;
            } else {
                yw2Var = new yw2(this, continuationImpl);
            }
        }
        Object obj = yw2Var.f12337g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yw2Var.f12339i;
        String strO0 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i11 == 0) {
            ResultKt.b(obj);
            String strA2 = d62.a(rVar, "id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            strA = d62.a(rVar, "fail", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            com.google.gson.r rVarA = d62.a(rVar, "result", (com.google.gson.r) null);
            yw2Var.f12331a = this;
            yw2Var.f12332b = rVar;
            yw2Var.f12333c = strA2;
            yw2Var.f12334d = strA;
            yw2Var.f12335e = rVarA;
            d dVar2 = this.f1184a;
            yw2Var.f12336f = dVar2;
            yw2Var.f12339i = 1;
            if (dVar2.e(yw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ax2Var = this;
            str = strA2;
            rVar2 = rVarA;
            rVar3 = rVar;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = yw2Var.f12336f;
            rVar2 = yw2Var.f12335e;
            strA = yw2Var.f12334d;
            str = yw2Var.f12333c;
            rVar3 = yw2Var.f12332b;
            ax2Var = yw2Var.f12331a;
            ResultKt.b(obj);
        }
        try {
            t70.r rVar4 = (t70.r) ax2Var.f1185b.remove(str);
            if (rVar4 == null) {
                return Unit.f71706a;
            }
            String strA3 = d62.a(rVar3, "fail_stack", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            String strA4 = d62.a(rVar3, "fail_reason", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            if (strA3.length() == 0) {
                strA4 = "Unknown Fail Reason.";
            }
            if (strA3.length() != 0) {
                strO0 = f.o0(strA3);
            }
            if (strA.length() <= 0) {
                if (rVar2 == null) {
                    ((t70.s) rVar4).X(null);
                    return Unit.f71706a;
                }
                ((t70.s) rVar4).X(rVar2);
                return Unit.f71706a;
            }
            rVar4.c(new CancellationException(c0.E(strA4, strO0)));
            zi3.a(6, strA4 + strO0, null);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, t70.r rVar, ContinuationImpl continuationImpl) {
        zw2 zw2Var;
        d dVar;
        ax2 ax2Var;
        if (continuationImpl instanceof zw2) {
            zw2Var = (zw2) continuationImpl;
            int i5 = zw2Var.f12712g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zw2Var.f12712g = i5 - Integer.MIN_VALUE;
            } else {
                zw2Var = new zw2(this, continuationImpl);
            }
        }
        Object obj = zw2Var.f12710e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zw2Var.f12712g;
        if (i11 == 0) {
            ResultKt.b(obj);
            zw2Var.f12706a = this;
            zw2Var.f12707b = str;
            zw2Var.f12708c = rVar;
            dVar = this.f1184a;
            zw2Var.f12709d = dVar;
            zw2Var.f12712g = 1;
            if (dVar.e(zw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ax2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = zw2Var.f12709d;
            rVar = zw2Var.f12708c;
            String str2 = zw2Var.f12707b;
            ax2Var = zw2Var.f12706a;
            ResultKt.b(obj);
            dVar = dVar2;
            str = str2;
        }
        try {
            ax2Var.f1185b.put(str, rVar);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
