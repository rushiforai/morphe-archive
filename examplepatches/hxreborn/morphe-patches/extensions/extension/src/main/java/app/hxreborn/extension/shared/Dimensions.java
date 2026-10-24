/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hxreborn.extension.shared;

import android.content.Context;
import android.util.TypedValue;

public final class Dimensions {

    private Dimensions() {

    }

    public static int dp(Context context, float value) {
        return Math.round(dpExact(context, value));
    }

    public static float dpExact(Context context, float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

    public static int sp(Context context, float value) {
        return Math.round(spExact(context, value));
    }

    public static float spExact(Context context, float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, value,
                context.getResources().getDisplayMetrics());
    }

}
