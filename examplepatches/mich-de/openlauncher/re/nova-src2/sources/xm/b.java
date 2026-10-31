package xm;

import com.google.android.gms.internal.consent_sdk.z;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96094a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f96095b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ z f96096c;

    public b(z zVar, int i5, long j11) {
        this.f96096c = zVar;
        this.f96094a = i5;
        this.f96095b = j11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        final z zVar = this.f96096c;
        int i5 = this.f96094a;
        final long j11 = this.f96095b;
        synchronized (zVar) {
            final int i11 = i5 - 1;
            final Task taskC = ((i) zVar.f32328c).c(3 - i11);
            final Task taskB = ((c) zVar.f32329d).b();
            Tasks.f(taskC, taskB).k((ScheduledExecutorService) zVar.f32331f, new fi.c() { // from class: xm.a
                @Override // fi.c
                public final Object then(Task task) throws JSONException {
                    Boolean boolValueOf;
                    z zVar2 = zVar;
                    Task task2 = taskC;
                    Task task3 = taskB;
                    long j12 = j11;
                    int i12 = i11;
                    if (!task2.q()) {
                        return Tasks.c(new FirebaseRemoteConfigClientException("Failed to auto-fetch config update.", task2.l()));
                    }
                    if (!task3.q()) {
                        return Tasks.c(new FirebaseRemoteConfigClientException("Failed to get activated config for auto-fetch", task3.l()));
                    }
                    h hVar = (h) task2.m();
                    e eVarA = (e) task3.m();
                    e eVar = hVar.f96125b;
                    if (eVar != null) {
                        boolValueOf = Boolean.valueOf(eVar.f96114f >= j12);
                    } else {
                        boolValueOf = Boolean.valueOf(hVar.f96124a == 1);
                    }
                    Object obj = null;
                    if (!boolValueOf.booleanValue()) {
                        zVar2.b(i12, j12);
                        return Tasks.d(null);
                    }
                    if (hVar.f96125b == null) {
                        return Tasks.d(null);
                    }
                    if (eVarA == null) {
                        eVarA = e.d().a();
                    }
                    e eVar2 = hVar.f96125b;
                    JSONObject jSONObject = eVarA.f96113e;
                    JSONObject jSONObject2 = eVar2.f96109a;
                    JSONObject jSONObject3 = eVar2.f96110b;
                    JSONObject jSONObject4 = eVar2.f96113e;
                    JSONObject jSONObject5 = e.a(new JSONObject(jSONObject2.toString())).f96110b;
                    HashMap mapC = eVarA.c();
                    HashMap mapC2 = eVar2.c();
                    HashMap mapB = eVarA.b();
                    HashMap mapB2 = eVar2.b();
                    HashSet hashSet = new HashSet();
                    JSONObject jSONObject6 = eVarA.f96110b;
                    Iterator<String> itKeys = jSONObject6.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        if (jSONObject3.has(next)) {
                            Object obj2 = obj;
                            if (!jSONObject6.get(next).equals(jSONObject3.get(next))) {
                                hashSet.add(next);
                            } else if ((jSONObject.has(next) && !jSONObject4.has(next)) || (!jSONObject.has(next) && jSONObject4.has(next))) {
                                hashSet.add(next);
                            } else if ((jSONObject.has(next) && jSONObject4.has(next) && !jSONObject.getJSONObject(next).toString().equals(jSONObject4.getJSONObject(next).toString())) || mapC.containsKey(next) != mapC2.containsKey(next)) {
                                hashSet.add(next);
                            } else if ((mapC.containsKey(next) && mapC2.containsKey(next) && !((Map) mapC.get(next)).equals(mapC2.get(next))) || mapB.containsKey(next) != mapB2.containsKey(next)) {
                                hashSet.add(next);
                            } else if (mapB2.containsKey(next) && mapB.containsKey(next) && !((JSONObject) mapB2.get(next)).toString().equals(((JSONObject) mapB.get(next)).toString())) {
                                hashSet.add(next);
                            } else {
                                jSONObject5.remove(next);
                            }
                            obj = obj2;
                        } else {
                            hashSet.add(next);
                        }
                    }
                    Object obj3 = obj;
                    Iterator<String> itKeys2 = jSONObject5.keys();
                    while (itKeys2.hasNext()) {
                        hashSet.add(itKeys2.next());
                    }
                    if (hashSet.isEmpty()) {
                        return Tasks.d(obj3);
                    }
                    synchronized (zVar2) {
                        Iterator it = ((LinkedHashSet) zVar2.f32326a).iterator();
                        while (it.hasNext()) {
                            ((k) it.next()).getClass();
                        }
                    }
                    return Tasks.d(obj3);
                }
            });
        }
    }
}
