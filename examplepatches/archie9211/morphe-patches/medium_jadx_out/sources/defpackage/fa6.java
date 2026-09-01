package defpackage;

import android.net.ConnectivityManager;
import android.net.Network;
import j$.util.DesugarCollections;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.chromium.net.impl.NetworkExceptionImpl;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class fa6 implements oa6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ na6 b;

    public /* synthetic */ fa6(na6 na6Var, int i) {
        this.a = i;
        this.b = na6Var;
    }

    @Override // defpackage.oa6
    public final void run() throws IOException {
        List list;
        Network network;
        HttpURLConnection httpURLConnection;
        int i = 0;
        switch (this.a) {
            case 0:
                na6 na6Var = this.b;
                n0c n0cVar = na6Var.r;
                if (na6Var.F == null) {
                    return;
                }
                ArrayList arrayList = new ArrayList();
                String headerField = "http/1.1";
                int i2 = 0;
                while (true) {
                    String headerFieldKey = na6Var.F.getHeaderFieldKey(i2);
                    if (headerFieldKey == null) {
                        int responseCode = na6Var.F.getResponseCode();
                        i7e i7eVar = new i7e(new ArrayList(na6Var.v), responseCode, na6Var.F.getResponseMessage(), DesugarCollections.unmodifiableList(arrayList), headerField);
                        if (responseCode >= 300 && responseCode < 400 && (list = (List) i7eVar.L().get("location")) != null) {
                            na6Var.j0(1, 2, new ss(na6Var, (String) list.get(0), i7eVar, 13));
                            return;
                        }
                        na6Var.D = i7eVar;
                        na6Var.g0();
                        HttpURLConnection httpURLConnection2 = na6Var.F;
                        int i3 = 25;
                        if (responseCode >= 400) {
                            InputStream errorStream = httpURLConnection2.getErrorStream();
                            na6Var.C = errorStream != null ? errorStream instanceof FileInputStream ? ((FileInputStream) errorStream).getChannel() : new x26(errorStream) : null;
                            n0cVar.getClass();
                            n0cVar.A(new f70(i3, n0cVar), "onResponseStarted");
                            return;
                        }
                        InputStream inputStream = httpURLConnection2.getInputStream();
                        na6Var.C = inputStream instanceof FileInputStream ? ((FileInputStream) inputStream).getChannel() : new x26(inputStream);
                        n0cVar.getClass();
                        n0cVar.A(new f70(i3, n0cVar), "onResponseStarted");
                        return;
                    }
                    if ("X-Android-Selected-Transport".equalsIgnoreCase(headerFieldKey)) {
                        headerField = na6Var.F.getHeaderField(i2);
                    }
                    if (!headerFieldKey.startsWith("X-Android")) {
                        arrayList.add(new AbstractMap.SimpleEntry(headerFieldKey, na6Var.F.getHeaderField(i2)));
                    }
                    i2++;
                }
                break;
            default:
                na6 na6Var2 = this.b;
                TreeMap treeMap = na6Var2.u;
                if (na6Var2.w.get() == 8) {
                    return;
                }
                URL url = new URL(na6Var2.B);
                HttpURLConnection httpURLConnection3 = na6Var2.F;
                if (httpURLConnection3 != null) {
                    httpURLConnection3.disconnect();
                    na6Var2.F = null;
                }
                long j = na6Var2.K;
                if (j == -1) {
                    httpURLConnection = (HttpURLConnection) url.openConnection();
                    na6Var2.F = httpURLConnection;
                } else {
                    Network[] allNetworks = ((ConnectivityManager) na6Var2.H.B.getSystemService("connectivity")).getAllNetworks();
                    int length = allNetworks.length;
                    int i4 = 0;
                    while (true) {
                        if (i4 < length) {
                            network = allNetworks[i4];
                            if (network.getNetworkHandle() != j) {
                                i4++;
                            }
                        } else {
                            network = null;
                        }
                    }
                    if (network == null) {
                        throw new NetworkExceptionImpl("Network bound to request not found", null);
                    }
                    httpURLConnection = (HttpURLConnection) network.openConnection(url);
                    na6Var2.F = httpURLConnection;
                }
                httpURLConnection.setInstanceFollowRedirects(false);
                if (!treeMap.containsKey("User-Agent")) {
                    treeMap.put("User-Agent", na6Var2.t);
                }
                for (Map.Entry entry : treeMap.entrySet()) {
                    na6Var2.F.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
                na6Var2.F.setRequestMethod(na6Var2.y);
                u5e u5eVar = na6Var2.z;
                if (u5eVar == null) {
                    na6Var2.F.connect();
                    na6Var2.f0(new ha6(na6Var2, new fa6(na6Var2, i), 0), "fireGetHeaders");
                    return;
                } else {
                    la6 la6Var = new la6(na6Var2, na6Var2.A, na6Var2.s, na6Var2.F, u5eVar);
                    na6Var2.G = la6Var;
                    la6Var.J(new ca6(la6Var, na6Var2.v.size() == 1), "start");
                    return;
                }
        }
    }
}
