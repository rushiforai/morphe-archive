/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;

import app.fakh.extension.shared.Features;

/**
 * The note under a comment by Copilot that it can make mistakes, which takes no room with the switch on. The patch puts
 * it in the note's layout in place of the plain text view.
 */
@SuppressWarnings("unused")
public final class CopilotDisclaimerView extends TextView {
    /** Called by the layout inflater. */
    public CopilotDisclaimerView(Context context, AttributeSet attributes) {
        super(context, attributes);
    }

    @Override
    protected void onMeasure(int width, int height) {
        if (Features.on("fakh_hide_copilot_note")) setMeasuredDimension(0, 0);
        else super.onMeasure(width, height);
    }
}
