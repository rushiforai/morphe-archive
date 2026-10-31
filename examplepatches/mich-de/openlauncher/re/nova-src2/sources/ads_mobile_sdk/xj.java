package ads_mobile_sdk;

import c80.d;
import java.util.LinkedHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class xj {

    /* renamed from: a, reason: collision with root package name */
    public final ql1 f11732a;

    /* renamed from: b, reason: collision with root package name */
    public final d f11733b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f11734c;

    /* renamed from: d, reason: collision with root package name */
    public final ConcurrentHashMap f11735d;

    /* renamed from: e, reason: collision with root package name */
    public final ConcurrentHashMap f11736e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicInteger f11737f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicReference f11738g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f11739h;

    public xj(qq0 flagDataStore, ql1 liveWebViewManager) {
        Intrinsics.g(flagDataStore, "flagDataStore");
        Intrinsics.g(liveWebViewManager, "liveWebViewManager");
        this.f11732a = liveWebViewManager;
        this.f11733b = new d();
        this.f11734c = new LinkedHashMap();
        this.f11735d = new ConcurrentHashMap();
        this.f11736e = new ConcurrentHashMap();
        this.f11737f = new AtomicInteger(0);
        this.f11738g = new AtomicReference(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f11739h = new AtomicBoolean(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(xj xjVar, ContinuationImpl continuationImpl) {
        jj jjVar;
        xj xjVar2;
        d dVar;
        if (continuationImpl instanceof jj) {
            jjVar = (jj) continuationImpl;
            int i5 = jjVar.f5259e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jjVar.f5259e = i5 - Integer.MIN_VALUE;
            } else {
                jjVar = new jj(xjVar, continuationImpl);
            }
        }
        Object obj = jjVar.f5257c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jjVar.f5259e;
        if (i11 == 0) {
            ResultKt.b(obj);
            d dVar2 = xjVar.f11733b;
            jjVar.f5255a = xjVar;
            jjVar.f5256b = dVar2;
            jjVar.f5259e = 1;
            if (dVar2.e(jjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            xjVar2 = xjVar;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = jjVar.f5256b;
            xjVar2 = jjVar.f5255a;
            ResultKt.b(obj);
        }
        try {
            LinkedHashMap linkedHashMap = xjVar2.f11734c;
            dVar.g(null);
            return MapsKt.s0(linkedHashMap);
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(xj xjVar, String str, String str2, Continuation continuation) {
        uj ujVar;
        d dVar;
        if (continuation instanceof uj) {
            ujVar = (uj) continuation;
            int i5 = ujVar.f10363g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ujVar.f10363g = i5 - Integer.MIN_VALUE;
            } else {
                ujVar = new uj(xjVar, continuation);
            }
        }
        Object obj = ujVar.f10361e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ujVar.f10363g;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = xjVar.f11733b;
            ujVar.f10357a = xjVar;
            ujVar.f10358b = str;
            ujVar.f10359c = str2;
            ujVar.f10360d = dVar;
            ujVar.f10363g = 1;
            if (dVar.e(ujVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = ujVar.f10360d;
            str2 = ujVar.f10359c;
            str = ujVar.f10358b;
            xj xjVar2 = ujVar.f10357a;
            ResultKt.b(obj);
            dVar = dVar2;
            xjVar = xjVar2;
        }
        if (str2 != null) {
            try {
                if (str2.length() != 0) {
                    xjVar.f11734c.put(str, str2);
                    Unit unit = Unit.f71706a;
                } else {
                    xjVar.f11734c.remove(str);
                }
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        } else {
            xjVar.f11734c.remove(str);
        }
        dVar.g(null);
        return Unit.f71706a;
    }
}
