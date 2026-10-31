package xm;

import android.text.format.DateUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigFetchThrottledException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigServerException;
import com.google.firebase.remoteconfig.internal.ConfigFetchHttpClient;
import fi.t;
import java.net.HttpURLConnection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: i, reason: collision with root package name */
    public static final long f96127i = TimeUnit.HOURS.toSeconds(12);

    /* renamed from: j, reason: collision with root package name */
    public static final int[] f96128j = {2, 4, 8, 16, 32, 64, 128, 256};

    /* renamed from: a, reason: collision with root package name */
    public final om.e f96129a;

    /* renamed from: b, reason: collision with root package name */
    public final nm.c f96130b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f96131c;

    /* renamed from: d, reason: collision with root package name */
    public final Random f96132d;

    /* renamed from: e, reason: collision with root package name */
    public final c f96133e;

    /* renamed from: f, reason: collision with root package name */
    public final ConfigFetchHttpClient f96134f;

    /* renamed from: g, reason: collision with root package name */
    public final n f96135g;

    /* renamed from: h, reason: collision with root package name */
    public final Map f96136h;

    public i(om.e eVar, nm.c cVar, Executor executor, Random random, c cVar2, ConfigFetchHttpClient configFetchHttpClient, n nVar, HashMap map) {
        this.f96129a = eVar;
        this.f96130b = cVar;
        this.f96131c = executor;
        this.f96132d = random;
        this.f96133e = cVar2;
        this.f96134f = configFetchHttpClient;
        this.f96135g = nVar;
        this.f96136h = map;
    }

    public final h a(String str, String str2, Date date, HashMap map) throws FirebaseRemoteConfigException {
        String str3;
        ConfigFetchHttpClient configFetchHttpClient = this.f96134f;
        n nVar = this.f96135g;
        try {
            HttpURLConnection httpURLConnectionB = configFetchHttpClient.b();
            HashMap mapD = d();
            String strD = nVar.d();
            yl.d dVar = (yl.d) this.f96130b.get();
            h hVarFetch = configFetchHttpClient.fetch(httpURLConnectionB, str, str2, mapD, strD, map, dVar != null ? (Long) ((yl.e) dVar).f97388a.getUserProperties(null, null, true).get("_fot") : null, date, nVar.b());
            if (hVarFetch.d() != null) {
                nVar.m(hVarFetch.d().f96114f);
            }
            if (hVarFetch.e() != null) {
                nVar.l(hVarFetch.e());
            }
            nVar.i();
            return hVarFetch;
        } catch (FirebaseRemoteConfigServerException e3) {
            int i5 = e3.f34768a;
            if (i5 == 429 || i5 == 502 || i5 == 503 || i5 == 504) {
                int iB = nVar.a().b() + 1;
                TimeUnit timeUnit = TimeUnit.MINUTES;
                int[] iArr = f96128j;
                nVar.j(iB, new Date(date.getTime() + (timeUnit.toMillis(iArr[Math.min(iB, iArr.length) - 1]) / 2) + this.f96132d.nextInt((int) r2)));
            }
            m mVarA = nVar.a();
            if (mVarA.b() > 1 || i5 == 429) {
                mVarA.a().getTime();
                throw new FirebaseRemoteConfigFetchThrottledException("Fetch was throttled.");
            }
            if (i5 == 401) {
                str3 = "The request did not have the required credentials. Please make sure your google-services.json is valid.";
            } else if (i5 == 403) {
                str3 = "The user is not authorized to access the project. Please make sure you are using the API key that corresponds to your Firebase project.";
            } else {
                if (i5 == 429) {
                    throw new FirebaseRemoteConfigClientException("The throttled response from the server was not handled correctly by the FRC SDK.");
                }
                if (i5 != 500) {
                    switch (i5) {
                        case PglCryptUtils.INPUT_INVALID /* 502 */:
                        case PglCryptUtils.COMPRESS_FAILED /* 503 */:
                        case PglCryptUtils.BASE64_FAILED /* 504 */:
                            str3 = "The server is unavailable. Please try again later.";
                            break;
                        default:
                            str3 = "The server returned an unexpected error.";
                            break;
                    }
                } else {
                    str3 = "There was an internal server error.";
                }
            }
            throw new FirebaseRemoteConfigServerException(i5, "Fetch failed: ".concat(str3), e3);
        }
    }

    public final Task b(Task task, long j11, final HashMap map) {
        Task taskK;
        final Date date = new Date(System.currentTimeMillis());
        boolean zQ = task.q();
        n nVar = this.f96135g;
        if (zQ) {
            Date dateE = nVar.e();
            if (dateE.equals(n.f96164e) ? false : date.before(new Date(TimeUnit.SECONDS.toMillis(j11) + dateE.getTime()))) {
                return Tasks.d(h.c());
            }
        }
        Date dateA = nVar.a().a();
        if (!date.before(dateA)) {
            dateA = null;
        }
        Executor executor = this.f96131c;
        if (dateA != null) {
            String str = "Fetch is throttled. Please wait before calling fetch again: " + DateUtils.formatElapsedTime(TimeUnit.MILLISECONDS.toSeconds(dateA.getTime() - date.getTime()));
            dateA.getTime();
            taskK = Tasks.c(new FirebaseRemoteConfigFetchThrottledException(str));
        } else {
            om.d dVar = (om.d) this.f96129a;
            final t tVarC = dVar.c();
            final t tVarE = dVar.e();
            taskK = Tasks.f(tVarC, tVarE).k(executor, new fi.c() { // from class: xm.g
                @Override // fi.c
                public final Object then(Task task2) {
                    i iVar = this.f96119a;
                    Date date2 = date;
                    HashMap map2 = map;
                    Task task3 = tVarC;
                    if (!task3.q()) {
                        return Tasks.c(new FirebaseRemoteConfigClientException("Firebase Installations failed to get installation ID for fetch.", task3.l()));
                    }
                    Task task4 = tVarE;
                    if (!task4.q()) {
                        return Tasks.c(new FirebaseRemoteConfigClientException("Firebase Installations failed to get installation auth token for fetch.", task4.l()));
                    }
                    try {
                        h hVarA = iVar.a((String) task3.m(), ((om.b) task4.m()).b(), date2, map2);
                        return hVarA.f() != 0 ? Tasks.d(hVarA) : iVar.f96133e.d(hVarA.d()).s(iVar.f96131c, new wm.b(hVarA, 5));
                    } catch (FirebaseRemoteConfigException e3) {
                        return Tasks.c(e3);
                    }
                }
            });
        }
        return taskK.k(executor, new bm.o(5, this, date));
    }

    public final Task c(int i5) {
        HashMap map = new HashMap(this.f96136h);
        map.put("X-Firebase-RC-Fetch-Type", x8.h.b(2) + "/" + i5);
        return this.f96133e.b().k(this.f96131c, new q10.d(11, this, map));
    }

    public final HashMap d() {
        HashMap map = new HashMap();
        yl.d dVar = (yl.d) this.f96130b.get();
        if (dVar != null) {
            for (Map.Entry<String, Object> entry : ((yl.e) dVar).f97388a.getUserProperties(null, null, false).entrySet()) {
                map.put(entry.getKey(), entry.getValue().toString());
            }
        }
        return map;
    }
}
