package com.bytedance.adsdk.zb;

import android.graphics.Bitmap;
import java.util.List;
import org.json.JSONArray;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: dj, reason: collision with root package name */
    private final String f22844dj;

    /* renamed from: ea, reason: collision with root package name */
    private Bitmap f22845ea;
    private final String fby;

    /* renamed from: jc, reason: collision with root package name */
    private final JSONArray f22846jc;

    /* renamed from: jw, reason: collision with root package name */
    private final int[][] f22847jw;

    /* renamed from: lt, reason: collision with root package name */
    private final String f22848lt;
    private final String lud;
    private final String sya;

    /* renamed from: ul, reason: collision with root package name */
    private final List<ycx> f22849ul;
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f22850zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public String f22851dj;

        /* renamed from: lt, reason: collision with root package name */
        public int f22852lt;
        public int lud;
        public String sya;

        /* renamed from: ul, reason: collision with root package name */
        public String f22853ul;
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int f22854zb;
    }

    public jc(int i5, int i11, String str, String str2, String str3, String str4, List<ycx> list, String str5, int[][] iArr, JSONArray jSONArray) {
        this.ycx = i5;
        this.f22850zb = i11;
        this.sya = str;
        this.f22844dj = str2;
        this.lud = str3;
        this.f22848lt = str4;
        this.f22849ul = list;
        this.fby = str5;
        this.f22847jw = iArr;
        this.f22846jc = jSONArray;
    }

    public String dj() {
        return this.f22848lt;
    }

    public Bitmap ea() {
        return this.f22845ea;
    }

    public String fby() {
        return this.sya;
    }

    public String jc() {
        return this.lud;
    }

    public String jw() {
        return this.f22844dj;
    }

    public int[][] lt() {
        return this.f22847jw;
    }

    public String lud() {
        return this.fby;
    }

    public List<ycx> sya() {
        return this.f22849ul;
    }

    public JSONArray ul() {
        return this.f22846jc;
    }

    public int ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f22850zb;
    }

    public void ycx(Bitmap bitmap) {
        this.f22845ea = bitmap;
    }
}
