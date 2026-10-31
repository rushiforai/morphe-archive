package com.bytedance.sdk.openadsdk.wwx.ycx;

import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.ry.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final FrameLayout f27400dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f27401lt;
    private FrameLayout lud;
    private ul sya;

    /* renamed from: zb, reason: collision with root package name */
    private volatile boolean f27402zb;

    public zb(Context context, tn tnVar, int i5, boolean z11, FrameLayout frameLayout, String str) {
        super(context, tnVar, i5, z11, frameLayout);
        this.f27400dj = frameLayout;
        this.f27401lt = str;
        zb(false);
        int iDj = dc.dj(context);
        int iLt = dc.lt(context);
        if (i5 == 1) {
            if (iDj <= iLt) {
                this.ycx.layout(0, 0, iDj, iLt);
                return;
            }
        } else {
            if (i5 != 2) {
                return;
            }
            if (iDj > iLt) {
                this.ycx.layout(0, 0, iDj, iLt);
                return;
            }
        }
        this.ycx.layout(0, 0, iLt, iDj);
    }

    public void fby() {
        super.ycx(true, new ul() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.zb.1
            @Override // com.bytedance.sdk.openadsdk.ry.ul
            public void ycx() {
                if (zb.this.sya != null) {
                    zb.this.sya.ycx();
                } else {
                    zb.this.f27402zb = true;
                }
            }
        });
    }

    public String jw() {
        return this.f27401lt;
    }

    public void ycx(FrameLayout frameLayout, ul ulVar) {
        this.lud = frameLayout;
        frameLayout.addView(this.f27400dj);
        this.sya = ulVar;
        if (this.f27402zb) {
            this.sya.ycx();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.wwx.ycx.ycx
    public void ycx() throws JSONException {
        this.lud.setVisibility(0);
        super.ycx();
    }
}
