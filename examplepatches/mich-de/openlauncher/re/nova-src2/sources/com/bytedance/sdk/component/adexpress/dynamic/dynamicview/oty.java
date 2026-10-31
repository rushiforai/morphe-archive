package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.TextView;
import b.c9;
import com.amplitude.core.events.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.text.DecimalFormat;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class oty extends lt {
    public oty(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.fby += 6;
        if (this.f23413ok.dwi()) {
            com.bytedance.sdk.component.adexpress.lt.ycx ycxVar = new com.bytedance.sdk.component.adexpress.lt.ycx(context, this.f23413ok.ul(), this.f23413ok.lud(), 1, this.f23413ok.fby());
            this.syc = ycxVar;
            ycxVar.setMaxLines(1);
        } else {
            TextView textView = new TextView(context);
            this.syc = textView;
            textView.setIncludeFontPadding(false);
        }
        this.syc.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
    }

    private void ea() {
        if (this.syc instanceof com.bytedance.sdk.component.adexpress.lt.ycx) {
            String text = getText();
            ArrayList arrayList = new ArrayList();
            try {
                JSONArray jSONArray = new JSONArray(text);
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    arrayList.add(jSONArray.optString(i5));
                }
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOFUsNrhRS3", "S/wilgaveuaOQ9pcmBivJm/rNYE=", 282);
                arrayList.add(text);
            }
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setMaxLines(1);
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setTextColor(this.f23413ok.ul());
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setTextSize(this.f23413ok.lud());
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setAnimationText(arrayList);
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setAnimationType(this.f23413ok.nji());
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).setAnimationDuration(this.f23413ok.oby() * 1000);
            ((com.bytedance.sdk.component.adexpress.lt.ycx) this.syc).ycx();
        }
    }

    private void jc() {
        int iYcx;
        if (c9.u(this.f23414ry, Plan.AMP_PLAN_SOURCE) || c9.u(this.f23414ry, "title") || c9.u(this.f23414ry, "text_star")) {
            int[] iArrZb = com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb(this.f23413ok.lt(), this.f23413ok.lud(), true);
            int iYcx2 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23413ok.zb());
            int iYcx3 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23413ok.sya());
            int iYcx4 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23413ok.dj());
            int iYcx5 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23413ok.ycx());
            int iMin = Math.min(iYcx2, iYcx5);
            if (c9.u(this.f23414ry, Plan.AMP_PLAN_SOURCE) && (iYcx = ((this.fby - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), this.f23413ok.lud()))) - iYcx2) - iYcx5) > 1 && iYcx <= iMin * 2) {
                int i5 = iYcx / 2;
                this.syc.setPadding(iYcx3, iYcx2 - i5, iYcx4, iYcx5 - (iYcx - i5));
                return;
            }
            int i11 = (((iArrZb[1] + iYcx2) + iYcx5) - this.fby) - 2;
            if (i11 <= 1) {
                return;
            }
            if (i11 <= iMin * 2) {
                int i12 = i11 / 2;
                this.syc.setPadding(iYcx3, iYcx2 - i12, iYcx4, iYcx5 - (i11 - i12));
            } else if (i11 > iYcx2 + iYcx5) {
                final int i13 = (i11 - iYcx2) - iYcx5;
                this.syc.setPadding(iYcx3, 0, iYcx4, 0);
                if (i13 <= ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), 1.0f)) + 1) {
                    ((TextView) this.syc).setTextSize(this.f23413ok.lud() - 1.0f);
                } else if (i13 <= (((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), 1.0f)) + 1) * 2) {
                    ((TextView) this.syc).setTextSize(this.f23413ok.lud() - 2.0f);
                } else {
                    post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.oty.1
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                ViewGroup.LayoutParams layoutParams = oty.this.syc.getLayoutParams();
                                oty otyVar = oty.this;
                                layoutParams.height = otyVar.fby + i13;
                                otyVar.syc.setLayoutParams(layoutParams);
                                oty.this.syc.setTranslationY(-i13);
                                ((ViewGroup) oty.this.syc.getParent()).setClipChildren(false);
                                ((ViewGroup) oty.this.syc.getParent().getParent()).setClipChildren(false);
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOFUsNrhRS3bAo=", "Sfsj", 229);
                            }
                        }
                    });
                }
            } else if (iYcx2 > iYcx5) {
                this.syc.setPadding(iYcx3, iYcx2 - (i11 - iMin), iYcx4, iYcx5 - iMin);
            } else {
                this.syc.setPadding(iYcx3, iYcx2 - iMin, iYcx4, iYcx5 - (i11 - iMin));
            }
        }
        if (c9.u(this.f23414ry, "fillButton")) {
            this.syc.setTextAlignment(2);
            ((TextView) this.syc).setGravity(17);
        }
    }

    private boolean ycx() {
        DynamicRootView dynamicRootView = this.xkz;
        return (dynamicRootView == null || dynamicRootView.getRenderRequest() == null || this.xkz.getRenderRequest().jc() == 4) ? false : true;
    }

    public String getText() {
        String strLt = this.f23413ok.lt();
        if (TextUtils.isEmpty(strLt)) {
            if (!com.bytedance.sdk.component.adexpress.dj.zb() && c9.u(this.f23414ry, "text_star")) {
                strLt = "5";
            }
            if (!com.bytedance.sdk.component.adexpress.dj.zb() && c9.u(this.f23414ry, "score-count")) {
                strLt = "6870";
            }
        }
        return (c9.u(this.f23414ry, "title") || c9.u(this.f23414ry, "subtitle")) ? strLt.replace("\n", b.f42142b) : strLt;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() throws NumberFormatException {
        int i5;
        double d5;
        super.jw();
        if (TextUtils.isEmpty(getText())) {
            this.syc.setVisibility(4);
            return true;
        }
        if (this.f23413ok.dwi()) {
            ea();
            return true;
        }
        ((TextView) this.syc).setText(this.f23413ok.lt());
        ((TextView) this.syc).setTextDirection(5);
        this.syc.setTextAlignment(this.f23413ok.fby());
        ((TextView) this.syc).setTextColor(this.f23413ok.ul());
        ((TextView) this.syc).setTextSize(this.f23413ok.lud());
        if (this.f23413ok.wwx()) {
            int iTn = this.f23413ok.tn();
            if (iTn > 0) {
                ((TextView) this.syc).setLines(iTn);
                ((TextView) this.syc).setEllipsize(TextUtils.TruncateAt.END);
            }
        } else {
            ((TextView) this.syc).setMaxLines(1);
            ((TextView) this.syc).setGravity(17);
            ((TextView) this.syc).setEllipsize(TextUtils.TruncateAt.END);
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.f23414ry;
        if (fbyVar != null && fbyVar.jc() != null) {
            if (com.bytedance.sdk.component.adexpress.dj.zb() && ycx() && (c9.u(this.f23414ry, "text_star") || c9.u(this.f23414ry, "score-count") || c9.u(this.f23414ry, "score-count-type-1") || c9.u(this.f23414ry, "score-count-type-2"))) {
                setVisibility(8);
                return true;
            }
            if (c9.u(this.f23414ry, "score-count") || c9.u(this.f23414ry, "score-count-type-2")) {
                try {
                    try {
                        i5 = Integer.parseInt(getText());
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOFUsNrhRS3", "Wv49mRqSaNOJXNJumAisLQ==", Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
                    }
                } catch (NumberFormatException e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOFUsNrhRS3", "Wv49mRqSaNOJXNJumAisLQ==", 100);
                    i5 = -1;
                }
                if (i5 < 0) {
                    if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                        setVisibility(8);
                        return true;
                    }
                    this.syc.setVisibility(0);
                }
                if (TextUtils.equals(this.f23414ry.jc().zb(), "score-count-type-2")) {
                    ((TextView) this.syc).setText(String.format(new DecimalFormat("(###,###,###)").format(i5), Integer.valueOf(i5)));
                    ((TextView) this.syc).setGravity(17);
                    return true;
                }
                ycx((TextView) this.syc, i5, getContext(), "tt_comment_num");
            } else if (c9.u(this.f23414ry, "text_star")) {
                try {
                    d5 = Double.parseDouble(getText());
                } catch (Exception e12) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOFUsNrhRS3", "Wv49mRqSaNOJXNJumAisLQ==", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
                    d5 = -1.0d;
                }
                if (d5 < 0.0d || d5 > 5.0d) {
                    if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                        setVisibility(8);
                        return true;
                    }
                    this.syc.setVisibility(0);
                }
                ((TextView) this.syc).setIncludeFontPadding(false);
                ((TextView) this.syc).setText(String.format("%.1f", Double.valueOf(d5)));
            } else if (TextUtils.equals("privacy-detail", this.f23414ry.jc().zb())) {
                ((TextView) this.syc).setText("Permission list | Privacy policy");
            } else if (c9.u(this.f23414ry, "development-name")) {
                ((TextView) this.syc).setText(com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_text_privacy_development") + getText());
            } else if (c9.u(this.f23414ry, "app-version")) {
                ((TextView) this.syc).setText(com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_text_privacy_app_version") + getText());
            } else {
                ((TextView) this.syc).setText(getText());
            }
            this.syc.setTextAlignment(this.f23413ok.fby());
            ((TextView) this.syc).setGravity(this.f23413ok.jw());
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                jc();
            }
        }
        return true;
    }

    public void ycx(TextView textView, int i5, Context context, String str) {
        textView.setText("(" + String.format(com.bytedance.sdk.component.utils.wwx.ycx(context, str), Integer.valueOf(i5)) + ")");
        if (i5 == -1) {
            textView.setVisibility(8);
        }
    }
}
