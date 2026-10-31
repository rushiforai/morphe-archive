package ads_mobile_sdk;

import android.net.Uri;
import android.os.Bundle;
import java.net.URL;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class os implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final k8 f7988a;

    /* renamed from: b, reason: collision with root package name */
    public final y2 f7989b;

    /* renamed from: c, reason: collision with root package name */
    public final kx2 f7990c;

    /* renamed from: d, reason: collision with root package name */
    public final zm0 f7991d;

    /* renamed from: e, reason: collision with root package name */
    public final z1 f7992e;

    public os(k8 adSpamClient, y2 adEventEmitter, kx2 urlPinger, zm0 firebaseAnalyticsEventHandler, z1 adConfiguration) {
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(urlPinger, "urlPinger");
        Intrinsics.g(firebaseAnalyticsEventHandler, "firebaseAnalyticsEventHandler");
        Intrinsics.g(adConfiguration, "adConfiguration");
        this.f7988a = adSpamClient;
        this.f7989b = adEventEmitter;
        this.f7990c = urlPinger;
        this.f7991d = firebaseAnalyticsEventHandler;
        this.f7992e = adConfiguration;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0086, code lost:
    
        if (r7.f7989b.n(r0) == r1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a7, code lost:
    
        if (r10 == r1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00a9, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        ns nsVar;
        String str;
        os osVar;
        if (continuation instanceof ns) {
            nsVar = (ns) continuation;
            int i5 = nsVar.f7666f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nsVar.f7666f = i5 - Integer.MIN_VALUE;
            } else {
                nsVar = new ns(this, continuation);
            }
        }
        Object objA = nsVar.f7664d;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = nsVar.f7666f;
        if (i11 == 0) {
            ResultKt.b(objA);
            str = (String) map.get("u");
            if (str == null) {
                zi3.a(6, "URL is missing from a click GMSG: " + map, null);
                return Unit.f71706a;
            }
            if (r70.j.B0((String) map.get("sc"), "1", false)) {
                nsVar.f7661a = this;
                nsVar.f7662b = tx0Var;
                nsVar.f7663c = str;
                nsVar.f7666f = 1;
            }
            osVar = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                tx0Var = nsVar.f7662b;
                osVar = nsVar.f7661a;
                ResultKt.b(objA);
                try {
                    Uri uriA = osVar.f7988a.a((Uri) objA, tx0Var);
                    kx2 kx2Var = osVar.f7990c;
                    String string = uriA.toString();
                    Intrinsics.f(string, "toString(...)");
                    Uri uri = Uri.parse(new URL(string).toString());
                    Intrinsics.f(uri, "toUriWithURLValidation(...)");
                    Boolean bool = Boolean.FALSE;
                    kx2Var.getClass();
                    kx2Var.f6014c.a(uri, kx2Var.f6012a, kx2Var.f6013b, null, bool);
                } catch (Exception e3) {
                    zi3.b(e3);
                }
                return Unit.f71706a;
            }
            String str2 = nsVar.f7663c;
            tx0 tx0Var2 = nsVar.f7662b;
            os osVar2 = nsVar.f7661a;
            ResultKt.b(objA);
            str = str2;
            tx0Var = tx0Var2;
            osVar = osVar2;
        }
        zm0 zm0Var = osVar.f7991d;
        Uri uri2 = Uri.parse(str);
        Intrinsics.f(uri2, "parse(...)");
        rm0 rm0Var = rm0.f9230b;
        Bundle bundle = osVar.f7992e.f12397q;
        nsVar.f7661a = osVar;
        nsVar.f7662b = tx0Var;
        nsVar.f7663c = null;
        nsVar.f7666f = 2;
        objA = zm0Var.a(uri2, rm0Var, bundle, nsVar);
    }

    @Override // b.gb
    public final int b() {
        return 5;
    }
}
