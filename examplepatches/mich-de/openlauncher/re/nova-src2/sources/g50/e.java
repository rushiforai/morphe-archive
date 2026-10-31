package g50;

import ab.e0;
import e10.j2;
import f50.k;
import f50.l;
import h50.g1;
import h50.h1;
import h50.l1;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.net.ssl.HttpsURLConnection;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import o50.f0;
import o50.n;
import o50.o;
import o50.p;
import o50.s;
import o50.t;
import s50.i;

/* loaded from: classes.dex */
public final class e extends f50.f {

    /* renamed from: d, reason: collision with root package name */
    public final g f57183d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f57184e = kotlin.collections.c.f1(new f50.g[]{g1.f59194a, j50.a.f69064a});

    public e(g gVar) {
        this.f57183d = gVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x02d2 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:111:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(k50.d dVar, ContinuationImpl continuationImpl) {
        c cVar;
        k50.d dVar2;
        Object obj;
        r50.c cVar2;
        CoroutineContext coroutineContext;
        Long lA;
        HttpURLConnection httpURLConnection;
        String strD;
        String strD2;
        CoroutineSingletons coroutineSingletons;
        CoroutineContext coroutineContext2;
        k50.d dVar3;
        v50.d dVar4;
        r50.c cVar3;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.A = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj2 = cVar.f57179y;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i11 = cVar.A;
        if (i11 == 0) {
            ResultKt.b(obj2);
            dVar2 = dVar;
            cVar.f57174t = dVar2;
            cVar.A = 1;
            Set set = l.f54332a;
            CoroutineContext.Element element = cVar.getContext().get(k.f54330b);
            Intrinsics.d(element);
            obj = ((k) element).f54331a;
            if (obj == coroutineSingletons2) {
                return coroutineSingletons2;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                    return obj2;
                }
                HttpURLConnection httpURLConnection2 = cVar.f57178x;
                cVar3 = cVar.f57177w;
                dVar4 = cVar.f57176v;
                coroutineContext2 = cVar.f57175u;
                dVar3 = cVar.f57174t;
                ResultKt.b(obj2);
                httpURLConnection = httpURLConnection2;
                coroutineSingletons = coroutineSingletons2;
                cVar2 = cVar3;
                dVar2 = dVar3;
                b bVar = new b(coroutineContext2, dVar2, cVar2, dVar4);
                cVar.f57174t = null;
                cVar.f57175u = null;
                cVar.f57176v = null;
                cVar.f57177w = null;
                cVar.f57178x = null;
                cVar.A = 3;
                Object objX = e0.X(httpURLConnection, dVar2, bVar, cVar);
                return objX == coroutineSingletons ? coroutineSingletons : objX;
            }
            k50.d dVar5 = cVar.f57174t;
            ResultKt.b(obj2);
            obj = obj2;
            dVar2 = dVar5;
        }
        CoroutineContext coroutineContext3 = (CoroutineContext) obj;
        v50.d dVarA = v50.a.a(null);
        f0 f0Var = dVar2.f71123a;
        o oVar = dVar2.f71125c;
        cVar2 = dVar2.f71126d;
        s sVar = dVar2.f71124b;
        String str = f0Var.f79561f;
        List list = p.f79582a;
        String strD3 = oVar.d("Content-Length");
        if (strD3 != null) {
            coroutineContext = coroutineContext3;
            lA = new Long(Long.parseLong(strD3));
        } else {
            coroutineContext = coroutineContext3;
            lA = cVar2.a();
        }
        URL url = new URL(str);
        g gVar = this.f57183d;
        gVar.getClass();
        URLConnection uRLConnectionOpenConnection = url.openConnection();
        Intrinsics.f(uRLConnectionOpenConnection, "openConnection(...)");
        httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
        httpURLConnection.setConnectTimeout(100000);
        httpURLConnection.setReadTimeout(100000);
        Map map = (Map) dVar2.f71128f.d(f50.h.f54327a);
        h1 h1Var = (h1) (map != null ? map.get(g1.f59194a) : null);
        if (h1Var != null) {
            Long l9 = h1Var.f59204b;
            if (l9 != null) {
                httpURLConnection.setConnectTimeout(l1.a(l9.longValue()));
            }
            Long l11 = h1Var.f59205c;
            if (l11 != null) {
                httpURLConnection.setReadTimeout(l1.a(l11.longValue()));
            }
            Long l12 = h1Var.f59203a;
            if (l12 != null) {
                long jLongValue = l12.longValue();
                if (jLongValue != Long.MAX_VALUE && (httpURLConnection.getConnectTimeout() == 0 || httpURLConnection.getConnectTimeout() > jLongValue)) {
                    httpURLConnection.setConnectTimeout(l1.a(jLongValue));
                }
            }
        }
        if (httpURLConnection instanceof HttpsURLConnection) {
            gVar.f57188a.invoke(httpURLConnection);
        }
        httpURLConnection.setRequestMethod(sVar.f79588a);
        httpURLConnection.setUseCaches(false);
        httpURLConnection.setInstanceFollowRedirects(false);
        Set set2 = t.f79589a;
        Set set3 = t.f79589a;
        d dVar6 = new d(set3.contains(sVar) && (cVar2 instanceof m50.b), httpURLConnection);
        Set set4 = l.f54332a;
        n nVar = new n();
        nVar.e(oVar);
        cVar2.c();
        nVar.e(o50.f.f79555c);
        Unit unit = Unit.f71706a;
        Map values = nVar.f86691a;
        Intrinsics.g(values, "values");
        s50.b bVar2 = new s50.b();
        Iterator it = values.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String str2 = (String) entry.getKey();
            Iterator it2 = it;
            List list2 = (List) entry.getValue();
            Long l13 = lA;
            int size = list2.size();
            CoroutineSingletons coroutineSingletons3 = coroutineSingletons2;
            ArrayList arrayList = new ArrayList(size);
            v50.d dVar7 = dVarA;
            for (int i12 = 0; i12 < size; i12++) {
                arrayList.add((String) list2.get(i12));
            }
            bVar2.put(str2, arrayList);
            lA = l13;
            it = it2;
            coroutineSingletons2 = coroutineSingletons3;
            dVarA = dVar7;
        }
        CoroutineSingletons coroutineSingletons4 = coroutineSingletons2;
        v50.d dVar8 = dVarA;
        Long l14 = lA;
        j2 j2Var = new j2(dVar6, 1);
        for (Map.Entry entry2 : bVar2.entrySet()) {
            j2Var.invoke((String) entry2.getKey(), (List) entry2.getValue());
        }
        if (oVar.d("User-Agent") == null) {
            cVar2.c();
            int i13 = i.f86690a;
            dVar6.invoke("User-Agent", "ktor-client");
        }
        o50.e eVarB = cVar2.b();
        if (eVarB == null || (strD = eVarB.toString()) == null) {
            cVar2.c();
            strD = oVar.d("Content-Type");
        }
        Long lA2 = cVar2.a();
        if (lA2 == null || (strD2 = lA2.toString()) == null) {
            cVar2.c();
            strD2 = oVar.d("Content-Length");
        }
        if (strD != null) {
            dVar6.invoke("Content-Type", strD);
        }
        if (strD2 != null) {
            dVar6.invoke("Content-Length", strD2);
        }
        gVar.f57189b.invoke(httpURLConnection);
        if (!set3.contains(sVar)) {
            if (l14 == null && httpURLConnection.getRequestProperty("Transfer-Encoding") == null) {
                httpURLConnection.addRequestProperty("Transfer-Encoding", "chunked");
            }
            if (l14 != null) {
                httpURLConnection.setFixedLengthStreamingMode(l14.longValue());
            } else {
                httpURLConnection.setChunkedStreamingMode(0);
            }
            httpURLConnection.setDoOutput(true);
            OutputStream outputStream = httpURLConnection.getOutputStream();
            Intrinsics.f(outputStream, "getOutputStream(...)");
            cVar.f57174t = dVar2;
            cVar.f57175u = coroutineContext;
            cVar.f57176v = dVar8;
            cVar.f57177w = cVar2;
            cVar.f57178x = httpURLConnection;
            cVar.A = 2;
            coroutineSingletons = coroutineSingletons4;
            if (x7.f.a0(cVar2, outputStream, cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            coroutineContext2 = coroutineContext;
            dVar3 = dVar2;
            dVar4 = dVar8;
            cVar3 = cVar2;
            cVar2 = cVar3;
            dVar2 = dVar3;
            b bVar3 = new b(coroutineContext2, dVar2, cVar2, dVar4);
            cVar.f57174t = null;
            cVar.f57175u = null;
            cVar.f57176v = null;
            cVar.f57177w = null;
            cVar.f57178x = null;
            cVar.A = 3;
            Object objX2 = e0.X(httpURLConnection, dVar2, bVar3, cVar);
            if (objX2 == coroutineSingletons) {
            }
        } else {
            if (!(cVar2 instanceof m50.b)) {
                throw new IllegalStateException(("Request of type " + sVar + " couldn't send a body with the [Android] engine.").toString());
            }
            coroutineContext2 = coroutineContext;
            coroutineSingletons = coroutineSingletons4;
            dVar4 = dVar8;
            b bVar32 = new b(coroutineContext2, dVar2, cVar2, dVar4);
            cVar.f57174t = null;
            cVar.f57175u = null;
            cVar.f57176v = null;
            cVar.f57177w = null;
            cVar.f57178x = null;
            cVar.A = 3;
            Object objX22 = e0.X(httpURLConnection, dVar2, bVar32, cVar);
            if (objX22 == coroutineSingletons) {
            }
        }
    }
}
