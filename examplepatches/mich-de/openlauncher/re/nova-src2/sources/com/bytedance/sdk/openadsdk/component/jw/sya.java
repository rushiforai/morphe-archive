package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.pmi;
import com.bytedance.sdk.openadsdk.core.widget.wie;

/* loaded from: classes2.dex */
public abstract class sya extends com.bytedance.sdk.openadsdk.core.lt.ul {

    /* renamed from: dj, reason: collision with root package name */
    PAGLogoView f24789dj;

    /* renamed from: ea, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.lt.fby f24790ea;
    final ul fby;

    /* renamed from: jc, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.lt.fby f24791jc;

    /* renamed from: jw, reason: collision with root package name */
    pmi f24792jw;

    /* renamed from: lt, reason: collision with root package name */
    pmi f24793lt;
    com.bytedance.sdk.openadsdk.core.lt.fby lud;

    /* renamed from: ok, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.widget.sya f24794ok;
    com.bytedance.sdk.openadsdk.core.lt.dj sya;

    /* renamed from: ul, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.lt.fby f24795ul;
    com.bytedance.sdk.openadsdk.core.lt.dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.lt.sya f24796zb;

    public sya(Context context) {
        super(context);
        this.fby = new ul(context);
    }

    public abstract com.bytedance.sdk.openadsdk.core.lt.dj getAdIconView();

    public PAGLogoView getAdLogo() {
        return this.f24789dj;
    }

    public abstract com.bytedance.sdk.openadsdk.core.lt.fby getAdTitleTextView();

    public com.bytedance.sdk.openadsdk.core.lt.dj getBackImage() {
        return this.ycx;
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getClickButton() {
        return this.lud;
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getContent() {
        return this.f24790ea;
    }

    public com.bytedance.sdk.openadsdk.core.widget.sya getDspAdChoice() {
        return this.f24794ok;
    }

    public pmi getHostAppIcon() {
        return this.f24793lt;
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getHostAppName() {
        return this.f24795ul;
    }

    public pmi getIconOnlyView() {
        return this.f24792jw;
    }

    public com.bytedance.sdk.openadsdk.core.lt.dj getImageView() {
        return this.sya;
    }

    public com.bytedance.sdk.openadsdk.core.lt.lud getOverlayLayout() {
        return null;
    }

    public abstract wie getScoreBar();

    public com.bytedance.sdk.openadsdk.core.lt.fby getTitle() {
        return this.f24791jc;
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getTopCountDown() {
        ul ulVar = this.fby;
        if (ulVar != null) {
            return ulVar.getTopCountDown();
        }
        return null;
    }

    public View getTopDisLike() {
        ul ulVar = this.fby;
        if (ulVar != null) {
            return ulVar.getTopDislike();
        }
        return null;
    }

    public com.bytedance.sdk.openadsdk.core.lt.dj getTopSkip() {
        ul ulVar = this.fby;
        if (ulVar != null) {
            return ulVar.getTopSkip();
        }
        return null;
    }

    public abstract View getUserInfo();

    public com.bytedance.sdk.openadsdk.core.lt.sya getVideoContainer() {
        return this.f24796zb;
    }
}
