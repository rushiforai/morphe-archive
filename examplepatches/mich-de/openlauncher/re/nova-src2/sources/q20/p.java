package q20;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import android.net.Uri;
import b.c0;
import com.google.android.gms.internal.measurement.le;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.spotify.sdk.android.auth.AuthorizationResponse;
import com.vungle.ads.internal.protos.Sdk;
import cw.r;
import e10.h2;
import java.io.Closeable;
import java.io.Serializable;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
import pu.q;
import t70.y0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.m0;
import x80.p0;
import x80.v;
import x80.w;

/* loaded from: classes.dex */
public final class p extends i20.g implements s80.d {

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f83512h = {"playlist-read-collaborative", "playlist-read-private", "user-follow-read", "user-library-read", "user-read-playback-position", "user-read-playback-state", "user-read-recently-played", "user-read-currently-playing", "user-top-read"};

    /* renamed from: i, reason: collision with root package name */
    public static final ArrayList f83513i = ul.b.h(new g("album", "https://api.spotify.com/v1/me/albums", new o0.m(6), new o0.m(8), new o0.m(20), new o0.m(26), new o0.m(27)), new g("artist", "https://api.spotify.com/v1/me/following?type=artist", new o0.m(29), new c(0), new c(1), new c(2), new c(3)), new g("track", "https://api.spotify.com/v1/me/tracks", new o0.m(17), new o0.m(28), new c(4), new c(5), new c(6)), new g("playlist", "https://api.spotify.com/v1/me/playlists", new c(7), new c(8), new c(9), new c(10), new o0.m(7)), new g("show", "https://api.spotify.com/v1/me/shows", new o0.m(9), new o0.m(10), new o0.m(11), new o0.m(12), new o0.m(13)), new g("episode", "https://api.spotify.com/v1/me/episodes", new o0.m(14), new o0.m(15), new o0.m(16), new o0.m(18), new o0.m(19)), new g("audiobook", "https://api.spotify.com/v1/me/audiobooks", new o0.m(21), new o0.m(22), new o0.m(23), new o0.m(24), new o0.m(25)));

    /* renamed from: e, reason: collision with root package name */
    public final e0 f83514e;

    /* renamed from: f, reason: collision with root package name */
    public final com.moloco.sdk.service_locator.b f83515f;

    /* renamed from: g, reason: collision with root package name */
    public final h2 f83516g;

    public p(e0 e0Var, String str, h2 h2Var, com.moloco.sdk.service_locator.b bVar, h2 h2Var2) {
        super(e0Var, str, h2Var, "SSML-SpotifyIngester");
        this.f83514e = e0Var;
        this.f83515f = bVar;
        this.f83516g = h2Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:107:0x03bb, B:122:0x043b], limit reached: 253 */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0595  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x05f3  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x0164 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x023a A[Catch: all -> 0x0252, TRY_ENTER, TryCatch #13 {all -> 0x0252, blocks: (B:45:0x023a, B:47:0x0245, B:49:0x024b, B:53:0x0259, B:59:0x029d, B:65:0x02b9, B:70:0x02e2), top: B:234:0x02b9 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x029b  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r12v0 */
    /* JADX WARN: Type inference failed for: r12v1 */
    /* JADX WARN: Type inference failed for: r12v10 */
    /* JADX WARN: Type inference failed for: r12v15, types: [kotlin.jvm.internal.Ref$LongRef] */
    /* JADX WARN: Type inference failed for: r12v16 */
    /* JADX WARN: Type inference failed for: r12v17 */
    /* JADX WARN: Type inference failed for: r12v19 */
    /* JADX WARN: Type inference failed for: r12v2 */
    /* JADX WARN: Type inference failed for: r12v20 */
    /* JADX WARN: Type inference failed for: r12v3, types: [kotlin.jvm.internal.Ref$LongRef] */
    /* JADX WARN: Type inference failed for: r12v35 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:103:0x03a6 -> B:244:0x03af). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:153:0x04c8 -> B:224:0x04df). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:74:0x02f3 -> B:75:0x02fe). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(p pVar, ArrayList arrayList, ContinuationImpl continuationImpl) {
        o oVar;
        String str;
        long j11;
        Ref.ObjectRef objectRef;
        ArrayList arrayList2;
        p pVar2;
        Map map;
        HashSet hashSet;
        Ref.LongRef longRef;
        long j12;
        String str2;
        Ref.LongRef longRef2;
        Throwable th2;
        Closeable closeable;
        String str3;
        String str4;
        String str5;
        String str6;
        Map map2;
        Ref.LongRef longRef3;
        p pVar3;
        h0 h0VarB;
        Object obj;
        Ref.LongRef longRef4;
        Ref.ObjectRef objectRef2;
        m0 m0Var;
        boolean zC;
        p pVar4;
        p0 p0Var;
        long j13;
        long jContentLength;
        int length;
        ArrayList arrayList3;
        int i5;
        String strString;
        Object obj2;
        Map map3;
        Closeable closeable2;
        Ref.LongRef longRef5;
        int i11;
        JSONObject jSONObject;
        String str7;
        CoroutineSingletons coroutineSingletons;
        p pVar5;
        long j14;
        Ref.ObjectRef objectRef3;
        Ref.LongRef longRef6;
        Closeable closeable3;
        Object obj3;
        String str8;
        Closeable closeable4;
        int i12;
        String str9;
        p0 p0Var2;
        long j15;
        long length2;
        String str10 = "context";
        String str11 = "<this>";
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i13 = oVar.K;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                oVar.K = i13 - Integer.MIN_VALUE;
            } else {
                oVar = new o(pVar, continuationImpl);
            }
        }
        Object obj4 = oVar.I;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i14 = oVar.K;
        String str12 = "images";
        String str13 = PendingUpgradeStore.KEY_NAME;
        String str14 = "SSML-SpotifyIngester";
        ?? r12 = 2;
        try {
        } catch (Throwable th3) {
            th = th3;
        }
        if (i14 == 0) {
            j11 = 0;
            ArrayList arrayListX = c0.x(obj4);
            int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
            for (Object obj5 : arrayList) {
                linkedHashMap.put(((ExternalLink) obj5).f78377a, obj5);
            }
            arrayListX.add(new ExternalLink("liked_songs", "Liked Songs", null, "https://t.scdn.co/images/3099b3803ad9496896c43f22fe9be8c4.png", n("https://open.spotify.com/collection/tracks"), null, null, 228));
            HashSet hashSet2 = new HashSet();
            Ref.LongRef longRef7 = new Ref.LongRef();
            long jCurrentTimeMillis = System.currentTimeMillis() + 2592000000L;
            Ref.LongRef longRef8 = new Ref.LongRef();
            o oVar2 = oVar;
            longRef8.f71862a = -1L;
            Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
            objectRef4.f71863a = "https://api.spotify.com/v1/me/player/recently-played";
            objectRef = objectRef4;
            oVar = oVar2;
            arrayList2 = arrayListX;
            pVar2 = pVar;
            map = linkedHashMap;
            hashSet = hashSet2;
            longRef = longRef8;
            j12 = jCurrentTimeMillis;
            r12 = longRef7;
            obj2 = objectRef.f71863a;
            if (obj2 == null) {
            }
            str = str2;
            th.printStackTrace();
            mc0.b bVar = mc0.d.f76206a;
            bVar.r(str);
            bVar.n(c0.k("Error pulling recently played tracks from Spotify: ", th.getMessage()), new Object[0]);
            return new f(null, true, r12.f71862a);
        }
        if (i14 == 1) {
            j11 = 0;
            j12 = oVar.E;
            h0 h0Var = (h0) oVar.A;
            objectRef = oVar.f83511z;
            longRef = oVar.f83510y;
            Ref.LongRef longRef9 = oVar.f83509x;
            hashSet = oVar.f83508w;
            Map map4 = oVar.f83507v;
            arrayList2 = oVar.f83506u;
            p pVar6 = oVar.f83505t;
            ResultKt.b(obj4);
            str3 = "context";
            str4 = "<this>";
            str5 = PendingUpgradeStore.KEY_NAME;
            h0VarB = h0Var;
            pVar3 = pVar6;
            obj = obj4;
            str6 = "images";
            longRef3 = longRef9;
            map2 = map4;
            longRef4 = longRef;
            objectRef2 = objectRef;
            longRef2 = longRef3;
            closeable = (Closeable) obj;
            m0Var = (m0) closeable;
            zC = m0Var.c();
            pVar4 = pVar3;
            p0Var = m0Var.f95559g;
            if (!zC) {
            }
        } else {
            if (i14 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = 0;
            long epochMilli = oVar.F;
            int i15 = oVar.H;
            int i16 = oVar.G;
            long j16 = oVar.E;
            String str15 = oVar.D;
            JSONArray jSONArray = oVar.C;
            JSONObject jSONObject2 = oVar.B;
            Closeable closeable5 = (Closeable) oVar.A;
            Ref.ObjectRef objectRef5 = oVar.f83511z;
            Ref.LongRef longRef10 = oVar.f83510y;
            longRef2 = oVar.f83509x;
            HashSet hashSet3 = oVar.f83508w;
            Map map5 = oVar.f83507v;
            ArrayList arrayList4 = oVar.f83506u;
            p pVar7 = oVar.f83505t;
            try {
                ResultKt.b(obj4);
                str2 = "SSML-SpotifyIngester";
                j14 = j16;
                hashSet = hashSet3;
                pVar5 = pVar7;
                str8 = str15;
                obj3 = obj4;
                map3 = map5;
                str6 = "images";
                closeable3 = closeable5;
                longRef4 = longRef10;
                str3 = "context";
                str5 = PendingUpgradeStore.KEY_NAME;
                arrayList3 = arrayList4;
                i11 = i15;
                str4 = "<this>";
                i5 = i16;
                objectRef2 = objectRef5;
            } catch (Throwable th4) {
                th2 = th4;
                str2 = "SSML-SpotifyIngester";
                closeable = closeable5;
                try {
                    throw th2;
                } catch (Throwable th5) {
                    try {
                        CloseableKt.a(closeable, th2);
                        throw th5;
                    } catch (Throwable th6) {
                        th = th6;
                        r12 = longRef2;
                        str = str2;
                        th.printStackTrace();
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r(str);
                        bVar2.n(c0.k("Error pulling recently played tracks from Spotify: ", th.getMessage()), new Object[0]);
                        return new f(null, true, r12.f71862a);
                    }
                }
            }
            try {
                try {
                    try {
                        try {
                            m0 m0Var2 = (m0) closeable4;
                            if (m0Var2.c() || (p0Var2 = m0Var2.f95559g) == null) {
                                i12 = i5;
                                coroutineSingletons = coroutineSingletons2;
                                objectRef3 = objectRef2;
                            } else {
                                i12 = i5;
                                JSONObject jSONObject3 = new JSONObject(p0Var2.string());
                                coroutineSingletons = coroutineSingletons2;
                                objectRef3 = objectRef2;
                                long j17 = longRef2.f71862a;
                                if (p0Var2.contentLength() >= j11) {
                                    j15 = j17;
                                    length2 = p0Var2.contentLength();
                                } else {
                                    j15 = j17;
                                    length2 = 2 * r0.length();
                                }
                                longRef2.f71862a = j15 + length2;
                                if (str8 != null) {
                                    str7 = str5;
                                    String string = jSONObject3.getString(str7);
                                    if (string == null) {
                                        str9 = str6;
                                    } else {
                                        str9 = str6;
                                        String strZ = o7.a.z(jSONObject3.getJSONArray(str9));
                                        pVar5.getClass();
                                        arrayList3.add(new ExternalLink(str8, string, null, strZ, n(str8), new Long(j14), new Long(epochMilli), Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE));
                                    }
                                }
                                Unit unit = Unit.f71706a;
                                CloseableKt.a(closeable4, null);
                                JSONObject jSONObject4 = jSONObject2;
                                i5 = i12;
                                String str16 = str9;
                                closeable5 = closeable3;
                                longRef6 = longRef2;
                                String string2 = str8;
                                j12 = j14;
                                hashSet.add(string2);
                                longRef2 = longRef6;
                                objectRef2 = objectRef3;
                                map3 = map3;
                                Unit unit2 = Unit.f71706a;
                                int i17 = i5;
                                Ref.LongRef longRef11 = longRef2;
                                String str17 = str7;
                                Closeable closeable6 = closeable5;
                                length = i11;
                                str6 = str16;
                                str5 = str17;
                                i5 = i17 + 1;
                                p pVar8 = pVar5;
                                coroutineSingletons2 = coroutineSingletons;
                                map3 = map3;
                                if (i5 >= length) {
                                    CoroutineSingletons coroutineSingletons3 = coroutineSingletons2;
                                    try {
                                        try {
                                            JSONObject jSONObject5 = jSONArray.getJSONObject(i5);
                                            i11 = length;
                                            long j18 = j12;
                                            epochMilli = Instant.parse(jSONObject5.getString("played_at")).toEpochMilli();
                                            longRef4.f71862a = Math.max(epochMilli, longRef4.f71862a);
                                            String str18 = str3;
                                            if (jSONObject5.isNull(str18)) {
                                                jSONObject = null;
                                            } else {
                                                try {
                                                    jSONObject = jSONObject5.getJSONObject(str18);
                                                } catch (Throwable th7) {
                                                    th = th7;
                                                    closeable = closeable2;
                                                    th2 = th;
                                                    throw th2;
                                                }
                                            }
                                            longRef5 = longRef2;
                                            if (jSONObject != null) {
                                                try {
                                                    String string3 = jSONObject.getString("href");
                                                    string2 = jSONObject.getString("uri");
                                                    if (hashSet.contains(string2)) {
                                                        str3 = str18;
                                                        str7 = str5;
                                                        coroutineSingletons = coroutineSingletons3;
                                                        pVar5 = pVar8;
                                                        str16 = str6;
                                                        longRef2 = longRef5;
                                                        j12 = j18;
                                                        closeable5 = closeable2;
                                                        map3 = map3;
                                                        Unit unit22 = Unit.f71706a;
                                                        int i172 = i5;
                                                        Ref.LongRef longRef112 = longRef2;
                                                        String str172 = str7;
                                                        Closeable closeable62 = closeable5;
                                                        length = i11;
                                                        str6 = str16;
                                                        str5 = str172;
                                                        i5 = i172 + 1;
                                                        p pVar82 = pVar5;
                                                        coroutineSingletons2 = coroutineSingletons;
                                                        map3 = map3;
                                                        if (i5 >= length) {
                                                            p pVar9 = pVar82;
                                                            CoroutineSingletons coroutineSingletons4 = coroutineSingletons2;
                                                            Closeable closeable7 = closeable62;
                                                            Ref.LongRef longRef12 = longRef112;
                                                            String str19 = str6;
                                                            String str20 = str5;
                                                            o oVar3 = oVar;
                                                            long j19 = j12;
                                                            try {
                                                                try {
                                                                    objectRef2.f71863a = UtilsKt.optStringNull(jSONObject4, "next");
                                                                    Unit unit3 = Unit.f71706a;
                                                                    CloseableKt.a(closeable7, null);
                                                                    objectRef = objectRef2;
                                                                    longRef = longRef4;
                                                                    arrayList2 = arrayList3;
                                                                    j12 = j19;
                                                                    map = map3;
                                                                    oVar = oVar3;
                                                                    str14 = str2;
                                                                    pVar2 = pVar9;
                                                                    coroutineSingletons2 = coroutineSingletons4;
                                                                    r12 = longRef12;
                                                                    str12 = str19;
                                                                    str13 = str20;
                                                                    str11 = str4;
                                                                    str10 = str3;
                                                                    obj2 = objectRef.f71863a;
                                                                    if (obj2 == null) {
                                                                        try {
                                                                            str6 = str12;
                                                                            v vVar = new v();
                                                                            str5 = str13;
                                                                            vVar.e(null, (String) obj2);
                                                                            vVar.b().k();
                                                                            g0 g0Var = new g0();
                                                                            g0Var.d();
                                                                            String str21 = (String) objectRef.f71863a;
                                                                            Intrinsics.g(str21, str11);
                                                                            v vVar2 = new v();
                                                                            str4 = str11;
                                                                            vVar2.e(null, str21);
                                                                            v vVarG = vVar2.b().g();
                                                                            vVarG.g("limit", "50");
                                                                            g0Var.f95504a = vVarG.b();
                                                                            i20.d dVar = pVar2.f61215d;
                                                                            Intrinsics.d(dVar);
                                                                            String strA = dVar.a();
                                                                            StringBuilder sb2 = new StringBuilder();
                                                                            str3 = str10;
                                                                            sb2.append("Bearer ");
                                                                            sb2.append(strA);
                                                                            g0Var.a("Authorization", sb2.toString());
                                                                            h0VarB = g0Var.b();
                                                                            objectRef.f71863a = null;
                                                                            TrafficStats.setThreadStatsTag(-432531203);
                                                                            mc0.b bVar3 = mc0.d.f76206a;
                                                                            bVar3.r(str14);
                                                                            bVar3.b("Starting call to " + h0VarB.f95509a, new Object[0]);
                                                                            b90.j jVarC = pVar2.f83514e.c(h0VarB);
                                                                            oVar.f83505t = pVar2;
                                                                            oVar.f83506u = arrayList2;
                                                                            oVar.f83507v = map;
                                                                            oVar.f83508w = hashSet;
                                                                            oVar.f83509x = r12;
                                                                            oVar.f83510y = longRef;
                                                                            oVar.f83511z = objectRef;
                                                                            oVar.A = h0VarB;
                                                                            oVar.B = null;
                                                                            oVar.C = null;
                                                                            oVar.D = null;
                                                                            oVar.E = j12;
                                                                            oVar.K = 1;
                                                                            Object objAwait = UtilsKt.await(jVarC, oVar);
                                                                            if (objAwait != coroutineSingletons2) {
                                                                                try {
                                                                                    try {
                                                                                        try {
                                                                                            pVar3 = pVar2;
                                                                                            obj = objAwait;
                                                                                            map2 = map;
                                                                                            longRef3 = r12;
                                                                                            m0Var = (m0) closeable;
                                                                                            zC = m0Var.c();
                                                                                            if (!zC) {
                                                                                                mc0.b bVar4 = mc0.d.f76206a;
                                                                                                bVar4.r(str14);
                                                                                                int i18 = m0Var.f95556d;
                                                                                                String str22 = m0Var.f95555c;
                                                                                                String strG1 = (p0Var == null || (strString = p0Var.string()) == null) ? null : r70.l.G1(100, strString);
                                                                                                bVar4.n("Failed API request: '" + i18 + " " + str22 + " [" + strG1 + "]' from " + h0VarB.f95509a, new Object[0]);
                                                                                                f fVar = new f(null, true, longRef2.f71862a);
                                                                                                CloseableKt.a(closeable, null);
                                                                                                return fVar;
                                                                                            }
                                                                                            if (p0Var == null) {
                                                                                                f fVar2 = new f(null, true, longRef2.f71862a);
                                                                                                CloseableKt.a(closeable, null);
                                                                                                return fVar2;
                                                                                            }
                                                                                            String strString2 = p0Var.string();
                                                                                            long j21 = longRef2.f71862a;
                                                                                            if (p0Var.contentLength() >= j11) {
                                                                                                try {
                                                                                                    j13 = j21;
                                                                                                    jContentLength = p0Var.contentLength();
                                                                                                } catch (Throwable th8) {
                                                                                                    th2 = th8;
                                                                                                    str2 = str14;
                                                                                                    throw th2;
                                                                                                }
                                                                                            } else {
                                                                                                j13 = j21;
                                                                                                jContentLength = 2 * strString2.length();
                                                                                            }
                                                                                            longRef2.f71862a = j13 + jContentLength;
                                                                                            JSONObject jSONObject6 = new JSONObject(strString2);
                                                                                            JSONArray jSONArray2 = jSONObject6.getJSONArray("items");
                                                                                            if (jSONArray2 == null) {
                                                                                                f fVar3 = new f(null, true, longRef2.f71862a);
                                                                                                CloseableKt.a(closeable, null);
                                                                                                return fVar3;
                                                                                            }
                                                                                            longRef112 = longRef2;
                                                                                            str2 = str14;
                                                                                            length = jSONArray2.length();
                                                                                            closeable62 = closeable;
                                                                                            arrayList3 = arrayList2;
                                                                                            i5 = 0;
                                                                                            jSONArray = jSONArray2;
                                                                                            jSONObject4 = jSONObject6;
                                                                                            pVar82 = pVar4;
                                                                                            map3 = map2;
                                                                                            if (i5 >= length) {
                                                                                            }
                                                                                        } catch (Throwable th9) {
                                                                                            th = th9;
                                                                                            str2 = str14;
                                                                                            r12 = longRef2;
                                                                                            str = str2;
                                                                                            th.printStackTrace();
                                                                                            mc0.b bVar22 = mc0.d.f76206a;
                                                                                            bVar22.r(str);
                                                                                            bVar22.n(c0.k("Error pulling recently played tracks from Spotify: ", th.getMessage()), new Object[0]);
                                                                                            return new f(null, true, r12.f71862a);
                                                                                        }
                                                                                        longRef4 = longRef;
                                                                                        objectRef2 = objectRef;
                                                                                        longRef2 = longRef3;
                                                                                    } catch (Throwable th10) {
                                                                                        th = th10;
                                                                                        r12 = longRef2;
                                                                                        str = str14;
                                                                                        th.printStackTrace();
                                                                                        mc0.b bVar222 = mc0.d.f76206a;
                                                                                        bVar222.r(str);
                                                                                        bVar222.n(c0.k("Error pulling recently played tracks from Spotify: ", th.getMessage()), new Object[0]);
                                                                                        return new f(null, true, r12.f71862a);
                                                                                    }
                                                                                    pVar4 = pVar3;
                                                                                    p0Var = m0Var.f95559g;
                                                                                } catch (Throwable th11) {
                                                                                    th = th11;
                                                                                    str2 = str14;
                                                                                    th2 = th;
                                                                                    throw th2;
                                                                                }
                                                                                closeable = (Closeable) obj;
                                                                            }
                                                                            return coroutineSingletons2;
                                                                        } catch (Throwable th12) {
                                                                            th = th12;
                                                                            str2 = str14;
                                                                        }
                                                                    } else {
                                                                        str2 = str14;
                                                                        try {
                                                                            pVar2.f83516g.invoke(new Long(longRef.f71862a));
                                                                            mc0.b bVar5 = mc0.d.f76206a;
                                                                            str = str2;
                                                                            try {
                                                                                bVar5.r(str);
                                                                                bVar5.b("Finished API requests to https://api.spotify.com/v1/me/player/recently-played: got " + arrayList2.size() + " ingest packets at " + r12.f71862a + " bytes", new Object[0]);
                                                                                return new f(arrayList2, false, r12.f71862a);
                                                                            } catch (Throwable th13) {
                                                                                th = th13;
                                                                            }
                                                                        } catch (Throwable th14) {
                                                                            th = th14;
                                                                        }
                                                                    }
                                                                } catch (Throwable th15) {
                                                                    th = th15;
                                                                    r12 = longRef12;
                                                                }
                                                            } catch (Throwable th16) {
                                                                longRef2 = longRef12;
                                                                th2 = th16;
                                                                closeable = closeable7;
                                                                throw th2;
                                                            }
                                                            str = str2;
                                                            th.printStackTrace();
                                                            mc0.b bVar2222 = mc0.d.f76206a;
                                                            bVar2222.r(str);
                                                            bVar2222.n(c0.k("Error pulling recently played tracks from Spotify: ", th.getMessage()), new Object[0]);
                                                            return new f(null, true, r12.f71862a);
                                                        }
                                                    } else if (map3.containsKey(string2)) {
                                                        str3 = str18;
                                                        str7 = str5;
                                                        coroutineSingletons = coroutineSingletons3;
                                                        j14 = j18;
                                                        pVar5 = pVar82;
                                                        str16 = str6;
                                                        Object obj6 = map3.get(string2);
                                                        Intrinsics.d(obj6);
                                                        int i19 = i5;
                                                        Long l9 = ((ExternalLink) obj6).f78383g;
                                                        if (l9 == null || l9.longValue() < epochMilli) {
                                                            Object obj7 = map3.get(string2);
                                                            Intrinsics.d(obj7);
                                                            o oVar4 = oVar;
                                                            ((ExternalLink) obj7).f78383g = new Long(epochMilli);
                                                            objectRef3 = objectRef2;
                                                            oVar = oVar4;
                                                            i5 = i19;
                                                            closeable5 = closeable2;
                                                            longRef6 = longRef5;
                                                        } else {
                                                            objectRef3 = objectRef2;
                                                            oVar = oVar;
                                                            i5 = i19;
                                                            closeable5 = closeable2;
                                                            longRef6 = longRef5;
                                                        }
                                                        j12 = j14;
                                                        hashSet.add(string2);
                                                        longRef2 = longRef6;
                                                        objectRef2 = objectRef3;
                                                        map3 = map3;
                                                        Unit unit222 = Unit.f71706a;
                                                        int i1722 = i5;
                                                        Ref.LongRef longRef1122 = longRef2;
                                                        String str1722 = str7;
                                                        Closeable closeable622 = closeable5;
                                                        length = i11;
                                                        str6 = str16;
                                                        str5 = str1722;
                                                        i5 = i1722 + 1;
                                                        p pVar822 = pVar5;
                                                        coroutineSingletons2 = coroutineSingletons;
                                                        map3 = map3;
                                                        if (i5 >= length) {
                                                        }
                                                    } else {
                                                        try {
                                                            try {
                                                                e0 e0Var = pVar822.f83514e;
                                                                str3 = str18;
                                                                i20.d dVar2 = pVar822.f61215d;
                                                                Intrinsics.d(dVar2);
                                                                b90.j jVarC2 = e0Var.c(m(string3, dVar2.a()));
                                                                oVar.f83505t = pVar822;
                                                                oVar.f83506u = arrayList3;
                                                                oVar.f83507v = map3;
                                                                oVar.f83508w = hashSet;
                                                                oVar.f83509x = longRef5;
                                                                oVar.f83510y = longRef4;
                                                                oVar.f83511z = objectRef2;
                                                                oVar.A = closeable2;
                                                                oVar.B = jSONObject4;
                                                                oVar.C = jSONArray;
                                                                oVar.D = string2;
                                                                j14 = j18;
                                                                oVar.E = j14;
                                                                oVar.G = i5;
                                                                pVar5 = pVar822;
                                                                oVar.H = i11;
                                                                oVar.F = epochMilli;
                                                                i11 = i11;
                                                                oVar.K = 2;
                                                                Object objAwait2 = UtilsKt.await(jVarC2, oVar);
                                                                coroutineSingletons2 = coroutineSingletons3;
                                                                if (objAwait2 != coroutineSingletons2) {
                                                                    closeable3 = closeable2;
                                                                    jSONObject2 = jSONObject4;
                                                                    obj3 = objAwait2;
                                                                    str8 = string2;
                                                                    longRef2 = longRef5;
                                                                    map3 = map3;
                                                                    closeable4 = (Closeable) obj3;
                                                                    m0 m0Var22 = (m0) closeable4;
                                                                    if (m0Var22.c()) {
                                                                    }
                                                                    i12 = i5;
                                                                    coroutineSingletons = coroutineSingletons2;
                                                                    objectRef3 = objectRef2;
                                                                }
                                                                return coroutineSingletons2;
                                                            } catch (Throwable th17) {
                                                                th = th17;
                                                                longRef5 = longRef5;
                                                                closeable2 = closeable2;
                                                                closeable = closeable2;
                                                                longRef2 = longRef5;
                                                                th2 = th;
                                                                throw th2;
                                                            }
                                                        } catch (Throwable th18) {
                                                            th = th18;
                                                            longRef5 = longRef5;
                                                        }
                                                    }
                                                } catch (Throwable th19) {
                                                    th = th19;
                                                }
                                            } else {
                                                str3 = str18;
                                                coroutineSingletons = coroutineSingletons3;
                                                pVar5 = pVar822;
                                                i1722 = i5;
                                                str16 = str6;
                                                str1722 = str5;
                                                o oVar5 = oVar;
                                                JSONObject jSONObject7 = jSONObject5.getJSONObject("track");
                                                String string4 = jSONObject7.getString("uri");
                                                if (map3.containsKey(string4)) {
                                                    Object obj8 = map3.get(string4);
                                                    Intrinsics.d(obj8);
                                                    Long l11 = ((ExternalLink) obj8).f78383g;
                                                    if (l11 == null || l11.longValue() < epochMilli) {
                                                        Object obj9 = map3.get(string4);
                                                        Intrinsics.d(obj9);
                                                        ((ExternalLink) obj9).f78383g = new Long(epochMilli);
                                                    }
                                                    Unit unit4 = Unit.f71706a;
                                                    j12 = j18;
                                                    oVar = oVar5;
                                                    closeable622 = closeable2;
                                                    longRef1122 = longRef5;
                                                } else {
                                                    String string5 = jSONObject7.getString(str1722);
                                                    String strZ2 = o7.a.z(jSONObject7.getJSONObject("album").getJSONArray(str16));
                                                    pVar5.getClass();
                                                    arrayList3.add(new ExternalLink(string4, string5, null, strZ2, n(string4), new Long(j18), new Long(epochMilli), Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE));
                                                    j12 = j18;
                                                    oVar = oVar5;
                                                    closeable622 = closeable2;
                                                    longRef1122 = longRef5;
                                                }
                                                length = i11;
                                                str6 = str16;
                                                str5 = str1722;
                                                i5 = i1722 + 1;
                                                p pVar8222 = pVar5;
                                                coroutineSingletons2 = coroutineSingletons;
                                                map3 = map3;
                                                if (i5 >= length) {
                                                }
                                            }
                                        } catch (Throwable th20) {
                                            th = th20;
                                        }
                                        closeable2 = closeable622;
                                        longRef2 = longRef1122;
                                    } catch (Throwable th21) {
                                        th = th21;
                                        closeable2 = closeable622;
                                        longRef5 = longRef1122;
                                    }
                                }
                            }
                            str9 = str6;
                            str7 = str5;
                            Unit unit5 = Unit.f71706a;
                            CloseableKt.a(closeable4, null);
                            JSONObject jSONObject42 = jSONObject2;
                            i5 = i12;
                            String str162 = str9;
                            closeable5 = closeable3;
                            longRef6 = longRef2;
                            String string22 = str8;
                            hashSet.add(string22);
                            Unit unit2222 = Unit.f71706a;
                            int i17222 = i5;
                            Ref.LongRef longRef11222 = longRef2;
                            String str17222 = str7;
                            Closeable closeable6222 = closeable5;
                            length = i11;
                            str6 = str162;
                            str5 = str17222;
                            i5 = i17222 + 1;
                            p pVar82222 = pVar5;
                            coroutineSingletons2 = coroutineSingletons;
                            map3 = map3;
                            if (i5 >= length) {
                            }
                        } catch (Throwable th22) {
                            th2 = th22;
                            longRef2 = longRef6;
                            closeable = closeable5;
                            throw th2;
                        }
                        j12 = j14;
                    } finally {
                    }
                    closeable4 = (Closeable) obj3;
                } catch (Throwable th23) {
                    th2 = th23;
                    closeable = closeable5;
                    throw th2;
                }
                longRef2 = longRef6;
                objectRef2 = objectRef3;
                map3 = map3;
            } catch (Throwable th24) {
                th2 = th24;
                closeable = closeable3;
                throw th2;
            }
        }
    }

    public static h0 m(String str, String str2) {
        g0 g0Var = new g0();
        g0Var.d();
        Intrinsics.g(str, "<this>");
        v vVar = new v();
        vVar.e(null, str);
        v vVarG = vVar.b().g();
        vVarG.g("limit", "50");
        g0Var.f95504a = vVarG.b();
        g0Var.a("Authorization", "Bearer " + str2);
        return g0Var.b();
    }

    public static String n(String str) {
        String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse(str)).setPackage("com.spotify.music"));
        Intrinsics.d(intentUri);
        return intentUri;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        r rVar = new r(7);
        rVar.t(f83512h);
        return le.c(activity, rVar.q());
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132019594);
    }

    @Override // s80.c
    public final String d() {
        return "com.spotify.music";
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new q(this, (Continuation) null, 10), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        l lVar;
        p pVar;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i11 = lVar.f83494w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                lVar.f83494w = i11 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, (ContinuationImpl) continuation);
            }
        }
        Object objJ = lVar.f83492u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = lVar.f83494w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                AuthorizationResponse authorizationResponseD = le.d(i5, intent);
                String strA = authorizationResponseD.A();
                if (strA != null && strA.length() != 0) {
                    lVar.f83491t = this;
                    lVar.f83494w = 1;
                    objJ = j(null, strA, "com.spotify.music", "disco://nova.branch.search.spotify/callback/oauth2", "https://sesame.ninja/app/auth/branch_exchange.php", lVar);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    pVar = this;
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("SSML-SpotifyIngester");
                bVar.n("ERROR: Spotify authorization request got response type='" + x8.h.j(authorizationResponseD.l()) + "':", new Object[0]);
                bVar.r("SSML-SpotifyIngester");
                bVar.n("    code=" + authorizationResponseD.A(), new Object[0]);
                bVar.r("SSML-SpotifyIngester");
                bVar.n("    accessToken=" + authorizationResponseD.b(), new Object[0]);
                bVar.r("SSML-SpotifyIngester");
                bVar.n("    expiresIn=" + authorizationResponseD.e(), new Object[0]);
                bVar.r("SSML-SpotifyIngester");
                bVar.n("    state=" + authorizationResponseD.i(), new Object[0]);
                bVar.r("SSML-SpotifyIngester");
                bVar.n("    error=" + authorizationResponseD.d(), new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            p pVar2 = lVar.f83491t;
            ResultKt.b(objJ);
            pVar = pVar2;
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            pVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("SSML-SpotifyIngester");
            bVar2.o(th2);
            return Boolean.FALSE;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0091, code lost:
    
        if (r13 == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(ContinuationImpl continuationImpl) {
        h hVar;
        p pVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f83479w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f83479w = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object objS = hVar.f83477u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f83479w;
        if (i11 == 0) {
            ResultKt.b(objS);
            hVar.f83476t = this;
            hVar.f83479w = 1;
            objS = s(hVar);
            if (objS != coroutineSingletons) {
                pVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
            List listA = ((f) objS).a();
            if (listA == null) {
                listA = EmptyList.f71733a;
            }
            int i12 = Result.f71687b;
            return listA;
        }
        pVar = hVar.f83476t;
        ResultKt.b(objS);
        Result result = (Result) objS;
        if (result != null) {
            return result.f71688a;
        }
        String string = Uri.parse("https://api.spotify.com/v1/me/playlists").buildUpon().build().toString();
        int i13 = Result.f71687b;
        g gVar = new g("playlist", string, new pu.e(4), new pu.e(5), new pu.e(6), new pu.e(7), new pu.e(8));
        hVar.f83476t = null;
        hVar.f83479w = 2;
        objS = pVar.t(gVar, hVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0095, code lost:
    
        if (r13 == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object p(ContinuationImpl continuationImpl) {
        i iVar;
        p pVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f83483w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f83483w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object objS = iVar.f83481u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f83483w;
        if (i11 == 0) {
            ResultKt.b(objS);
            iVar.f83480t = this;
            iVar.f83483w = 1;
            objS = s(iVar);
            if (objS != coroutineSingletons) {
                pVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
            List listA = ((f) objS).a();
            if (listA == null) {
                listA = EmptyList.f71733a;
            }
            int i12 = Result.f71687b;
            return listA;
        }
        pVar = iVar.f83480t;
        ResultKt.b(objS);
        Result result = (Result) objS;
        if (result != null) {
            return result.f71688a;
        }
        String string = Uri.parse("https://api.spotify.com/v1/me/player/queue").buildUpon().build().toString();
        int i13 = Result.f71687b;
        g gVar = new g("queue", string, new pu.e(14), new pu.e(15), new pu.e(16), new pu.e(17), new pu.e(13));
        iVar.f83480t = null;
        iVar.f83483w = 2;
        objS = pVar.t(gVar, iVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0095, code lost:
    
        if (r13 == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(ContinuationImpl continuationImpl) {
        j jVar;
        p pVar;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f83487w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f83487w = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object objS = jVar.f83485u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f83487w;
        if (i11 == 0) {
            ResultKt.b(objS);
            jVar.f83484t = this;
            jVar.f83487w = 1;
            objS = s(jVar);
            if (objS != coroutineSingletons) {
                pVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
            List listA = ((f) objS).a();
            if (listA == null) {
                listA = EmptyList.f71733a;
            }
            int i12 = Result.f71687b;
            return listA;
        }
        pVar = jVar.f83484t;
        ResultKt.b(objS);
        Result result = (Result) objS;
        if (result != null) {
            return result.f71688a;
        }
        String string = Uri.parse("https://api.spotify.com/v1/me/player/recently-played").buildUpon().build().toString();
        int i13 = Result.f71687b;
        g gVar = new g("recently_played", string, new pu.e(9), new pu.e(10), new pu.e(11), new pu.e(12), new pu.e(13));
        jVar.f83484t = null;
        jVar.f83487w = 2;
        objS = pVar.t(gVar, jVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(ContinuationImpl continuationImpl) {
        k kVar;
        p0 p0Var;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f83490v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f83490v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object objAwait = kVar.f83488t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f83490v;
        if (i11 == 0) {
            ResultKt.b(objAwait);
            i20.d dVar = this.f61215d;
            if (dVar == null) {
                return null;
            }
            b90.j jVarC = this.f83514e.c(m("https://api.spotify.com/v1/me/player/currently-playing", dVar.a()));
            kVar.f83490v = 1;
            objAwait = UtilsKt.await(jVarC, kVar);
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
            if (m0Var.c() && (p0Var = m0Var.f95559g) != null) {
                try {
                    JSONObject jSONObjectOptJSONObject = new JSONObject(p0Var.string()).getJSONObject("item").optJSONObject("external_urls");
                    if (jSONObjectOptJSONObject == null) {
                        jSONObjectOptJSONObject = new JSONObject();
                    }
                    String strOptString = jSONObjectOptJSONObject.optString("spotify");
                    if (strOptString.length() == 0) {
                        strOptString = null;
                    }
                    CloseableKt.a(closeable, null);
                    return strOptString;
                } catch (Exception unused) {
                }
            }
            CloseableKt.a(closeable, null);
            return null;
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable s(ContinuationImpl continuationImpl) {
        m mVar;
        Object objI;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f83497v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f83497v = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object obj = mVar.f83495t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f83497v;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.moloco.sdk.service_locator.b bVar = this.f83515f;
            try {
                int i12 = Result.f71687b;
                bVar.invoke();
            } catch (Throwable th2) {
                int i13 = Result.f71687b;
                ResultKt.a(th2);
            }
            mVar.f83497v = 1;
            objI = i20.g.i(this, "com.spotify.music", "disco://nova.branch.search.spotify/callback/oauth2", mVar);
            if (objI == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objI = ((Result) obj).f71688a;
        }
        int i14 = Result.f71687b;
        if (objI instanceof Result.Failure) {
            return new Result(ResultKt.a(new Exception("Token refreshing failed")));
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x007a A[Catch: all -> 0x0175, TryCatch #2 {all -> 0x0175, blocks: (B:31:0x010e, B:44:0x0171, B:50:0x0183, B:59:0x01c6, B:73:0x023f, B:26:0x0076, B:28:0x007a, B:79:0x0250, B:77:0x024c, B:78:0x024f, B:25:0x006e, B:32:0x0111, B:35:0x011c, B:37:0x0127, B:39:0x012d, B:43:0x0139, B:49:0x017a, B:52:0x0187, B:54:0x0199, B:56:0x01aa, B:58:0x01bd, B:61:0x01ca, B:63:0x01d1, B:70:0x022d, B:66:0x01e6, B:69:0x01f3, B:71:0x0234, B:55:0x01a0, B:75:0x024a), top: B:88:0x006e, inners: #1, #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x011c A[Catch: all -> 0x0134, TRY_ENTER, TryCatch #1 {all -> 0x0134, blocks: (B:32:0x0111, B:35:0x011c, B:37:0x0127, B:39:0x012d, B:43:0x0139, B:49:0x017a, B:52:0x0187, B:54:0x0199, B:56:0x01aa, B:58:0x01bd, B:61:0x01ca, B:63:0x01d1, B:70:0x022d, B:66:0x01e6, B:69:0x01f3, B:71:0x0234, B:55:0x01a0), top: B:87:0x0111, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0250 A[Catch: all -> 0x0175, TRY_LEAVE, TryCatch #2 {all -> 0x0175, blocks: (B:31:0x010e, B:44:0x0171, B:50:0x0183, B:59:0x01c6, B:73:0x023f, B:26:0x0076, B:28:0x007a, B:79:0x0250, B:77:0x024c, B:78:0x024f, B:25:0x006e, B:32:0x0111, B:35:0x011c, B:37:0x0127, B:39:0x012d, B:43:0x0139, B:49:0x017a, B:52:0x0187, B:54:0x0199, B:56:0x01aa, B:58:0x01bd, B:61:0x01ca, B:63:0x01d1, B:70:0x022d, B:66:0x01e6, B:69:0x01f3, B:71:0x0234, B:55:0x01a0, B:75:0x024a), top: B:88:0x006e, inners: #1, #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x010b -> B:31:0x010e). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(g gVar, ContinuationImpl continuationImpl) {
        n nVar;
        Ref.LongRef longRef;
        g gVar2;
        i20.d dVar;
        List list;
        Ref.ObjectRef objectRef;
        p pVar;
        long j11;
        long length;
        String str;
        JSONArray jSONArray;
        int i5;
        String strString;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i11 = nVar.C;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                nVar.C = i11 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objAwait = nVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = nVar.C;
        w wVar = null;
        if (i12 == 0) {
            ResultKt.b(objAwait);
            i20.d dVar2 = this.f61215d;
            if (dVar2 == null) {
                return new f(null, true, 0L);
            }
            longRef = new Ref.LongRef();
            try {
                ArrayList arrayList = new ArrayList();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                gVar2 = gVar;
                try {
                    objectRef2.f71863a = gVar2.f83470b;
                    dVar = dVar2;
                    list = arrayList;
                    objectRef = objectRef2;
                    pVar = this;
                    if (objectRef.f71863a != null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
                gVar2 = gVar;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0 h0VarB = nVar.f83504z;
            objectRef = nVar.f83503y;
            list = nVar.f83502x;
            longRef = nVar.f83501w;
            dVar = nVar.f83500v;
            g gVar3 = nVar.f83499u;
            pVar = nVar.f83498t;
            try {
                ResultKt.b(objAwait);
                gVar2 = gVar3;
                Closeable closeable = (Closeable) objAwait;
                try {
                    m0 m0Var = (m0) closeable;
                    boolean zC = m0Var.c();
                    p0 p0Var = m0Var.f95559g;
                    if (!zC) {
                        if (p0Var == null) {
                            f fVar = new f(null, true, longRef.f71862a);
                            CloseableKt.a(closeable, null);
                            return fVar;
                        }
                        String strString2 = p0Var.string();
                        n nVar2 = nVar;
                        long j12 = longRef.f71862a;
                        if (p0Var.contentLength() >= 0) {
                            length = p0Var.contentLength();
                            j11 = j12;
                        } else {
                            j11 = j12;
                            length = strString2.length() * 2;
                        }
                        longRef.f71862a = j11 + length;
                        JSONObject jSONObject = new JSONObject(strString2);
                        JSONArray jSONArray2 = (JSONArray) gVar2.f83471c.invoke(jSONObject);
                        if (jSONArray2 == null) {
                            f fVar2 = new f(null, true, longRef.f71862a);
                            CloseableKt.a(closeable, null);
                            return fVar2;
                        }
                        int length2 = jSONArray2.length();
                        int i13 = 0;
                        while (i13 < length2) {
                            JSONObject jSONObject2 = jSONArray2.getJSONObject(i13);
                            String str2 = (String) gVar2.f83472d.invoke(jSONObject2);
                            if (str2 == null || (str = (String) gVar2.f83473e.invoke(jSONObject2)) == null) {
                                jSONArray = jSONArray2;
                                i5 = length2;
                            } else {
                                String str3 = (String) gVar2.f83474f.invoke(jSONObject2);
                                jSONArray = jSONArray2;
                                i5 = length2;
                                String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse(str)).setPackage("com.spotify.music"));
                                Intrinsics.d(intentUri);
                                list.add(new ExternalLink(str, str2, null, str3, intentUri, null, null, 228));
                            }
                            i13++;
                            jSONArray2 = jSONArray;
                            length2 = i5;
                        }
                        objectRef.f71863a = gVar2.f83475g.invoke(jSONObject);
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        nVar = nVar2;
                        wVar = null;
                        if (objectRef.f71863a != null) {
                            mc0.b bVar = mc0.d.f76206a;
                            bVar.r("SSML-SpotifyIngester");
                            bVar.b("Finished API requests to " + gVar2.f83470b + ": got " + list.size() + " " + gVar2.f83469a + " ingest packets at " + longRef.f71862a + " bytes", new Object[0]);
                            return new f(list, false, longRef.f71862a);
                        }
                        g0 g0Var = new g0();
                        g0Var.d();
                        String str4 = (String) objectRef.f71863a;
                        Intrinsics.g(str4, "<this>");
                        v vVar = new v();
                        vVar.e(wVar, str4);
                        v vVarG = vVar.b().g();
                        vVarG.g("limit", "50");
                        g0Var.f95504a = vVarG.b();
                        g0Var.a("Authorization", "Bearer " + dVar.a());
                        h0VarB = g0Var.b();
                        objectRef.f71863a = null;
                        TrafficStats.setThreadStatsTag(-432531203);
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r("SSML-SpotifyIngester");
                        bVar2.b("Starting call to " + h0VarB.f95509a, new Object[0]);
                        b90.j jVarC = pVar.f83514e.c(h0VarB);
                        nVar.f83498t = pVar;
                        nVar.f83499u = gVar2;
                        nVar.f83500v = dVar;
                        nVar.f83501w = longRef;
                        nVar.f83502x = list;
                        nVar.f83503y = objectRef;
                        nVar.f83504z = h0VarB;
                        nVar.C = 1;
                        objAwait = UtilsKt.await(jVarC, nVar);
                        if (objAwait == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        Closeable closeable2 = (Closeable) objAwait;
                        m0 m0Var2 = (m0) closeable2;
                        boolean zC2 = m0Var2.c();
                        p0 p0Var2 = m0Var2.f95559g;
                        if (!zC2) {
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r("SSML-SpotifyIngester");
                            int i14 = m0Var2.f95556d;
                            String str5 = m0Var2.f95555c;
                            String strG1 = (p0Var2 == null || (strString = p0Var2.string()) == null) ? null : r70.l.G1(100, strString);
                            bVar3.n("Failed API request: '" + i14 + " " + str5 + " [" + strG1 + "]' from " + h0VarB.f95509a, new Object[0]);
                            f fVar3 = new f(null, true, longRef.f71862a);
                            CloseableKt.a(closeable2, null);
                            return fVar3;
                        }
                    }
                } finally {
                }
            } catch (Throwable th4) {
                th = th4;
                gVar2 = gVar3;
            }
        }
        mc0.b bVar4 = mc0.d.f76206a;
        bVar4.r("SSML-SpotifyIngester");
        bVar4.n(c0.m("Error pulling Spotify ", gVar2.f83469a, "s: ", th.getMessage()), new Object[0]);
        return new f(null, true, longRef.f71862a);
    }
}
