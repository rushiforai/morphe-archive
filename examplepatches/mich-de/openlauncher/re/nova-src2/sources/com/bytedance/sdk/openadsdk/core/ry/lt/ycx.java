package com.bytedance.sdk.openadsdk.core.ry.lt;

import com.bytedance.adsdk.ugeno.core.pmi;
import com.bytedance.sdk.component.adexpress.zb.ry;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends ry {

    /* renamed from: dj, reason: collision with root package name */
    private float f25956dj;
    private boolean lud;
    private float sya;
    private JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    private pmi f25957zb;

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.lt.ycx$ycx, reason: collision with other inner class name */
    public static class C0076ycx extends ry.ycx {

        /* renamed from: dj, reason: collision with root package name */
        private float f25971dj;
        private boolean lud;
        private float sya;
        private JSONObject ycx;

        /* renamed from: zb, reason: collision with root package name */
        private pmi f25972zb;

        public C0076ycx ul(boolean z11) {
            this.lud = z11;
            return this;
        }

        public C0076ycx zb(float f11) {
            this.f25971dj = f11;
            return this;
        }

        public C0076ycx ycx(JSONObject jSONObject) {
            this.ycx = jSONObject;
            return this;
        }

        @Override // com.bytedance.sdk.component.adexpress.zb.ry.ycx
        /* renamed from: zb, reason: merged with bridge method [inline-methods] */
        public ycx ycx() {
            return new ycx(this);
        }

        public C0076ycx ycx(pmi pmiVar) {
            this.f25972zb = pmiVar;
            return this;
        }

        public C0076ycx ycx(float f11) {
            this.sya = f11;
            return this;
        }
    }

    public ycx(C0076ycx c0076ycx) {
        super(c0076ycx);
        this.ycx = c0076ycx.ycx;
        this.f25957zb = c0076ycx.f25972zb;
        this.sya = c0076ycx.sya;
        this.f25956dj = c0076ycx.f25971dj;
        this.lud = c0076ycx.lud;
    }

    public float aeu() {
        return this.f25956dj;
    }

    public boolean kgy() {
        return this.lud;
    }

    public float rmf() {
        return this.sya;
    }

    public pmi rmy() {
        return this.f25957zb;
    }

    public JSONObject xz() {
        return this.ycx;
    }
}
