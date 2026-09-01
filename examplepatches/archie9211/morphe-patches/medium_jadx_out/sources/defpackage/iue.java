package defpackage;

import android.app.Activity;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import com.medium.android.common.ui.Ezz.Plbho;
import java.lang.ref.WeakReference;
import java.util.Set;
import java.util.TimerTask;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class iue extends TimerTask {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ iue(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        WeakReference weakReference;
        int i = this.a;
        Handler handler = null;
        boolean z = false;
        Object obj = this.b;
        switch (i) {
            case 0:
                jue jueVar = (jue) obj;
                try {
                    if (ec2.a.contains(jue.class)) {
                        weakReference = null;
                    } else {
                        try {
                            weakReference = jueVar.b;
                        } catch (Throwable th) {
                            ec2.a(jue.class, th);
                            weakReference = null;
                        }
                    }
                    Activity activity = (Activity) weakReference.get();
                    View viewE = r40.E(activity);
                    if (activity != null && viewE != null) {
                        String simpleName = activity.getClass().getSimpleName();
                        fq1 fq1Var = fq1.a;
                        if (!ec2.a.contains(fq1.class)) {
                            try {
                                z = fq1.g.get();
                            } catch (Throwable th2) {
                                ec2.a(fq1.class, th2);
                            }
                        }
                        if (z) {
                            FutureTask futureTask = new FutureTask(new wf3(viewE));
                            if (!ec2.a.contains(jue.class)) {
                                try {
                                    handler = jueVar.a;
                                } catch (Throwable th3) {
                                    ec2.a(jue.class, th3);
                                }
                            }
                            handler.post(futureTask);
                            String str = "";
                            try {
                                str = (String) futureTask.get(1L, TimeUnit.SECONDS);
                            } catch (Exception e) {
                                Log.e(jue.a(), "Failed to take screenshot.", e);
                            }
                            JSONObject jSONObject = new JSONObject();
                            try {
                                jSONObject.put("screenname", simpleName);
                                jSONObject.put(Plbho.rLKTmTZrhq, str);
                                JSONArray jSONArray = new JSONArray();
                                jSONArray.put(gue.d(viewE));
                                jSONObject.put("view", jSONArray);
                            } catch (JSONException unused) {
                                Log.e(jue.a(), "Failed to create JSONObject");
                            }
                            String string = jSONObject.toString();
                            string.getClass();
                            Set set = ec2.a;
                            if (!set.contains(jue.class)) {
                                try {
                                    if (!set.contains(jueVar)) {
                                        try {
                                            f94.c().execute(new fi2(string, 27, jueVar));
                                        } catch (Throwable th4) {
                                            ec2.a(jueVar, th4);
                                        }
                                    }
                                } catch (Throwable th5) {
                                    ec2.a(jue.class, th5);
                                    return;
                                }
                                break;
                            }
                            break;
                        }
                    }
                } catch (Exception e2) {
                    Log.e(jue.a(), "UI Component tree indexing failure!", e2);
                    return;
                }
                break;
            default:
                try {
                    tag tagVar = (tag) obj;
                    vx0.c0((k92) ((uz5) tagVar.c).f, null, null, new qu6(tagVar, 0, null, 4), 3);
                } catch (Exception unused2) {
                    return;
                }
                break;
        }
    }
}
