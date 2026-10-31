package com.bytedance.adsdk.ugeno.lt;

import android.content.Context;
import android.text.TextUtils;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.lt.lud;
import com.bytedance.adsdk.ugeno.zb.ycx;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class lt extends com.bytedance.adsdk.ugeno.zb.ycx<lud> {

    /* renamed from: nc, reason: collision with root package name */
    private int f22401nc;

    /* renamed from: pg, reason: collision with root package name */
    private int f22402pg;

    /* renamed from: qt, reason: collision with root package name */
    private int f22403qt;

    /* renamed from: te, reason: collision with root package name */
    private int f22404te;
    private int vbt;

    public static class ycx extends ycx.C0024ycx {
        public int aeu;

        /* renamed from: av, reason: collision with root package name */
        public int f22405av;
        public float bhi;

        /* renamed from: hf, reason: collision with root package name */
        public int f22406hf;
        public int kgy;
        public float rmf;
        public int rmy;
        public float tru;

        /* renamed from: xz, reason: collision with root package name */
        public int f22407xz;

        public ycx(com.bytedance.adsdk.ugeno.zb.ycx ycxVar) {
            super(ycxVar);
            this.f22406hf = 1;
            this.tru = 0.0f;
            this.bhi = 0.0f;
            this.f22405av = -1;
            this.rmf = -1.0f;
            this.aeu = -1;
            this.f22407xz = -1;
            this.rmy = 16777215;
            this.kgy = 16777215;
        }

        private float dj(String str) {
            try {
                return Float.parseFloat(str);
            } catch (Exception unused) {
                return -1.0f;
            }
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Removed duplicated region for block: B:4:0x0010  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        private int lud(String str) {
            str.getClass();
            switch (str) {
                case "stretch":
                    return 4;
                case "baseline":
                    return 3;
                case "center":
                    return 2;
                case "flex_start":
                    return 0;
                case "flex_end":
                    return 1;
                default:
                    return -1;
            }
        }

        private float sya(String str) {
            try {
                return Float.parseFloat(str);
            } catch (Exception unused) {
                return 0.0f;
            }
        }

        private float zb(String str) {
            try {
                return Float.parseFloat(str);
            } catch (Exception unused) {
                return 0.0f;
            }
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        public String toString() {
            return "LayoutParams{mWidth=" + this.ycx + ", mHeight=" + this.f22723zb + ", mMargin=" + this.lud + ", mMarginLeft=" + this.f22717lt + ", mMarginRight=" + this.f22722ul + ", mMarginTop=" + this.fby + ", mMarginBottom=" + this.f22716jw + ", mParams=" + this.f22712dv + ", mOrder=" + this.f22406hf + ", mFlexGrow=" + this.tru + ", mFlexShrink=" + this.bhi + ", mAlignSelf=" + this.f22405av + ", mFlexBasisPercent=" + this.rmf + ", mMinWidth=" + this.aeu + ", mMinHeight=" + this.f22407xz + ", mMaxWidth=" + this.rmy + ", mMaxHeight=" + this.kgy + "} " + super.toString();
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        public void ycx(Context context, String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            super.ycx(context, str, str2);
            str.getClass();
            switch (str) {
                case "flexBasisPercent":
                    this.rmf = dj(str2);
                    break;
                case "order":
                    this.f22406hf = ycx(str2);
                    break;
                case "flexShrink":
                    this.bhi = sya(str2);
                    break;
                case "flexGrow":
                    this.tru = zb(str2);
                    break;
                case "alignSelf":
                    this.f22405av = lud(str2);
                    break;
            }
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        /* renamed from: zb, reason: merged with bridge method [inline-methods] */
        public lud.ycx ycx() {
            lud.ycx ycxVar = new lud.ycx((int) this.ycx, (int) this.f22723zb);
            ((ViewGroup.MarginLayoutParams) ycxVar).leftMargin = (int) this.f22717lt;
            ((ViewGroup.MarginLayoutParams) ycxVar).rightMargin = (int) this.f22722ul;
            ((ViewGroup.MarginLayoutParams) ycxVar).topMargin = (int) this.fby;
            ((ViewGroup.MarginLayoutParams) ycxVar).bottomMargin = (int) this.f22716jw;
            ycxVar.sya(this.f22406hf);
            ycxVar.dj(this.f22405av);
            ycxVar.ycx(this.tru);
            ycxVar.zb(this.bhi);
            ycxVar.sya(this.rmf);
            return ycxVar;
        }

        private int ycx(String str) {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException unused) {
                return 1;
            }
        }
    }

    public lt(Context context) {
        super(context);
    }

    private int dy(String str) {
        switch (str.hashCode()) {
            case -1881872635:
                str.equals("stretch");
                return 4;
            case -1720785339:
                return str.equals("baseline") ? 3 : 4;
            case -1364013995:
                return str.equals("center") ? 2 : 4;
            case 1384876188:
                return str.equals("flex_start") ? 0 : 4;
            case 1744442261:
                return str.equals("flex_end") ? 1 : 4;
            default:
                return 4;
        }
    }

    private int syc(String str) {
        str.getClass();
        switch (str) {
            case "center":
                return 2;
            case "space_around":
                return 4;
            case "space_between":
                return 3;
            case "flex_end":
                return 1;
            default:
                return 0;
        }
    }

    private int wie(String str) {
        switch (str.hashCode()) {
            case -1881872635:
                str.equals("stretch");
                return 5;
            case -1364013995:
                return str.equals("center") ? 2 : 5;
            case -932331738:
                return str.equals("space_around") ? 4 : 5;
            case 1384876188:
                return str.equals("flex_start") ? 0 : 5;
            case 1682480591:
                return str.equals("space_between") ? 3 : 5;
            case 1744442261:
                return str.equals("flex_end") ? 1 : 5;
            default:
                return 5;
        }
    }

    private int xkz(String str) {
        str.getClass();
        return !str.equals("wrap") ? 0 : 1;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public ycx.C0024ycx jc() {
        return new ycx(this);
    }

    public int ry(String str) {
        str.getClass();
        switch (str) {
            case "column_reverse":
                return 3;
            case "column":
                return 2;
            case "row_reverse":
                return 1;
            default:
                return 0;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public lud ycx() {
        lud ludVar = new lud(this.f22701zb);
        ludVar.ycx(this);
        return ludVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        ((lud) this.lud).setFlexDirection(this.f22403qt);
        ((lud) this.lud).setFlexWrap(this.f22404te);
        ((lud) this.lud).setJustifyContent(this.f22401nc);
        ((lud) this.lud).setAlignItems(this.vbt);
        ((lud) this.lud).setAlignContent(this.f22402pg);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "alignItems":
                this.vbt = dy(str2);
                break;
            case "flexDirection":
                this.f22403qt = ry(str2);
                break;
            case "alignContent":
                this.f22402pg = wie(str2);
                break;
            case "flexWrap":
                this.f22404te = xkz(str2);
                break;
            case "justifyContent":
                this.f22401nc = syc(str2);
                break;
        }
    }
}
