package com.amplitude;

import androidx.compose.ui.node.LayoutNode;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.p4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0499p4 {

    /* renamed from: a, reason: collision with root package name */
    public final C0543y3 f20714a;

    /* renamed from: b, reason: collision with root package name */
    public final I2 f20715b;

    /* renamed from: c, reason: collision with root package name */
    public final K3 f20716c;

    /* renamed from: d, reason: collision with root package name */
    public final C0529w f20717d;

    /* renamed from: e, reason: collision with root package name */
    public List f20718e;

    /* renamed from: f, reason: collision with root package name */
    public final v70.m f20719f;

    /* renamed from: g, reason: collision with root package name */
    public final v70.m f20720g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicInteger f20721h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicLong f20722i;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicInteger f20723j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f20724k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f20725l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicInteger f20726m;

    public AbstractC0499p4(C0543y3 storage, I2 sessionReplayDispatchers, K3 logger, C0529w c0529w) {
        Intrinsics.g(storage, "storage");
        Intrinsics.g(sessionReplayDispatchers, "sessionReplayDispatchers");
        Intrinsics.g(logger, "logger");
        this.f20714a = storage;
        this.f20715b = sessionReplayDispatchers;
        this.f20716c = logger;
        this.f20717d = c0529w;
        this.f20718e = EmptyList.f71733a;
        this.f20721h = new AtomicInteger(0);
        this.f20722i = new AtomicLong(0L);
        this.f20723j = new AtomicInteger(0);
        this.f20726m = new AtomicInteger(1);
        this.f20724k = false;
        this.f20725l = false;
        this.f20719f = v70.o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
        this.f20720g = v70.o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
        Runtime.getRuntime().addShutdownHook(new C0438f4(this));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r5v6, types: [com.amplitude.p4] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(G3 g32, P3 p32, String str, ContinuationImpl continuationImpl) {
        C0426d4 c0426d4;
        G3 g33;
        if (continuationImpl instanceof C0426d4) {
            c0426d4 = (C0426d4) continuationImpl;
            int i5 = c0426d4.f20548d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0426d4.f20548d = i5 - Integer.MIN_VALUE;
            } else {
                c0426d4 = new C0426d4(g32, continuationImpl);
            }
        }
        Object obj = c0426d4.f20546b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0426d4.f20548d;
        if (i11 == 0) {
            ResultKt.b(obj);
            int i12 = p32.f20359a;
            if (i12 != 200) {
                g32.f20716c.error("Error response: " + i12 + ". Keeping data block for next upload attempt.");
                g32.f20723j.incrementAndGet();
                return Unit.f71706a;
            }
            I2 i22 = g32.f20715b;
            C0432e4 c0432e4 = new C0432e4(g32, str, null);
            i22.getClass();
            t70.q0 q0VarE = t70.m0.e(i22.f20272a, i22.f20274c, new H2(c0432e4, null), 2);
            c0426d4.f20545a = g32;
            c0426d4.f20548d = 1;
            g33 = g32;
            if (q0VarE.y(c0426d4) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r52 = c0426d4.f20545a;
            ResultKt.b(obj);
            g33 = r52;
        }
        g33.f20722i.set(System.currentTimeMillis());
        g33.f20723j.set(0);
        return Unit.f71706a;
    }
}
