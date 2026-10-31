package com.bytedance.sdk.openadsdk.sya;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: dy, reason: collision with root package name */
    private int f26995dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f26996ea;

    /* renamed from: jc, reason: collision with root package name */
    private String f26997jc;

    /* renamed from: ok, reason: collision with root package name */
    private String f27000ok;

    /* renamed from: ry, reason: collision with root package name */
    private JSONObject f27001ry;
    private int syc;
    private FilterWord wie;
    private tn xkz;
    public static FilterWord ycx = new FilterWord(b.f42142b, b.f42142b);

    /* renamed from: zb, reason: collision with root package name */
    public static int f26994zb = 1;
    public static int sya = 2;

    /* renamed from: dj, reason: collision with root package name */
    public static int f26993dj = 3;
    public static int lud = 4;

    /* renamed from: lt, reason: collision with root package name */
    private final Set<sya> f26999lt = new HashSet();

    /* renamed from: ul, reason: collision with root package name */
    private final Set<zb> f27002ul = new HashSet();
    private final Set<dj> fby = new HashSet();

    /* renamed from: jw, reason: collision with root package name */
    private final Set<ycx> f26998jw = new HashSet();

    public interface dj {
        void ycx(String str);
    }

    public interface sya {
        void ycx(FilterWord filterWord);
    }

    public interface ycx {
        void ycx(List<FilterWord> list);
    }

    public interface zb {
        void ycx(int i5);
    }

    private void jc() {
        Iterator<sya> it = this.f26999lt.iterator();
        while (it.hasNext()) {
            it.next().ycx(this.wie);
        }
    }

    public void dj() {
        tn tnVar;
        if (!sya() && !TextUtils.isEmpty(this.f27000ok)) {
            this.wie = new FilterWord("0:00", this.f27000ok);
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(this.wie);
        if (!TextUtils.isEmpty(this.f26997jc)) {
            if (TextUtils.isEmpty(this.f27000ok)) {
                com.bytedance.sdk.openadsdk.sya.zb.ycx().ycx(this.f26997jc, arrayList, this.f26996ea);
            } else {
                if (this.f27001ry == null && (tnVar = this.xkz) != null) {
                    this.f27001ry = tnVar.ry(true);
                }
                com.bytedance.sdk.openadsdk.sya.zb.ycx().ycx(this.f26997jc, arrayList, this.f27001ry, this.f27000ok, this.f26996ea);
            }
        }
        Iterator<zb> it = this.f27002ul.iterator();
        while (it.hasNext()) {
            it.next().ycx(f26994zb);
        }
        ycx(ycx);
        sya(b.f42142b);
    }

    public int fby() {
        return this.syc;
    }

    public boolean jw() {
        return this.syc < this.f26995dy;
    }

    public void lt() {
        Iterator<zb> it = this.f27002ul.iterator();
        while (it.hasNext()) {
            it.next().ycx(lud);
        }
    }

    public void lud() {
        Iterator<zb> it = this.f27002ul.iterator();
        while (it.hasNext()) {
            it.next().ycx(sya);
        }
    }

    public boolean sya() {
        FilterWord filterWord = this.wie;
        return (filterWord == null || filterWord.equals(ycx)) ? false : true;
    }

    public String ul() {
        return this.f27000ok;
    }

    public void ycx() {
        this.f26999lt.clear();
        this.f27002ul.clear();
        this.fby.clear();
        this.f26998jw.clear();
    }

    public void zb(String str) {
        this.f26996ea = str;
    }

    public void sya(String str) {
        this.f27000ok = str;
        Iterator<dj> it = this.fby.iterator();
        while (it.hasNext()) {
            it.next().ycx(this.f27000ok);
        }
    }

    public FilterWord zb() {
        return this.wie;
    }

    public void ycx(String str) {
        this.f26997jc = str;
    }

    public void ycx(FilterWord filterWord) {
        this.wie = filterWord;
        jc();
    }

    public void ycx(sya syaVar) {
        this.f26999lt.add(syaVar);
    }

    public void ycx(zb zbVar) {
        this.f27002ul.add(zbVar);
    }

    public void ycx(dj djVar) {
        this.fby.add(djVar);
    }

    public void ycx(ycx ycxVar) {
        this.f26998jw.add(ycxVar);
    }

    public void ycx(List<FilterWord> list) {
        Iterator<ycx> it = this.f26998jw.iterator();
        while (it.hasNext()) {
            it.next().ycx(list);
        }
    }

    public void ycx(tn tnVar) {
        this.xkz = tnVar;
    }

    public void ycx(int i5, int i11) {
        this.syc = i5;
        this.f26995dy = i11;
    }
}
