package com.rov3r.extension.vsco;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageButton;

/** Download action inflated directly with VSCO's native layouts. */
@SuppressWarnings("unused")
public final class MorpheDownloadButton extends ImageButton {
    public MorpheDownloadButton(Context context) {
        super(context);
        initialize();
    }

    public MorpheDownloadButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public MorpheDownloadButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    private void initialize() {
        DownloadPostsPatch.bindInflatedDownloadButton(this);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        DownloadPostsPatch.bindInflatedDownloadButton(this);
        if (getParent() instanceof android.view.View) {
            PatchSettings.applyBeforeDraw(getContext(), (android.view.View) getParent());
        }
    }
}
