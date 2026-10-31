package cn;

import a7.f;
import b70.k;
import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f20140a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final Map f20141b = Collections.synchronizedMap(new LinkedHashMap());

    public static a a(d dVar) {
        Map dependencies = f20141b;
        Intrinsics.f(dependencies, "dependencies");
        Object obj = dependencies.get(dVar);
        if (obj != null) {
            return (a) obj;
        }
        throw new IllegalStateException("Cannot get dependency " + dVar + ". Dependencies should be added at class load time.");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00c9 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x009d -> B:21:0x009e). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        b bVar;
        Map linkedHashMap;
        Iterator it;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.A = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f20138y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.A;
        if (i11 == 0) {
            ResultKt.b(obj);
            Map dependencies = f20141b;
            Intrinsics.f(dependencies, "dependencies");
            linkedHashMap = new LinkedHashMap(k.d0(dependencies.size()));
            it = dependencies.entrySet().iterator();
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Object key = bVar.f20137x;
            linkedHashMap = bVar.f20136w;
            d subscriberName = bVar.f20135v;
            it = bVar.f20134u;
            Map map = bVar.f20133t;
            ResultKt.b(obj);
            Intrinsics.g(subscriberName, "subscriberName");
            CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber = a(subscriberName).f20132b;
            if (crashlyticsAppQualitySessionsSubscriber == null) {
                linkedHashMap.put(key, crashlyticsAppQualitySessionsSubscriber);
                linkedHashMap = map;
                if (it.hasNext()) {
                    return linkedHashMap;
                }
                Map.Entry entry = (Map.Entry) it.next();
                key = entry.getKey();
                subscriberName = (d) entry.getKey();
                f fVar = new f((a) entry.getValue(), 5);
                Map map2 = linkedHashMap;
                bVar.f20133t = map2;
                bVar.f20134u = it;
                bVar.f20135v = subscriberName;
                bVar.f20136w = map2;
                bVar.f20137x = key;
                bVar.A = 1;
                if (ps.c.s(fVar, bVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                map = linkedHashMap;
                Intrinsics.g(subscriberName, "subscriberName");
                CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber2 = a(subscriberName).f20132b;
                if (crashlyticsAppQualitySessionsSubscriber2 == null) {
                    throw new IllegalStateException("Subscriber " + subscriberName + " has not been registered.");
                }
            }
        }
    }
}
