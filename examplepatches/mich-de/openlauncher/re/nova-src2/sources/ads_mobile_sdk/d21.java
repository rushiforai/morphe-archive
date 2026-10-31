package ads_mobile_sdk;

import b.e6;
import java.net.URL;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d21 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final e6 f2158a;

    public d21(e6 httpClient) {
        Intrinsics.g(httpClient, "httpClient");
        this.f2158a = httpClient;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        c21 c21Var;
        if (continuation instanceof c21) {
            c21Var = (c21) continuation;
            int i5 = c21Var.f1634c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c21Var.f1634c = i5 - Integer.MIN_VALUE;
            } else {
                c21Var = new c21(this, continuation);
            }
        }
        Object obj = c21Var.f1632a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c21Var.f1634c;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                String str = (String) map.get("u");
                if (str == null) {
                    zi3.a(6, "URL is missing from an httpTrack GMSG: " + map, null);
                    return Unit.f71706a;
                }
                e6 e6Var = this.f2158a;
                URL url = new URL(str);
                c21Var.f1634c = 1;
                if (e6.b(e6Var, url, null, c21Var, 30) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
        } catch (Exception e3) {
            zi3.a(null, e3, true, false);
        }
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 6;
    }
}
