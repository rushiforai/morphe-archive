package com.apm.insight.k;

import b.c0;
import com.apm.insight.CustomRequestHeader;
import com.apm.insight.MonitorCrash;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    private final String f21729a;

    /* renamed from: b, reason: collision with root package name */
    private HttpURLConnection f21730b;

    /* renamed from: c, reason: collision with root package name */
    private String f21731c;

    /* renamed from: d, reason: collision with root package name */
    private boolean f21732d;

    /* renamed from: e, reason: collision with root package name */
    private f f21733e;

    /* renamed from: f, reason: collision with root package name */
    private k f21734f;

    public i(String str, String str2, boolean z11) throws IOException {
        this.f21731c = str2;
        this.f21732d = z11;
        String str3 = "AAA" + System.currentTimeMillis() + "AAA";
        this.f21729a = str3;
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        this.f21730b = httpURLConnection;
        httpURLConnection.setUseCaches(false);
        this.f21730b.setDoOutput(true);
        this.f21730b.setDoInput(true);
        this.f21730b.setRequestMethod("POST");
        CustomRequestHeader customRequestHeader = MonitorCrash.mCustomRequestHeader;
        if (customRequestHeader != null) {
            customRequestHeader.addRequestHeader(this.f21730b);
        }
        this.f21730b.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + str3);
        if (!z11) {
            this.f21733e = new f(this.f21730b.getOutputStream());
        } else {
            this.f21730b.setRequestProperty("Content-Encoding", "gzip");
            this.f21734f = new k(this.f21730b.getOutputStream());
        }
    }

    public final void a(String str, String str2) throws IOException {
        b(str, str2);
    }

    public final void b(String str, String str2) throws IOException {
        StringBuilder sb2 = new StringBuilder("--");
        c0.D(sb2, this.f21729a, "\r\nContent-Disposition: form-data; name=\"", str, "\"\r\nContent-Type: text/plain; charset=");
        sb2.append(this.f21731c);
        sb2.append("\r\n\r\n");
        try {
            if (this.f21732d) {
                this.f21734f.write(sb2.toString().getBytes());
            } else {
                this.f21733e.write(sb2.toString().getBytes());
            }
        } catch (IOException unused) {
        }
        byte[] bytes = str2.getBytes();
        try {
            if (this.f21732d) {
                this.f21734f.write(bytes);
                this.f21734f.write("\r\n".getBytes());
            } else {
                this.f21733e.write(bytes);
                this.f21733e.write("\r\n".getBytes());
            }
        } catch (IOException unused2) {
        }
    }

    public final void a(String str, File... fileArr) throws IOException {
        StringBuilder sb2 = new StringBuilder("--");
        c0.D(sb2, this.f21729a, "\r\nContent-Disposition: form-data; name=\"", str, "\"; filename=\"");
        sb2.append(str);
        sb2.append("\"\r\nContent-Transfer-Encoding: binary\r\n\r\n");
        if (this.f21732d) {
            this.f21734f.write(sb2.toString().getBytes());
        } else {
            this.f21733e.write(sb2.toString().getBytes());
        }
        if (this.f21732d) {
            com.apm.insight.l.f.a(this.f21734f, fileArr);
        } else {
            com.apm.insight.l.f.a(this.f21733e, fileArr);
        }
        if (this.f21732d) {
            this.f21734f.write("\r\n".getBytes());
        } else {
            this.f21733e.write("\r\n".getBytes());
            this.f21733e.flush();
        }
    }

    public final void a(String str, File file, Map<String, String> map) throws IOException {
        String name = file.getName();
        StringBuilder sb2 = new StringBuilder("--");
        c0.D(sb2, this.f21729a, "\r\nContent-Disposition: form-data; name=\"", str, "\"; filename=\"");
        sb2.append(name);
        sb2.append("\"");
        for (Map.Entry<String, String> entry : map.entrySet()) {
            sb2.append("; ");
            sb2.append(entry.getKey());
            sb2.append("=\"");
            sb2.append(entry.getValue());
            sb2.append("\"");
        }
        sb2.append("\r\nContent-Transfer-Encoding: binary\r\n\r\n");
        if (this.f21732d) {
            this.f21734f.write(sb2.toString().getBytes());
        } else {
            this.f21733e.write(sb2.toString().getBytes());
        }
        FileInputStream fileInputStream = new FileInputStream(file);
        byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        while (true) {
            int i5 = fileInputStream.read(bArr);
            if (i5 == -1) {
                break;
            } else if (this.f21732d) {
                this.f21734f.write(bArr, 0, i5);
            } else {
                this.f21733e.write(bArr, 0, i5);
            }
        }
        fileInputStream.close();
        if (this.f21732d) {
            this.f21734f.write("\r\n".getBytes());
        } else {
            this.f21733e.write("\r\n".getBytes());
            this.f21733e.flush();
        }
    }

    public final String a() throws IOException {
        ArrayList arrayList = new ArrayList();
        byte[] bytes = ("\r\n--" + this.f21729a + "--\r\n").getBytes();
        if (this.f21732d) {
            this.f21734f.write(bytes);
            this.f21734f.b();
            this.f21734f.a();
        } else {
            this.f21733e.write(bytes);
            this.f21733e.flush();
            this.f21733e.a();
        }
        int responseCode = this.f21730b.getResponseCode();
        if (responseCode == 200) {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this.f21730b.getInputStream()));
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                arrayList.add(line);
            }
            bufferedReader.close();
            this.f21730b.disconnect();
            StringBuilder sb2 = new StringBuilder();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                sb2.append((String) it.next());
            }
            return sb2.toString();
        }
        throw new IOException("Server returned non-OK status: ".concat(String.valueOf(responseCode)));
    }
}
