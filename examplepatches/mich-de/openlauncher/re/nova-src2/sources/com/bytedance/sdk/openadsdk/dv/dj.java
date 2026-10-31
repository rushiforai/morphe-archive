package com.bytedance.sdk.openadsdk.dv;

import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.openadsdk.dv.zb;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private ycx f26772dj;
    private lt sya;

    /* renamed from: zb, reason: collision with root package name */
    private sya f26775zb;
    private final String ycx = "StrategyCenter";
    private int lud = 0;

    /* renamed from: lt, reason: collision with root package name */
    private final ConcurrentHashMap<String, Object> f26773lt = new ConcurrentHashMap<>();

    /* renamed from: ul, reason: collision with root package name */
    private Runnable f26774ul = new Runnable() { // from class: com.bytedance.sdk.openadsdk.dv.dj.2
        @Override // java.lang.Runnable
        public void run() {
            dj.this.sya();
        }
    };

    public dj(lt ltVar) {
        this.f26775zb = null;
        ul ulVar = new ul(ltVar);
        this.sya = ulVar;
        String strSya = ulVar.sya();
        if (!TextUtils.isEmpty(strSya) && !strSya.startsWith("pag")) {
            strSya = "pag_".concat(strSya);
        }
        this.f26775zb = new sya(this.sya.zb(), strSya);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        this.f26773lt.clear();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya() {
        lt ltVar = this.sya;
        if (ltVar == null || ltVar.lud() == null || this.sya.lt() == null || this.sya.fby()) {
            return;
        }
        this.sya.ycx().execute(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dv.dj.1
            @Override // java.lang.Runnable
            public void run() {
                OutputStream outputStream;
                dj.this.lud++;
                try {
                    if (dj.this.f26772dj != null) {
                        dj.this.f26772dj.ycx();
                    }
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(dj.this.sya.lud()).openConnection();
                    if (dj.this.sya.ul() != null && dj.this.sya.ul().size() > 0) {
                        for (Map.Entry<String, String> entry : dj.this.sya.ul().entrySet()) {
                            httpURLConnection.addRequestProperty(entry.getKey(), entry.getValue());
                        }
                    }
                    httpURLConnection.setRequestMethod("POST");
                    httpURLConnection.setRequestProperty("Content-Type", "application/json");
                    try {
                        outputStream = httpURLConnection.getOutputStream();
                        try {
                            outputStream.write(dj.this.sya.lt().toString().getBytes());
                            outputStream.close();
                            int responseCode = httpURLConnection.getResponseCode();
                            Log.i("StrategyCenter", "executing strategy fetch");
                            if (responseCode == 200) {
                                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
                                StringBuffer stringBuffer = new StringBuffer();
                                while (true) {
                                    String line = bufferedReader.readLine();
                                    if (line == null) {
                                        break;
                                    } else {
                                        stringBuffer.append(line);
                                    }
                                }
                                bufferedReader.close();
                                JSONObject jSONObjectYcx = dj.this.sya.ycx(new JSONObject(stringBuffer.toString()));
                                dj.this.f26775zb.zb();
                                dj.this.dj();
                                dj.this.f26775zb.ycx(jSONObjectYcx);
                                if (dj.this.f26772dj != null) {
                                    dj.this.f26772dj.zb();
                                }
                            } else if (dj.this.f26772dj != null) {
                                dj.this.f26772dj.ycx(responseCode, httpURLConnection.getResponseMessage());
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            if (outputStream != null) {
                                outputStream.close();
                            }
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        outputStream = null;
                    }
                } catch (Throwable th4) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQPkeQ==", "Sfsj", 110);
                    Log.e("StrategyCenter", th4.getMessage() == null ? "error " : th4.getMessage());
                    if (dj.this.f26772dj != null) {
                        dj.this.f26772dj.ycx(-1, th4.getMessage());
                    }
                }
                dj.this.f26775zb.ycx("local_last_update_time", System.currentTimeMillis());
                dj.this.ycx();
            }
        });
    }

    public sya zb() {
        return this.f26775zb;
    }

    public void ycx(ycx ycxVar) {
        this.f26772dj = ycxVar;
    }

    public void ycx() {
        if (this.sya != null) {
            int i5 = 3600000;
            int iYcx = this.f26775zb.ycx("req_interval", 3600000);
            long j11 = 0;
            long jZb = this.f26775zb.zb("local_last_update_time", 0L);
            if (iYcx >= 600000 && iYcx <= 86400000) {
                i5 = iYcx;
            }
            long jCurrentTimeMillis = System.currentTimeMillis() - jZb;
            Log.i("StrategyCenter", "before  realInterval=".concat(String.valueOf(jCurrentTimeMillis)));
            if (jCurrentTimeMillis >= 0) {
                long j12 = i5;
                if (jCurrentTimeMillis <= j12) {
                    j11 = j12 - jCurrentTimeMillis;
                }
            }
            Log.i("StrategyCenter", "after  realInterval=".concat(String.valueOf(j11)));
            this.sya.dj().removeCallbacks(this.f26774ul);
            if (this.lud > 24) {
                return;
            }
            this.sya.dj().postDelayed(this.f26774ul, j11);
        }
    }

    public int ycx(String str, int i5) {
        sya syaVar = this.f26775zb;
        return syaVar == null ? i5 : syaVar.ycx(str, i5);
    }

    public String ycx(String str, String str2) {
        sya syaVar = this.f26775zb;
        return syaVar == null ? str2 : syaVar.ycx(str, str2);
    }

    public boolean ycx(String str, boolean z11) {
        sya syaVar = this.f26775zb;
        return syaVar == null ? z11 : syaVar.ycx(str, z11);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001f, code lost:
    
        if (r7.getClass().isInstance(r0) != false) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public <T> T ycx(String str, T t6, zb.ycx<T> ycxVar) {
        if (this.f26775zb != null && str != null) {
            T t9 = (T) this.f26773lt.get(str);
            if (t9 != null) {
                if (t6 != null) {
                    try {
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQM=", "XOs5ugG2bMSU", Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE);
                    }
                }
                return t9;
            }
            if (ycxVar != null) {
                try {
                    T t10 = (T) this.f26775zb.ycx(str, t6, ycxVar);
                    if (t10 != null) {
                        this.f26773lt.put(str, t10);
                        return t10;
                    }
                } catch (Exception e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQM=", "XOs5ugG2bMSU", 235);
                }
            }
        }
        return t6;
    }
}
