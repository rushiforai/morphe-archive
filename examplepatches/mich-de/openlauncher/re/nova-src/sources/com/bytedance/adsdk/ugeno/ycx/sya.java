package com.bytedance.adsdk.ugeno.ycx;

import b.c0;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private String f22543dj;
    private String fby;

    /* renamed from: jc, reason: collision with root package name */
    private JSONObject f22544jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22545jw = 1;

    /* renamed from: lt, reason: collision with root package name */
    private ycx f22546lt;
    private long lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f22547ul;
    private Map<String, TreeMap<Float, String>> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f22548zb;

    public static class ycx {
        public String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public String f22549zb;
    }

    public int dj() {
        return this.sya;
    }

    public String fby() {
        return this.f22547ul;
    }

    public int jc() {
        return this.f22545jw;
    }

    public String jw() {
        return this.fby;
    }

    public long lt() {
        return this.lud;
    }

    public String lud() {
        return this.f22543dj;
    }

    public long sya() {
        return this.f22548zb;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("AnimationModel{mKeyFramesMap=");
        sb2.append(this.ycx);
        sb2.append(", mDuration=");
        sb2.append(this.f22548zb);
        sb2.append(", mPlayCount=");
        sb2.append(this.sya);
        sb2.append(", mPlayDirection=");
        sb2.append(this.f22543dj);
        sb2.append(", mDelay=");
        sb2.append(this.lud);
        sb2.append(", mName=");
        sb2.append(this.fby);
        sb2.append(", mPlayState=");
        sb2.append(this.f22545jw);
        sb2.append(", mTransformOrigin='");
        sb2.append(this.f22546lt);
        sb2.append("', mTimingFunction='");
        return c0.q(sb2, this.f22547ul, "'}");
    }

    public ycx ul() {
        return this.f22546lt;
    }

    public JSONObject ycx() {
        return this.f22544jc;
    }

    public Map<String, TreeMap<Float, String>> zb() {
        return this.ycx;
    }

    public void sya(String str) {
        this.fby = str;
    }

    public void ycx(JSONObject jSONObject) {
        this.f22544jc = jSONObject;
    }

    public void zb(long j11) {
        this.lud = j11;
    }

    public void ycx(Map<String, TreeMap<Float, String>> map) {
        this.ycx = map;
    }

    public void zb(String str) {
        this.f22547ul = str;
    }

    public void ycx(long j11) {
        this.f22548zb = j11;
    }

    public void zb(int i5) {
        this.f22545jw = i5;
    }

    public void ycx(int i5) {
        this.sya = i5;
    }

    public void ycx(String str) {
        this.f22543dj = str;
    }

    public void ycx(ycx ycxVar) {
        this.f22546lt = ycxVar;
    }
}
