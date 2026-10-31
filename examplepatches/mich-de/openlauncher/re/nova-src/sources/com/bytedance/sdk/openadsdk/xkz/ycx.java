package com.bytedance.sdk.openadsdk.xkz;

import android.content.Context;
import android.graphics.Color;
import android.text.Html;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.lt.sya {
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private fby f27420zb;

    public ycx(Context context) {
        super(context);
        this.ycx = context;
        ycx();
    }

    private void ycx() {
        setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        setId(wie.f27238uu);
        setBackgroundColor(-1);
        setClickable(true);
        setFocusable(true);
        this.f27420zb = new fby(this.ycx);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 17;
        this.f27420zb.setLayoutParams(layoutParams);
        this.f27420zb.setTextColor(Color.argb(166, 0, 0, 0));
        this.f27420zb.setTextSize(16.0f);
        this.f27420zb.setMaxLines(3);
        this.f27420zb.setEllipsize(TextUtils.TruncateAt.END);
        addView(this.f27420zb);
    }

    public void setPrivacyText(String str) {
        try {
            if (this.f27420zb == null || TextUtils.isEmpty(str)) {
                return;
            }
            this.f27420zb.setText(Html.fromHtml(str, 63));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArts", "cs8PtwyofciNZtZEgwS0", "SOs5pRG1f8aDU+NYlAU=", 66);
            e3.getMessage();
            this.f27420zb.setText("You agree to the Terms of Use and Privacy Policy.");
        }
    }
}
