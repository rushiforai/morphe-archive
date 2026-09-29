package io.github.bakwudo.uyu.extension.danmaku;

import android.view.View;

/**
 * Reads Twitch's view delegates. The field holding the root view is obfuscated, so the Danmaku
 * comments patch replaces the body of this method.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class ViewDelegates {
    private ViewDelegates() {
    }

    /**
     * @param viewDelegate A tv.twitch.android.core.mvp.viewdelegate.BaseViewDelegate.
     * @return Its root view, or null if the object is not a view delegate.
     */
    public static View rootView(Object viewDelegate) {
        return null;
    }
}
