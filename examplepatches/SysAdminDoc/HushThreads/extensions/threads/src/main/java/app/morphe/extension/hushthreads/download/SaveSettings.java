/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.download;

import app.morphe.extension.shared.settings.EnumSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * The save's stored choices that aren't switches: the quality, the folder and the video file
 * name. {@link app.morphe.extension.hushthreads.settings.Settings} holds only switches, which is
 * all a settings file carries, so these are kept here, the way the release check keeps its own.
 * A paused Threads makes no HushThreads saves for them to steer.
 */
public final class SaveSettings {
    private SaveSettings() {
    }

    /**
     * The quality a video save asks for: the best the player streams, a ceiling, or the smallest
     * file. Every video save reads it when it starts, and one that finds nothing at or under a
     * ceiling takes the nearest above it. Photos always save whole.
     */
    public static final EnumSetting<DownloadQuality> DOWNLOAD_QUALITY =
            new EnumSetting<>("hushthreads_download_quality", DownloadQuality.BEST);

    /**
     * The folder every save goes to, under Movies for a video and Pictures for a photo. The
     * settings row keeps it clean, and {@link SaveFolder#sanitize} cleans it again wherever it's
     * read, so whatever wrote the store, a save lands in one folder under each.
     */
    public static final StringSetting SAVE_FOLDER =
            new StringSetting("hushthreads_save_folder", SaveFolder.DEFAULT);

    /**
     * The name a saved video gets: {date}, {video_id}, {owner} and {posted} fill in per save, the
     * last three only when the save knows them, and the default is TH_VID_ and the date and time.
     * Photos keep their TH_IMG_ names. Cleaned like the folder wherever it's read
     * ({@link FileNameTemplate#sanitize}).
     */
    public static final StringSetting FILENAME_TEMPLATE =
            new StringSetting("hushthreads_filename_template", FileNameTemplate.DEFAULT);
}
