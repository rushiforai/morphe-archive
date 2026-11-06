/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/


package app.morphe.extension.instagram.patches.story;

import static app.morphe.extension.instagram.utils.IgStr.str;

import java.util.ArrayList;
import android.content.Context;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.entity.MediaData;

import com.instagram.common.session.UserSession;

public class StoryButton {
    private static boolean ENABLE_DOWNLOAD;
    private static boolean ENABLE_DIRECT_DOWNLOAD;

    static{
        ENABLE_DOWNLOAD = Pref.enableDownload() && SettingsStatus.downloadMedia;
        ENABLE_DIRECT_DOWNLOAD = Pref.enableDirectDownload() && SettingsStatus.downloadMedia;
    }

    public static ArrayList addButtons(ArrayList buttonList){
        if(ENABLE_DOWNLOAD){
            if(ENABLE_DIRECT_DOWNLOAD){
                buttonList.add(str("piko_category_download_media"));
            }else{
                buttonList.add(str("piko_download_options"));
            }
        }

        return buttonList;
    }

    public static boolean storyButtonAction(CharSequence buttonText, Context ctx, Object mediaObject){
        try {
            // piko also offers a debug view, an external downloader and story mentions here,
            // each switched on from its settings screen. That screen is not in this bundle, so
            // only the download button, which "Download media" turns on, is kept.
            if (buttonText.equals(str("piko_download_options")) || buttonText.equals(str("piko_category_download_media"))) {
                DownloadUtils.downloadPost(ctx,null,mediaObject,0);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Failed storyButtonAction", ex);
        }
        return false;
    }
}