/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/


package app.morphe.extension.instagram.patches.overflowMenuButton.reels;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.view.View;
import android.content.Context;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.constants.UI;

import app.morphe.extension.instagram.patches.overflowMenuButton.reels.buttons.ReelButton;
import app.morphe.extension.instagram.patches.overflowMenuButton.reels.buttons.DownloadButton;

public class AddReelButton {

    private static void addReelButton(Context context, ReelOverflowButton reelOverflowButton, Object helperObject){
        try {
                int icon = ResourceUtils.getIdentifier(ResourceType.DRAWABLE,reelOverflowButton.drawableResId);

                Class<?> clazz = helperObject.getClass();
                Method method = clazz.getDeclaredMethod(
                        "A01",
                        Context.class,
                        View.OnClickListener.class,
                        String.class,
                        int.class
                );

                method.setAccessible(true);

                method.invoke(helperObject, context, reelOverflowButton.reelButton, reelOverflowButton.buttonText, icon);

        } catch (Exception e) {
            Logger.printException(() -> "Error at addReelButton",e);
        }
    }

    public static void addDownloadButton(Context context, Object helperObject, Object mediaObject, int currentMediaIndex){
        String icon = UI.DRAWABLE_DOWNLOAD_ICON;
        ReelButton reelButton = new DownloadButton(context, mediaObject, currentMediaIndex);
        String DOWNLOAD_BUTTON_TEXT = str("piko_download_options");
        if(Pref.enableDirectDownload()){
            DOWNLOAD_BUTTON_TEXT = str("piko_category_download_media");
        }

        ReelOverflowButton reelOverflowButton = new ReelOverflowButton(icon,reelButton,DOWNLOAD_BUTTON_TEXT);

        AddReelButton.addReelButton(context,reelOverflowButton,helperObject);
    }

    /**
     * One sheet's worth of added rows, keyed on the sheet builder the app hands us.
     *
     * The reel menu calls its per-option method once for every row it is about to draw, so the
     * download row is added on the first of those calls and skipped for the rest. A new sheet
     * brings a new builder instance, which is what makes it appear again next time.
     */
    // Weak: only compared against, and it would otherwise keep the last sheet alive.
    private static java.lang.ref.WeakReference<Object> lastSheetHelper = new java.lang.ref.WeakReference<>(null);

    /** Field on the reel menu helper holding the media. Rewritten by the patch. */
    private static String reelMediaFieldName() { return "fieldName"; }

    public static void addReelMenuDownloadRow(Object moreOptionsHelper, Context context, Object sheetHelper) {
        try {
            if (sheetHelper == null || sheetHelper == lastSheetHelper.get()) return;
            lastSheetHelper = new java.lang.ref.WeakReference<>(sheetHelper);

            if (!Pref.enableDownload()) return;

            Object media = new Entity().getField(moreOptionsHelper, reelMediaFieldName());
            if (media == null) return;

            AddReelButton.addDownloadButton(context, sheetHelper, media, 0);
        } catch (Exception e) {
            Logger.printException(() -> "Error at addReelMenuDownloadRow", e);
        }
    }
}
