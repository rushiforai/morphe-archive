package io.sentry.android.core.internal.util;

import android.view.KeyEvent;

/* loaded from: classes4.dex */
public abstract class e {
    public static String a(KeyEvent.Callback callback) {
        if (callback == null) {
            return null;
        }
        String canonicalName = callback.getClass().getCanonicalName();
        return canonicalName != null ? canonicalName : callback.getClass().getSimpleName();
    }
}
