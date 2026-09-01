package defpackage;

import android.util.Base64OutputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.zip.GZIPOutputStream;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ez2 implements Callable {
    public final /* synthetic */ int a;
    public final /* synthetic */ fz2 b;

    public /* synthetic */ ez2(fz2 fz2Var, int i) {
        this.a = i;
        this.b = fz2Var;
    }

    private final Object a() {
        String string;
        fz2 fz2Var = this.b;
        synchronized (fz2Var) {
            try {
                dj5 dj5Var = (dj5) fz2Var.a.get();
                ArrayList arrayListC = dj5Var.c();
                dj5Var.b();
                JSONArray jSONArray = new JSONArray();
                for (int i = 0; i < arrayListC.size(); i++) {
                    nj0 nj0Var = (nj0) arrayListC.get(i);
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("agent", nj0Var.a);
                    jSONObject.put("dates", new JSONArray((Collection) nj0Var.b));
                    jSONArray.put(jSONObject);
                }
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("heartbeats", jSONArray);
                jSONObject2.put("version", "2");
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                Base64OutputStream base64OutputStream = new Base64OutputStream(byteArrayOutputStream, 11);
                try {
                    GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(base64OutputStream);
                    try {
                        gZIPOutputStream.write(jSONObject2.toString().getBytes("UTF-8"));
                        gZIPOutputStream.close();
                        base64OutputStream.close();
                        string = byteArrayOutputStream.toString("UTF-8");
                    } finally {
                    }
                } finally {
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return string;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.a) {
            case 0:
                return a();
            default:
                fz2 fz2Var = this.b;
                synchronized (fz2Var) {
                    ((dj5) fz2Var.a.get()).k(System.currentTimeMillis(), ((e33) fz2Var.c.get()).a());
                    break;
                }
                return null;
        }
    }
}
