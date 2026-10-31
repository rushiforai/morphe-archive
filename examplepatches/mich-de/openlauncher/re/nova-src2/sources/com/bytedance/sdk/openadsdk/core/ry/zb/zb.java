package com.bytedance.sdk.openadsdk.core.ry.zb;

import android.content.Context;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.jc.lt.zb {

    /* renamed from: nc, reason: collision with root package name */
    private String f26061nc;
    private String vbt;

    public zb(Context context) {
        super(context);
    }

    public int dj() {
        return this.f22662iq;
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb
    public void xkz(String str) {
        if (TextUtils.isEmpty(str) || TextUtils.equals(str, AbstractJsonLexerKt.NULL)) {
            str = b.f42142b;
        }
        if (TextUtils.isEmpty(this.vbt) || TextUtils.equals(this.vbt, AbstractJsonLexerKt.NULL)) {
            this.vbt = b.f42142b;
        }
        if (TextUtils.isEmpty(this.f26061nc) || TextUtils.equals(this.f26061nc, AbstractJsonLexerKt.NULL)) {
            this.f26061nc = b.f42142b;
        }
        String str2 = this.f26061nc + str + this.vbt;
        ((com.bytedance.adsdk.ugeno.jc.lt.zb) this).ycx = str2;
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText(str2);
        try {
            float f11 = this.f22697xz ? this.tru : this.f22661hf;
            float f12 = this.rmy ? this.bhi : this.f22661hf;
            float fMeasureText = ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).getPaint().measureText(((com.bytedance.adsdk.ugeno.jc.lt.zb) this).ycx);
            if (fMeasureText >= 0.0f) {
                lud((int) (f11 + fMeasureText + f12));
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7Q=", "bskOmhayfcOPXdlqhRWnLU8=", "SOs5oQakfQ==", 57);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        if (str.equals("before")) {
            this.f26061nc = str2;
        } else if (str.equals("after")) {
            this.vbt = str2;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        if (TextUtils.isEmpty(this.vbt) || TextUtils.equals(this.vbt, AbstractJsonLexerKt.NULL)) {
            this.vbt = b.f42142b;
        }
        if (TextUtils.isEmpty(this.f26061nc) || TextUtils.equals(this.f26061nc, AbstractJsonLexerKt.NULL)) {
            this.f26061nc = b.f42142b;
        }
        String str = this.f26061nc + this.vbt;
        ((com.bytedance.adsdk.ugeno.jc.lt.zb) this).ycx = str;
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText(str);
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setGravity(17);
    }
}
