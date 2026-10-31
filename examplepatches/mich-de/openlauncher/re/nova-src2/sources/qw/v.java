package qw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final xq.c f84417a;

    /* renamed from: b, reason: collision with root package name */
    public final q.c f84418b;

    /* renamed from: c, reason: collision with root package name */
    public final l f84419c;

    /* renamed from: d, reason: collision with root package name */
    public final d f84420d;

    /* renamed from: e, reason: collision with root package name */
    public final ConcurrentHashMap f84421e;

    public v(Context context, int i5) {
        xq.c cVar = (context.getApplicationInfo().flags & 2) != 0 ? xq.d.f96223a : xq.d.f96224b;
        q.c cVar2 = new q.c(6);
        l lVar = new l();
        d dVar = (i5 & 16) != 0 ? new d(context) : null;
        Intrinsics.g(context, "context");
        this.f84417a = cVar;
        this.f84418b = cVar2;
        this.f84419c = lVar;
        this.f84420d = dVar;
        this.f84421e = new ConcurrentHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:46:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Result a(v vVar, String key) throws Throwable {
        j jVar;
        p8.f fVar;
        p8.f fVarD;
        d dVar = vVar.f84420d;
        p8.f fVar2 = null;
        if (dVar != null) {
            Intrinsics.g(key, "key");
            String strValueOf = String.valueOf(key.hashCode());
            try {
                qo.d dVar2 = (qo.d) dVar.f84338a.getValue();
                fVarD = dVar2 != null ? dVar2.d(strValueOf) : null;
            } catch (IOException e3) {
                e = e3;
                fVar = null;
            } catch (Throwable th2) {
                th = th2;
            }
            if (fVarD == null) {
                jVar = null;
            } else {
                try {
                    InputStream inputStream = ((InputStream[]) fVarD.f82452b)[0];
                    Intrinsics.f(inputStream, "getInputStream(...)");
                    String strB = fVarD.b();
                    Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(new BufferedInputStream(inputStream, UserMetadata.MAX_INTERNAL_KEY_SIZE));
                    Intrinsics.d(strB);
                    Intrinsics.d(bitmapDecodeStream);
                    jVar = new j(strB, bitmapDecodeStream);
                    fVarD.close();
                } catch (IOException e11) {
                    fVar = fVarD;
                    e = e11;
                    try {
                        Log.e("stripe_image_disk_cache", "error getting bitmap from cache", e);
                        if (fVar != null) {
                            fVar.close();
                        }
                        jVar = null;
                        if (jVar == null) {
                        }
                        if (jVar != null) {
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        fVar2 = fVar;
                        if (fVar2 != null) {
                            fVar2.close();
                        }
                        throw th;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    fVar2 = fVarD;
                    if (fVar2 != null) {
                    }
                    throw th;
                }
            }
        }
        if (jVar == null) {
            vVar.f("Image loaded from disk cache");
        } else {
            vVar.f("Image not found on disk cache");
        }
        if (jVar != null) {
            return null;
        }
        q.c cVar = vVar.f84418b;
        if (cVar != null) {
            cVar.z(key, jVar);
        }
        int i5 = Result.f71687b;
        return new Result(jVar.f84351b);
    }

    public static final Result b(v vVar, String key) {
        j jVar;
        q.c cVar = vVar.f84418b;
        if (cVar != null) {
            Intrinsics.g(key, "key");
            synchronized (cVar) {
                jVar = (j) ((e) cVar.f83189b).get(String.valueOf(key.hashCode()));
            }
        } else {
            jVar = null;
        }
        if (jVar != null) {
            vVar.f("Image loaded from memory cache");
        } else {
            vVar.f("Image not found on memory cache");
        }
        if (jVar == null) {
            return null;
        }
        d dVar = vVar.f84420d;
        if (dVar != null) {
            dVar.a(key, jVar);
        }
        int i5 = Result.f71687b;
        return new Result(jVar.f84351b);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(v vVar, String str, int i5, int i11, ContinuationImpl continuationImpl) {
        s sVar;
        Object objA;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i12 = sVar.f84404x;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                sVar.f84404x = i12 - Integer.MIN_VALUE;
            } else {
                sVar = new s(vVar, continuationImpl);
            }
        }
        Object objA2 = sVar.f84402v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = sVar.f84404x;
        try {
            if (i13 == 0) {
                ResultKt.b(objA2);
                int i14 = Result.f71687b;
                vVar.f("Image " + str + " loading from internet (" + i5 + " x " + i11 + ")");
                l lVar = vVar.f84419c;
                URL url = new URL(str);
                sVar.f84400t = vVar;
                sVar.f84401u = str;
                sVar.f84404x = 1;
                objA2 = lVar.a(url, i5, i11, sVar);
                if (objA2 == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i13 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str = sVar.f84401u;
                vVar = sVar.f84400t;
                ResultKt.b(objA2);
            }
            j jVar = (j) objA2;
            if (jVar != null) {
                d dVar = vVar.f84420d;
                if (dVar != null) {
                    dVar.a(str, jVar);
                }
                q.c cVar = vVar.f84418b;
                if (cVar != null) {
                    cVar.z(str, jVar);
                }
                objA = jVar.f84351b;
            } else {
                objA = null;
            }
            int i15 = Result.f71687b;
        } catch (Throwable th2) {
            int i16 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            vVar.f84417a.b("StripeImageLoader: Could not load image from network", thA);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(v vVar, String str, ContinuationImpl continuationImpl) {
        t tVar;
        Object objA;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f84409x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f84409x = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(vVar, continuationImpl);
            }
        }
        Object objB = tVar.f84407v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar.f84409x;
        try {
            if (i11 == 0) {
                ResultKt.b(objB);
                int i12 = Result.f71687b;
                vVar.f("Image " + str + " loading from internet");
                l lVar = vVar.f84419c;
                URL url = new URL(str);
                tVar.f84405t = vVar;
                tVar.f84406u = str;
                tVar.f84409x = 1;
                lVar.getClass();
                objB = l.b(new BitmapFactory.Options(), url, tVar);
                if (objB != coroutineSingletons) {
                    objB = (j) objB;
                }
                if (objB == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str = tVar.f84406u;
                vVar = tVar.f84405t;
                ResultKt.b(objB);
            }
            j jVar = (j) objB;
            if (jVar != null) {
                d dVar = vVar.f84420d;
                if (dVar != null) {
                    dVar.a(str, jVar);
                }
                q.c cVar = vVar.f84418b;
                if (cVar != null) {
                    cVar.z(str, jVar);
                }
                objA = jVar.f84351b;
            } else {
                objA = null;
            }
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            vVar.f84417a.b("StripeImageLoader: Could not load image from network", thA);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(v vVar, String str, Function1 function1, ContinuationImpl continuationImpl) {
        u uVar;
        c80.a aVar;
        Object objPutIfAbsent;
        c80.a aVar2;
        v vVar2;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f84416z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f84416z = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(vVar, continuationImpl);
            }
        }
        Object objInvoke = uVar.f84414x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f84416z;
        try {
            if (i11 == 0) {
                ResultKt.b(objInvoke);
                ConcurrentHashMap concurrentHashMap = vVar.f84421e;
                Object dVar = concurrentHashMap.get(str);
                if (dVar == null && (objPutIfAbsent = concurrentHashMap.putIfAbsent(str, (dVar = new c80.d()))) != null) {
                    dVar = objPutIfAbsent;
                }
                aVar = (c80.a) dVar;
                uVar.f84410t = vVar;
                uVar.f84411u = str;
                uVar.f84412v = function1;
                uVar.f84413w = aVar;
                uVar.f84416z = 1;
                if (((c80.d) aVar).e(uVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar2 = (c80.a) uVar.f84412v;
                str = uVar.f84411u;
                vVar2 = uVar.f84410t;
                try {
                    ResultKt.b(objInvoke);
                    ((c80.d) aVar2).g(null);
                    vVar2.f84421e.remove(str);
                    return objInvoke;
                } catch (Throwable th2) {
                    th = th2;
                    ((c80.d) aVar2).g(null);
                    throw th;
                }
            }
            c80.a aVar3 = uVar.f84413w;
            function1 = (Function1) uVar.f84412v;
            str = uVar.f84411u;
            v vVar3 = uVar.f84410t;
            ResultKt.b(objInvoke);
            aVar = aVar3;
            vVar = vVar3;
            uVar.f84410t = vVar;
            uVar.f84411u = str;
            uVar.f84412v = aVar;
            uVar.f84413w = null;
            uVar.f84416z = 2;
            objInvoke = function1.invoke(uVar);
            if (objInvoke != coroutineSingletons) {
                vVar2 = vVar;
                aVar2 = aVar;
                ((c80.d) aVar2).g(null);
                vVar2.f84421e.remove(str);
                return objInvoke;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            aVar2 = aVar;
            ((c80.d) aVar2).g(null);
            throw th;
        }
    }

    public final void f(String str) {
        this.f84417a.a("StripeImageLoader: " + str);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, int i5, int i11, ContinuationImpl continuationImpl) {
        p pVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i12 = pVar.f84391v;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                pVar.f84391v = i12 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objY = pVar.f84389t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = pVar.f84391v;
        if (i13 == 0) {
            ResultKt.b(objY);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            m0.x xVar = new m0.x(this, str, i5, i11, null);
            pVar.f84391v = 1;
            objY = m0.y(dVar, xVar, pVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(String str, ContinuationImpl continuationImpl) {
        r rVar;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f84399v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f84399v = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        Object objY = rVar.f84397t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f84399v;
        if (i11 == 0) {
            ResultKt.b(objY);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            pu.q qVar = new pu.q(this, str, null, 12);
            rVar.f84399v = 1;
            objY = m0.y(dVar, qVar, rVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }
}
