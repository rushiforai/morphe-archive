package com.bykv.vk.openvk.ycx.ycx.ycx.sya;

import android.text.TextUtils;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class a implements Serializable {

    /* renamed from: av, reason: collision with root package name */
    private int f22165av;

    /* renamed from: dv, reason: collision with root package name */
    private int f22167dv;

    /* renamed from: dy, reason: collision with root package name */
    private String f22168dy;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f22169ea;
    private String fby;
    private long htf;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f22171jc;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f22172jw;

    /* renamed from: lt, reason: collision with root package name */
    private c f22173lt;

    /* renamed from: ok, reason: collision with root package name */
    private final int f22174ok;
    private int pmi;
    public int sya;
    private boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f22176tn;

    /* renamed from: uh, reason: collision with root package name */
    private String f22177uh;

    /* renamed from: ul, reason: collision with root package name */
    private c f22178ul;
    private int wie;
    private boolean wwx;

    /* renamed from: zb, reason: collision with root package name */
    public String f22179zb;

    /* renamed from: ry, reason: collision with root package name */
    private int f22175ry = 204800;
    private int xkz = 0;
    private int syc = 0;
    protected float ycx = -1.0f;

    /* renamed from: dj, reason: collision with root package name */
    public final HashMap<String, Object> f22166dj = new HashMap<>();
    private int oty = 10000;

    /* renamed from: hf, reason: collision with root package name */
    private int f22170hf = 10000;
    private int tru = 10000;
    private int bhi = 0;
    public int lud = 1;
    private JSONObject rmf = new JSONObject();

    public a(String str, c cVar, c cVar2, int i5, int i11, int i12) {
        this.f22176tn = 0;
        this.f22167dv = 0;
        this.fby = str;
        this.f22173lt = cVar;
        this.f22178ul = cVar2;
        this.f22176tn = i5;
        this.f22167dv = i11;
        this.f22174ok = i12;
    }

    public int av() {
        return this.f22174ok;
    }

    public boolean bhi() {
        return this.f22169ea;
    }

    public int dj() {
        return this.rmf.optInt("pitaya_cache_size", 0);
    }

    public c dv() {
        return this.f22178ul;
    }

    public String dy() {
        if (xkz()) {
            return this.f22178ul.f22189g;
        }
        c cVar = this.f22173lt;
        if (cVar != null) {
            return cVar.f22189g;
        }
        return null;
    }

    public boolean ea() {
        return this.thx;
    }

    public int fby() {
        return this.wie;
    }

    public boolean hf() {
        return this.f22171jc;
    }

    public int htf() {
        return this.f22170hf;
    }

    public long jc() {
        return this.htf;
    }

    public int jw() {
        return this.pmi;
    }

    public int lt() {
        if (xkz()) {
            return this.f22178ul.b();
        }
        c cVar = this.f22173lt;
        if (cVar != null) {
            return cVar.b();
        }
        return 0;
    }

    public String lud() {
        return this.fby;
    }

    public long ok() {
        if (xkz()) {
            return this.f22178ul.f22185c;
        }
        c cVar = this.f22173lt;
        if (cVar != null) {
            return cVar.f22185c;
        }
        return 0L;
    }

    public boolean oty() {
        return this.f22172jw;
    }

    public int pmi() {
        return this.f22176tn;
    }

    public boolean ry() {
        if (xkz()) {
            return this.f22178ul.o == 0;
        }
        c cVar = this.f22173lt;
        return cVar == null || cVar.o == 0;
    }

    public JSONObject sya() {
        return this.rmf;
    }

    public float syc() {
        float f11 = this.ycx;
        if (f11 != -1.0f) {
            return f11;
        }
        if (xkz()) {
            this.f22178ul.getClass();
            return -1.0f;
        }
        c cVar = this.f22173lt;
        if (cVar != null) {
            cVar.getClass();
        }
        return -1.0f;
    }

    public int thx() {
        return this.tru;
    }

    public c tn() {
        return this.f22173lt;
    }

    public File tru() {
        String strWie = wie();
        if (this.fby == null || strWie == null) {
            return null;
        }
        return new File(this.fby, strWie);
    }

    public int uh() {
        return this.oty;
    }

    public boolean ul() {
        return this.wwx;
    }

    public String wie() {
        if (xkz()) {
            return this.f22178ul.c();
        }
        c cVar = this.f22173lt;
        if (cVar != null) {
            return cVar.c();
        }
        return null;
    }

    public int wwx() {
        return this.bhi;
    }

    public boolean xkz() {
        c cVar;
        return (this.f22167dv != 1 || (cVar = this.f22178ul) == null || TextUtils.isEmpty(cVar.f22189g)) ? false : true;
    }

    public void ycx(int i5) {
        this.f22165av = i5;
    }

    public boolean zb() {
        return this.f22165av == 2;
    }

    public void dj(String str) {
        this.f22179zb = str;
    }

    public void fby(int i5) {
        this.bhi = i5;
    }

    public synchronized Object lud(String str) {
        return this.f22166dj.get(str);
    }

    public void sya(int i5) {
        this.pmi = i5;
    }

    public void ul(int i5) {
        this.tru = i5;
    }

    public boolean ycx() {
        int i5 = this.f22165av;
        return i5 == 1 || i5 == 2;
    }

    public void zb(String str) {
        this.f22168dy = str;
    }

    public void dj(int i5) {
        this.sya = i5;
    }

    public void lud(int i5) {
        this.oty = i5;
    }

    public void sya(String str) {
        this.f22177uh = str;
    }

    public void ycx(String str) {
        this.fby = str;
    }

    public void zb(int i5) {
        this.wie = i5;
    }

    public void dj(boolean z11) {
        this.f22169ea = z11;
    }

    public void sya(boolean z11) {
        this.f22171jc = z11;
    }

    public void ycx(long j11) {
        this.htf = j11;
    }

    public void zb(boolean z11) {
        this.f22172jw = z11;
    }

    public void lt(int i5) {
        this.f22170hf = i5;
    }

    public void ycx(boolean z11) {
        this.thx = z11;
    }

    public synchronized void ycx(String str, Object obj) {
        this.f22166dj.put(str, obj);
    }
}
