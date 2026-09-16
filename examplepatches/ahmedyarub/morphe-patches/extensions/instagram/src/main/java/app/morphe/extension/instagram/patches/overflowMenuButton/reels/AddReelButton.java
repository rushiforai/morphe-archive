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
import app.morphe.extension.instagram.patches.overflowMenuButton.reels.buttons.DebugButton;
import app.morphe.extension.instagram.patches.overflowMenuButton.reels.buttons.InfoButton;
import app.morphe.extension.instagram.patches.overflowMenuButton.reels.buttons.ExternalDownloadButton;

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

    private static void addInfoButton(Context context, Object helperObject, Object mediaObject, int currentMediaIndex){
        String icon = UI.DRAWABLE_BLUB_ICON;
        ReelButton reelButton = new InfoButton(context, mediaObject, currentMediaIndex);
        String buttonText = str("piko_more_options");

        ReelOverflowButton reelOverflowButton = new ReelOverflowButton(icon,reelButton,buttonText);

        AddReelButton.addReelButton(context,reelOverflowButton,helperObject);
    }

    private static void addDebugButton(Context context, Object helperObject, Object mediaObject, int currentMediaIndex) {
        String icon = UI.DRAWABLE_DEBUG_ICON;
        ReelButton reelButton = new DebugButton(context, mediaObject);
        String buttonText = str("piko_debug");

        ReelOverflowButton reelOverflowButton = new ReelOverflowButton(icon, reelButton, buttonText);

        AddReelButton.addReelButton(context, reelOverflowButton, helperObject);
    }

    private static void addExternalDownloadButton(Context context, Object helperObject, Object mediaObject, int currentMediaIndex){
        String icon = UI.DRAWABLE_DOWNLOAD_ICON;
        ReelButton reelButton = new ExternalDownloadButton(context, mediaObject, currentMediaIndex);
        String buttonText = str("piko_download_with_external_downloader");

        ReelOverflowButton reelOverflowButton = new ReelOverflowButton(icon,reelButton,buttonText);

        AddReelButton.addReelButton(context,reelOverflowButton,helperObject);
    }

    // Called from hook — passes the real current carousel index.
    /*
     * The reel controller hands its values over one at a time.
     *
     * Only move-object/from16 and invoke-static/range can name a register above v15, and this
     * controller's free registers are all above it. So the patch cannot read a field or pass
     * several arguments in one call: it copies one value at a time into a single scratch
     * register and stashes it here, then calls the hook with no arguments at all. The field
     * reads it can no longer do in bytecode happen below instead, by reflection, against names
     * the patch writes into the placeholders.
     */
    private static Object stashedSelf;
    private static Object stashedController;
    private static Object stashedMedia;
    private static Object stashedHelper;

    public static void stashReelSelf(Object value) { stashedSelf = value; }

    public static void stashReelController(Object value) { stashedController = value; }

    public static void stashReelMedia(Object value) { stashedMedia = value; }

    public static void stashReelHelper(Object value) { stashedHelper = value; }

    /** Field on the reel controller holding the activity. Rewritten by the patch. */
    private static String activityFieldName() { return "fieldName"; }

    /** Field holding the object that carries the carousel index. Rewritten by the patch. */
    private static String mediaExtraFieldName() { return "fieldName"; }

    /** The carousel index field on that object. Rewritten by the patch. */
    private static String currentMediaFieldName() { return "fieldName"; }

    public static void runReelHook() {
        try {
            Entity entity = new Entity();
            Context context = (Context) entity.getField(stashedSelf, activityFieldName());
            Object mediaExtra = entity.getField(stashedController, mediaExtraFieldName());
            int currentMediaIndex = (Integer) entity.getField(mediaExtra, currentMediaFieldName());

            AddReelButton.includeCustomReelOverflowButtons(
                    context, stashedHelper, stashedMedia, currentMediaIndex);
        } catch (Exception e) {
            Logger.printException(() -> "Error at runReelHook", e);
        }
    }

    /**
     * One sheet's worth of added rows, keyed on the sheet builder the app hands us.
     *
     * The reel menu calls its per-option method once for every row it is about to draw, so the
     * download row is added on the first of those calls and skipped for the rest. A new sheet
     * brings a new builder instance, which is what makes it appear again next time.
     */
    private static Object lastSheetHelper;

    /** Field on the reel menu helper holding the media. Rewritten by the patch. */
    private static String reelMediaFieldName() { return "fieldName"; }

    public static void addReelMenuDownloadRow(Object moreOptionsHelper, Context context, Object sheetHelper) {
        try {
            if (sheetHelper == null || sheetHelper == lastSheetHelper) return;
            lastSheetHelper = sheetHelper;

            if (!Pref.enableDownload()) return;

            Object media = new Entity().getField(moreOptionsHelper, reelMediaFieldName());
            if (media == null) return;

            AddReelButton.addDownloadButton(context, sheetHelper, media, 0);
        } catch (Exception e) {
            Logger.printException(() -> "Error at addReelMenuDownloadRow", e);
        }
    }

    public static void includeCustomReelOverflowButtons(Context context, Object helperObject, Object mediaObject, int currentMediaIndex){
        if(Pref.pikoDebug()){
            AddReelButton.addDebugButton(context, helperObject, mediaObject, currentMediaIndex);
        }
        if(Pref.enableDownload()){
            AddReelButton.addDownloadButton(context, helperObject, mediaObject, currentMediaIndex);
        }
        if(Pref.downloadWithExternalDownloader()){
            AddReelButton.addExternalDownloadButton(context, helperObject, mediaObject, currentMediaIndex);
        }
        if(Pref.moreOptionsOnPost()){
            AddReelButton.addInfoButton(context, helperObject, mediaObject, currentMediaIndex);
        }
    }


}