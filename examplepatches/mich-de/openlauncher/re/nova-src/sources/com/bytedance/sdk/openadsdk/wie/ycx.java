package com.bytedance.sdk.openadsdk.wie;

import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements Comparable<ycx> {
    private int lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f27285ul;
    private long xkz;

    /* renamed from: zb, reason: collision with root package name */
    private final String f27286zb;
    private final ArrayList<Long> ycx = new ArrayList<>();

    /* renamed from: dj, reason: collision with root package name */
    private final ArrayList<Long> f27278dj = new ArrayList<>();

    /* renamed from: lt, reason: collision with root package name */
    private final ArrayList<Long> f27282lt = new ArrayList<>();
    private final ArrayList<Long> fby = new ArrayList<>();

    /* renamed from: jw, reason: collision with root package name */
    private final HashMap<String, zb> f27281jw = new HashMap<>();

    /* renamed from: jc, reason: collision with root package name */
    private int f27280jc = 0;

    /* renamed from: ea, reason: collision with root package name */
    private int f27279ea = 0;

    /* renamed from: ok, reason: collision with root package name */
    private final HashMap<String, zb> f27283ok = new HashMap<>();

    /* renamed from: ry, reason: collision with root package name */
    private int f27284ry = 0;
    private final ArrayList<String> syc = new ArrayList<>();

    public ycx(String str) {
        this.f27286zb = str;
    }

    private void zb(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        int i5;
        int i11;
        int i12;
        int[] iArr;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        int[] iArrOk = com.bytedance.sdk.openadsdk.lt.ycx.ycx().ok();
        if (iArrOk != null) {
            int i13 = 0;
            while (i13 < iArrOk.length) {
                int i14 = iArrOk[i13];
                long j11 = 60000;
                long j12 = jElapsedRealtime - (i14 * 60000);
                Iterator<String> it = this.f27283ok.keySet().iterator();
                long j13 = 0;
                while (it.hasNext()) {
                    long j14 = j11;
                    String next = it.next();
                    Iterator<String> it2 = it;
                    zb zbVar = this.f27283ok.get(next);
                    if (zbVar != null) {
                        long jYcx = zbVar.ycx(j12, jElapsedRealtime);
                        j13 += jYcx;
                        if (jYcx <= 0 && i13 == iArrOk.length - 1) {
                            hashSet.add(next);
                        }
                    }
                    it = it2;
                    j11 = j14;
                }
                if (j13 != 0) {
                    jSONObject.put("lp_stay_t_".concat(String.valueOf(i14)), j13);
                    iArr = iArrOk;
                    long jOptInt = jSONObject2.optInt("lp_stay_t_".concat(String.valueOf(i14))) + j13;
                    if (jOptInt != 0) {
                        jSONObject2.put("lp_stay_t_".concat(String.valueOf(i14)), jOptInt);
                    }
                } else {
                    iArr = iArrOk;
                }
                i13++;
                iArrOk = iArr;
            }
        }
        int[] iArrRy = com.bytedance.sdk.openadsdk.lt.ycx.ycx().ry();
        if (iArrRy != null) {
            int i15 = 0;
            while (i15 < iArrRy.length) {
                int i16 = iArrRy[i15];
                long j15 = jElapsedRealtime - (i16 * 60000);
                long j16 = 0;
                int i17 = 0;
                for (String str : this.f27281jw.keySet()) {
                    HashSet hashSet3 = hashSet;
                    int i18 = i16;
                    zb zbVar2 = this.f27281jw.get(str);
                    if (zbVar2 != null) {
                        long jYcx2 = zbVar2.ycx(j15, jElapsedRealtime);
                        j16 += jYcx2;
                        if (jYcx2 > 20000) {
                            i17++;
                        }
                        if (jYcx2 <= 0 && i15 == iArrRy.length - 1) {
                            hashSet2.add(str);
                        }
                    }
                    i16 = i18;
                    hashSet = hashSet3;
                }
                HashSet hashSet4 = hashSet;
                int i19 = i16;
                if (j16 != 0) {
                    jSONObject.put("v_stay_t_".concat(String.valueOf(i19)), j16);
                    long jOptInt2 = jSONObject2.optInt("v_stay_t_".concat(String.valueOf(i19))) + j16;
                    if (jOptInt2 != 0) {
                        jSONObject2.put("v_stay_t_".concat(String.valueOf(i19)), jOptInt2);
                    }
                }
                if (i17 != 0) {
                    jSONObject.put("v_20s_play_c_".concat(String.valueOf(i19)), i17);
                    int iOptInt = jSONObject2.optInt("v_20s_play_c_".concat(String.valueOf(i19))) + i17;
                    if (iOptInt != 0) {
                        jSONObject2.put("v_20s_play_c_".concat(String.valueOf(i19)), iOptInt);
                    }
                }
                i15++;
                hashSet = hashSet4;
            }
        }
        HashSet hashSet5 = hashSet;
        if (!hashSet5.isEmpty()) {
            Iterator it3 = hashSet5.iterator();
            while (it3.hasNext()) {
                this.f27283ok.remove((String) it3.next());
            }
        }
        if (!hashSet2.isEmpty()) {
            Iterator it4 = hashSet2.iterator();
            while (it4.hasNext()) {
                this.f27281jw.remove((String) it4.next());
            }
        }
        if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().syc() && (i12 = this.f27280jc) != 0) {
            jSONObject.put("v_stay_t_s", i12);
            int iOptInt2 = jSONObject2.optInt("v_stay_t_s") + this.f27280jc;
            if (iOptInt2 != 0) {
                jSONObject2.put("v_stay_t_s", iOptInt2);
            }
        }
        if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().xkz() && (i11 = this.f27284ry) != 0) {
            jSONObject.put("lp_stay_t_s", i11);
            int iOptInt3 = jSONObject2.optInt("lp_stay_t_s") + this.f27284ry;
            if (iOptInt3 != 0) {
                jSONObject2.put("lp_stay_t_s", iOptInt3);
            }
        }
        if (!com.bytedance.sdk.openadsdk.lt.ycx.ycx().wie() || (i5 = this.f27279ea) == 0) {
            return;
        }
        jSONObject.put("v_30p_play_c_s", i5);
        int iOptInt4 = jSONObject2.optInt("v_30p_play_c_s") + this.f27279ea;
        if (iOptInt4 != 0) {
            jSONObject2.put("v_30p_play_c_s", iOptInt4);
        }
    }

    public void ycx(String str, String str2) {
        zb zbVar;
        zb zbVar2;
        zb zbVar3;
        zb zbVar4;
        zb zbVar5;
        zb zbVar6;
        str.getClass();
        switch (str) {
            case "landingContinue":
                if (!TextUtils.isEmpty(str2) && (zbVar = this.f27283ok.get(str2)) != null) {
                    zbVar.dj(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "landingPause":
                if (!TextUtils.isEmpty(str2) && (zbVar2 = this.f27283ok.get(str2)) != null) {
                    zbVar2.sya(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "landingStart":
                if (!TextUtils.isEmpty(str2) && this.f27283ok.get(str2) == null) {
                    zb zbVar7 = new zb();
                    this.f27283ok.put(str2, zbVar7);
                    zbVar7.ycx(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "feed_over":
            case "feed_break":
            case "videoForceBreak":
            case "play_error":
                if (!TextUtils.isEmpty(str2) && (zbVar3 = this.f27281jw.get(str2)) != null && zbVar3.ycx() != zb.lud) {
                    zbVar3.zb(SystemClock.elapsedRealtime());
                    if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().syc()) {
                        this.f27280jc = (int) (zbVar3.ycx(this.xkz, SystemClock.elapsedRealtime()) + this.f27280jc);
                        break;
                    }
                }
                break;
            case "feed_play":
                this.f27282lt.add(Long.valueOf(SystemClock.elapsedRealtime()));
                if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().fby()) {
                    this.f27285ul++;
                }
                if (!TextUtils.isEmpty(str2) && this.f27281jw.get(str2) == null) {
                    zb zbVar8 = new zb();
                    this.f27281jw.put(str2, zbVar8);
                    zbVar8.ycx(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "show":
                this.ycx.add(Long.valueOf(SystemClock.elapsedRealtime()));
                if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().lt()) {
                    this.sya++;
                    break;
                }
                break;
            case "click":
                if (!this.syc.contains(str2)) {
                    if (this.syc.size() > 50) {
                        this.syc.subList(0, 25).clear();
                    }
                    this.syc.add(str2);
                    this.f27278dj.add(Long.valueOf(SystemClock.elapsedRealtime()));
                    if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().ul()) {
                        this.lud++;
                        break;
                    }
                }
                break;
            case "feed_continue":
                if (!TextUtils.isEmpty(str2) && (zbVar4 = this.f27281jw.get(str2)) != null) {
                    zbVar4.dj(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "feed_pause":
                if (!TextUtils.isEmpty(str2) && (zbVar5 = this.f27281jw.get(str2)) != null) {
                    zbVar5.sya(SystemClock.elapsedRealtime());
                    break;
                }
                break;
            case "landingFinish":
                if (!TextUtils.isEmpty(str2) && (zbVar6 = this.f27283ok.get(str2)) != null && zbVar6.ycx() != zb.lud) {
                    zbVar6.zb(SystemClock.elapsedRealtime());
                    if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().xkz()) {
                        this.f27284ry = (int) (zbVar6.ycx(this.xkz, SystemClock.elapsedRealtime()) + this.f27284ry);
                        break;
                    }
                }
                break;
            case "videoPercent30":
                if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().wie()) {
                    this.f27279ea++;
                    break;
                }
                break;
            case "dislike":
                this.fby.add(Long.valueOf(SystemClock.elapsedRealtime()));
                break;
        }
    }

    public JSONObject ycx(JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        try {
            ycx(jSONObject2, jSONObject);
            zb(jSONObject2, jSONObject);
            return jSONObject2;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EepC1X", "fessgRaubOSPRttYjwWpJ1XDIpEGsA==", "WO8hlhawaNOF", 188);
            htf.sya(th2.getMessage(), new Object[0]);
            return jSONObject2;
        }
    }

    public String zb() {
        return this.f27286zb;
    }

    private void ycx(String str, JSONObject jSONObject, ArrayList<Long> arrayList, int[] iArr, long j11, JSONObject jSONObject2) throws JSONException {
        int size = arrayList.size() - 1;
        int i5 = 0;
        for (int i11 : iArr) {
            long j12 = j11 - (i11 * 60000);
            while (size >= 0 && arrayList.get(size).longValue() >= j12) {
                i5++;
                size--;
            }
            if (i5 != 0) {
                jSONObject.put(str + i11, i5);
                int iOptInt = jSONObject2.optInt(str + i11) + i5;
                if (iOptInt != 0) {
                    jSONObject2.put(str + i11, iOptInt);
                }
            }
        }
        while (size >= 0) {
            arrayList.remove(0);
            size--;
        }
    }

    private void ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        int i5;
        int i11;
        int i12;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        ycx("show_c_", jSONObject, this.ycx, com.bytedance.sdk.openadsdk.lt.ycx.ycx().jw(), jElapsedRealtime, jSONObject2);
        ycx("click_c_", jSONObject, this.f27278dj, com.bytedance.sdk.openadsdk.lt.ycx.ycx().jc(), jElapsedRealtime, jSONObject2);
        ycx("v_play_c_", jSONObject, this.f27282lt, com.bytedance.sdk.openadsdk.lt.ycx.ycx().ea(), jElapsedRealtime, jSONObject2);
        ycx("dislike_c_", jSONObject, this.fby, com.bytedance.sdk.openadsdk.lt.ycx.ycx().dy(), jElapsedRealtime, jSONObject2);
        if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().lt() && (i12 = this.sya) != 0) {
            jSONObject.put("show_c_s", i12);
            int iOptInt = jSONObject2.optInt("show_c_s") + this.sya;
            if (iOptInt != 0) {
                jSONObject2.put("show_c_s", iOptInt);
            }
        }
        if (com.bytedance.sdk.openadsdk.lt.ycx.ycx().ul() && (i11 = this.lud) != 0) {
            jSONObject.put("click_c_s", i11);
            int iOptInt2 = jSONObject2.optInt("click_c_s") + this.lud;
            if (iOptInt2 != 0) {
                jSONObject2.put("click_c_s", iOptInt2);
            }
        }
        if (!com.bytedance.sdk.openadsdk.lt.ycx.ycx().fby() || (i5 = this.f27285ul) == 0) {
            return;
        }
        jSONObject.put("v_play_c_s", i5);
        int iOptInt3 = jSONObject2.optInt("v_play_c_s") + this.f27285ul;
        if (iOptInt3 != 0) {
            jSONObject2.put("v_play_c_s", iOptInt3);
        }
    }

    public void ycx() {
        this.xkz = SystemClock.elapsedRealtime();
        this.f27279ea = 0;
        this.lud = 0;
        this.sya = 0;
        this.f27284ry = 0;
        this.f27280jc = 0;
        this.f27285ul = 0;
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(ycx ycxVar) {
        return ycxVar.sya - this.sya;
    }
}
