package defpackage;

import android.app.ProgressDialog;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.ImageView;
import com.facebook.FacebookException;
import com.facebook.FacebookGraphResponseException;
import com.pairip.VMRunner;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class k1f extends AsyncTask {
    public final String a;
    public final Bundle b;
    public Exception[] c = new Exception[0];
    public final /* synthetic */ n1f d;

    public k1f(n1f n1fVar, String str, Bundle bundle) {
        this.d = n1fVar;
        this.a = str;
        this.b = bundle;
    }

    /* JADX WARN: Type inference failed for: r9v1, types: [j1f] */
    public final String[] a(Void... voidArr) {
        if (!ec2.a.contains(this)) {
            try {
                voidArr.getClass();
                String[] stringArray = this.b.getStringArray("media");
                if (stringArray != null) {
                    final String[] strArr = new String[stringArray.length];
                    this.c = new Exception[stringArray.length];
                    final CountDownLatch countDownLatch = new CountDownLatch(stringArray.length);
                    ConcurrentLinkedQueue concurrentLinkedQueue = new ConcurrentLinkedQueue();
                    Date date = w3.l;
                    w3 w3VarR = wgf.r();
                    try {
                        int length = stringArray.length;
                        for (final int i = 0; i < length; i++) {
                            if (isCancelled()) {
                                Iterator it2 = concurrentLinkedQueue.iterator();
                                while (it2.hasNext()) {
                                    ((gf5) it2.next()).cancel(true);
                                }
                            } else {
                                Uri uri = Uri.parse(stringArray[i]);
                                if (epe.K(uri)) {
                                    strArr[i] = uri.toString();
                                    countDownLatch.countDown();
                                } else {
                                    ?? r9 = new bf5() { // from class: j1f
                                        @Override // defpackage.bf5
                                        public final void a(if5 if5Var) {
                                            b94 b94Var;
                                            String str;
                                            String[] strArr2 = strArr;
                                            int i2 = i;
                                            try {
                                                b94Var = if5Var.c;
                                                str = "Error staging photo.";
                                            } catch (Exception e) {
                                                this.c[i2] = e;
                                            }
                                            if (b94Var != null) {
                                                String strA = b94Var.a();
                                                if (strA != null) {
                                                    str = strA;
                                                }
                                                throw new FacebookGraphResponseException(if5Var, str);
                                            }
                                            JSONObject jSONObject = if5Var.b;
                                            if (jSONObject == null) {
                                                throw new FacebookException("Error staging photo.");
                                            }
                                            String strOptString = jSONObject.optString("uri");
                                            if (strOptString == null) {
                                                throw new FacebookException("Error staging photo.");
                                            }
                                            strArr2[i2] = strOptString;
                                            countDownLatch.countDown();
                                        }
                                    };
                                    uri.getClass();
                                    concurrentLinkedQueue.add(gp7.o(w3VarR, uri, r9).d());
                                }
                            }
                        }
                        countDownLatch.await();
                        return strArr;
                    } catch (Exception unused) {
                        Iterator it3 = concurrentLinkedQueue.iterator();
                        while (it3.hasNext()) {
                            ((gf5) it3.next()).cancel(true);
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final void b(String[] strArr) {
        Bundle bundle = this.b;
        n1f n1fVar = this.d;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            ProgressDialog progressDialog = n1fVar.e;
            if (progressDialog != null) {
                progressDialog.dismiss();
            }
            for (Exception exc : this.c) {
                if (exc != null) {
                    n1fVar.e(exc);
                    return;
                }
            }
            if (strArr == null) {
                n1fVar.e(new FacebookException("Failed to stage photos for web dialog"));
                return;
            }
            List listAsList = Arrays.asList(strArr);
            listAsList.getClass();
            if (listAsList.contains(null)) {
                n1fVar.e(new FacebookException("Failed to stage photos for web dialog"));
                return;
            }
            epe.R(bundle, new JSONArray((Collection) listAsList));
            n1fVar.a = epe.a(no7.t(), f94.d() + "/dialog/" + this.a, bundle).toString();
            ImageView imageView = n1fVar.f;
            if (imageView == null) {
                throw new IllegalStateException("Required value was null.");
            }
            n1fVar.f((imageView.getDrawable().getIntrinsicWidth() / 2) + 1);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return VMRunner.invoke("32JeK1DMuOrRElHG", new Object[]{this, objArr});
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            b((String[]) obj);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
