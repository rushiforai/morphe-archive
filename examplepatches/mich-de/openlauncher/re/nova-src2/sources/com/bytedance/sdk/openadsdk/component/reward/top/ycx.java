package com.bytedance.sdk.openadsdk.component.reward.top;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public interface ycx<T extends View> {
    void clickSkip();

    void clickSound(String str);

    View getCloseBackupButton();

    View getCloseButton();

    void setCountDownFor1InN(CharSequence charSequence, int i5);

    void setListener(zb zbVar);

    void setShowDislike(boolean z11);

    void setShowEndCardNextAd(boolean z11, tn tnVar);

    void setShowPlayableNextAd(boolean z11, tn tnVar);

    void setShowSkip(boolean z11);

    void setShowSound(boolean z11);

    void setSkipEnable(boolean z11);

    void setSkipInvisiable();

    void setSkipText(CharSequence charSequence);

    void setSoundMute(boolean z11);

    void setTime(CharSequence charSequence, CharSequence charSequence2);

    void showCloseButton();

    void showCountDownText();

    void showSkipButton();
}
