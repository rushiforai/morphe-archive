package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ls implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final qw2 f6938a;

    /* renamed from: b, reason: collision with root package name */
    public final wj f6939b;

    /* renamed from: c, reason: collision with root package name */
    public final ni.q f6940c;

    /* renamed from: d, reason: collision with root package name */
    public final vw f6941d;

    public ls(qw2 requestType, wj appState, ni.q adRequest, vw configLoader) {
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(adRequest, "adRequest");
        Intrinsics.g(configLoader, "configLoader");
        this.f6938a = requestType;
        this.f6939b = appState;
        this.f6940c = adRequest;
        this.f6941d = configLoader;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.CLD;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        ks ksVar;
        ls lsVar;
        ls lsVar2;
        String str;
        d62 d62Var;
        Object objB;
        String str2;
        Object objB2;
        com.google.gson.r rVar;
        String str3;
        String str4;
        if (continuation instanceof ks) {
            ksVar = (ks) continuation;
            int i5 = ksVar.f5951g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ksVar.f5951g = i5 - Integer.MIN_VALUE;
            } else {
                ksVar = new ks(this, (ContinuationImpl) continuation);
            }
        }
        Object objB3 = ksVar.f5949e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ksVar.f5951g;
        if (i11 == 0) {
            ResultKt.b(objB3);
            String strL = this.f6940c.l();
            String str5 = this.f6938a.f8869a;
            ksVar.f5945a = this;
            ksVar.f5951g = 1;
            objB3 = this.f6939b.b(strL, str5, ksVar);
            if (objB3 != coroutineSingletons) {
                lsVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                str = ksVar.f5946b;
                ls lsVar3 = (ls) ksVar.f5945a;
                ResultKt.b(objB3);
                lsVar2 = lsVar3;
                String str6 = (String) objB3;
                d62Var = d62.a$1;
                wj wjVar = lsVar2.f6939b;
                ksVar.f5945a = lsVar2;
                ksVar.f5946b = str;
                ksVar.f5947c = str6;
                ksVar.f5948d = d62Var;
                ksVar.f5951g = 3;
                wjVar.getClass();
                objB = wj.b(wjVar, ksVar);
                if (objB != coroutineSingletons) {
                    str2 = str6;
                    objB3 = objB;
                    d62Var.getClass();
                    com.google.gson.r rVarA = d62.a((com.google.gson.r) objB3, "common_settings", (com.google.gson.r) null);
                    vw vwVar = lsVar2.f6941d;
                    ksVar.f5945a = str;
                    ksVar.f5946b = str2;
                    ksVar.f5947c = rVarA;
                    ksVar.f5948d = null;
                    ksVar.f5951g = 4;
                    vwVar.getClass();
                    objB2 = vw.b(vwVar, ksVar);
                    if (objB2 != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            }
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                com.google.gson.r rVar2 = (com.google.gson.r) ksVar.f5947c;
                str4 = ksVar.f5946b;
                String str7 = (String) ksVar.f5945a;
                ResultKt.b(objB3);
                rVar = rVar2;
                str3 = str7;
                return new xu0(new js(str3, str4, rVar, ((Number) objB3).longValue()));
            }
            d62 d62Var2 = ksVar.f5948d;
            str2 = (String) ksVar.f5947c;
            String str8 = ksVar.f5946b;
            lsVar2 = (ls) ksVar.f5945a;
            ResultKt.b(objB3);
            d62Var = d62Var2;
            str = str8;
            d62Var.getClass();
            com.google.gson.r rVarA2 = d62.a((com.google.gson.r) objB3, "common_settings", (com.google.gson.r) null);
            vw vwVar2 = lsVar2.f6941d;
            ksVar.f5945a = str;
            ksVar.f5946b = str2;
            ksVar.f5947c = rVarA2;
            ksVar.f5948d = null;
            ksVar.f5951g = 4;
            vwVar2.getClass();
            objB2 = vw.b(vwVar2, ksVar);
            if (objB2 != coroutineSingletons) {
                rVar = rVarA2;
                objB3 = objB2;
                str3 = str;
                str4 = str2;
                return new xu0(new js(str3, str4, rVar, ((Number) objB3).longValue()));
            }
            return coroutineSingletons;
        }
        lsVar = (ls) ksVar.f5945a;
        ResultKt.b(objB3);
        String str9 = (String) objB3;
        wj wjVar2 = lsVar.f6939b;
        ksVar.f5945a = lsVar;
        ksVar.f5946b = str9;
        ksVar.f5951g = 2;
        Object objA = wjVar2.a(ksVar);
        if (objA != coroutineSingletons) {
            lsVar2 = lsVar;
            str = str9;
            objB3 = objA;
            String str62 = (String) objB3;
            d62Var = d62.a$1;
            wj wjVar3 = lsVar2.f6939b;
            ksVar.f5945a = lsVar2;
            ksVar.f5946b = str;
            ksVar.f5947c = str62;
            ksVar.f5948d = d62Var;
            ksVar.f5951g = 3;
            wjVar3.getClass();
            objB = wj.b(wjVar3, ksVar);
            if (objB != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
