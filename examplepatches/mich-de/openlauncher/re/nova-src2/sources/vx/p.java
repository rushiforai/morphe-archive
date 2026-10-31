package vx;

import android.content.Context;
import b.c0;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kw.s3;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import t70.m0;
import t70.y0;
import tx.g4;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public static final p f93347a = new p();

    /* renamed from: b, reason: collision with root package name */
    public static final List f93348b = ul.b.Q(k.f93317a, i.f93306a, f.f93290a, g.f93297a, c.f93269a, e.f93283a, d.f93276a, l.f93324a);

    /* renamed from: c, reason: collision with root package name */
    public static final ConcurrentHashMap f93349c = new ConcurrentHashMap();

    /* renamed from: d, reason: collision with root package name */
    public static final ConcurrentHashMap f93350d = new ConcurrentHashMap();

    /* renamed from: e, reason: collision with root package name */
    public static final c80.d f93351e = new c80.d();

    /* renamed from: f, reason: collision with root package name */
    public static volatile o20.p f93352f;

    /* renamed from: g, reason: collision with root package name */
    public static volatile long f93353g;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e2 A[Catch: all -> 0x003e, TRY_LEAVE, TryCatch #1 {all -> 0x003e, blocks: (B:13:0x0039, B:39:0x00da, B:42:0x00e2), top: B:50:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r0v6, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v8, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Context context, g20.a aVar, ContinuationImpl continuationImpl) {
        m mVar;
        Context context2;
        c80.d dVar;
        ?? r32;
        List list;
        g20.a aVar2 = aVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f93335x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f93335x = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(continuationImpl);
            }
        }
        Object obj = mVar.f93334w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f93335x;
        ConcurrentHashMap concurrentHashMap = f93349c;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                long jCurrentTimeMillis = System.currentTimeMillis();
                Pair pair = (Pair) concurrentHashMap.get(aVar2);
                if (pair != null) {
                    List list2 = (List) pair.f71683a;
                    if (jCurrentTimeMillis - ((Number) pair.f71684b).longValue() < 300000) {
                        return list2;
                    }
                }
                c80.a aVar3 = (c80.a) f93350d.computeIfAbsent(aVar2, new com.google.firebase.crashlytics.internal.persistence.d(new g4(4), 7));
                context2 = context;
                mVar.f93331t = context2;
                mVar.f93332u = aVar2;
                mVar.f93333v = aVar3;
                mVar.f93335x = 1;
                dVar = (c80.d) aVar3;
                if (dVar.e(mVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r32 = (c80.a) mVar.f93332u;
                aVar2 = (g20.a) mVar.f93331t;
                try {
                    ResultKt.b(obj);
                    r32 = r32;
                    list = (List) obj;
                    if (list != null) {
                        dVar = r32;
                        list = null;
                    } else {
                        concurrentHashMap.put(aVar2, new Pair(list, new Long(System.currentTimeMillis())));
                        dVar = r32;
                    }
                    dVar.g(null);
                    return list;
                } catch (Throwable th2) {
                    th = th2;
                    ((c80.d) r32).g(null);
                    throw th;
                }
            }
            ?? r02 = mVar.f93333v;
            g20.a aVar4 = (g20.a) mVar.f93332u;
            Context context3 = (Context) mVar.f93331t;
            ResultKt.b(obj);
            dVar = r02;
            aVar2 = aVar4;
            context2 = context3;
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            Pair pair2 = (Pair) concurrentHashMap.get(aVar2);
            if (pair2 != null) {
                list = (List) pair2.f71683a;
                if (jCurrentTimeMillis2 - ((Number) pair2.f71684b).longValue() < 300000) {
                    dVar.g(null);
                    return list;
                }
            }
            s80.d dVar2 = (s80.d) ul.b.E(context2, aVar2);
            mVar.f93331t = aVar2;
            mVar.f93332u = dVar;
            mVar.f93333v = null;
            mVar.f93335x = 2;
            Object objE = dVar2.e(mVar);
            if (objE != coroutineSingletons) {
                r32 = dVar;
                obj = objE;
                list = (List) obj;
                if (list != null) {
                }
                dVar.g(null);
                return list;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            r32 = dVar;
            ((c80.d) r32).g(null);
            throw th;
        }
    }

    public static final MapBuilder b(ExternalLink externalLink) {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(PendingUpgradeStore.KEY_NAME, externalLink.f78378b);
        String str = externalLink.f78380d;
        if (str != null) {
            mapBuilder.put("icon", str);
        }
        mapBuilder.put("uri", externalLink.f78381e);
        return mapBuilder.b();
    }

    public static Object c(Context context, g20.a aVar, String str, String str2, Continuation continuation, int i5) {
        if ((i5 & 8) != 0) {
            str2 = null;
        }
        String str3 = str2;
        ToolResult.Error errorE = e(str, ul.b.N(context, aVar));
        if (errorE != null) {
            return errorE;
        }
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new n(context, aVar, str, str3, null), continuation);
    }

    public static ToolResult.Error e(String str, boolean z11) {
        if (z11) {
            return null;
        }
        return new ToolResult.Error(c0.l("Service not connected. Link ", str, " in Nova Settings > Integrations."), "not_connected");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:(1:(1:(7:12|74|13|59|(1:62)|66|67)(2:19|20))(1:21))(2:22|(1:24)(5:25|(3:27|(1:30)|(1:32))|33|(0)|57))|73|36|(4:38|39|(1:42)|(2:44|45))|71|48|(1:50)(1:53)|(3:55|(5:58|59|(0)|66|67)|57)(4:60|(0)|66|67)) */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00ac, code lost:
    
        r14 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00ad, code lost:
    
        r12 = r15;
        r15 = r14;
        r14 = r12;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00d6 A[Catch: all -> 0x0033, Exception -> 0x0036, TRY_LEAVE, TryCatch #0 {all -> 0x0033, blocks: (B:13:0x002e, B:59:0x00cf, B:62:0x00d6, B:64:0x00df), top: B:70:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r14v0, types: [android.content.Context, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Context context, ContinuationImpl continuationImpl) throws Throwable {
        o oVar;
        long jCurrentTimeMillis;
        c80.d dVar;
        Context context2;
        c80.a aVar;
        o20.p pVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f93346y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f93346y = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object obj = oVar.f93344w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f93346y;
        Continuation continuation = null;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (e("Slack", ul.b.N(context, g20.a.f56919e)) != null) {
                    return null;
                }
                jCurrentTimeMillis = System.currentTimeMillis();
                o20.p pVar2 = f93352f;
                if (pVar2 != null) {
                    if (jCurrentTimeMillis - f93353g >= 3600000) {
                        pVar2 = null;
                    }
                    if (pVar2 != null) {
                        return pVar2;
                    }
                }
                dVar = f93351e;
                oVar.f93341t = context;
                oVar.f93342u = dVar;
                oVar.f93343v = jCurrentTimeMillis;
                oVar.f93346y = 1;
                context2 = context;
                if (dVar.e(oVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = (c80.a) oVar.f93341t;
                try {
                    ResultKt.b(obj);
                    pVar = (o20.p) obj;
                    if (pVar != null) {
                        f93352f = pVar;
                        f93353g = System.currentTimeMillis();
                    }
                } catch (Exception e3) {
                    Exception e11 = e3;
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NovaIntegrationTools");
                    bVar.p(e11, "Slack enriched fetch", new Object[0]);
                    pVar = null;
                    ((c80.d) aVar).g(null);
                    return pVar;
                }
                ((c80.d) aVar).g(null);
                return pVar;
            }
            jCurrentTimeMillis = oVar.f93343v;
            c80.d dVar2 = oVar.f93342u;
            Context context3 = (Context) oVar.f93341t;
            ResultKt.b(obj);
            dVar = dVar2;
            context2 = context3;
            o20.p pVar3 = f93352f;
            if (pVar3 != null) {
                if (jCurrentTimeMillis - f93353g >= 3600000) {
                    pVar3 = null;
                }
                if (pVar3 != null) {
                    dVar.g(null);
                    return pVar3;
                }
            }
            s80.a aVarE = ul.b.E(context2, g20.a.f56919e);
            o20.f fVar = aVarE instanceof o20.f ? (o20.f) aVarE : null;
            if (fVar == null) {
                aVar = dVar;
                pVar = null;
                if (pVar != null) {
                }
                ((c80.d) aVar).g(null);
                return pVar;
            }
            oVar.f93341t = dVar;
            oVar.f93342u = null;
            oVar.f93346y = 2;
            a80.e eVar = y0.f88884a;
            Object objY = m0.y(a80.d.f488c, new s3(fVar, continuation, 19), oVar);
            if (objY != coroutineSingletons) {
                c80.d dVar3 = dVar;
                obj = objY;
                aVar = dVar3;
                pVar = (o20.p) obj;
                if (pVar != null) {
                }
                ((c80.d) aVar).g(null);
                return pVar;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            c80.d dVar4 = dVar;
            th = th3;
            context = dVar4;
            ((c80.d) context).g(null);
            throw th;
        }
    }
}
