package b;

import ads_mobile_sdk.i11;
import ads_mobile_sdk.j11;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeoutException;

/* loaded from: classes2.dex */
public final /* synthetic */ class o4 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15960a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f15961b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f15962c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f15963d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f15964e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f15965f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Serializable f15966g;

    /* JADX WARN: Multi-variable type inference failed */
    public /* synthetic */ o4(j11 j11Var, String str, d4.h hVar, boolean z11, String str2, byte[] bArr) {
        this.f15962c = j11Var;
        this.f15963d = str;
        this.f15965f = hVar;
        this.f15961b = z11;
        this.f15964e = str2;
        this.f15966g = bArr;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f15960a) {
            case 0:
                j11 j11Var = (j11) this.f15962c;
                String str = (String) this.f15963d;
                d4.h hVar = (d4.h) this.f15965f;
                String str2 = (String) this.f15964e;
                byte[] bArr = (byte[]) this.f15966g;
                long j11 = j11Var.f5083c;
                HttpURLConnection httpURLConnection = null;
                try {
                    try {
                        HttpURLConnection httpURLConnection2 = (HttpURLConnection) URI.create(str).toURL().openConnection();
                        try {
                            Objects.requireNonNull(httpURLConnection2);
                            aa.x xVar = new aa.x(httpURLConnection2, 6);
                            ExecutorService executorService = j11Var.f5081a;
                            d4.l lVar = hVar.f48968c;
                            if (lVar != null) {
                                lVar.b(xVar, executorService);
                            }
                            httpURLConnection2.setRequestProperty("User-Agent", j11Var.f5082b);
                            int i5 = (int) j11;
                            httpURLConnection2.setConnectTimeout(i5);
                            httpURLConnection2.setReadTimeout(i5);
                            if (this.f15961b) {
                                httpURLConnection2.setDoOutput(true);
                                httpURLConnection2.setRequestMethod("POST");
                                if (str2 != null) {
                                    httpURLConnection2.setRequestProperty("Content-Type", str2);
                                }
                                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(httpURLConnection2.getOutputStream());
                                try {
                                    bufferedOutputStream.write(bArr);
                                    bufferedOutputStream.close();
                                } finally {
                                }
                            }
                            int responseCode = httpURLConnection2.getResponseCode();
                            hVar.a(new i11(responseCode, j11.a(httpURLConnection2, responseCode)));
                            httpURLConnection2.disconnect();
                            return;
                        } catch (SocketTimeoutException e3) {
                            e = e3;
                            httpURLConnection = httpURLConnection2;
                            hVar.b(new TimeoutException("Timeout: " + e.getMessage()));
                            if (httpURLConnection != null) {
                                httpURLConnection.disconnect();
                            }
                            return;
                        } catch (Throwable th2) {
                            th = th2;
                            httpURLConnection = httpURLConnection2;
                            hVar.b(th);
                            if (httpURLConnection != null) {
                                httpURLConnection.disconnect();
                            }
                            return;
                        }
                    } catch (Throwable th3) {
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        throw th3;
                    }
                } catch (SocketTimeoutException e11) {
                    e = e11;
                } catch (Throwable th4) {
                    th = th4;
                }
            default:
                gf.a0 a0Var = (gf.a0) this.f15962c;
                ((gf.b0) this.f15963d).s(a0Var.f57451a, a0Var.f57452b, (gf.m) this.f15964e, (gf.r) this.f15965f, (IOException) this.f15966g, this.f15961b);
                return;
        }
    }

    public /* synthetic */ o4(gf.a0 a0Var, gf.b0 b0Var, gf.m mVar, gf.r rVar, IOException iOException, boolean z11) {
        this.f15962c = a0Var;
        this.f15963d = b0Var;
        this.f15964e = mVar;
        this.f15965f = rVar;
        this.f15966g = iOException;
        this.f15961b = z11;
    }
}
