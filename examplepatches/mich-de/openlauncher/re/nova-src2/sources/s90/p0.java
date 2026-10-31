package s90;

import android.net.ConnectivityManager;
import android.net.Network;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.chromium.net.impl.NetworkExceptionImpl;

/* loaded from: classes5.dex */
public final /* synthetic */ class p0 implements b1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86996a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a1 f86997b;

    public /* synthetic */ p0(a1 a1Var, int i5) {
        this.f86996a = i5;
        this.f86997b = a1Var;
    }

    @Override // s90.b1
    /* renamed from: run */
    public final void mo109run() throws IOException {
        List list;
        switch (this.f86996a) {
            case 0:
                a1 a1Var = this.f86997b;
                x0 x0Var = a1Var.f86853a;
                if (a1Var.f86867q == null) {
                    return;
                }
                ArrayList arrayList = new ArrayList();
                String headerField = "http/1.1";
                int i5 = 0;
                while (true) {
                    String headerFieldKey = a1Var.f86867q.getHeaderFieldKey(i5);
                    if (headerFieldKey == null) {
                        int responseCode = a1Var.f86867q.getResponseCode();
                        g1 g1Var = new g1(new ArrayList(a1Var.f86857e), responseCode, a1Var.f86867q.getResponseMessage(), Collections.unmodifiableList(arrayList), headerField);
                        if (responseCode >= 300 && responseCode < 400 && (list = (List) g1Var.f86954g.getAsMap().get("location")) != null) {
                            a1Var.g(1, 2, new r0(0, a1Var, (String) list.get(0), g1Var));
                            return;
                        }
                        a1Var.o = g1Var;
                        a1Var.e();
                        if (responseCode >= 400) {
                            InputStream errorStream = a1Var.f86867q.getErrorStream();
                            a1Var.n = errorStream == null ? null : errorStream instanceof FileInputStream ? ((FileInputStream) errorStream).getChannel() : new g0(errorStream);
                            x0Var.getClass();
                            x0Var.b(new k30.e(x0Var, 21), "onResponseStarted");
                            return;
                        }
                        InputStream inputStream = a1Var.f86867q.getInputStream();
                        a1Var.n = inputStream instanceof FileInputStream ? ((FileInputStream) inputStream).getChannel() : new g0(inputStream);
                        x0Var.getClass();
                        x0Var.b(new k30.e(x0Var, 21), "onResponseStarted");
                        return;
                    }
                    if ("X-Android-Selected-Transport".equalsIgnoreCase(headerFieldKey)) {
                        headerField = a1Var.f86867q.getHeaderField(i5);
                    }
                    if (!headerFieldKey.startsWith("X-Android")) {
                        arrayList.add(new AbstractMap.SimpleEntry(headerFieldKey, a1Var.f86867q.getHeaderField(i5)));
                    }
                    i5++;
                }
            default:
                a1 a1Var2 = this.f86997b;
                if (a1Var2.f86858f.get() == 8) {
                    return;
                }
                URL url = new URL(a1Var2.f86865m);
                HttpURLConnection httpURLConnection = a1Var2.f86867q;
                Network network = null;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                    a1Var2.f86867q = null;
                }
                long j11 = a1Var2.f86872v;
                if (j11 == -1) {
                    a1Var2.f86867q = (HttpURLConnection) url.openConnection();
                } else {
                    Network[] allNetworks = ((ConnectivityManager) a1Var2.f86869s.f86966g.getSystemService("connectivity")).getAllNetworks();
                    int length = allNetworks.length;
                    int i11 = 0;
                    while (true) {
                        if (i11 < length) {
                            Network network2 = allNetworks[i11];
                            if (network2.getNetworkHandle() == j11) {
                                network = network2;
                            } else {
                                i11++;
                            }
                        }
                    }
                    if (network == null) {
                        throw new NetworkExceptionImpl();
                    }
                    a1Var2.f86867q = (HttpURLConnection) network.openConnection(url);
                }
                a1Var2.f86867q.setInstanceFollowRedirects(false);
                if (!a1Var2.f86856d.containsKey("User-Agent")) {
                    a1Var2.f86856d.put("User-Agent", a1Var2.f86855c);
                }
                for (Map.Entry entry : a1Var2.f86856d.entrySet()) {
                    a1Var2.f86867q.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
                a1Var2.f86867q.setRequestMethod(a1Var2.f86861i);
                q90.a aVar = a1Var2.f86862j;
                if (aVar != null) {
                    y0 y0Var = new y0(a1Var2, a1Var2.f86863k, a1Var2.f86854b, a1Var2.f86867q, aVar);
                    a1Var2.f86868r = y0Var;
                    y0Var.b(new k0(y0Var, a1Var2.f86857e.size() == 1, 0), "start");
                    return;
                } else {
                    a1Var2.f86864l = 10;
                    a1Var2.f86867q.connect();
                    a1Var2.f86864l = 13;
                    a1Var2.d("fireGetHeaders", new o0(a1Var2, new p0(a1Var2, 0), 2));
                    return;
                }
        }
    }
}
