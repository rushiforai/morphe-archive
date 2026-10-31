package o20;

import android.net.Uri;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.ByteStreamsKt;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlin.sequences.SequencesKt;
import kotlin.text.Charsets;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import t70.t0;

/* loaded from: classes4.dex */
public final class l {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /* JADX WARN: Type inference failed for: r12v10, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r12v12, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r12v9, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r9v0, types: [o20.l] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, Continuation continuation) throws JSONException, IOException {
        g gVar;
        b6.b bVar;
        ?? arrayList;
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f79422w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f79422w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuation);
            }
        }
        g gVar2 = gVar;
        Object obj = gVar2.f79420u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar2.f79422w;
        if (i11 == 0) {
            ResultKt.b(obj);
            Integer num = new Integer(100);
            b6.b bVar2 = p20.a.f82008c;
            gVar2.f79419t = bVar2;
            gVar2.f79422w = 1;
            Object objB = b(str, "https://slack.com/api/users.conversations?pretty=1", str2, num, gVar2);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            obj = objB;
            bVar = bVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            bVar = gVar2.f79419t;
            ResultKt.b(obj);
        }
        JSONObject jSONObject = new JSONObject((String) obj);
        bVar.getClass();
        jSONObject.getBoolean("ok");
        if (jSONObject.has("channels")) {
            JSONArray jSONArray = jSONObject.getJSONArray("channels");
            IntRange intRange = new IntRange(0, jSONArray.length() - 1, 1);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(intRange, 10));
            IntProgressionIterator it = intRange.iterator();
            while (it.f71911c) {
                arrayList2.add(jSONArray.getJSONObject(it.nextInt()));
            }
            arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                JSONObject jSONObject2 = (JSONObject) it2.next();
                String strOptString = jSONObject2.optString("id");
                String string = jSONObject2.getString(PendingUpgradeStore.KEY_NAME);
                jSONObject2.optString("name_normalized");
                arrayList.add(new p20.b(strOptString, string, jSONObject2.has("topic") ? jSONObject2.getJSONObject("topic").optString("value") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        return new p20.a(arrayList, jSONObject.has("response_metadata") ? UtilsKt.optStringNull(jSONObject.getJSONObject("response_metadata"), "next_cursor") : null);
    }

    /* JADX WARN: Path cross not found for [B:40:0x00ef, B:31:0x00d5], limit reached: 73 */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x012d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x012e -> B:45:0x0130). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, String str3, Integer num, ContinuationImpl continuationImpl) throws IOException {
        h hVar;
        String str4;
        Integer num2;
        int i5;
        h hVar2;
        String str5;
        String str6;
        Throwable th2;
        long j11;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i11 = hVar.B;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                hVar.B = i11 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f79429z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = hVar.B;
        boolean z11 = true;
        if (i12 == 0) {
            ResultKt.b(obj);
            str4 = str3;
            num2 = num;
            i5 = 5;
            hVar2 = hVar;
            str5 = str;
            str6 = str2;
            i = i5 - 1;
            if (i5 > 0) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i13 = hVar.f79428y;
            InputStream inputStream = hVar.f79427x;
            Integer num3 = hVar.f79426w;
            String str7 = hVar.f79425v;
            String str8 = hVar.f79424u;
            String str9 = hVar.f79423t;
            try {
                ResultKt.b(obj);
                hVar2 = hVar;
                str6 = str8;
                int i14 = i13;
                str4 = str7;
                boolean z12 = true;
                str5 = str9;
                Unit unit = Unit.f71706a;
                CloseableKt.a(inputStream, null);
                num2 = num3;
                i5 = i14;
                z11 = z12;
                i14 = i5 - 1;
                if (i5 > 0) {
                    Uri.Builder builderBuildUpon = Uri.parse(str6).buildUpon();
                    if (str4 != null) {
                        builderBuildUpon.appendQueryParameter("cursor", str4);
                    }
                    if (num2 != null) {
                        builderBuildUpon.appendQueryParameter("limit", String.valueOf(num2.intValue()));
                    }
                    URLConnection uRLConnectionOpenConnection = new URL(builderBuildUpon.build().toString()).openConnection();
                    Intrinsics.e(uRLConnectionOpenConnection, "null cannot be cast to non-null type java.net.HttpURLConnection");
                    HttpURLConnection httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
                    httpURLConnection.setRequestMethod("GET");
                    httpURLConnection.setRequestProperty("Authorization", "Bearer " + str5);
                    httpURLConnection.setDoInput(z11);
                    if (httpURLConnection.getResponseCode() >= 400) {
                        InputStream errorStream = httpURLConnection.getErrorStream();
                        try {
                            String str10 = new String(ByteStreamsKt.b(errorStream), Charsets.f72000b);
                            List<String> list = httpURLConnection.getHeaderFields().get("Retry-After");
                            if (list != null) {
                                String str11 = list.size() > 0 ? list.get(0) : null;
                                j11 = str11 != null ? Long.parseLong(str11) : 5L;
                                mc0.b bVar = mc0.d.f76206a;
                                bVar.r("Slack-OAUTH");
                                bVar.o(new Throwable(str10 + " retry delay: " + j11));
                                hVar2.f79423t = str5;
                                hVar2.f79424u = str6;
                                hVar2.f79425v = str4;
                                hVar2.f79426w = num2;
                                hVar2.f79427x = errorStream;
                                hVar2.f79428y = i14;
                                z12 = true;
                                hVar2.B = 1;
                                if (t0.b(j11 * 1000, hVar2) != coroutineSingletons) {
                                    return coroutineSingletons;
                                }
                                num3 = num2;
                                inputStream = errorStream;
                                Unit unit2 = Unit.f71706a;
                                CloseableKt.a(inputStream, null);
                                num2 = num3;
                                i5 = i14;
                                z11 = z12;
                                i14 = i5 - 1;
                                if (i5 > 0) {
                                    throw new RuntimeException("SLACK-ERROR: Too many retry");
                                }
                            }
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r("Slack-OAUTH");
                            bVar2.o(new Throwable(str10 + " retry delay: " + j11));
                            hVar2.f79423t = str5;
                            hVar2.f79424u = str6;
                            hVar2.f79425v = str4;
                            hVar2.f79426w = num2;
                            hVar2.f79427x = errorStream;
                            hVar2.f79428y = i14;
                            z12 = true;
                            hVar2.B = 1;
                            if (t0.b(j11 * 1000, hVar2) != coroutineSingletons) {
                            }
                        } catch (Throwable th3) {
                            th2 = th3;
                            inputStream = errorStream;
                            try {
                                throw th2;
                            } catch (Throwable th4) {
                                CloseableKt.a(inputStream, th2);
                                throw th4;
                            }
                        }
                    } else {
                        InputStream inputStream2 = httpURLConnection.getInputStream();
                        try {
                            String str12 = new String(ByteStreamsKt.b(inputStream2), Charsets.f72000b);
                            inputStream2.close();
                            return str12;
                        } finally {
                        }
                    }
                }
            } catch (Throwable th5) {
                th2 = th5;
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ContinuationImpl continuationImpl) throws JSONException, IOException {
        i iVar;
        b6.e eVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f79433w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f79433w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        i iVar2 = iVar;
        Object obj = iVar2.f79431u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = iVar2.f79433w;
        if (i11 == 0) {
            ResultKt.b(obj);
            b6.e eVar2 = p20.h.f82025b;
            iVar2.f79430t = eVar2;
            iVar2.f79433w = 1;
            Object objB = b(str, "https://slack.com/api/team.info?pretty=1", null, null, iVar2);
            if (objB == obj2) {
                return obj2;
            }
            eVar = eVar2;
            obj = objB;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            eVar = iVar2.f79430t;
            ResultKt.b(obj);
        }
        JSONObject jSONObject = new JSONObject((String) obj);
        eVar.getClass();
        jSONObject.getBoolean("ok");
        JSONObject jSONObject2 = jSONObject.getJSONObject("team");
        String string = jSONObject2.getString("id");
        String string2 = jSONObject2.getString(PendingUpgradeStore.KEY_NAME);
        UtilsKt.optStringNull(jSONObject2, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        UtilsKt.optStringNull(jSONObject2, "domain");
        UtilsKt.optStringNull(jSONObject2, "email_domain");
        JSONObject jSONObject3 = jSONObject2.getJSONObject("icon");
        Map mapT0 = MapsKt.t0(SequencesKt.y0(SequencesKt.u0(SequencesKt.t0(q70.d.m0(jSONObject3.keys()), new iv.c(1, p20.e.f82014b, p20.d.class, "hasResolution", "hasResolution(Ljava/lang/String;)Z", 0, 22)), new nq.a(20)), new dr.c(jSONObject3, 1)));
        jSONObject3.optBoolean("image_default");
        return new p20.h(new mh.c(6, string, string2, new p20.e(mapT0)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /* JADX WARN: Type inference failed for: r0v10, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v5, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r10v0, types: [o20.l] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(String str, ContinuationImpl continuationImpl) throws JSONException, IOException {
        j jVar;
        br.a aVar;
        ?? arrayList;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f79437w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f79437w = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        j jVar2 = jVar;
        Object obj = jVar2.f79435u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar2.f79437w;
        if (i11 == 0) {
            ResultKt.b(obj);
            br.a aVar2 = p20.i.f82027b;
            jVar2.f79434t = aVar2;
            jVar2.f79437w = 1;
            Object objB = b(str, "https://slack.com/api/usergroups.list?pretty=1&include_users=true", null, null, jVar2);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            obj = objB;
            aVar = aVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = jVar2.f79434t;
            ResultKt.b(obj);
        }
        JSONObject jSONObject = new JSONObject((String) obj);
        aVar.getClass();
        jSONObject.getBoolean("ok");
        if (jSONObject.has("usergroups")) {
            JSONArray jSONArray = jSONObject.getJSONArray("usergroups");
            IntRange intRange = new IntRange(0, jSONArray.length() - 1, 1);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(intRange, 10));
            IntProgressionIterator it = intRange.iterator();
            while (it.f71911c) {
                arrayList2.add(jSONArray.getJSONObject(it.nextInt()));
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (((JSONObject) next).optInt("date_delete", 0) == 0) {
                    arrayList3.add(next);
                }
            }
            arrayList = new ArrayList(b70.c.u0(arrayList3, 10));
            Iterator it3 = arrayList3.iterator();
            while (it3.hasNext()) {
                JSONObject jSONObject2 = (JSONObject) it3.next();
                jSONObject2.getString("id");
                arrayList.add(new p20.g(jSONObject2.has("users") ? jSONObject2.getJSONArray("users").length() : jSONObject2.optInt("user_count", 0), jSONObject2.optString(PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), jSONObject2.optString("handle", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), jSONObject2.optString(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)));
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        return new p20.i(arrayList);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Type inference failed for: r1v11, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r1v8, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r1v9, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(String str, String str2, Continuation continuation) throws JSONException, IOException {
        k kVar;
        l lVar;
        br.c cVar;
        ?? arrayList;
        if (continuation instanceof k) {
            kVar = (k) continuation;
            int i5 = kVar.f79441w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f79441w = i5 - Integer.MIN_VALUE;
                lVar = this;
            } else {
                lVar = this;
                kVar = new k(lVar, continuation);
            }
        }
        k kVar2 = kVar;
        Object obj = kVar2.f79439u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar2.f79441w;
        if (i11 == 0) {
            ResultKt.b(obj);
            Integer num = new Integer(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE);
            br.c cVar2 = p20.j.f82029c;
            kVar2.f79438t = cVar2;
            kVar2.f79441w = 1;
            Object objB = lVar.b(str, "https://slack.com/api/users.list?pretty=1", str2, num, kVar2);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            cVar = cVar2;
            obj = objB;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = kVar2.f79438t;
            ResultKt.b(obj);
        }
        JSONObject jSONObject = new JSONObject((String) obj);
        cVar.getClass();
        jSONObject.getBoolean("ok");
        if (jSONObject.has("members")) {
            JSONArray jSONArray = jSONObject.getJSONArray("members");
            boolean z11 = false;
            IntRange intRange = new IntRange(0, jSONArray.length() - 1, 1);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(intRange, 10));
            IntProgressionIterator it = intRange.iterator();
            while (it.f71911c) {
                arrayList2.add(jSONArray.getJSONObject(it.nextInt()));
            }
            arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                JSONObject jSONObject2 = (JSONObject) it2.next();
                String string = jSONObject2.getString("id");
                jSONObject2.getString("team_id");
                String string2 = jSONObject2.getString(PendingUpgradeStore.KEY_NAME);
                boolean zOptBoolean = jSONObject2.optBoolean("deleted", z11);
                jSONObject2.optString("color");
                String strOptString = jSONObject2.optString("real_name");
                JSONObject jSONObject3 = jSONObject2.getJSONObject("profile");
                String strOptString2 = jSONObject3.optString("title");
                jSONObject3.optString("phone");
                jSONObject3.optString("skype");
                jSONObject3.getString("real_name");
                jSONObject3.getString("real_name_normalized");
                jSONObject3.getString("display_name");
                jSONObject3.getString("display_name_normalized");
                jSONObject3.optString("team");
                Map mapT0 = MapsKt.t0(SequencesKt.y0(SequencesKt.u0(SequencesKt.t0(q70.d.m0(jSONObject3.keys()), new iv.c(1, p20.e.f82014b, p20.d.class, "hasResolution", "hasResolution(Ljava/lang/String;)Z", 0, 22)), new nq.a(20)), new dr.c(jSONObject3, 1)));
                jSONObject3.optBoolean("image_default");
                arrayList.add(new p20.f(string, string2, zOptBoolean, strOptString, new og.i(5, strOptString2, new p20.e(mapT0))));
                z11 = false;
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        return new p20.j(arrayList, jSONObject.has("response_metadata") ? UtilsKt.optStringNull(jSONObject.getJSONObject("response_metadata"), "next_cursor") : null);
    }
}
