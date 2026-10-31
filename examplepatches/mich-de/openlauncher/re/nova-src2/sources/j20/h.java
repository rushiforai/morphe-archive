package j20;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import android.net.Uri;
import b.c0;
import b90.j;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import h50.i1;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.Strs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONObject;
import r70.l;
import t70.m0;
import t70.y0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.p0;
import x80.v;
import x80.w;

/* loaded from: classes.dex */
public final class h extends i20.g implements s80.d {

    /* renamed from: f, reason: collision with root package name */
    public static final String[] f68759f = {"manage_library", "listening_history", "offline_access"};

    /* renamed from: g, reason: collision with root package name */
    public static final ArrayList f68760g = ul.b.h(new a("album", "https://api.deezer.com/user/me/albums", new i1(2), new i1(3), new i1(8), new i1(9), new i1(18)), new a("artist", "https://api.deezer.com/user/me/artists", new i1(10), new i1(11), new i1(12), new i1(14), new i1(18)), new a("playlist", "https://api.deezer.com/user/me/playlists", new i1(13), new i1(15), new i1(16), new i1(17), new i1(18)));

    /* renamed from: h, reason: collision with root package name */
    public static final a f68761h = new a("flow", "https://api.deezer.com/user/me/flow", new i1(19), new i1(20), new i1(21), new i1(22), new i1(18));

    /* renamed from: i, reason: collision with root package name */
    public static final a f68762i = new a("recently_played", "https://api.deezer.com/user/me/history", new i1(4), new i1(5), new i1(6), new i1(7), new i1(18));

    /* renamed from: e, reason: collision with root package name */
    public final e0 f68763e;

    public h(e0 e0Var, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "DeezerIngester");
        this.f68763e = e0Var;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("669983", "https://sesame.ninja/app/auth/branch_exchange.php", "https://connect.deezer.com/oauth/auth.php", UUID.randomUUID().toString(), f68759f, h20.a.f59032b);
        int i5 = LoginOauthActivity.f46279c;
        return wh.f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return "Deezer";
    }

    @Override // s80.c
    public final String d() {
        return "deezer.android.app";
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new h6.c(this, (Continuation) null, 16), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        f fVar;
        h hVar;
        if (continuation instanceof f) {
            fVar = (f) continuation;
            int i11 = fVar.f68751w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                fVar.f68751w = i11 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, (ContinuationImpl) continuation);
            }
        }
        f fVar2 = fVar;
        Object objJ = fVar2.f68749u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = fVar2.f68751w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = wh.f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    fVar2.f68748t = this;
                    fVar2.f68751w = 1;
                    objJ = j(null, strN, "deezer.android.app", "disco://nova.branch.search/callback/oauth2", "https://sesame.ninja/app/auth/branch_exchange.php", fVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    hVar = this;
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("DeezerIngester");
                bVar.n("ERROR: Deezer authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            hVar = fVar2.f68748t;
            ResultKt.b(objJ);
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            hVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("DeezerIngester");
            bVar2.f(th2, "DeezerIngester", new Object[0]);
            return Boolean.FALSE;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object l(ContinuationImpl continuationImpl) {
        c cVar;
        Object objO;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f68741v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f68741v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f68739t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = cVar.f68741v;
        if (i11 == 0) {
            ResultKt.b(obj);
            int i12 = Result.f71687b;
            cVar.f68741v = 1;
            objO = o(f68761h, cVar);
            if (objO == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objO = ((Result) obj).f71688a;
        }
        EmptyList emptyList = EmptyList.f71733a;
        int i13 = Result.f71687b;
        return objO instanceof Result.Failure ? emptyList : objO;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m(ContinuationImpl continuationImpl) {
        d dVar;
        Object objO;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f68744v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f68744v = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f68742t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = dVar.f68744v;
        if (i11 == 0) {
            ResultKt.b(obj);
            int i12 = Result.f71687b;
            a aVar = (a) f68760g.get(2);
            dVar.f68744v = 1;
            objO = o(aVar, dVar);
            if (objO == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objO = ((Result) obj).f71688a;
        }
        EmptyList emptyList = EmptyList.f71733a;
        int i13 = Result.f71687b;
        return objO instanceof Result.Failure ? emptyList : objO;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object n(ContinuationImpl continuationImpl) {
        e eVar;
        Object objO;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f68747v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f68747v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f68745t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = eVar.f68747v;
        if (i11 == 0) {
            ResultKt.b(obj);
            int i12 = Result.f71687b;
            eVar.f68747v = 1;
            objO = o(f68762i, eVar);
            if (objO == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objO = ((Result) obj).f71688a;
        }
        EmptyList emptyList = EmptyList.f71733a;
        int i13 = Result.f71687b;
        return objO instanceof Result.Failure ? emptyList : objO;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0078 A[Catch: all -> 0x0223, TRY_LEAVE, TryCatch #2 {all -> 0x0223, blocks: (B:25:0x0074, B:27:0x0078, B:78:0x0225, B:24:0x006e), top: B:86:0x006e }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0109 A[Catch: all -> 0x0121, TRY_ENTER, TryCatch #0 {all -> 0x0121, blocks: (B:32:0x00fe, B:35:0x0109, B:37:0x0114, B:39:0x011a, B:43:0x0126, B:48:0x0166, B:52:0x0178, B:54:0x018b, B:58:0x019d, B:60:0x01a4, B:67:0x01f8, B:63:0x01b9, B:66:0x01c6, B:68:0x0202), top: B:84:0x00fe, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0225 A[Catch: all -> 0x0223, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x0223, blocks: (B:25:0x0074, B:27:0x0078, B:78:0x0225, B:24:0x006e), top: B:86:0x006e }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r11v11, types: [java.util.List] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x00f7 -> B:31:0x00fb). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(a aVar, ContinuationImpl continuationImpl) {
        g gVar;
        a aVar2;
        ArrayList arrayList;
        Ref.ObjectRef objectRef;
        i20.d dVar;
        h hVar;
        String str;
        g gVar2;
        String strString;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.B;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.B = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f68758z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.B;
        w wVar = null;
        int i12 = 0;
        if (i11 == 0) {
            ResultKt.b(obj);
            i20.d dVar2 = this.f61215d;
            if (dVar2 == null) {
                int i13 = Result.f71687b;
                return ResultKt.a(new Throwable("No auth"));
            }
            try {
                arrayList = new ArrayList();
                objectRef = new Ref.ObjectRef();
                aVar2 = aVar;
                try {
                    objectRef.f71863a = aVar2.f68730b;
                    dVar = dVar2;
                    hVar = this;
                    if (objectRef.f71863a != null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("DeezerIngester");
                    bVar.n(c0.m("Error pulling Deezer ", aVar2.f68729a, "s: ", th.getMessage()), new Object[0]);
                    int i14 = Result.f71687b;
                    return ResultKt.a(th);
                }
            } catch (Throwable th3) {
                th = th3;
                aVar2 = aVar;
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("DeezerIngester");
                bVar2.n(c0.m("Error pulling Deezer ", aVar2.f68729a, "s: ", th.getMessage()), new Object[0]);
                int i142 = Result.f71687b;
                return ResultKt.a(th);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0 h0Var = gVar.f68757y;
            objectRef = gVar.f68756x;
            List list = gVar.f68755w;
            dVar = gVar.f68754v;
            a aVar3 = gVar.f68753u;
            hVar = gVar.f68752t;
            try {
                ResultKt.b(obj);
                ArrayList arrayList2 = list;
                Closeable closeable = (Closeable) obj;
                try {
                    x80.m0 m0Var = (x80.m0) closeable;
                    boolean zC = m0Var.c();
                    p0 p0Var = m0Var.f95559g;
                    if (!zC) {
                        if (p0Var == null) {
                            int i15 = Result.f71687b;
                            Result.Failure failureA = ResultKt.a(new Throwable("Response body is empty"));
                            CloseableKt.a(closeable, null);
                            return failureA;
                        }
                        JSONObject jSONObject = new JSONObject(p0Var.string());
                        JSONArray jSONArray = (JSONArray) aVar3.f68731c.invoke(jSONObject);
                        if (jSONArray == null) {
                            int i16 = Result.f71687b;
                            Result.Failure failureA2 = ResultKt.a(new Throwable("Data array not present"));
                            CloseableKt.a(closeable, null);
                            return failureA2;
                        }
                        int length = jSONArray.length();
                        int i17 = i12;
                        while (i17 < length) {
                            JSONObject jSONObject2 = jSONArray.getJSONObject(i17);
                            JSONArray jSONArray2 = jSONArray;
                            String str2 = (String) aVar3.f68732d.invoke(jSONObject2);
                            if (str2 == null || (str = (String) aVar3.f68733e.invoke(jSONObject2)) == null) {
                                gVar2 = gVar;
                            } else {
                                String str3 = (String) aVar3.f68734f.invoke(jSONObject2);
                                gVar2 = gVar;
                                String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse(str)));
                                Intrinsics.d(intentUri);
                                arrayList2.add(new ExternalLink(str, str2, null, str3, intentUri, null, null, 228));
                            }
                            i17++;
                            jSONArray = jSONArray2;
                            gVar = gVar2;
                        }
                        g gVar3 = gVar;
                        objectRef.f71863a = aVar3.f68735g.invoke(jSONObject);
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        wVar = null;
                        arrayList = arrayList2;
                        aVar2 = aVar3;
                        gVar = gVar3;
                        i12 = 0;
                        if (objectRef.f71863a != null) {
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r("DeezerIngester");
                            bVar3.b("Finished API requests to " + aVar2.f68730b + ": got " + arrayList.size() + " " + aVar2.f68729a + " ingest packets", new Object[0]);
                            int i18 = Result.f71687b;
                            return arrayList;
                        }
                        g0 g0Var = new g0();
                        g0Var.d();
                        String str4 = (String) objectRef.f71863a;
                        Intrinsics.g(str4, "<this>");
                        v vVar = new v();
                        vVar.e(wVar, str4);
                        v vVarG = vVar.b().g();
                        vVarG.g("limit", "50");
                        vVarG.g("access_token", dVar.a());
                        g0Var.f95504a = vVarG.b();
                        h0 h0VarB = g0Var.b();
                        objectRef.f71863a = wVar;
                        TrafficStats.setThreadStatsTag(-1915923596);
                        mc0.b bVar4 = mc0.d.f76206a;
                        bVar4.r("DeezerIngester");
                        bVar4.b("Starting call to " + h0VarB.f95509a, new Object[i12]);
                        j jVarC = hVar.f68763e.c(h0VarB);
                        gVar.f68752t = hVar;
                        gVar.f68753u = aVar2;
                        gVar.f68754v = dVar;
                        gVar.f68755w = arrayList;
                        gVar.f68756x = objectRef;
                        gVar.f68757y = h0VarB;
                        gVar.B = 1;
                        Object objAwait = UtilsKt.await(jVarC, gVar);
                        if (objAwait == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        aVar3 = aVar2;
                        arrayList2 = arrayList;
                        h0Var = h0VarB;
                        obj = objAwait;
                        Closeable closeable2 = (Closeable) obj;
                        x80.m0 m0Var2 = (x80.m0) closeable2;
                        boolean zC2 = m0Var2.c();
                        p0 p0Var2 = m0Var2.f95559g;
                        if (!zC2) {
                            mc0.b bVar5 = mc0.d.f76206a;
                            bVar5.r("DeezerIngester");
                            int i19 = m0Var2.f95556d;
                            String str5 = m0Var2.f95555c;
                            String strG1 = (p0Var2 == null || (strString = p0Var2.string()) == null) ? null : l.G1(100, strString);
                            bVar5.n("Failed API request: '" + i19 + " " + str5 + " [" + strG1 + "]' from " + h0Var.f95509a, new Object[i12]);
                            int i21 = Result.f71687b;
                            Result.Failure failureA3 = ResultKt.a(new Throwable());
                            CloseableKt.a(closeable2, null);
                            return failureA3;
                        }
                    }
                } finally {
                }
            } catch (Throwable th4) {
                th = th4;
                aVar2 = aVar3;
                mc0.b bVar22 = mc0.d.f76206a;
                bVar22.r("DeezerIngester");
                bVar22.n(c0.m("Error pulling Deezer ", aVar2.f68729a, "s: ", th.getMessage()), new Object[0]);
                int i1422 = Result.f71687b;
                return ResultKt.a(th);
            }
        }
    }
}
