package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.Button;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class fby extends Button {
    public fby(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        setId(com.bytedance.sdk.openadsdk.utils.wie.f27203jp);
        Context context = getContext();
        setLayoutParams(new ViewGroup.LayoutParams(-1, dc.zb(context, 48.0f)));
        setBackground(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_browser_download_selector"));
        setText(com.bytedance.sdk.component.utils.wwx.ycx(context, "tt_video_download_apk"));
        setTextColor(-1);
        setTextSize(2, 16.0f);
    }
}
