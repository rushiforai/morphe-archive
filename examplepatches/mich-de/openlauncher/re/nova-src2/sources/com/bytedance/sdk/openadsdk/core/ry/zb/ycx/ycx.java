package com.bytedance.sdk.openadsdk.core.ry.zb.ycx;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import com.bytedance.adsdk.ugeno.jc.lt.zb;
import com.bytedance.adsdk.ugeno.sya.sya;
import com.google.android.gms.internal.consent_sdk.h5;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends zb {

    /* renamed from: ci, reason: collision with root package name */
    private String f26054ci;

    /* renamed from: cu, reason: collision with root package name */
    private int f26055cu;
    private int ff;
    private int hfd;

    /* renamed from: kh, reason: collision with root package name */
    private int f26056kh;
    private int liq;
    private int mue;

    /* renamed from: nc, reason: collision with root package name */
    private String f26057nc;

    /* renamed from: pg, reason: collision with root package name */
    private String f26058pg;
    private int pyn;
    private int skm;

    /* renamed from: sp, reason: collision with root package name */
    private int f26059sp;
    private int tpg;
    private String vbt;
    private int vy;

    /* renamed from: yw, reason: collision with root package name */
    private int f26060yw;
    private int yyc;

    public ycx(Context context) {
        super(context);
        this.f26058pg = "symbol";
        this.f26054ci = "standard";
        this.f26059sp = 2;
        this.tpg = Integer.MIN_VALUE;
        this.liq = Integer.MIN_VALUE;
        this.vy = Integer.MIN_VALUE;
        this.f26060yw = Integer.MIN_VALUE;
        this.ff = Integer.MIN_VALUE;
        this.yyc = Integer.MIN_VALUE;
        this.mue = Integer.MIN_VALUE;
        this.f26056kh = Integer.MIN_VALUE;
        this.f26055cu = Integer.MIN_VALUE;
        this.pyn = Integer.MIN_VALUE;
        this.skm = Integer.MIN_VALUE;
        this.hfd = Integer.MIN_VALUE;
    }

    private int ry(String str) {
        str.getClass();
        switch (str) {
            case "narrowSymbol":
                return 3;
            case "symbol":
                return 2;
            case "code":
                return 1;
            case "name":
                return 4;
            default:
                return 2;
        }
    }

    private void sya(int i5, SpannableStringBuilder spannableStringBuilder, int i11, int i12) {
        if (i5 != Integer.MIN_VALUE) {
            if (Build.VERSION.SDK_INT >= 28) {
                Typeface typeface = Typeface.DEFAULT;
                spannableStringBuilder.setSpan(h5.f(Typeface.create(Typeface.DEFAULT, i5, ((zb) this).f22334te == 2)), i11, i12, 33);
            } else if (i5 >= 500) {
                spannableStringBuilder.setSpan(new StyleSpan(1), i11, i12, 33);
            }
        }
    }

    private int syc(String str) {
        str.getClass();
        if (str.equals("compact")) {
            return 2;
        }
        str.equals("standard");
        return 1;
    }

    private CharSequence ycx(List<sya> list) {
        int length;
        int length2;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        for (sya syaVar : list) {
            length = spannableStringBuilder.length();
            spannableStringBuilder.append((CharSequence) syaVar.zb());
            length2 = spannableStringBuilder.length();
            String strYcx = syaVar.ycx();
            strYcx.getClass();
            switch (strYcx) {
                case "fraction":
                    ycx(this.mue, spannableStringBuilder, length, length2);
                    zb(this.f26056kh, spannableStringBuilder, length, length2);
                    sya(this.f26055cu, spannableStringBuilder, length, length2);
                    break;
                case "currency":
                    ycx(this.tpg, spannableStringBuilder, length, length2);
                    zb(this.liq, spannableStringBuilder, length, length2);
                    sya(this.vy, spannableStringBuilder, length, length2);
                    break;
                case "compact":
                    ycx(this.pyn, spannableStringBuilder, length, length2);
                    zb(this.skm, spannableStringBuilder, length, length2);
                    sya(this.hfd, spannableStringBuilder, length, length2);
                    break;
                case "integer":
                    ycx(this.f26060yw, spannableStringBuilder, length, length2);
                    zb(this.ff, spannableStringBuilder, length, length2);
                    sya(this.yyc, spannableStringBuilder, length, length2);
                    break;
            }
        }
        return spannableStringBuilder;
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb
    public void xkz(String str) {
        super.xkz(str);
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        try {
            if (!TextUtils.isEmpty(this.f26057nc) && !TextUtils.isEmpty(this.vbt)) {
                List<sya> listZb = com.bytedance.adsdk.ugeno.sya.zb.zb(new BigDecimal(this.f26057nc), this.vbt, Locale.getDefault(), ry(this.f26058pg), syc(this.f26054ci), this.f26059sp);
                if (listZb == null || listZb.isEmpty()) {
                    return;
                }
                ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText(ycx(listZb));
                return;
            }
            ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText(b.f42142b);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7RmWPs/hwayat4=", "bskOgBGubMmDU+NYlAWXIV/pKIE=", "SesjkQau", 110);
            ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText(b.f42142b);
        }
    }

    private void zb(int i5, SpannableStringBuilder spannableStringBuilder, int i11, int i12) {
        if (i5 != Integer.MIN_VALUE) {
            spannableStringBuilder.setSpan(new AbsoluteSizeSpan(i5, true), i11, i12, 33);
        }
    }

    private void ycx(int i5, SpannableStringBuilder spannableStringBuilder, int i11, int i12) {
        if (i5 != Integer.MIN_VALUE) {
            spannableStringBuilder.setSpan(new ForegroundColorSpan(i5), i11, i12, 33);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x000f  */
    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "currencyDisplay":
                this.f26058pg = str2;
                break;
            case "currencyTextColor":
                this.tpg = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "currencyFontWeight":
                int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1);
                this.vy = iYcx;
                if (iYcx <= 0 || iYcx > 1000) {
                    this.vy = Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
                    break;
                }
            case "precision":
                this.f26059sp = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 2);
                break;
            case "intFontWeight":
                int iYcx2 = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1);
                this.yyc = iYcx2;
                if (iYcx2 <= 0 || iYcx2 > 1000) {
                    this.yyc = Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
                    break;
                }
            case "intTextSize":
                this.ff = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, Integer.MIN_VALUE);
                break;
            case "price":
                this.f26057nc = str2;
                break;
            case "cptTextColor":
                this.pyn = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "intTextColor":
                this.f26060yw = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "frcTextColor":
                this.mue = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "currency":
                this.vbt = str2;
                break;
            case "frcTextSize":
                this.f26056kh = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, Integer.MIN_VALUE);
                break;
            case "frcFontWeight":
                int iYcx3 = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1);
                this.f26055cu = iYcx3;
                if (iYcx3 <= 0 || iYcx3 > 1000) {
                    this.f26055cu = Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
                    break;
                }
            case "cptFontWeight":
                int iYcx4 = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1);
                this.hfd = iYcx4;
                if (iYcx4 <= 0 || iYcx4 > 1000) {
                    this.hfd = Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
                    break;
                }
            case "notation":
                this.f26054ci = str2;
                break;
            case "cptTextSize":
                this.skm = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, Integer.MIN_VALUE);
                break;
            case "currencyTextSize":
                this.liq = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, Integer.MIN_VALUE);
                break;
        }
    }
}
