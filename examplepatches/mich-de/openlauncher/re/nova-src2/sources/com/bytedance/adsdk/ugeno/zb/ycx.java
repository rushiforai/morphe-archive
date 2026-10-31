package com.bytedance.adsdk.ugeno.zb;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.fby.fby;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx<E extends ViewGroup> extends sya {
    protected List<sya<View>> ycx;

    public ycx(Context context) {
        this(context, null);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public sya dj(String str) {
        sya<T> syaVarFby;
        if (!TextUtils.isEmpty(str) && ok(str) != null) {
            return this;
        }
        for (sya<View> syaVar : this.ycx) {
            if (syaVar != null && (syaVarFby = syaVar.fby(str)) != 0) {
                return syaVarFby;
            }
        }
        return null;
    }

    public C0024ycx jc() {
        return new C0024ycx(this);
    }

    public List<sya<View>> jw() {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public sya sya(String str) {
        sya<T> syaVarUl;
        if (!TextUtils.isEmpty(str) && TextUtils.equals(str, this.f22674ok) && this.f22662iq == 0) {
            return this;
        }
        if (this.f22662iq != 0) {
            return null;
        }
        for (sya<View> syaVar : this.ycx) {
            if (syaVar != null && (syaVarUl = syaVar.ul(str)) != 0) {
                return syaVarUl;
            }
        }
        return null;
    }

    public void ycx(sya syaVar) {
        if (syaVar == null) {
            return;
        }
        this.ycx.add(syaVar);
        View viewEa = syaVar.ea();
        if (viewEa != null) {
            ((ViewGroup) this.lud).addView(viewEa);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
    }

    public ycx(Context context, ycx ycxVar) {
        super(context, ycxVar);
        this.ycx = new ArrayList();
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public sya zb(String str) {
        sya<T> syaVarLt;
        if (!TextUtils.isEmpty(str) && TextUtils.equals(str, this.f22674ok)) {
            return this;
        }
        for (sya<View> syaVar : this.ycx) {
            if (syaVar != null && (syaVarLt = syaVar.lt(str)) != 0) {
                return syaVarLt;
            }
        }
        return null;
    }

    public void ycx(sya syaVar, ViewGroup.LayoutParams layoutParams) {
        if (syaVar == null) {
            return;
        }
        this.ycx.add(syaVar);
        View viewEa = syaVar.ea();
        if (viewEa != null) {
            ((ViewGroup) this.lud).addView(viewEa, layoutParams);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public sya ycx(String str) {
        sya<T> syaVarLud;
        if (!TextUtils.isEmpty(str) && TextUtils.equals(str, this.f22659ea)) {
            return this;
        }
        for (sya<View> syaVar : this.ycx) {
            if (syaVar != null && (syaVarLud = syaVar.lud(str)) != 0) {
                return syaVarLud;
            }
        }
        return null;
    }

    /* renamed from: com.bytedance.adsdk.ugeno.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0024ycx {

        /* renamed from: dv, reason: collision with root package name */
        protected ViewGroup.LayoutParams f22712dv;

        /* renamed from: dy, reason: collision with root package name */
        protected boolean f22713dy;

        /* renamed from: ea, reason: collision with root package name */
        protected float f22714ea;
        protected float fby;
        protected boolean htf;

        /* renamed from: jc, reason: collision with root package name */
        protected float f22715jc;

        /* renamed from: jw, reason: collision with root package name */
        protected float f22716jw;

        /* renamed from: lt, reason: collision with root package name */
        protected float f22717lt;
        protected float lud;

        /* renamed from: ok, reason: collision with root package name */
        protected float f22718ok;
        protected ycx oty;
        protected boolean pmi;

        /* renamed from: ry, reason: collision with root package name */
        protected float f22719ry;
        protected boolean syc;
        protected boolean thx;

        /* renamed from: tn, reason: collision with root package name */
        protected boolean f22720tn;

        /* renamed from: uh, reason: collision with root package name */
        protected boolean f22721uh;

        /* renamed from: ul, reason: collision with root package name */
        protected float f22722ul;
        protected boolean wie;
        protected boolean wwx;
        protected float xkz;
        protected float ycx = -2.0f;

        /* renamed from: zb, reason: collision with root package name */
        protected float f22723zb = -2.0f;
        protected float sya = 0.0f;

        /* renamed from: dj, reason: collision with root package name */
        protected float f22711dj = 0.0f;

        public C0024ycx(ycx ycxVar) {
            this.oty = ycxVar;
        }

        public String toString() {
            return "LayoutParams{mWidth=" + this.ycx + ", mHeight=" + this.f22723zb + ", mMargin=" + this.lud + ", mMarginLeft=" + this.f22717lt + ", mMarginRight=" + this.f22722ul + ", mMarginTop=" + this.fby + ", mMarginBottom=" + this.f22716jw + ", mParams=" + this.f22712dv + AbstractJsonLexerKt.END_OBJ;
        }

        public void ycx(Context context, String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            str.getClass();
            switch (str) {
                case "paddingLeft":
                    this.f22714ea = fby.ycx(context, str2);
                    this.f22713dy = true;
                    break;
                case "minWidth":
                    this.sya = fby.ycx(context, str2);
                    break;
                case "height":
                    if (!TextUtils.equals(str2, "match_parent")) {
                        if (!TextUtils.equals(str2, "wrap_content")) {
                            this.f22723zb = fby.ycx(context, str2);
                            break;
                        } else {
                            this.f22723zb = -2.0f;
                            break;
                        }
                    } else {
                        this.f22723zb = -1.0f;
                        break;
                    }
                case "margin":
                    this.lud = fby.ycx(context, str2);
                    break;
                case "marginTop":
                    this.fby = fby.ycx(context, str2);
                    this.wwx = true;
                    break;
                case "padding":
                    this.f22715jc = fby.ycx(context, str2);
                    this.syc = true;
                    break;
                case "marginBottom":
                    this.f22716jw = fby.ycx(context, str2);
                    this.f22720tn = true;
                    break;
                case "minHeight":
                    this.f22711dj = fby.ycx(context, str2);
                    break;
                case "paddingTop":
                    this.f22718ok = fby.ycx(context, str2);
                    this.pmi = true;
                    break;
                case "width":
                    if (!TextUtils.equals(str2, "match_parent")) {
                        if (!TextUtils.equals(str2, "wrap_content")) {
                            this.ycx = fby.ycx(context, str2);
                            break;
                        } else {
                            this.ycx = -2.0f;
                            break;
                        }
                    } else {
                        this.ycx = -1.0f;
                        break;
                    }
                case "paddingBottom":
                    this.xkz = fby.ycx(context, str2);
                    this.f22721uh = true;
                    break;
                case "paddingRight":
                    this.f22719ry = fby.ycx(context, str2);
                    this.wie = true;
                    break;
                case "marginRight":
                    this.f22722ul = fby.ycx(context, str2);
                    this.thx = true;
                    break;
                case "marginLeft":
                    this.f22717lt = fby.ycx(context, str2);
                    this.htf = true;
                    break;
            }
        }

        public ViewGroup.LayoutParams ycx() {
            ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams((int) this.ycx, (int) this.f22723zb);
            marginLayoutParams.leftMargin = (int) (this.htf ? this.f22717lt : this.lud);
            marginLayoutParams.rightMargin = (int) (this.thx ? this.f22722ul : this.lud);
            marginLayoutParams.topMargin = (int) (this.wwx ? this.fby : this.lud);
            marginLayoutParams.bottomMargin = (int) (this.f22720tn ? this.f22716jw : this.lud);
            return marginLayoutParams;
        }
    }
}
