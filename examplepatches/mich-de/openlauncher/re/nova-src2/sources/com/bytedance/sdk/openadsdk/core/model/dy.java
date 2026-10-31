package com.bytedance.sdk.openadsdk.core.model;

import android.util.SparseArray;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dy implements com.bytedance.sdk.component.adexpress.sya {

    /* renamed from: dj, reason: collision with root package name */
    public final float f25616dj;

    /* renamed from: dy, reason: collision with root package name */
    public String f25617dy;

    /* renamed from: ea, reason: collision with root package name */
    public final boolean f25618ea;
    public int fby;

    /* renamed from: jc, reason: collision with root package name */
    public SparseArray<sya.ycx> f25619jc;

    /* renamed from: jw, reason: collision with root package name */
    public JSONObject f25620jw;

    /* renamed from: lt, reason: collision with root package name */
    public final long f25621lt;
    public final long lud;

    /* renamed from: ok, reason: collision with root package name */
    public int f25622ok;

    /* renamed from: ry, reason: collision with root package name */
    public JSONObject f25623ry;
    public final float sya;
    public int syc;

    /* renamed from: ul, reason: collision with root package name */
    public final String f25624ul;
    public int wie;
    public boolean xkz;
    public final float ycx;

    /* renamed from: zb, reason: collision with root package name */
    public final float f25625zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private float f25626dj;

        /* renamed from: dy, reason: collision with root package name */
        private int f25627dy;

        /* renamed from: ea, reason: collision with root package name */
        private JSONObject f25628ea;
        private int fby;

        /* renamed from: jc, reason: collision with root package name */
        private int f25629jc;

        /* renamed from: jw, reason: collision with root package name */
        private String f25630jw;

        /* renamed from: lt, reason: collision with root package name */
        private float f25631lt;
        private float lud;

        /* renamed from: ok, reason: collision with root package name */
        private int f25632ok;

        /* renamed from: ry, reason: collision with root package name */
        private JSONObject f25633ry;
        private long sya;
        private String syc;

        /* renamed from: ul, reason: collision with root package name */
        private float f25634ul;
        private boolean wie;
        private boolean xkz = false;
        protected SparseArray<sya.ycx> ycx = new SparseArray<>();

        /* renamed from: zb, reason: collision with root package name */
        private long f25635zb;

        public ycx dj(float f11) {
            this.f25634ul = f11;
            return this;
        }

        public ycx sya(int i5) {
            this.fby = i5;
            return this;
        }

        public ycx ycx(int i5) {
            this.f25632ok = i5;
            return this;
        }

        public ycx zb(int i5) {
            this.f25629jc = i5;
            return this;
        }

        public ycx dj(int i5) {
            this.f25627dy = i5;
            return this;
        }

        public ycx sya(float f11) {
            this.f25631lt = f11;
            return this;
        }

        public ycx ycx(JSONObject jSONObject) {
            this.f25628ea = jSONObject;
            return this;
        }

        public ycx zb(long j11) {
            this.sya = j11;
            return this;
        }

        public ycx ycx(boolean z11) {
            this.wie = z11;
            return this;
        }

        public ycx zb(float f11) {
            this.lud = f11;
            return this;
        }

        public ycx ycx(long j11) {
            this.f25635zb = j11;
            return this;
        }

        public ycx zb(JSONObject jSONObject) {
            this.f25633ry = jSONObject;
            return this;
        }

        public ycx ycx(float f11) {
            this.f25626dj = f11;
            return this;
        }

        public ycx zb(boolean z11) {
            this.xkz = z11;
            return this;
        }

        public ycx ycx(String str) {
            this.f25630jw = str;
            return this;
        }

        public ycx zb(String str) {
            this.syc = str;
            return this;
        }

        public ycx ycx(SparseArray<sya.ycx> sparseArray) {
            this.ycx = sparseArray;
            return this;
        }

        public dy ycx() {
            return new dy(this);
        }
    }

    private dy(ycx ycxVar) {
        this.xkz = false;
        this.ycx = ycxVar.f25634ul;
        this.f25625zb = ycxVar.f25631lt;
        this.sya = ycxVar.lud;
        this.f25616dj = ycxVar.f25626dj;
        this.lud = ycxVar.sya;
        this.f25621lt = ycxVar.f25635zb;
        this.f25624ul = ycxVar.f25630jw;
        this.f25619jc = ycxVar.ycx;
        this.f25618ea = ycxVar.wie;
        this.fby = ycxVar.f25629jc;
        this.f25620jw = ycxVar.f25628ea;
        this.f25622ok = ycxVar.f25632ok;
        this.f25623ry = ycxVar.f25633ry;
        this.xkz = ycxVar.xkz;
        this.syc = ycxVar.fby;
        this.f25617dy = ycxVar.syc;
        this.wie = ycxVar.f25627dy;
    }
}
