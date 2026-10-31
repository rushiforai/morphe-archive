package r20;

import a80.m;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import android.net.Uri;
import b.c0;
import b.u4;
import com.amplitude.android.TrackingOptions;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Strs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONObject;
import pu.q;
import qx.z0;
import t70.y0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.m0;
import x80.p0;
import x80.v;
import x80.w;

/* loaded from: classes4.dex */
public final class l extends i20.g implements s80.d {

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f85385g = {"user:read:follows"};

    /* renamed from: e, reason: collision with root package name */
    public final e0 f85386e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f85387f;

    public l(e0 e0Var, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "TwitchApiIntegration");
        this.f85386e = e0Var;
        this.f85387f = ul.b.h(new b("FollowedStreams", "https://api.twitch.tv/helix/streams/followed", new z0(5), new z0(18), new z0(19), new z0(20), new z0(6), new f(4, null), (e) null, 640), new b("FollowedVideos", "https://api.twitch.tv/helix/videos", new z0(7), new z0(8), new z0(9), new z0(10), new z0(11), new z0(12), new d(4, null, 0), new e(this, null, 0)), new b("GameCategoryStreams", "https://api.twitch.tv/helix/streams", new z0(13), new z0(14), new z0(15), new z0(16), new z0(17), new d(4, null, 1), new e(this, null, 1), 128));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(l lVar, ContinuationImpl continuationImpl) {
        g gVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f85359v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f85359v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(lVar, continuationImpl);
            }
        }
        Object objAwait = gVar.f85357t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f85359v;
        try {
            if (i11 == 0) {
                ResultKt.b(objAwait);
                i20.d dVar = lVar.f61215d;
                if (dVar == null) {
                    throw new IllegalStateException("Twitch auth is null");
                }
                g0 g0Var = new g0();
                g0Var.d();
                g0Var.k("https://api.twitch.tv/helix/users");
                g0Var.a("Authorization", "Bearer " + dVar.f61200a);
                g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
                b90.j jVarC = lVar.f85386e.c(g0Var.b());
                gVar.f85359v = 1;
                objAwait = UtilsKt.await(jVarC, gVar);
                if (objAwait == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objAwait);
            }
            Closeable closeable = (Closeable) objAwait;
            try {
                m0 m0Var = (m0) closeable;
                if (!m0Var.c()) {
                    CloseableKt.a(closeable, null);
                    return null;
                }
                p0 p0Var = m0Var.f95559g;
                if (p0Var == null) {
                    CloseableKt.a(closeable, null);
                    return null;
                }
                JSONArray jSONArray = new JSONObject(p0Var.string()).getJSONArray("data");
                if (jSONArray.length() == 1) {
                    JSONObject jSONObject = jSONArray.getJSONObject(0);
                    c cVar = new c(jSONObject.getString("id"), jSONObject.getString("login"), jSONObject.getString("display_name"), jSONObject.getString("profile_image_url"));
                    CloseableKt.a(closeable, null);
                    return cVar;
                }
                throw new IllegalStateException("Invalid users array length=" + jSONArray.length());
            } finally {
            }
        } catch (Throwable th2) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("TwitchApiIntegration");
            bVar.e(th2);
            return null;
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:32|(1:34)|54|35|(1:37)(1:39)|40|22|(2:24|(1:57)(4:27|12|28|(0)(0)))(2:45|(2:47|48)(2:49|50))) */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x00d7 -> B:12:0x0034). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object m(l lVar, List list, i20.d dVar, ContinuationImpl continuationImpl) {
        h hVar;
        Ref.ObjectRef objectRef;
        l lVar2;
        List arrayList;
        w wVarB;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f85366z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f85366z = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(lVar, continuationImpl);
            }
        }
        Object obj = hVar.f85364x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f85366z;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (list.isEmpty()) {
                throw new IllegalStateException("Empty broadcasters list");
            }
            objectRef = new Ref.ObjectRef();
            v vVar = new v();
            vVar.e(null, "https://api.twitch.tv/helix/streams");
            v vVarG = vVar.b().g();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                vVarG.a("user_id", (String) it.next());
            }
            objectRef.f71863a = vVarG.b();
            lVar2 = lVar;
            arrayList = new ArrayList();
            if (objectRef.f71863a != null) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            arrayList = hVar.f85363w;
            Ref.ObjectRef objectRef2 = hVar.f85362v;
            dVar = hVar.f85361u;
            l lVar3 = hVar.f85360t;
            ResultKt.b(obj);
            h hVar2 = hVar;
            Ref.ObjectRef objectRef3 = objectRef2;
            lVar2 = lVar3;
            h hVar3 = hVar2;
            m0 m0Var = (m0) obj;
            if (!m0Var.c()) {
                throw new IllegalStateException(m.f(m0Var.f95556d, "Fetching broadcasters steam games failed, code=", ", message=", m0Var.f95555c));
            }
            p0 p0Var = m0Var.f95559g;
            if (p0Var == null) {
                throw new IllegalStateException("Fetching broadcasters steam games returned no body");
            }
            JSONObject jSONObject = new JSONObject(p0Var.string());
            JSONArray jSONArray = jSONObject.getJSONArray("data");
            int length = jSONArray.length();
            for (int i12 = 0; i12 < length; i12++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i12);
                arrayList.add(new a(jSONObject2.getString("game_id"), jSONObject2.getString(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE)));
            }
            String string = jSONObject.getJSONObject("pagination").getString("cursor");
            w wVar = (w) objectRef3.f71863a;
            if (wVar != null) {
                v vVarG2 = wVar.g();
                vVarG2.g("after", string);
                wVarB = vVarG2.b();
            } else {
                wVarB = null;
            }
            objectRef3.f71863a = wVarB;
            objectRef = objectRef3;
            hVar = hVar3;
            if (objectRef.f71863a != null) {
                if (arrayList.isEmpty()) {
                    throw new IllegalStateException("Empty game_id list");
                }
                return arrayList;
            }
            g0 g0Var = new g0();
            g0Var.d();
            w url = (w) objectRef.f71863a;
            Intrinsics.g(url, "url");
            g0Var.f95504a = url;
            g0Var.a("Authorization", "Bearer " + dVar.f61200a);
            g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
            b90.j jVarC = lVar2.f85386e.c(g0Var.b());
            hVar.f85360t = lVar2;
            hVar.f85361u = dVar;
            hVar.f85362v = objectRef;
            hVar.f85363w = arrayList;
            hVar.f85366z = 1;
            Object objAwait = UtilsKt.await(jVarC, hVar);
            if (objAwait == coroutineSingletons) {
                return coroutineSingletons;
            }
            hVar2 = hVar;
            objectRef3 = objectRef;
            obj = objAwait;
            h hVar32 = hVar2;
            m0 m0Var2 = (m0) obj;
            if (!m0Var2.c()) {
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:26|(1:28)|46|29|(1:31)(1:33)|34|16|(2:18|(1:48)(4:21|12|22|(0)(0)))(2:39|(2:41|42)(2:43|44))) */
    /* JADX WARN: Removed duplicated region for block: B:18:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x00bd -> B:12:0x0034). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object n(l lVar, i20.d dVar, c cVar, ContinuationImpl continuationImpl) {
        i iVar;
        Ref.ObjectRef objectRefL;
        l lVar2;
        List arrayList;
        i20.d dVar2;
        w wVarB;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f85373z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f85373z = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(lVar, continuationImpl);
            }
        }
        Object obj = iVar.f85371x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f85373z;
        if (i11 == 0) {
            objectRefL = u4.l(obj);
            v vVar = new v();
            vVar.e(null, "https://api.twitch.tv/helix/channels/followed");
            v vVarG = vVar.b().g();
            vVarG.g("user_id", cVar.f85344a);
            objectRefL.f71863a = vVarG.b();
            lVar2 = lVar;
            arrayList = new ArrayList();
            dVar2 = dVar;
            if (objectRefL.f71863a != null) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            arrayList = iVar.f85370w;
            Ref.ObjectRef objectRef = iVar.f85369v;
            dVar2 = iVar.f85368u;
            l lVar3 = iVar.f85367t;
            ResultKt.b(obj);
            i iVar2 = iVar;
            Ref.ObjectRef objectRef2 = objectRef;
            lVar2 = lVar3;
            i iVar3 = iVar2;
            m0 m0Var = (m0) obj;
            if (!m0Var.c()) {
                throw new IllegalStateException(m.f(m0Var.f95556d, "Fetching followed users failed, code=", ", message=", m0Var.f95555c));
            }
            p0 p0Var = m0Var.f95559g;
            if (p0Var == null) {
                throw new IllegalStateException("Fetching followed users returned no body");
            }
            JSONObject jSONObject = new JSONObject(p0Var.string());
            JSONArray jSONArray = jSONObject.getJSONArray("data");
            int length = jSONArray.length();
            for (int i12 = 0; i12 < length; i12++) {
                arrayList.add(jSONArray.getJSONObject(i12).getString("broadcaster_id"));
            }
            String string = jSONObject.getJSONObject("pagination").getString("cursor");
            w wVar = (w) objectRef2.f71863a;
            if (wVar != null) {
                v vVarG2 = wVar.g();
                vVarG2.g("after", string);
                wVarB = vVarG2.b();
            } else {
                wVarB = null;
            }
            objectRef2.f71863a = wVarB;
            objectRefL = objectRef2;
            iVar = iVar3;
            if (objectRefL.f71863a != null) {
                if (arrayList.isEmpty()) {
                    throw new IllegalStateException("Empty broadcasterIds list");
                }
                return arrayList;
            }
            g0 g0Var = new g0();
            g0Var.d();
            w url = (w) objectRefL.f71863a;
            Intrinsics.g(url, "url");
            g0Var.f95504a = url;
            g0Var.a("Authorization", "Bearer " + dVar2.f61200a);
            g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
            b90.j jVarC = lVar2.f85386e.c(g0Var.b());
            iVar.f85367t = lVar2;
            iVar.f85368u = dVar2;
            iVar.f85369v = objectRefL;
            iVar.f85370w = arrayList;
            iVar.f85373z = 1;
            Object objAwait = UtilsKt.await(jVarC, iVar);
            if (objAwait == coroutineSingletons) {
                return coroutineSingletons;
            }
            iVar2 = iVar;
            objectRef2 = objectRefL;
            obj = objAwait;
            i iVar32 = iVar2;
            m0 m0Var2 = (m0) obj;
            if (!m0Var2.c()) {
            }
        }
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("u8y2iqeqd6iphtnaivnbusd1ho4ceu", "https://sesame.ninja/app/auth/branch_exchange.php", "https://id.twitch.tv/oauth2/authorize?response_type=code", UUID.randomUUID().toString(), f85385g);
        int i5 = LoginOauthActivity.f46279c;
        return wh.f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132017492);
    }

    @Override // s80.c
    public final String d() {
        return Pkgs.TWITCH;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new q(this, (Continuation) null, 16), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        j jVar;
        l lVar;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i11 = jVar.f85377w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                jVar.f85377w = i11 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, (ContinuationImpl) continuation);
            }
        }
        j jVar2 = jVar;
        Object objJ = jVar2.f85375u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = jVar2.f85377w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = wh.f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    jVar2.f85374t = this;
                    jVar2.f85377w = 1;
                    objJ = j(null, strN, Pkgs.TWITCH, "https://sesame.ninja/app/auth/branch_exchange.php", "https://sesame.ninja/app/auth/branch_exchange.php", jVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    lVar = this;
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("TwitchApiIntegration");
                bVar.n("ERROR: Twitch authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            lVar = jVar2.f85374t;
            ResultKt.b(objJ);
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            lVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("TwitchApiIntegration");
            bVar2.e(th2);
            return Boolean.FALSE;
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:138:0x041d A[Catch: all -> 0x0124, TRY_ENTER, TRY_LEAVE, TryCatch #4 {all -> 0x0124, blocks: (B:28:0x00b2, B:30:0x00b6, B:32:0x00dc, B:138:0x041d, B:27:0x00a3), top: B:155:0x00a3 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00b6 A[Catch: all -> 0x0124, TryCatch #4 {all -> 0x0124, blocks: (B:28:0x00b2, B:30:0x00b6, B:32:0x00dc, B:138:0x041d, B:27:0x00a3), top: B:155:0x00a3 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0130 A[Catch: all -> 0x0120, TryCatch #0 {all -> 0x0120, blocks: (B:36:0x0112, B:43:0x0130, B:44:0x0138, B:46:0x013e, B:47:0x015b), top: B:147:0x0112 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01e7  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0200 A[Catch: all -> 0x0218, TRY_ENTER, TryCatch #7 {all -> 0x0218, blocks: (B:52:0x01f3, B:55:0x0200, B:57:0x020b, B:59:0x0211, B:63:0x021d, B:68:0x0262, B:72:0x0276, B:74:0x0287, B:76:0x02a0, B:78:0x02b3, B:82:0x02c7, B:128:0x03e3, B:130:0x03fd, B:127:0x03c3, B:129:0x03ef, B:75:0x0293), top: B:161:0x01f3, outer: #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0260  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r11v16, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r12v20, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r14v5, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function4] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:50:0x01e7 -> B:51:0x01f0). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(b bVar, c cVar, i20.d dVar, Map map, ContinuationImpl continuationImpl) {
        k kVar;
        l lVar;
        Ref.LongRef longRef;
        b bVar2;
        ArrayList arrayList;
        k kVar2;
        l lVar2;
        Ref.ObjectRef objectRef;
        c cVar2;
        i20.d dVar2;
        Map map2;
        b bVar3;
        Ref.LongRef longRef2;
        v vVar;
        v vVarG;
        g0 g0Var;
        Ref.ObjectRef objectRef2;
        Object objAwait;
        c cVar3;
        i20.d dVar3;
        Map map3;
        ArrayList arrayList2;
        Ref.ObjectRef objectRef3;
        v vVar2;
        g0 g0Var2;
        Object obj;
        long j11;
        long length;
        c cVar4;
        l lVar3;
        k kVar3;
        String str;
        int i5;
        k kVar4;
        String str2;
        Long lValueOf;
        Long l9;
        String strString;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i11 = kVar.G;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                kVar.G = i11 - Integer.MIN_VALUE;
                lVar = this;
            } else {
                lVar = this;
                kVar = new k(lVar, continuationImpl);
            }
        }
        Object obj2 = kVar.E;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = kVar.G;
        if (i12 == 0) {
            ResultKt.b(obj2);
            longRef = new Ref.LongRef();
            try {
                ArrayList arrayList3 = new ArrayList();
                Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
                bVar2 = bVar;
                try {
                    objectRef4.f71863a = bVar2.f85335b;
                    arrayList = arrayList3;
                    kVar2 = kVar;
                    lVar2 = lVar;
                    objectRef = objectRef4;
                    cVar2 = cVar;
                    dVar2 = dVar;
                    map2 = map;
                    if (objectRef.f71863a != null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    bVar3 = bVar2;
                    mc0.b bVar4 = mc0.d.f76206a;
                    bVar4.r("TwitchApiIntegration");
                    bVar4.n(c0.m("Error pulling Twitch ", bVar3.f85334a, "s: ", th.getMessage()), new Object[0]);
                    return new i20.a(longRef.f71862a, null, null, true);
                }
            } catch (Throwable th3) {
                th = th3;
                bVar2 = bVar;
                bVar3 = bVar2;
                mc0.b bVar42 = mc0.d.f76206a;
                bVar42.r("TwitchApiIntegration");
                bVar42.n(c0.m("Error pulling Twitch ", bVar3.f85334a, "s: ", th.getMessage()), new Object[0]);
                return new i20.a(longRef.f71862a, null, null, true);
            }
        } else {
            if (i12 == 1) {
                g0Var2 = kVar.D;
                vVar2 = kVar.C;
                v vVar3 = (v) kVar.B;
                objectRef3 = kVar.A;
                List list = kVar.f85384z;
                longRef = kVar.f85383y;
                Map map4 = kVar.f85382x;
                i20.d dVar4 = kVar.f85381w;
                c cVar5 = kVar.f85380v;
                bVar3 = kVar.f85379u;
                l lVar4 = kVar.f85378t;
                try {
                    ResultKt.b(obj2);
                    dVar3 = dVar4;
                    longRef2 = longRef;
                    map3 = map4;
                    vVarG = vVar3;
                    lVar2 = lVar4;
                    obj = obj2;
                    cVar3 = cVar5;
                    arrayList2 = list;
                    arrayList = arrayList2;
                    cVar2 = cVar3;
                    g0Var = g0Var2;
                    map2 = map3;
                    vVar = vVar2;
                    objectRef2 = objectRef3;
                    kVar2 = kVar;
                    dVar2 = dVar3;
                    if (map2 != null) {
                    }
                    w wVarB = vVarG.b();
                    g0Var.getClass();
                    g0Var.f95504a = wVarB;
                    g0Var.a("Authorization", "Bearer " + dVar2.f61200a);
                    g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
                    h0 h0VarB = g0Var.b();
                    objectRef2.f71863a = null;
                    TrafficStats.setThreadStatsTag(125702701);
                    mc0.b bVar5 = mc0.d.f76206a;
                    bVar5.r("TwitchApiIntegration");
                    w wVar = h0VarB.f95509a;
                    String str3 = dVar2.f61200a;
                    StringBuilder sb2 = new StringBuilder();
                    Map map5 = map2;
                    sb2.append("Starting call to ");
                    sb2.append(wVar);
                    sb2.append(" ");
                    sb2.append(str3);
                    bVar5.b(sb2.toString(), new Object[0]);
                    b90.j jVarC = lVar2.f85386e.c(h0VarB);
                    kVar2.f85378t = lVar2;
                    kVar2.f85379u = bVar3;
                    kVar2.f85380v = cVar2;
                    kVar2.f85381w = dVar2;
                    kVar2.f85382x = map5;
                    kVar2.f85383y = longRef2;
                    kVar2.f85384z = arrayList;
                    kVar2.A = objectRef2;
                    kVar2.B = h0VarB;
                    kVar2.C = null;
                    kVar2.D = null;
                    kVar2.G = 2;
                    objAwait = UtilsKt.await(jVarC, kVar2);
                    if (objAwait != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                } catch (Throwable th4) {
                    th = th4;
                    mc0.b bVar422 = mc0.d.f76206a;
                    bVar422.r("TwitchApiIntegration");
                    bVar422.n(c0.m("Error pulling Twitch ", bVar3.f85334a, "s: ", th.getMessage()), new Object[0]);
                    return new i20.a(longRef.f71862a, null, null, true);
                }
            }
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0 h0Var = (h0) kVar.B;
            Ref.ObjectRef objectRef5 = kVar.A;
            List list2 = kVar.f85384z;
            longRef = kVar.f85383y;
            Map map6 = kVar.f85382x;
            i20.d dVar5 = kVar.f85381w;
            c cVar6 = kVar.f85380v;
            b bVar6 = kVar.f85379u;
            lVar2 = kVar.f85378t;
            try {
                ResultKt.b(obj2);
                bVar3 = bVar6;
                kVar2 = kVar;
                dVar2 = dVar5;
                ArrayList arrayList4 = list2;
                Closeable closeable = (Closeable) obj2;
                try {
                    m0 m0Var = (m0) closeable;
                    boolean zC = m0Var.c();
                    i20.d dVar6 = dVar2;
                    p0 p0Var = m0Var.f95559g;
                    if (!zC) {
                        if (p0Var == null) {
                            i20.a aVar = new i20.a(longRef.f71862a, null, null, true);
                            CloseableKt.a(closeable, null);
                            return aVar;
                        }
                        String strString2 = p0Var.string();
                        CoroutineSingletons coroutineSingletons2 = coroutineSingletons;
                        long j12 = longRef.f71862a;
                        if (p0Var.contentLength() >= 0) {
                            j11 = j12;
                            length = p0Var.contentLength();
                        } else {
                            j11 = j12;
                            length = 2 * strString2.length();
                        }
                        longRef.f71862a = j11 + length;
                        JSONObject jSONObject = new JSONObject(strString2);
                        JSONArray jSONArray = (JSONArray) bVar3.f85336c.invoke(jSONObject);
                        if (jSONArray == null) {
                            i20.a aVar2 = new i20.a(longRef.f71862a, null, null, true);
                            CloseableKt.a(closeable, null);
                            return aVar2;
                        }
                        int length2 = jSONArray.length();
                        int i13 = 0;
                        while (true) {
                            if (i13 >= length2) {
                                cVar4 = cVar6;
                                lVar3 = lVar2;
                                kVar3 = kVar2;
                                str = (String) bVar3.f85340g.invoke(jSONObject);
                                break;
                            }
                            try {
                                i5 = length2;
                                try {
                                    JSONObject jSONObject2 = jSONArray.getJSONObject(i13);
                                    String str4 = (String) bVar3.f85337d.invoke(jSONObject2);
                                    if (str4 == null || (str2 = (String) bVar3.f85338e.invoke(jSONObject2)) == null) {
                                        lVar3 = lVar2;
                                        kVar4 = kVar2;
                                    } else {
                                        lVar3 = lVar2;
                                        try {
                                            String str5 = (String) bVar3.f85339f.invoke(jSONObject2);
                                            Function1 function1 = bVar3.f85341h;
                                            if (function1 != null && !((Boolean) function1.invoke(jSONObject2)).booleanValue()) {
                                                kVar3 = kVar2;
                                                str = null;
                                                break;
                                            }
                                            String str6 = bVar3.f85334a + "/" + str2;
                                            kVar4 = kVar2;
                                            try {
                                                String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse(str2)).setPackage(Pkgs.TWITCH));
                                                Intrinsics.d(intentUri);
                                                lVar3.getClass();
                                                String str7 = bVar3.f85334a;
                                                int iHashCode = str7.hashCode();
                                                if (iHashCode == -2102288733) {
                                                    if (str7.equals("FollowedStreams")) {
                                                        lValueOf = Long.valueOf(System.currentTimeMillis() + 28800000);
                                                        l9 = lValueOf;
                                                    }
                                                    l9 = null;
                                                } else if (iHashCode != -115076189) {
                                                    if (iHashCode == 1392969640 && str7.equals("FollowedVideos")) {
                                                        lValueOf = Long.valueOf(System.currentTimeMillis() + 86400000);
                                                        l9 = lValueOf;
                                                    } else {
                                                        l9 = null;
                                                    }
                                                } else if (str7.equals("GameCategoryStreams")) {
                                                    lValueOf = Long.valueOf(System.currentTimeMillis() + 28800000);
                                                    l9 = lValueOf;
                                                } else {
                                                    l9 = null;
                                                }
                                                arrayList4.add(new ExternalLink(str6, str4, null, str5, intentUri, l9, null, 196));
                                            } catch (Throwable unused) {
                                                mc0.b bVar7 = mc0.d.f76206a;
                                                bVar7.r("TwitchApiIntegration");
                                                bVar7.n("Failed parsing item " + jSONArray.get(i13), new Object[0]);
                                                i13++;
                                                length2 = i5;
                                                cVar6 = cVar4;
                                                lVar2 = lVar3;
                                                kVar2 = kVar4;
                                            }
                                        } catch (Throwable unused2) {
                                            kVar4 = kVar2;
                                            mc0.b bVar72 = mc0.d.f76206a;
                                            bVar72.r("TwitchApiIntegration");
                                            bVar72.n("Failed parsing item " + jSONArray.get(i13), new Object[0]);
                                            i13++;
                                            length2 = i5;
                                            cVar6 = cVar4;
                                            lVar2 = lVar3;
                                            kVar2 = kVar4;
                                        }
                                    }
                                } catch (Throwable unused3) {
                                    cVar4 = cVar6;
                                }
                            } catch (Throwable unused4) {
                                lVar3 = lVar2;
                                kVar4 = kVar2;
                                mc0.b bVar722 = mc0.d.f76206a;
                                bVar722.r("TwitchApiIntegration");
                                bVar722.n("Failed parsing item " + jSONArray.get(i13), new Object[0]);
                                i13++;
                                length2 = i5;
                                cVar6 = cVar4;
                                lVar2 = lVar3;
                                kVar2 = kVar4;
                            }
                            cVar4 = cVar6;
                            i13++;
                            length2 = i5;
                            cVar6 = cVar4;
                            lVar2 = lVar3;
                            kVar2 = kVar4;
                        }
                        objectRef5.f71863a = str;
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        dVar2 = dVar6;
                        cVar2 = cVar4;
                        lVar2 = lVar3;
                        bVar2 = bVar3;
                        objectRef = objectRef5;
                        arrayList = arrayList4;
                        map2 = map6;
                        coroutineSingletons = coroutineSingletons2;
                        kVar2 = kVar3;
                        if (objectRef.f71863a != null) {
                            mc0.b bVar8 = mc0.d.f76206a;
                            bVar8.r("TwitchApiIntegration");
                            bVar8.b("Finished API requests to " + bVar2.f85335b + ": got " + arrayList.size() + " " + bVar2.f85334a + " ingest packets at " + longRef.f71862a + " bytes", new Object[0]);
                            return new i20.a(longRef.f71862a, null, arrayList, false);
                        }
                        g0Var = new g0();
                        g0Var.d();
                        String str8 = (String) objectRef.f71863a;
                        Intrinsics.g(str8, "<this>");
                        v vVar4 = new v();
                        vVar4.e(null, str8);
                        vVarG = vVar4.b().g();
                        ?? r14 = bVar2.f85342i;
                        if (r14 == 0) {
                            Ref.ObjectRef objectRef6 = objectRef;
                            bVar3 = bVar2;
                            objectRef2 = objectRef6;
                            longRef2 = longRef;
                            vVar = vVarG;
                            if (map2 != null) {
                            }
                            w wVarB2 = vVarG.b();
                            g0Var.getClass();
                            g0Var.f95504a = wVarB2;
                            g0Var.a("Authorization", "Bearer " + dVar2.f61200a);
                            g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
                            h0 h0VarB2 = g0Var.b();
                            objectRef2.f71863a = null;
                            TrafficStats.setThreadStatsTag(125702701);
                            mc0.b bVar52 = mc0.d.f76206a;
                            bVar52.r("TwitchApiIntegration");
                            w wVar2 = h0VarB2.f95509a;
                            String str32 = dVar2.f61200a;
                            StringBuilder sb22 = new StringBuilder();
                            Map map52 = map2;
                            sb22.append("Starting call to ");
                            sb22.append(wVar2);
                            sb22.append(" ");
                            sb22.append(str32);
                            bVar52.b(sb22.toString(), new Object[0]);
                            b90.j jVarC2 = lVar2.f85386e.c(h0VarB2);
                            kVar2.f85378t = lVar2;
                            kVar2.f85379u = bVar3;
                            kVar2.f85380v = cVar2;
                            kVar2.f85381w = dVar2;
                            kVar2.f85382x = map52;
                            kVar2.f85383y = longRef2;
                            kVar2.f85384z = arrayList;
                            kVar2.A = objectRef2;
                            kVar2.B = h0VarB2;
                            kVar2.C = null;
                            kVar2.D = null;
                            kVar2.G = 2;
                            objAwait = UtilsKt.await(jVarC2, kVar2);
                            if (objAwait != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        }
                        kVar2.f85378t = lVar2;
                        kVar2.f85379u = bVar2;
                        kVar2.f85380v = cVar2;
                        kVar2.f85381w = dVar2;
                        kVar2.f85382x = map2;
                        kVar2.f85383y = longRef;
                        kVar2.f85384z = arrayList;
                        kVar2.A = objectRef;
                        kVar2.B = vVarG;
                        kVar2.C = vVarG;
                        kVar2.D = g0Var;
                        kVar2.G = 1;
                        Object objInvoke = r14.invoke(vVarG, dVar2, cVar2, kVar2);
                        if (objInvoke != coroutineSingletons) {
                            cVar3 = cVar2;
                            dVar3 = dVar2;
                            kVar = kVar2;
                            objectRef3 = objectRef;
                            obj = objInvoke;
                            bVar3 = bVar2;
                            vVar2 = vVarG;
                            longRef2 = longRef;
                            map3 = map2;
                            g0Var2 = g0Var;
                            arrayList2 = arrayList;
                            try {
                                arrayList = arrayList2;
                                cVar2 = cVar3;
                                g0Var = g0Var2;
                                map2 = map3;
                                vVar = vVar2;
                                objectRef2 = objectRef3;
                                kVar2 = kVar;
                                dVar2 = dVar3;
                                if (map2 != null) {
                                    for (Map.Entry entry : map2.entrySet()) {
                                        vVar.g((String) entry.getKey(), (String) entry.getValue());
                                    }
                                }
                                w wVarB22 = vVarG.b();
                                g0Var.getClass();
                                g0Var.f95504a = wVarB22;
                                g0Var.a("Authorization", "Bearer " + dVar2.f61200a);
                                g0Var.a("Client-ID", "u8y2iqeqd6iphtnaivnbusd1ho4ceu");
                                h0 h0VarB22 = g0Var.b();
                                objectRef2.f71863a = null;
                                TrafficStats.setThreadStatsTag(125702701);
                                mc0.b bVar522 = mc0.d.f76206a;
                                bVar522.r("TwitchApiIntegration");
                                w wVar22 = h0VarB22.f95509a;
                                String str322 = dVar2.f61200a;
                                StringBuilder sb222 = new StringBuilder();
                                Map map522 = map2;
                                sb222.append("Starting call to ");
                                sb222.append(wVar22);
                                sb222.append(" ");
                                sb222.append(str322);
                                bVar522.b(sb222.toString(), new Object[0]);
                                b90.j jVarC22 = lVar2.f85386e.c(h0VarB22);
                                kVar2.f85378t = lVar2;
                                kVar2.f85379u = bVar3;
                                kVar2.f85380v = cVar2;
                                kVar2.f85381w = dVar2;
                                kVar2.f85382x = map522;
                                kVar2.f85383y = longRef2;
                                kVar2.f85384z = arrayList;
                                kVar2.A = objectRef2;
                                kVar2.B = h0VarB22;
                                kVar2.C = null;
                                kVar2.D = null;
                                kVar2.G = 2;
                                objAwait = UtilsKt.await(jVarC22, kVar2);
                                if (objAwait != coroutineSingletons) {
                                    objectRef5 = objectRef2;
                                    longRef = longRef2;
                                    arrayList4 = arrayList;
                                    map6 = map522;
                                    cVar6 = cVar2;
                                    obj2 = objAwait;
                                    h0Var = h0VarB22;
                                    Closeable closeable2 = (Closeable) obj2;
                                    m0 m0Var2 = (m0) closeable2;
                                    boolean zC2 = m0Var2.c();
                                    i20.d dVar62 = dVar2;
                                    p0 p0Var2 = m0Var2.f95559g;
                                    if (!zC2) {
                                        mc0.b bVar9 = mc0.d.f76206a;
                                        bVar9.r("TwitchApiIntegration");
                                        int i14 = m0Var2.f95556d;
                                        String str9 = m0Var2.f95555c;
                                        String strG1 = (p0Var2 == null || (strString = p0Var2.string()) == null) ? null : r70.l.G1(100, strString);
                                        bVar9.n("Failed API request: '" + i14 + " " + str9 + " [" + strG1 + "]' from " + h0Var.f95509a, new Object[0]);
                                        i20.a aVar3 = new i20.a(longRef.f71862a, null, null, true);
                                        CloseableKt.a(closeable2, null);
                                        return aVar3;
                                    }
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                longRef = longRef2;
                                mc0.b bVar4222 = mc0.d.f76206a;
                                bVar4222.r("TwitchApiIntegration");
                                bVar4222.n(c0.m("Error pulling Twitch ", bVar3.f85334a, "s: ", th.getMessage()), new Object[0]);
                                return new i20.a(longRef.f71862a, null, null, true);
                            }
                        }
                        return coroutineSingletons;
                    }
                } catch (Throwable th6) {
                    try {
                        throw th6;
                    } catch (Throwable th7) {
                        CloseableKt.a(closeable2, th6);
                        throw th7;
                    }
                }
            } catch (Throwable th8) {
                th = th8;
                bVar3 = bVar6;
                mc0.b bVar42222 = mc0.d.f76206a;
                bVar42222.r("TwitchApiIntegration");
                bVar42222.n(c0.m("Error pulling Twitch ", bVar3.f85334a, "s: ", th.getMessage()), new Object[0]);
                return new i20.a(longRef.f71862a, null, null, true);
            }
        }
    }
}
