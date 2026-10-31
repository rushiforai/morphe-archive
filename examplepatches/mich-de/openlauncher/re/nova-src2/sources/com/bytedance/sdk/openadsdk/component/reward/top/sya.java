package com.bytedance.sdk.openadsdk.component.reward.top;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class sya extends View implements ycx<sya> {
    private ycx<sya> ycx;

    public sya(Context context) {
        this(context, null);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void clickSkip() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.clickSkip();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void clickSound(String str) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.clickSound(str);
        }
    }

    @Override // android.view.View
    public void dispatchDraw(Canvas canvas) {
    }

    @Override // android.view.View
    @SuppressLint({"MissingSuperCall"})
    public void draw(Canvas canvas) {
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public View getCloseBackupButton() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.getCloseBackupButton();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public View getCloseButton() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            return ycxVar.getCloseButton();
        }
        return null;
    }

    public View getITopLayout() {
        Object obj = this.ycx;
        if (obj instanceof View) {
            return (View) obj;
        }
        return null;
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setCountDownFor1InN(CharSequence charSequence, int i5) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setCountDownFor1InN(charSequence, i5);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setListener(zb zbVar) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setListener(zbVar);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowDislike(boolean z11) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setShowDislike(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowEndCardNextAd(boolean z11, tn tnVar) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setShowEndCardNextAd(z11, tnVar);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowPlayableNextAd(boolean z11, tn tnVar) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setShowPlayableNextAd(z11, tnVar);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowSkip(boolean z11) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setShowSkip(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowSound(boolean z11) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setShowSound(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipEnable(boolean z11) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setSkipEnable(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipInvisiable() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setSkipInvisiable();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipText(CharSequence charSequence) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setSkipText(charSequence);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSoundMute(boolean z11) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setSoundMute(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setTime(CharSequence charSequence, CharSequence charSequence2) {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.setTime(charSequence, charSequence2);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showCloseButton() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.showCloseButton();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showCountDownText() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.showCountDownText();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showSkipButton() {
        ycx<sya> ycxVar = this.ycx;
        if (ycxVar != null) {
            ycxVar.showSkipButton();
        }
    }

    public sya ycx(tn tnVar) {
        if (this.ycx == null) {
            TopLayoutDislike2 topLayoutDislike2M146load = new TopLayoutDislike2(getContext()).load(tnVar);
            this.ycx = topLayoutDislike2M146load;
            ViewParent parent = getParent();
            if (parent != null && (parent instanceof ViewGroup)) {
                ycx(topLayoutDislike2M146load, (ViewGroup) parent);
            }
        }
        return this;
    }

    public sya(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public sya(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        setVisibility(8);
        setWillNotDraw(true);
    }

    private void ycx(View view, ViewGroup viewGroup) {
        int iIndexOfChild = viewGroup.indexOfChild(this);
        viewGroup.removeViewInLayout(this);
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams != null) {
            viewGroup.addView(view, iIndexOfChild, layoutParams);
        } else {
            viewGroup.addView(view, iIndexOfChild);
        }
        if (view != null) {
            view.setId(wie.yfd);
        }
    }
}
