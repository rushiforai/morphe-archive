package com.bytedance.adsdk.ugeno.yoga.zb;

import a2.c;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.yoga.dj;
import com.bytedance.adsdk.ugeno.yoga.jc;
import com.bytedance.adsdk.ugeno.yoga.lt;
import com.bytedance.adsdk.ugeno.yoga.lud;
import com.bytedance.adsdk.ugeno.yoga.ry;
import com.bytedance.adsdk.ugeno.yoga.xkz;
import com.bytedance.adsdk.ugeno.yoga.zb.sya;
import com.bytedance.adsdk.ugeno.zb;
import com.bytedance.adsdk.ugeno.zb.ycx;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.zb.ycx<sya> {

    /* renamed from: ci, reason: collision with root package name */
    private jc f22637ci;

    /* renamed from: nc, reason: collision with root package name */
    private lt f22638nc;

    /* renamed from: pg, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.yoga.ycx f22639pg;

    /* renamed from: qt, reason: collision with root package name */
    private lud f22640qt;

    /* renamed from: te, reason: collision with root package name */
    private xkz f22641te;
    private com.bytedance.adsdk.ugeno.yoga.ycx vbt;

    /* renamed from: com.bytedance.adsdk.ugeno.yoga.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0023ycx extends ycx.C0024ycx {
        public int aeu;

        /* renamed from: av, reason: collision with root package name */
        public int f22644av;
        public float bhi;
        private boolean dc;
        private boolean dwi;

        /* renamed from: hf, reason: collision with root package name */
        public int f22645hf;
        public int ifb;
        public int kgy;
        private boolean nji;
        private boolean oby;
        public float rmf;
        public int rmy;
        private boolean sz;
        public float tru;

        /* renamed from: xz, reason: collision with root package name */
        public int f22646xz;

        /* renamed from: yi, reason: collision with root package name */
        private boolean f22647yi;
        public float yzp;

        public C0023ycx(com.bytedance.adsdk.ugeno.zb.ycx ycxVar) {
            super(ycxVar);
            this.f22645hf = 1;
            this.tru = 0.0f;
            this.bhi = 1.0f;
            this.f22644av = com.bytedance.adsdk.ugeno.yoga.ycx.AUTO.ycx();
            this.rmf = -1.0f;
            this.aeu = ry.RELATIVE.ycx();
        }

        private void dj() {
            com.bytedance.adsdk.ugeno.zb.ycx ycxVar = this.oty;
            if (ycxVar instanceof ycx) {
                if (((ycx) ycxVar).uz() == lud.ROW && this.oty.ifb() == -2 && this.ycx == -1.0f && !this.oty.yi()) {
                    this.ycx = -2.0f;
                    this.bhi = 1.0f;
                    this.tru = 1.0f;
                    this.dwi = true;
                    this.rmf = -1.0f;
                }
                if (((ycx) this.oty).uz() == lud.COLUMN && this.oty.yzp() == -2 && this.f22723zb == -1.0f && !this.oty.yi()) {
                    this.f22723zb = -2.0f;
                    this.bhi = 1.0f;
                    this.tru = 1.0f;
                    this.dwi = true;
                    this.rmf = -1.0f;
                }
            }
        }

        public boolean sya() {
            float f11 = this.ycx;
            if (f11 == -1.0f && this.f22723zb == -1.0f) {
                return false;
            }
            return f11 == -2.0f || this.f22723zb == -2.0f;
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        public String toString() {
            StringBuilder sb2 = new StringBuilder("LayoutParams{mOrder=");
            sb2.append(this.f22645hf);
            sb2.append(", mFlexGrow=");
            sb2.append(this.tru);
            sb2.append(", mFlexShrink=");
            sb2.append(this.bhi);
            sb2.append(", mAlignSelf=");
            sb2.append(this.f22644av);
            sb2.append(", mFlexBasis=");
            sb2.append(this.rmf);
            sb2.append(", mPosition=");
            sb2.append(this.aeu);
            sb2.append(", mTop=");
            sb2.append(this.f22646xz);
            sb2.append(", mBottom=");
            sb2.append(this.rmy);
            sb2.append(", mLeft=");
            sb2.append(this.kgy);
            sb2.append(", mRight=");
            return c.m(sb2, this.ifb, AbstractJsonLexerKt.END_OBJ);
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        /* renamed from: zb, reason: merged with bridge method [inline-methods] */
        public sya.ycx ycx() {
            dj();
            sya.ycx ycxVar = new sya.ycx((int) this.ycx, (int) this.f22723zb);
            ycxVar.ok((int) (this.htf ? this.f22717lt : this.lud));
            ycxVar.xkz((int) (this.thx ? this.f22722ul : this.lud));
            ycxVar.ea((int) (this.wwx ? this.fby : this.lud));
            ycxVar.ry((int) (this.f22720tn ? this.f22716jw : this.lud));
            ycxVar.ycx(this.f22645hf);
            ycxVar.lud(this.f22644av);
            ycxVar.zb(this.tru);
            ycxVar.sya(this.bhi);
            ycxVar.dy(this.sya);
            ycxVar.wie(this.f22711dj);
            if (this.dwi) {
                ycxVar.dj(this.rmf);
            }
            ycxVar.lt(this.aeu);
            if (this.oby) {
                ycxVar.ul(this.f22646xz);
            }
            if (this.nji) {
                ycxVar.jw(this.rmy);
            }
            if (this.dc) {
                ycxVar.fby(this.kgy);
            }
            if (this.sz) {
                ycxVar.jc(this.ifb);
            }
            if (this.f22647yi && sya()) {
                float f11 = this.yzp;
                if (f11 > 0.0f) {
                    ycxVar.syc(f11);
                    ycxVar.sya(0.0f);
                    ycxVar.zb(0.0f);
                }
            }
            return ycxVar;
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        public void ycx(Context context, String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            super.ycx(context, str, str2);
            str.getClass();
            switch (str) {
                case "flexBasis":
                    this.dwi = true;
                    float fYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                    this.rmf = fYcx;
                    this.rmf = fby.ycx(context, fYcx);
                    break;
                case "bottom":
                    this.nji = true;
                    this.rmy = (int) fby.ycx(context, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0));
                    break;
                case "top":
                    this.oby = true;
                    this.f22646xz = (int) fby.ycx(context, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0));
                    break;
                case "left":
                    this.dc = true;
                    this.kgy = (int) fby.ycx(context, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0));
                    break;
                case "order":
                    this.f22645hf = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1);
                    break;
                case "ratio":
                    this.f22647yi = true;
                    this.yzp = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                    break;
                case "right":
                    this.sz = true;
                    this.ifb = (int) fby.ycx(context, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0));
                    break;
                case "position":
                    this.aeu = ry.ycx(str2).ycx();
                    break;
                case "flexShrink":
                    this.bhi = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                    break;
                case "flexGrow":
                    this.tru = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                    break;
                case "alignSelf":
                    this.f22644av = com.bytedance.adsdk.ugeno.yoga.ycx.ycx(str2).ycx();
                    break;
            }
        }
    }

    public ycx(Context context) {
        super(context);
        this.f22640qt = lud.ROW;
        this.f22641te = xkz.NO_WRAP;
        this.f22638nc = lt.FLEX_START;
        com.bytedance.adsdk.ugeno.yoga.ycx ycxVar = com.bytedance.adsdk.ugeno.yoga.ycx.STRETCH;
        this.vbt = ycxVar;
        this.f22639pg = ycxVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void bhi() {
        ImageView.ScaleType scaleType;
        if (this.dc) {
            com.bytedance.adsdk.ugeno.lt.ycx().zb().ycx(this.f22665jw, this.dwi, new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.yoga.zb.ycx.1
                @Override // com.bytedance.adsdk.ugeno.zb.ycx
                public void ycx(Bitmap bitmap) {
                    if (bitmap == null) {
                        if (((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl != null) {
                            com.bytedance.adsdk.ugeno.core.lt unused = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl;
                            String unused2 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).dwi;
                            return;
                        }
                        return;
                    }
                    if (((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl != null) {
                        com.bytedance.adsdk.ugeno.core.lt unused3 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl;
                        String unused4 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).dwi;
                    }
                    final Bitmap bitmapYcx = fby.ycx(((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).f22701zb, bitmap, (int) ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).nji);
                    if (bitmapYcx != null) {
                        fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.yoga.zb.ycx.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ycx.this.ycx(new BitmapDrawable(bitmapYcx));
                            }
                        });
                    }
                }
            });
            return;
        }
        com.bytedance.adsdk.ugeno.jc.dj.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.dj.ycx(this.f22701zb);
        com.bytedance.adsdk.ugeno.lt.ycx().zb().ycx(this.f22665jw, this.dwi, ycxVar, this.lud.getWidth(), this.lud.getHeight(), new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.yoga.zb.ycx.2
            @Override // com.bytedance.adsdk.ugeno.zb.ycx
            public void ycx(Bitmap bitmap) {
                if (bitmap == null) {
                    if (((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl != null) {
                        com.bytedance.adsdk.ugeno.core.lt unused = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl;
                        String unused2 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).dwi;
                        return;
                    }
                    return;
                }
                if (((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl != null) {
                    com.bytedance.adsdk.ugeno.core.lt unused3 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).vyl;
                    String unused4 = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).dwi;
                }
            }
        });
        if (!this.sz || (scaleType = this.oby) == ImageView.ScaleType.FIT_XY) {
            ycxVar.setScaleType(ImageView.ScaleType.FIT_XY);
        } else {
            ycxVar.setScaleType(scaleType);
        }
        ycxVar.setCornerRadius(this.f22698yi);
        sya.ycx ycxVar2 = new sya.ycx(-1, -1);
        ycxVar2.lt(ry.ABSOLUTE.ycx());
        ycxVar2.ul(0.0f);
        ycxVar2.fby(0.0f);
        T t6 = this.lud;
        if (t6 instanceof sya) {
            ((sya) t6).addView(ycxVar, 0, ycxVar2);
            ycx(ycxVar);
        }
    }

    public lud uz() {
        return this.f22640qt;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public C0023ycx jc() {
        return new C0023ycx(this);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public sya ycx() {
        sya syaVar = new sya(this.f22701zb);
        syaVar.ycx(this);
        this.f22637ci = syaVar.getYogaNode();
        return syaVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void xkz() {
        if (this.aeu) {
            this.f22637ci.zb(dj.ALL, this.f22661hf);
        }
        if (this.f22697xz) {
            this.f22637ci.zb(dj.LEFT, this.tru);
        }
        if (this.rmy) {
            this.f22637ci.zb(dj.RIGHT, this.bhi);
        }
        if (this.kgy) {
            this.f22637ci.zb(dj.TOP, this.f22651av);
        }
        if (this.ifb) {
            this.f22637ci.zb(dj.BOTTOM, this.rmf);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        this.f22637ci.ycx(this.f22640qt);
        this.f22637ci.ycx(this.f22641te);
        this.f22637ci.ycx(this.f22638nc);
        this.f22637ci.ycx(this.vbt);
        this.f22637ci.sya(this.f22639pg);
        this.f22637ci.ycx(true);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(Drawable drawable) {
        ImageView.ScaleType scaleType;
        com.bytedance.adsdk.ugeno.jc.dj.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.dj.ycx(this.f22701zb);
        ycxVar.setImageDrawable(drawable);
        if (this.sz && (scaleType = this.oby) != ImageView.ScaleType.FIT_XY) {
            ycxVar.setScaleType(scaleType);
        } else {
            ycxVar.setScaleType(ImageView.ScaleType.FIT_XY);
        }
        ycxVar.setCornerRadius(this.f22698yi);
        sya.ycx ycxVar2 = new sya.ycx(-1, -1);
        ycxVar2.lt(ry.ABSOLUTE.ycx());
        ycxVar2.ul(0.0f);
        ycxVar2.fby(0.0f);
        T t6 = this.lud;
        if (t6 instanceof sya) {
            ((sya) t6).addView(ycxVar, 0, ycxVar2);
            ycx(ycxVar);
        }
    }

    private void ycx(final com.bytedance.adsdk.ugeno.jc.dj.ycx ycxVar) {
        this.lud.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.bytedance.adsdk.ugeno.yoga.zb.ycx.3
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                jc jcVarYcx;
                if (((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud == null || (jcVarYcx = ((sya) ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud).ycx(ycxVar)) == null) {
                    return;
                }
                int width = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud.getWidth();
                jcVarYcx.dj(width);
                int height = ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud.getHeight();
                jcVarYcx.lt(height);
                ycxVar.setCornerRadius(((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).f22698yi);
                ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud.requestLayout();
                if (width > 0 || height > 0) {
                    ((com.bytedance.adsdk.ugeno.zb.sya) ycx.this).lud.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
            }
        });
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        super.ycx(syaVar);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, ViewGroup.LayoutParams layoutParams) {
        if (syaVar == null) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.add(syaVar);
        View viewEa = syaVar.ea();
        if (viewEa != null) {
            ((sya) this.lud).addView(viewEa, layoutParams);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "alignItems":
                this.vbt = com.bytedance.adsdk.ugeno.yoga.ycx.ycx(str2);
                break;
            case "flexDirection":
                this.f22640qt = lud.ycx(str2);
                break;
            case "alignContent":
                this.f22639pg = com.bytedance.adsdk.ugeno.yoga.ycx.ycx(str2);
                break;
            case "flexWrap":
                this.f22641te = xkz.ycx(str2);
                break;
            case "justifyContent":
                this.f22638nc = lt.ycx(str2);
                break;
        }
    }
}
