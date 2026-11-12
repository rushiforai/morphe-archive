/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.flyout;

import androidx.annotation.Nullable;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.downloads.DownloadMethod;

/**
 * What a song or playlist menu names, and which item offers Download. Reads only the serialized items, with no
 * Android dependency or fallback to the current player.
 *
 * <p>Add to queue names the song. It is an ordinary service item (66441155) or the conditional one (77258115), and
 * both keep the command in field 3. A menu without it falls back to the navigation items: Start mix (66441108, or the
 * conditional 77262503) names the video, and the credits page names it as {@code MPTC} plus the video id. The queue
 * id wins, and the song playing now is never a fallback: the menu is the one of the row that was opened.
 */
public final class FlyoutMenuScan {
    private static final int[] SERVICE_ITEMS = {66441155, 77258115};
    private static final int[] NAVIGATION_ITEMS = {66441108, 77262503};
    private static final int ITEM_COMMAND = 3;
    private static final int OFFLINE_UPSELL_ENDPOINT = 133724106;
    private static final int OFFLINE_VIDEO_ENDPOINT = 73080600;
    private static final int QUEUE_ADD_ENDPOINT = 163162354;
    private static final int WATCH_ENDPOINT = 48687757;
    private static final int BROWSE_ENDPOINT = 48687626;
    private static final String CREDITS_PREFIX = "MPTC";
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");

    /** @param songId null when the menu is not the menu of one song; the index is of the item to add after. */
    record Result(@Nullable String songId, List<Integer> downloadItems, int insertAfter) {
        boolean hasDownload() {
            return !downloadItems.isEmpty();
        }

        /** Replaces Download slots only, retaining every unrelated row and its position. */
        <T> List<T> withDownload(List<? extends T> items, T download) {
            List<T> result = new ArrayList<>(items);
            if (downloadItems.isEmpty()) {
                result.add(insertAfter + 1, download);
            } else {
                result.set(downloadItems.get(0), download);
                for (int index = downloadItems.size() - 1; index > 0; index--) {
                    result.remove(downloadItems.get(index).intValue());
                }
            }
            return result;
        }
    }

    private FlyoutMenuScan() {
    }

    /**
     * A Library row's endpoint tag includes its menu (66439850 / repeated 1). The playlist target is field 2 of
     * Add to queue, not the song field 1. The captured Download item is an Elements standalone list row whose
     * Premium reason is Download (14); its complete executor must equal the command that was tapped.
     */
    @Nullable
    public static String playlistForDownload(DownloadMethod method, byte[] command, byte[] menu) {
        if (method != DownloadMethod.STREAM && method != DownloadMethod.DEVICE_FILES) return null;
        try {
            ProtoMessage executor = new ProtoMessage(command).messageField(204158123);
            if (executor.isEmpty()) return null;

            boolean tappedDownload = false;
            String playlistId = null;
            for (ProtoMessage item : new ProtoMessage(menu).messageField(66439850).repeatedMessageField(1)) {
                if (matchesPlaylistDownload(item, executor)) tappedDownload = true;

                for (int renderer : SERVICE_ITEMS) {
                    ProtoMessage target = item.messagePath(renderer, ITEM_COMMAND, QUEUE_ADD_ENDPOINT, 1);
                    String id = target.stringField(2);
                    if (id.isEmpty()) continue;
                    if (!target.stringField(1).isEmpty()) return null;
                    if (id.startsWith("VL")) id = id.substring(2);
                    if (id.isEmpty() || (playlistId != null && !playlistId.equals(id))) return null;
                    playlistId = id;
                }
            }
            return tappedDownload ? playlistId : null;
        } catch (RuntimeException notPlaylistMenu) {
            return null;
        }
    }

    private static boolean matchesPlaylistDownload(ProtoMessage item, ProtoMessage tappedExecutor) {
        ProtoMessage component = item.messagePath(153515154, 172660663, 1, 168777401);
        if (!component.messagePath(3, 172035250).stringField(1).startsWith("list_item.eml-fe|")) return false;

        ProtoMessage executor = component.messagePath(5, 413471385, 1, 489973921, 997, 3, 3, 169495254, 204158123);
        return !executor.isEmpty() && executor.contentEquals(tappedExecutor)
                && isDownloadCommand(executor, 0, true);
    }

    /** @param items The serialized menu items, null for an item that is not a message. */
    static Result scan(List<byte[]> items) {
        String queued = null;
        int queuedIndex = -1;
        List<Integer> downloads = Collections.emptyList();
        boolean conflictingQueue = false;
        String mix = null;
        int mixIndex = -1;
        String credits = null;
        int creditsIndex = -1;

        for (int index = 0; index < items.size(); index++) {
            byte[] item = items.get(index);
            if (item == null) continue;

            if (isDownloadItem(item)) {
                if (downloads.isEmpty()) downloads = new ArrayList<>(1);
                downloads.add(index);
            }

            for (int renderer : SERVICE_ITEMS) {
                ProtoMessage command = commandOf(item, renderer);
                if (command == null) continue;

                String id = command.messagePath(QUEUE_ADD_ENDPOINT, 1).stringField(1);
                if (!VIDEO_ID.matcher(id).matches()) continue;

                // Two different videos in one menu: it is not the menu of one song.
                if (queued != null && !queued.equals(id)) conflictingQueue = true;
                queued = id;
                queuedIndex = index;
            }

            for (int renderer : NAVIGATION_ITEMS) {
                ProtoMessage command = commandOf(item, renderer);
                if (command == null) continue;

                String id = command.messageField(WATCH_ENDPOINT).stringField(1);
                if (mix == null && VIDEO_ID.matcher(id).matches()) {
                    mix = id;
                    mixIndex = index;
                }
                String browse = command.messageField(BROWSE_ENDPOINT).stringField(2);
                if (credits == null && browse.startsWith(CREDITS_PREFIX)
                        && VIDEO_ID.matcher(browse.substring(CREDITS_PREFIX.length())).matches()) {
                    credits = browse.substring(CREDITS_PREFIX.length());
                    creditsIndex = index;
                }
            }
        }

        if (conflictingQueue) return new Result(null, downloads, -1);
        if (queued != null) return new Result(queued, downloads, queuedIndex);
        if (mix != null) return new Result(mix, downloads, mixIndex);
        return new Result(credits, downloads, creditsIndex);
    }

    /** The command (field 3) of the item when it is the given renderer, else null. */
    @Nullable
    private static ProtoMessage commandOf(byte[] item, int renderer) {
        try {
            ProtoMessage wrapper = new ProtoMessage(item).messageField(renderer);
            return wrapper.isEmpty() ? null : wrapper.messageField(ITEM_COMMAND);
        } catch (RuntimeException notThisItem) {
            return null;
        }
    }

    private static boolean isDownloadItem(byte[] item) {
        for (int renderer : SERVICE_ITEMS) {
            ProtoMessage command = commandOf(item, renderer);
            if (command != null && isDownloadCommand(command, 0, false)) return true;
        }
        for (int renderer : NAVIGATION_ITEMS) {
            ProtoMessage command = commandOf(item, renderer);
            if (command != null && isDownloadCommand(command, 0, false)) return true;
        }

        // Only this standalone list-row model is replaceable; a carousel's other actions stay intact.
        try {
            ProtoMessage component = new ProtoMessage(item).messagePath(153515154, 172660663, 1, 168777401);
            if (!component.messagePath(3, 172035250).stringField(1).startsWith("list_item.eml-fe|")) return false;
            ProtoMessage click = component.messagePath(5, 413471385, 1, 489973921, 997, 3);
            return isDownloadCommand(click.messageField(3), 0, true);
        } catch (RuntimeException notThisRow) {
            return false;
        }
    }

    /** Traverses typed command edges, never arbitrary strings/bytes or all Premium sheets. */
    private static boolean isDownloadCommand(ProtoMessage command, int depth, boolean downloadSheet) {
        if (depth > 6 || command.isEmpty()) return false;
        if (!command.messageField(OFFLINE_UPSELL_ENDPOINT).isEmpty()) return true;
        ProtoMessage video = command.messageField(OFFLINE_VIDEO_ENDPOINT);
        if (!video.isEmpty() && video.varintField(2) == 1
                && (VIDEO_ID.matcher(video.stringField(1)).matches()
                || VIDEO_ID.matcher(video.stringField(7)).matches())) return true;

        if (downloadSheet && isDownloadSheet(command.messageField(443434441))) return true;
        if (isDownloadCommand(command.messageField(169495254), depth + 1, downloadSheet)) return true;
        if (isDownloadCommand(command.messageField(204158123), depth + 1, downloadSheet)) return true;
        for (ProtoMessage child : command.messageField(170382688).repeatedMessageField(1)) {
            if (isDownloadCommand(child, depth + 1, downloadSheet)) return true;
        }
        return false;
    }

    private static boolean isDownloadSheet(ProtoMessage sheet) {
        ProtoMessage destination = sheet.messagePath(1, 2);
        if (!"PApremium_upsell".equals(destination.stringField(2))) return false;
        try {
            String encoded = URLDecoder.decode(destination.stringField(3), "UTF-8");
            ProtoMessage params = new ProtoMessage(Base64.getUrlDecoder().decode(encoded));
            return params.messageField(145).varintField(1) == 14;
        } catch (Exception notDownloadParams) {
            return false;
        }
    }
}
