package com.bytedance.adsdk.zb;

import android.graphics.Rect;
import android.util.LongSparseArray;
import android.util.SparseArray;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: dj, reason: collision with root package name */
    private Map<String, jc> f23109dj;

    /* renamed from: dy, reason: collision with root package name */
    private sya f23110dy;

    /* renamed from: ea, reason: collision with root package name */
    private float f23111ea;
    private LongSparseArray<com.bytedance.adsdk.zb.sya.sya.lud> fby;

    /* renamed from: jc, reason: collision with root package name */
    private Rect f23112jc;

    /* renamed from: jw, reason: collision with root package name */
    private List<com.bytedance.adsdk.zb.sya.sya.lud> f23113jw;

    /* renamed from: lt, reason: collision with root package name */
    private List<com.bytedance.adsdk.zb.sya.lt> f23114lt;
    private Map<String, com.bytedance.adsdk.zb.sya.sya> lud;

    /* renamed from: ok, reason: collision with root package name */
    private float f23115ok;
    private ycx pmi;

    /* renamed from: ry, reason: collision with root package name */
    private float f23116ry;
    private Map<String, List<com.bytedance.adsdk.zb.sya.sya.lud>> sya;

    /* renamed from: uh, reason: collision with root package name */
    private zb f23117uh;

    /* renamed from: ul, reason: collision with root package name */
    private SparseArray<com.bytedance.adsdk.zb.sya.dj> f23118ul;
    private boolean xkz;
    private final pmi ycx = new pmi();

    /* renamed from: zb, reason: collision with root package name */
    private final HashSet<String> f23119zb = new HashSet<>();
    private int syc = 0;
    private String wie = b.f42142b;

    public static class sya {

        /* renamed from: dj, reason: collision with root package name */
        public String f23120dj;

        /* renamed from: lt, reason: collision with root package name */
        public String f23121lt;
        public int[] lud;
        public String sya;

        /* renamed from: ul, reason: collision with root package name */
        public JSONArray f23122ul;
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public String f23123zb;
    }

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public int f23125dj;

        /* renamed from: lt, reason: collision with root package name */
        public String f23126lt;
        public int lud;
        public Map<String, Object> sya;

        /* renamed from: ul, reason: collision with root package name */
        public JSONArray f23127ul;
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public Map<String, Object> f23128zb;
    }

    public static class zb {
        public JSONArray sya;
        public String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int[][] f23139zb;
    }

    public Rect dj() {
        return this.f23112jc;
    }

    public Map<String, jc> dy() {
        return this.f23109dj;
    }

    public ycx ea() {
        return this.pmi;
    }

    public sya fby() {
        return this.f23110dy;
    }

    public zb jc() {
        return this.f23117uh;
    }

    public String jw() {
        return this.wie;
    }

    public float lt() {
        return this.f23111ea;
    }

    public float lud() {
        return (long) ((wie() / this.f23116ry) * 1000.0f);
    }

    public float ok() {
        return this.f23116ry;
    }

    public List<com.bytedance.adsdk.zb.sya.sya.lud> ry() {
        return this.f23113jw;
    }

    public pmi sya() {
        return this.ycx;
    }

    public Map<String, com.bytedance.adsdk.zb.sya.sya> syc() {
        return this.lud;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("LottieComposition:\n");
        Iterator<com.bytedance.adsdk.zb.sya.sya.lud> it = this.f23113jw.iterator();
        while (it.hasNext()) {
            sb2.append(it.next().ycx("\t"));
        }
        return sb2.toString();
    }

    public float ul() {
        return this.f23115ok;
    }

    public float wie() {
        return this.f23115ok - this.f23111ea;
    }

    public SparseArray<com.bytedance.adsdk.zb.sya.dj> xkz() {
        return this.f23118ul;
    }

    public void ycx(Rect rect, float f11, float f12, float f13, List<com.bytedance.adsdk.zb.sya.sya.lud> list, LongSparseArray<com.bytedance.adsdk.zb.sya.sya.lud> longSparseArray, Map<String, List<com.bytedance.adsdk.zb.sya.sya.lud>> map, Map<String, jc> map2, SparseArray<com.bytedance.adsdk.zb.sya.dj> sparseArray, Map<String, com.bytedance.adsdk.zb.sya.sya> map3, List<com.bytedance.adsdk.zb.sya.lt> list2, sya syaVar, String str, ycx ycxVar, zb zbVar) {
        this.f23112jc = rect;
        this.f23111ea = f11;
        this.f23115ok = f12;
        this.f23116ry = f13;
        this.f23113jw = list;
        this.fby = longSparseArray;
        this.sya = map;
        this.f23109dj = map2;
        this.f23118ul = sparseArray;
        this.lud = map3;
        this.f23114lt = list2;
        this.f23110dy = syaVar;
        this.wie = str;
        this.pmi = ycxVar;
        this.f23117uh = zbVar;
    }

    public int zb() {
        return this.syc;
    }

    public com.bytedance.adsdk.zb.sya.lt sya(String str) {
        int size = this.f23114lt.size();
        for (int i5 = 0; i5 < size; i5++) {
            com.bytedance.adsdk.zb.sya.lt ltVar = this.f23114lt.get(i5);
            if (ltVar.ycx(str)) {
                return ltVar;
            }
        }
        return null;
    }

    public void zb(boolean z11) {
        this.ycx.ycx(z11);
    }

    public List<com.bytedance.adsdk.zb.sya.sya.lud> zb(String str) {
        return this.sya.get(str);
    }

    public void ycx(String str) {
        this.f23119zb.add(str);
    }

    public void ycx(boolean z11) {
        this.xkz = z11;
    }

    public void ycx(int i5) {
        this.syc += i5;
    }

    public boolean ycx() {
        return this.xkz;
    }

    public com.bytedance.adsdk.zb.sya.sya.lud ycx(long j11) {
        return this.fby.get(j11);
    }

    public float ycx(float f11) {
        return com.bytedance.adsdk.zb.lt.lud.ycx(this.f23111ea, this.f23115ok, f11);
    }
}
