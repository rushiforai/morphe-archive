package com.amplitude;

import com.amplitude.common.Logger;
import com.amplitude.core.events.Identify;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class G3 extends AbstractC0499p4 {
    public final /* synthetic */ com.amplitude.android.sessionreplay.a n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G3(com.amplitude.android.sessionreplay.a aVar, C0543y3 c0543y3, I2 i22, K3 k32, C0529w c0529w) {
        super(c0543y3, i22, k32, c0529w);
        this.n = aVar;
    }

    public final Object a(P3 p32, String str, C0487n4 c0487n4) {
        int i5 = p32.f20359a;
        if (400 > i5 || i5 >= 500 || !Intrinsics.b(p32.f20360b, "Session Not In Sample")) {
            Object objA = AbstractC0499p4.a(this, p32, str, c0487n4);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }
        this.n.sessionReplayLogger.c(E3.f20225a);
        I2 i22 = this.n.sessionReplayDispatchers;
        F3 f32 = new F3(this.n, str, null);
        i22.getClass();
        Object objY = t70.m0.e(i22.f20272a, i22.f20274c, new H2(f32, null), 2).y(c0487n4);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    public final P3 a(ArrayList dataItems, String uri) throws NumberFormatException {
        Logger logger;
        Intrinsics.g(dataItems, "dataItems");
        Intrinsics.g(uri, "uri");
        if (!this.n.captureEnabled) {
            return new P3("Session replay is disabled", 4);
        }
        if (this.n.optOut) {
            return new P3("Session is opted out", 4);
        }
        List listI1 = r70.k.i1(uri, new String[]{Identify.UNSET_VALUE}, 6);
        int size = listI1.size();
        long j11 = Long.parseLong((String) listI1.get(size - 2));
        int i5 = Integer.parseInt((String) listI1.get(size - 1));
        if (!this.n.sampler.a(j11)) {
            return new P3("Session not in sample", 4);
        }
        this.n.sessionReplayLogger.a(new C3(dataItems));
        if (this.n.internalOptions.getLogPayloads() && (logger = this.n.getLogger()) != null) {
            String json = this.n.prettyGson.toJson(dataItems);
            Intrinsics.f(json, "toJson(...)");
            logger.debug(json);
        }
        L3 l32 = this.n.sessionReplayServer;
        com.amplitude.android.sessionreplay.a aVar = this.n;
        String strAccess$getServerUrl = com.amplitude.android.sessionreplay.a.access$getServerUrl(aVar, aVar.serverZone);
        String str = this.n.apiKey;
        String str2 = this.n.deviceId;
        String packageName = this.n.context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        P3 p3A = l32.a(strAccess$getServerUrl, str, str2, j11, i5, dataItems, packageName, this.n.library, this.n.sampleRate);
        this.n.bandwidthThrottler.a(p3A.f20361c);
        this.n.sessionReplayLogger.a(new D3(dataItems, p3A));
        return p3A;
    }
}
