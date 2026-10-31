package com.bytedance.adsdk.ugeno.jc.lt;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends sya<ycx> {

    /* renamed from: ci, reason: collision with root package name */
    private int f22326ci;

    /* renamed from: cu, reason: collision with root package name */
    @Deprecated
    private float f22327cu;
    private float ff;
    private float hfd;

    /* renamed from: kh, reason: collision with root package name */
    @Deprecated
    private float f22328kh;

    @Deprecated
    private TextUtils.TruncateAt liq;
    private boolean mue;

    /* renamed from: nc, reason: collision with root package name */
    private float f22329nc;

    /* renamed from: nq, reason: collision with root package name */
    private float f22330nq;

    /* renamed from: pg, reason: collision with root package name */
    private int f22331pg;
    private float pyn;

    /* renamed from: qt, reason: collision with root package name */
    protected int f22332qt;
    private float skm;

    /* renamed from: sp, reason: collision with root package name */
    private int f22333sp;

    /* renamed from: te, reason: collision with root package name */
    protected int f22334te;
    private int tpg;
    private float vbt;
    private TextUtils.TruncateAt vy;
    protected String ycx;

    /* renamed from: yw, reason: collision with root package name */
    private float f22335yw;
    private int yyc;

    public zb(Context context) {
        super(context);
        this.f22332qt = -16777216;
        this.f22329nc = 12.0f;
        this.vbt = -1.0f;
        this.f22331pg = LayoutNode.NotPlacedPlaceOrder;
        this.f22333sp = 8388611;
        this.vy = TextUtils.TruncateAt.END;
        this.f22335yw = -1.0f;
        this.ff = 400.0f;
    }

    private void dj() {
        ((ycx) this.lud).setLineSpacing(0.0f, this.f22335yw);
    }

    private int dy(String str) {
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

    private void jw() {
        float f11 = this.f22335yw;
        if (f11 <= 3.0f) {
            ((ycx) this.lud).setLineSpacing(0.0f, f11);
            return;
        }
        if (Build.VERSION.SDK_INT >= 28) {
            int iRound = Math.round(fby.ycx(this.f22701zb, (f11 - (this.f22329nc * 1.2f)) / 2.0f));
            int paddingTop = ((ycx) this.lud).getPaddingTop() + iRound;
            int paddingBottom = ((ycx) this.lud).getPaddingBottom() + iRound;
            ycx ycxVar = (ycx) this.lud;
            ycxVar.setPadding(ycxVar.getPaddingLeft(), paddingTop, ((ycx) this.lud).getPaddingRight(), paddingBottom);
            ((ycx) this.lud).setLineHeight(Math.round(fby.ycx(this.f22701zb, this.f22335yw)));
        }
    }

    private int pmi(String str) {
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

    private TextUtils.TruncateAt ry(String str) {
        str.getClass();
        switch (str) {
            case "center":
                this.liq = TextUtils.TruncateAt.MIDDLE;
                break;
            case "end":
                this.liq = TextUtils.TruncateAt.END;
                break;
            case "start":
                this.liq = TextUtils.TruncateAt.START;
                break;
            default:
                this.liq = null;
                break;
        }
        return this.liq;
    }

    private TextUtils.TruncateAt syc(String str) {
        if (TextUtils.equals(str, "none")) {
            return null;
        }
        return TextUtils.TruncateAt.END;
    }

    private int wie(String str) {
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

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public ycx ycx() {
        ycx ycxVar = new ycx(this.f22701zb);
        ycxVar.ycx(this);
        return ycxVar;
    }

    public void xkz(String str) {
        this.ycx = str;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        if (TextUtils.equals(AbstractJsonLexerKt.NULL, str)) {
            this.ycx = b.f42142b;
        }
        ((ycx) this.lud).setText(this.ycx);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        if (TextUtils.equals(AbstractJsonLexerKt.NULL, this.ycx)) {
            this.ycx = b.f42142b;
        }
        xkz(this.ycx);
        ((ycx) this.lud).setTextSize(1, this.f22329nc);
        ((ycx) this.lud).setTextColor(this.f22332qt);
        ((ycx) this.lud).setLines(this.f22326ci);
        ((ycx) this.lud).setMaxLines(this.f22331pg);
        ((ycx) this.lud).setGravity(this.f22333sp);
        ((ycx) this.lud).setIncludeFontPadding(false);
        ((ycx) this.lud).setMinTextSize(fby.ycx(this.f22701zb, this.vbt));
        ycx(this.tpg);
        if (aeu()) {
            ycx(this.vy);
        } else {
            ycx(this.liq);
        }
        if (this.f22335yw > 0.0f) {
            if (aeu()) {
                jw();
            } else {
                dj();
            }
        }
        int i5 = Build.VERSION.SDK_INT;
        ((ycx) this.lud).setBreakStrategy(0);
        if (!aeu()) {
            ((ycx) this.lud).setShadowLayer(this.hfd, this.f22328kh, this.f22327cu, this.yyc);
        } else if (this.mue) {
            if (this.hfd <= 0.0f) {
                this.hfd = 1.0E-5f;
            }
            ((ycx) this.lud).setShadowLayer(this.hfd, this.pyn, this.skm, this.yyc);
        }
        int i11 = this.f22334te;
        if (i11 == 1) {
            ((ycx) this.lud).setTypeface(Typeface.DEFAULT, i11);
        } else if (i5 >= 28) {
            Typeface typeface = Typeface.DEFAULT;
            ((ycx) this.lud).setTypeface(Typeface.create(Typeface.DEFAULT, (int) this.ff, i11 == 2));
        } else if (this.ff >= 500.0f) {
            ((ycx) this.lud).setTypeface(Typeface.DEFAULT, 1);
        }
        if (fby.ycx(this.f22701zb, this.f22329nc) > 0.0f) {
            ((ycx) this.lud).setLetterSpacing(this.f22330nq / fby.ycx(this.f22701zb, this.f22329nc));
        }
    }

    public void ycx(int i5) {
        this.tpg = i5;
        if (i5 == Integer.MAX_VALUE) {
            return;
        }
        ((ycx) this.lud).setPaintFlags(i5);
    }

    public void ycx(TextUtils.TruncateAt truncateAt) {
        if (truncateAt == null) {
            return;
        }
        ((ycx) this.lud).setEllipsize(truncateAt);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "shadowRadius":
            case "shadowBlur":
                this.hfd = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "shadowColor":
                this.yyc = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                this.mue = true;
                break;
            case "shadowOffsetX":
                this.pyn = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "shadowOffsetY":
                this.skm = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "textAlign":
                this.f22333sp = wie(str2);
                break;
            case "textColor":
                this.f22332qt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "textStyle":
                this.f22334te = dy(str2);
                break;
            case "textSize":
                this.f22329nc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "textDecoration":
                this.tpg = pmi(str2);
                break;
            case "shadowDx":
                this.f22328kh = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "shadowDy":
                this.f22327cu = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "fontWeight":
                float fYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                this.ff = fYcx;
                if (fYcx < 1.0f || fYcx > 1000.0f) {
                    this.ff = 400.0f;
                    break;
                }
                break;
            case "lineHeight":
                this.f22335yw = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case "text":
                this.ycx = str2;
                break;
            case "lines":
                this.f22326ci = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
            case "ellipsis":
                this.vy = syc(str2);
                break;
            case "minTextSize":
                this.vbt = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                break;
            case "maxLines":
                int i5 = LayoutNode.NotPlacedPlaceOrder;
                int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, LayoutNode.NotPlacedPlaceOrder);
                if (iYcx > 0) {
                    i5 = iYcx;
                }
                this.f22331pg = i5;
                break;
            case "ellipsize":
                this.liq = ry(str2);
                break;
            case "letterSpacing":
                this.f22330nq = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
        }
    }
}
