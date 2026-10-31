package com.bytedance.sdk.component.lt.ycx.dj.ycx;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements com.bytedance.sdk.component.lt.ycx.dj.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private byte f23825dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f23826ea;
    private String fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f23827jc;

    /* renamed from: jw, reason: collision with root package name */
    private byte f23828jw;

    /* renamed from: lt, reason: collision with root package name */
    private long f23829lt;
    private long lud;
    private byte sya;

    /* renamed from: ul, reason: collision with root package name */
    private long f23830ul;
    protected JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    private zb f23831zb;

    public ycx(String str, JSONObject jSONObject) {
        this.fby = str;
        this.ycx = jSONObject;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public byte dj() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public long fby() {
        return this.f23829lt;
    }

    public String jc() {
        return this.f23827jc;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public int jw() {
        return this.f23826ea;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public synchronized JSONObject lt() {
        zb zbVar;
        try {
            if (this.ycx == null && (zbVar = this.f23831zb) != null) {
                this.ycx = zbVar.ycx(jc());
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public byte lud() {
        return this.f23825dj;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public String sya() {
        return this.fby;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public long ul() {
        return this.lud;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public zb ycx() {
        return this.f23831zb;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public byte zb() {
        return this.f23828jw;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public void sya(long j11) {
        this.f23830ul = j11;
    }

    public void ycx(byte b11) {
        this.f23828jw = b11;
    }

    public void zb(byte b11) {
        this.sya = b11;
    }

    public void sya(byte b11) {
        this.f23825dj = b11;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public void ycx(long j11) {
        this.lud = j11;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx
    public void zb(long j11) {
        this.f23829lt = j11;
    }

    public ycx(String str, zb zbVar) {
        this.fby = str;
        this.f23831zb = zbVar;
    }

    public void ycx(int i5) {
        this.f23826ea = i5;
    }

    private ycx() {
    }
}
