package com.bytedance.sdk.openadsdk.core.ry;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dy, reason: collision with root package name */
    private float f25979dy;

    /* renamed from: ea, reason: collision with root package name */
    private float f25980ea;
    private boolean htf;

    /* renamed from: jc, reason: collision with root package name */
    private TextUtils.TruncateAt f25981jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f25982jw;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private float f25984ok;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f25985ry;
    private float syc;

    /* renamed from: uh, reason: collision with root package name */
    private Context f25986uh;

    /* renamed from: ul, reason: collision with root package name */
    private int f25987ul;
    private float wie;
    private boolean xkz;
    protected String ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected int f25988zb = -16777216;
    private float sya = 12.0f;

    /* renamed from: dj, reason: collision with root package name */
    private float f25978dj = -1.0f;

    /* renamed from: lt, reason: collision with root package name */
    private int f25983lt = LayoutNode.NotPlacedPlaceOrder;
    private int fby = 8388611;

    public sya(Context context, boolean z11) {
        this.f25986uh = context;
        this.htf = z11;
    }

    private int dj(String str) {
        str.getClass();
        switch (str) {
            case "underline":
                return 8;
            case "strikethrough":
                return 16;
            case "none":
            default:
                return LayoutNode.NotPlacedPlaceOrder;
        }
    }

    private TextUtils.TruncateAt sya(String str) {
        if (TextUtils.equals(str, "none")) {
            return null;
        }
        return TextUtils.TruncateAt.END;
    }

    private int zb(String str) {
        int iHashCode = str.hashCode();
        if (iHashCode == -1178781136) {
            return str.equals("italic") ? 2 : 0;
        }
        if (iHashCode != -1039745817) {
            return (iHashCode == 3029637 && str.equals("bold")) ? 1 : 0;
        }
        str.equals("normal");
        return 0;
    }

    public void ycx(com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        if (!TextUtils.isEmpty(this.ycx)) {
            ycxVar.setText(TextUtils.equals(AbstractJsonLexerKt.NULL, this.ycx) ? b.f42142b : this.ycx);
        }
        ycxVar.setTextSize(1, this.sya);
        ycxVar.setMinTextSize(fby.ycx(this.f25986uh, this.f25978dj));
        ycxVar.setTextColor(this.f25988zb);
        ycxVar.setGravity(this.fby);
        ycxVar.setLines(this.f25987ul);
        ycxVar.setMaxLines(this.f25983lt);
        int i5 = this.f25982jw;
        if (i5 != Integer.MAX_VALUE) {
            ycxVar.setPaintFlags(i5);
        }
        ycxVar.setEllipsize(this.f25981jc);
        if (this.f25980ea > 0.0f) {
            if (this.htf) {
                sya(ycxVar);
            } else {
                zb(ycxVar);
            }
        }
        ycxVar.setTypeface(ycx((int) this.f25984ok));
        dj(ycxVar);
        float fYcx = fby.ycx(this.f25986uh, this.sya);
        if (fYcx > 0.0f) {
            ycxVar.setLetterSpacing(this.pmi / fYcx);
        }
        ycxVar.setIncludeFontPadding(false);
    }

    private void dj(com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar) {
        if (!this.htf) {
            ycxVar.setShadowLayer(this.wie, this.syc, this.f25979dy, this.f25985ry);
        } else if (this.xkz) {
            float f11 = this.wie;
            if (f11 <= 0.0f) {
                f11 = 1.0E-5f;
            }
            ycxVar.setShadowLayer(f11, this.syc, this.f25979dy, this.f25985ry);
        }
    }

    private void sya(com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar) {
        float f11 = this.f25980ea;
        if (f11 <= 3.0f) {
            ycxVar.setLineSpacing(0.0f, f11);
        } else if (Build.VERSION.SDK_INT >= 28) {
            int iRound = Math.round(fby.ycx(this.f25986uh, (f11 - (this.sya * 1.2f)) / 2.0f));
            ycxVar.setPadding(ycxVar.getPaddingLeft(), ycxVar.getPaddingTop() + iRound, ycxVar.getPaddingRight(), ycxVar.getPaddingBottom() + iRound);
            ycxVar.setLineHeight(Math.round(fby.ycx(this.f25986uh, this.f25980ea)));
        }
    }

    private void zb(com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar) {
        ycxVar.setLineSpacing(0.0f, this.f25980ea);
    }

    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        str.getClass();
        switch (str) {
            case "shadowColor":
                this.f25985ry = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                this.xkz = true;
                break;
            case "shadowOffsetX":
                this.syc = fby.ycx(this.f25986uh, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "shadowOffsetY":
                this.f25979dy = fby.ycx(this.f25986uh, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "textAlign":
                this.fby = ycx(str2);
                break;
            case "textColor":
                this.f25988zb = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "textStyle":
                this.lud = zb(str2);
                break;
            case "shadowBlur":
                this.wie = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "textSize":
                this.sya = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "textDecoration":
                this.f25982jw = dj(str2);
                break;
            case "fontWeight":
                float fYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                this.f25984ok = fYcx;
                if (fYcx < 1.0f || fYcx > 1000.0f) {
                    this.f25984ok = 400.0f;
                    break;
                }
                break;
            case "lineHeight":
                this.f25980ea = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case "text":
                this.ycx = str2;
                break;
            case "lines":
                this.f25987ul = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
            case "ellipsis":
                this.f25981jc = sya(str2);
                break;
            case "minTextSize":
                this.f25978dj = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                break;
            case "maxLines":
                int i5 = LayoutNode.NotPlacedPlaceOrder;
                int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, LayoutNode.NotPlacedPlaceOrder);
                if (iYcx > 0) {
                    i5 = iYcx;
                }
                this.f25983lt = i5;
                break;
            case "letterSpacing":
                this.pmi = fby.ycx(this.f25986uh, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
        }
    }

    private int ycx(String str) {
        str.getClass();
        switch (str) {
            case "center":
                return 17;
            case "center_vertical":
                return 16;
            case "left":
                return 3;
            case "right":
                return 5;
            case "center_horizontal":
                return 1;
            default:
                return 3;
        }
    }

    private Typeface ycx(int i5) {
        if (Build.VERSION.SDK_INT < 28) {
            return i5 >= 700 ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT;
        }
        Typeface typeface = Typeface.DEFAULT;
        return Typeface.create(Typeface.DEFAULT, i5, false);
    }
}
