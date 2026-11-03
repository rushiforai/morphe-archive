/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.share;

import android.app.Activity;
import android.content.Context;
import android.widget.ImageView;

/**
 * The share sheet actions HushPine builds on PineDrama's native Report carrier: Save cover (Advanced
 * downloads) and Make sticker (Create stickers). The
 * carrier's key, label, click and icon hooks land here once and each action answers only for the
 * carriers it built, so a carrier none of them owns keeps every original Report instruction.
 */
public final class OwnedShareActions {
    private OwnedShareActions() {}

    public static boolean owns(Object action) {
        return ShareSaveCover.owns(action) || ShareMakeSticker.owns(action);
    }

    public static String key(Object action) {
        String key = ShareSaveCover.key(action);
        return key != null ? key : ShareMakeSticker.key(action);
    }

    public static String label(Object action) {
        String label = ShareSaveCover.label(action);
        return label != null ? label : ShareMakeSticker.label(action);
    }

    public static boolean click(Object action, Context context, Object sharePackage) {
        return ShareSaveCover.click(action, context, sharePackage)
                || ShareMakeSticker.click(action, context, sharePackage);
    }

    /**
     * The key a native action binder looks up in its framed-icon list, read for that test alone.
     * PineDrama draws its themed circle and icon only for a key on the list and a bare drawable for
     * any other, so an owned carrier answers Report's here: it gets Report's frame, and
     * {@link #bindIcon} puts its own glyph inside it. Every other read keeps the carrier's key.
     */
    public static String framedKey(Object action, String key) {
        return owns(action) ? FRAMED_KEY : key;
    }

    /** The native carrier's own key, which PineDrama's framed-icon list holds. */
    static final String FRAMED_KEY = "report";

    public static void bindIcon(Object action, ImageView image) {
        ShareSaveCover.bindIcon(action, image);
        ShareMakeSticker.bindIcon(action, image);
    }

    /** Replaced with the reviewed native Report carrier constructor by the patch. */
    static Object newAction(Activity activity, Object aweme) {
        return null;
    }
}
