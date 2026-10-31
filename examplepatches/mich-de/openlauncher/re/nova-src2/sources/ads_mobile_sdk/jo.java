package ads_mobile_sdk;

import b.f9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class jo {

    /* renamed from: a, reason: collision with root package name */
    public final String f5313a;

    /* renamed from: b, reason: collision with root package name */
    public final int f5314b;

    /* renamed from: c, reason: collision with root package name */
    public final mi3 f5315c;

    /* renamed from: d, reason: collision with root package name */
    public final f9 f5316d;

    public jo(String requestId, int i5, mi3 traceMetaSet, f9 internalAdRequestEventEmitter) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        this.f5313a = requestId;
        this.f5314b = i5;
        this.f5315c = traceMetaSet;
        this.f5316d = internalAdRequestEventEmitter;
    }
}
