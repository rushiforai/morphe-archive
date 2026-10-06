/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.category;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.downloadActionRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.fileNameRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.folderRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.info;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.playbackQualityRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.qualityRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.saveToRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.sendAppRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.toggle;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import androidx.annotation.Nullable;

import java.util.Set;

import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * The category pages for video: Reels and Watch, Playback and Downloads. Each method adds its section to the page
 * {@link HushfacebookPreferenceFragment#initialize} builds, and leaves it out when the build has none of
 * its patches, but for the sections every build has.
 */
@SuppressWarnings("deprecation")
final class VideoPages {
    private VideoPages() {
    }

    /** Reels and Watch, in every build, with the map of the four places Reels show up. */
    static void reels(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        // In every build: "How do I block Reels?" has four answers in four places (discussion #17),
        // and the tab's answer is Facebook's own setting, so the map is here whatever was patched.
        PreferenceCategory reels = category(screen, L10n.t("Reels and Watch"));
        reels.addPreference(info(context, L10n.t("How to block Reels"),
                L10n.t("Reels show up in four places, and each one has its own control.")));
        reels.addPreference(reelsLink(page, context, build, PatchFamily.FEED_REELS, Settings.HIDE_FEED_REELS,
                L10n.t("Reels in the feed"),
                L10n.t("In News feed, Hide Reels in the feed blocks the rows of reels between posts.")));
        reels.addPreference(reelsLink(page, context, build, PatchFamily.TAP_TO_PLAY, Settings.TAP_TO_PLAY,
                L10n.t("Reels that play by themselves"),
                L10n.t("In Playback, Tap to play blocks autoplay, so reels and other videos wait for your tap.")));
        // Without Hide the Reels tab, Facebook's own Hide is the answer, on the accounts that have it.
        if (build.contains(PatchFamily.REELS_TAB)) {
            reels.addPreference(reelsLink(page, context, build, PatchFamily.REELS_TAB, Settings.HIDE_REELS_TAB,
                    L10n.t("The Reels tab"),
                    L10n.t("In Reels and Watch, Hide the Reels tab blocks it after a restart.")));
        } else {
            reels.addPreference(info(context, L10n.t("The Reels tab"),
                    L10n.f("Facebook's own setting blocks it. Open Settings, Tab bar, Customize the bar and choose "
                            + "Hide next to Reels, which some accounts call Video. If neither is listed, choose the "
                            + "%1$s patch in Morphe Manager and patch again.",
                            L10n.isolate(PatchFamily.REELS_TAB.patchName))));
        }
        reels.addPreference(reelsLink(page, context, build, PatchFamily.MARKETPLACE_ONLY, Settings.MARKETPLACE_ONLY,
                L10n.t("Everything except Marketplace"),
                L10n.t("In Opening Facebook, Marketplace only blocks the feed, the Reels tab and the other social "
                        + "tabs after a restart.")));
        if (build.contains(PatchFamily.REELS_TAB)) {
            // Facebook keeps the tab bar it built, so a change waits for a restart and the page says so.
            reels.addPreference(toggle(context, Settings.HIDE_REELS_TAB,
                    L10n.t("Take the Reels tab, called Video on some accounts, off the tab bar. Reel links and reels "
                            + "in the feed still open. Changes show after Facebook restarts.")));
        }
        if (build.contains(PatchFamily.REELS_TAB_DOT)) {
            reels.addPreference(toggle(context, Settings.HIDE_REELS_TAB_DOT,
                    L10n.t("No dot or new count on the Reels tab, called Video on some accounts. Other tabs keep theirs.")));
        }
        if (build.contains(PatchFamily.REEL_PROMPTS)) {
            reels.addPreference(toggle(context, Settings.HIDE_REEL_PROMPTS,
                    L10n.t("No \"Are you interested in this reel?\" prompt on reels. The reel plays as usual.")));
        }
        // Both reel filters work on each batch of reels as it arrives, so a change leaves the
        // reels already loaded as they are, and the rows say so.
        if (build.contains(PatchFamily.SPONSORED_REELS)) {
            reels.addPreference(toggle(context, Settings.HIDE_SPONSORED_REELS,
                    L10n.t("Ads inside Reels, starting with the next batch Facebook loads. Banners, mid-rolls "
                            + "and app-inserted ads stay blocked even while paused.")));
        }
        if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
            reels.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_REELS,
                    L10n.t("Reels and Watch videos that Facebook's own detection marks as made with AI, starting "
                            + "with the next batch Facebook loads. One that only its creator labelled as AI stays. "
                            + "It's off by default because it hasn't been tested on a real account yet.")));
        }
        if (build.contains(PatchFamily.REEL_DECLUTTER)) {
            reels.addPreference(toggle(context, Settings.HIDE_REEL_CHIPS,
                    L10n.t("Remix, Use template, Add yours and Edits buttons, plus Stars, games, partner apps "
                            + "and outside links. The song and other labels stay.")));
            reels.addPreference(toggle(context, Settings.HIDE_REEL_FOLLOW_BUTTON,
                    L10n.t("The Follow button next to the reel's author. You can still follow them from their profile.")));
            reels.addPreference(toggle(context, Settings.HIDE_REEL_SOCIAL_FOOTER,
                    L10n.t("The comment Facebook previews under a reel and the bubbles of friends who reacted. "
                            + "Open the comments to see them all.")));
        }
        if (build.contains(PatchFamily.REEL_WATCH_HISTORY)) {
            reels.addPreference(toggle(context, Settings.DONT_SEND_REEL_WATCH_HISTORY,
                    L10n.t("Stop sending watched-reel lists to Facebook. It uses them to rank your feed, so watched reels may return.")));
        }
        if (build.contains(PatchFamily.DOUBLE_TAP_LIKE)) {
            reels.addPreference(toggle(context, Settings.TURN_OFF_DOUBLE_TAP_LIKE,
                    L10n.t("A double tap on a reel or video no longer likes it or shows a heart. A single tap and the Like "
                            + "button work as before.")));
        }
        if (build.contains(PatchFamily.KEEP_REEL_SPEED)) {
            reels.addPreference(toggle(context, Settings.KEEP_REEL_SPEED,
                    L10n.t("A playback speed you pick in a reel's menu stays for the next reels until you pick another "
                            + "or Facebook restarts. Off, every reel starts at normal speed.")));
        }
        if (build.contains(PatchFamily.REEL_HOLD)) {
            reels.addPreference(toggle(context, Settings.HOLD_REEL_FOR_2X,
                    L10n.t("Holding a reel plays it at double speed until you let go, in place of Facebook's long-press "
                            + "menu. The reel's more button still opens that menu.")));
        }
        if (build.contains(PatchFamily.REEL_DOWNLOAD)) {
            reels.addPreference(toggle(context, Settings.DOWNLOAD_REELS,
                    L10n.t("Add a Download button to reels, using your download quality. Off or paused, Facebook's own buttons return.")));
        }
    }

    /** Playback. */
    static void playback(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.TAP_TO_PLAY) || build.contains(PatchFamily.RESUME_LONG_VIDEOS)
                || build.contains(PatchFamily.PLAYBACK_QUALITY) || build.contains(PatchFamily.PICTURE_IN_PICTURE)
                || build.contains(PatchFamily.HDR_BRIGHTNESS)) {
            PreferenceCategory playback = category(screen, L10n.t("Playback"));
            if (build.contains(PatchFamily.TAP_TO_PLAY)) {
                playback.addPreference(toggle(context, Settings.TAP_TO_PLAY,
                        L10n.t("Videos, reels, stories and music wait for your tap. Facebook's Autoplay setting temporarily reads Off.")));
            }
            if (build.contains(PatchFamily.RESUME_LONG_VIDEOS)) {
                playback.addPreference(toggle(context, Settings.RESUME_LONG_VIDEOS,
                        L10n.t("Resume videos over two minutes where you left off, in the feed or full screen. Seek to start elsewhere. Short reels, live videos and ads start as usual.")));
            }
            if (build.contains(PatchFamily.PLAYBACK_QUALITY)) {
                playback.addPreference(toggle(context, Settings.DEFAULT_PLAYBACK_QUALITY,
                        L10n.t("Play videos, reels and stories at the quality below. A quality picked in a video's own menu still wins.")));
                playback.addPreference(playbackQualityRow(context));
            }
            if (build.contains(PatchFamily.PICTURE_IN_PICTURE)) {
                playback.addPreference(toggle(context, Settings.PICTURE_IN_PICTURE,
                        L10n.t("A playing reel keeps going in a small window when you leave Facebook. Android 12 or later.")));
            }
            if (build.contains(PatchFamily.HDR_BRIGHTNESS)) {
                // Asked as each screen comes to the front, so a change shows from the next one.
                playback.addPreference(toggle(context, Settings.TURN_OFF_HDR_BRIGHTNESS,
                        L10n.t("HDR videos and photos stay at your screen's usual brightness instead of turning it up to "
                                + "full. They keep their resolution.")));
            }
        }
    }

    /**
     * Downloads, where the saves running now are listed too. Answers the section, or null when no
     * download patch is in.
     */
    @Nullable
    static PreferenceCategory downloads(PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.STORY_DOWNLOAD) || build.contains(PatchFamily.REEL_DOWNLOAD)
                || build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
            PreferenceCategory downloads = category(screen, L10n.t("Downloads"));
            if (build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
                downloads.addPreference(toggle(context, Settings.DOWNLOAD_VIDEOS,
                        L10n.t("Add Download to phone to feed and Watch video menus. Uses the quality below. Off or paused, Facebook's menu returns.")));
            }
            // Every save reads it, a story's and a reel's as much as a feed video's, so it's here
            // whichever download patch is in, above the quality it keeps within.
            downloads.addPreference(toggle(context, Settings.DOWNLOAD_COMPATIBLE,
                    L10n.t("For WhatsApp, video editors such as CapCut and InShot, or a gallery or player that plays saves "
                            + "without sound. May lower quality.")));
            downloads.addPreference(qualityRow(context));
            downloads.addPreference(saveToRow(context));
            downloads.addPreference(folderRow(context));
            downloads.addPreference(fileNameRow(context));
            // Reels and feed and Watch videos can go to another app as a link (#41). A story can't:
            // its link opens only for someone signed in, so no downloader could fetch it.
            if (build.contains(PatchFamily.REEL_DOWNLOAD) || build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
                downloads.addPreference(downloadActionRow(context));
                downloads.addPreference(sendAppRow(context));
            }
            return downloads;
        }
        return null;
    }

    /**
     * One line of the Reels map. A tap goes to [setting]'s own row, and changes nothing. Without
     * [family] in the build there's no row to go to, so the line names the patch to add instead
     * and can't be tapped.
     */
    private static Preference reelsLink(HushfacebookPreferenceFragment page, Context context, Set<PatchFamily> build,
                                        PatchFamily family, BooleanSetting setting, String title, String summary) {
        if (!build.contains(family)) {
            return info(context, title, L10n.f("Not in this build. To block this, choose the %1$s patch in "
                    + "Morphe Manager and patch again.", L10n.isolate(family.patchName)));
        }
        Row row = new Row(context);
        row.setKey("action_show_" + setting.key);
        row.setPersistent(false);
        row.setTitle(title);
        row.setSummary(summary);
        row.setOnPreferenceClickListener(ignored -> {
            Preference target = page.findPreference(setting.key);
            return target != null && page.jumpTo(target);
        });
        return row;
    }
}
