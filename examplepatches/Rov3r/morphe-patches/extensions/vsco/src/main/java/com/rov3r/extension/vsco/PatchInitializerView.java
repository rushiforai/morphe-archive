package com.rov3r.extension.vsco;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

/** Zero-sized layout marker that applies preferences before its parent is drawn. */
@SuppressWarnings("unused")
public final class PatchInitializerView extends View {
    public PatchInitializerView(Context context) {
        super(context);
        initialize();
    }

    public PatchInitializerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public PatchInitializerView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    private void initialize() {
        setVisibility(GONE);
        setWillNotDraw(true);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (getParent() instanceof View) {
            PatchSettings.applyBeforeDraw(getContext(), (View) getParent());
        }
    }
}
