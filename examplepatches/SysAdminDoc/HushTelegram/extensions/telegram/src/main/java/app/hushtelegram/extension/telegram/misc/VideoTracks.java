/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's video viewer plays a video's first audio track, never shows its subtitles, and its
 * settings menu has no way to pick either (#79). With the switch on, that menu gets Audio track
 * when the video has more than one, and Subtitles when it has any. A pick goes to the player's own
 * track selector, the way Telegram's quality choice does, and the subtitles picked show over the
 * video. Every video gets a new player, so the next one starts with Telegram's own choice again.
 *
 * <p>The viewer builds its menu once, so both rows are added then and stay hidden. Each time the
 * menu opens they show or hide for the video playing. All of it runs on the main thread.
 */
public final class VideoTracks {
    private VideoTracks() {}

    /** The rows' ids, far from the small numbers Telegram gives its own. */
    static final int AUDIO_ID = 0x48545601;
    static final int SUBTITLES_ID = 0x48545602;
    /** The player's track types. */
    static final int AUDIO = 1;
    static final int TEXT = 3;
    /** A track the player can play as it is, under the player's three-bit support mask. */
    static final int HANDLED = 4;
    static final String CHOSEN = "video track chosen";
    static final String CUE_TAG = "hushtelegram_video_cue";
    private static final long CUE_CHECK_MS = 400;

    /** Every viewer's rows. The views hold them, so a viewer that's gone takes its rows along. */
    private static final List<WeakReference<Rows>> ALL = new ArrayList<>();
    /** The rows of the menu open now, or open last. */
    private static WeakReference<Rows> shown = new WeakReference<>(null);
    /** Each player's picks. A player that's gone drops out. */
    private static final Map<Object, Track> AUDIO_PICKS = new WeakHashMap<>();
    private static final Map<Object, Track> TEXT_PICKS = new WeakHashMap<>();
    /** The text field of each cue class, read once. */
    private static final Map<Class<?>, Field> CUE_TEXT = new HashMap<>();
    /** The video view fields of each player class, read once. */
    private static final Map<Class<?>, List<Field>> VIDEO_VIEWS = new HashMap<>();
    /** The subtitle line on screen, and the player it belongs to. */
    private static WeakReference<TextView> cueLine = new WeakReference<>(null);
    private static WeakReference<Object> cueOwner = new WeakReference<>(null);
    private static boolean checking;

    /**
     * Called by the viewer right after it adds Loop video to its settings menu.
     *
     * @param viewer Telegram's video viewer
     */
    public static void menu(Object viewer) {
        HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
        try {
            Object menu = viewer == null ? null : videoMenu(viewer);
            if (menu == null) return;
            Context context = Utils.getContext();
            View audio = row(menu, AUDIO_ID, context, "msg_voice_headphones", L10n.t("Audio track"));
            View subtitles = row(menu, SUBTITLES_ID, context, "msg_stories_caption", L10n.t("Subtitles"));
            if (audio == null || subtitles == null) {
                if (audio != null) audio.setVisibility(View.GONE);
                if (subtitles != null) subtitles.setVisibility(View.GONE);
                return;
            }
            Rows rows = new Rows(viewer, audio, subtitles);
            prune();
            ALL.add(new WeakReference<>(rows));
            audio.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View view) {
                    shown = new WeakReference<>(rows);
                    rows.refresh();
                }

                @Override
                public void onViewDetachedFromWindow(View view) {}
            });
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video track menu", failure);
        }
    }

    /**
     * Called first when a row of the viewer's menus is tapped. Telegram has nothing for these ids.
     *
     * @param id the tapped row's id
     */
    public static void menuChoice(int id) {
        if (id != AUDIO_ID && id != SUBTITLES_ID) return;
        HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
        try {
            Rows rows = shown.get();
            Object viewer = rows == null ? null : rows.viewer.get();
            Object player = viewer == null ? null : player(viewer);
            Activity activity = rows == null ? null : ListBackground.activityOf(rows.audio.getContext());
            if (player == null || activity == null || activity.isFinishing()) {
                failed();
                return;
            }
            pick(activity, player, id == AUDIO_ID ? AUDIO : TEXT);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video track menu", failure);
            failed();
        }
    }

    /**
     * Called first when the player gets the subtitle lines to show now. Telegram shows none.
     *
     * @param player the viewer's video player
     * @param cues the lines, empty when nothing shows
     */
    public static void cues(Object player, List<?> cues) {
        if (player == null) return;
        try {
            CharSequence text = TEXT_PICKS.get(player) != null && enabled() ? text(cues) : null;
            Utils.runOnMainThreadNowOrLater(() -> showCue(player, text));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video subtitles", failure);
        }
    }

    static boolean enabled() {
        return Utils.settingsReady() && Settings.VIDEO_TRACKS.get();
    }

    @Nullable
    private static View row(Object menu, int id, @Nullable Context context, String icon, String title) {
        int drawable = context == null ? 0 : context.getResources().getIdentifier(icon, "drawable", context.getPackageName());
        Object row = addRow(menu, id, drawable, title);
        if (!(row instanceof View)) return null;
        View view = (View) row;
        view.setVisibility(View.GONE);
        return view;
    }

    private static void prune() {
        for (Iterator<WeakReference<Rows>> it = ALL.iterator(); it.hasNext(); ) {
            if (it.next().get() == null) it.remove();
        }
    }

    /** One viewer's two rows. */
    static final class Rows {
        final WeakReference<Object> viewer;
        final View audio;
        final View subtitles;

        Rows(Object viewer, View audio, View subtitles) {
            this.viewer = new WeakReference<>(viewer);
            this.audio = audio;
            this.subtitles = subtitles;
        }

        /** Shows each row only when the video playing has something to pick there. */
        void refresh() {
            try {
                Object owner = viewer.get();
                Object player = owner != null && enabled() ? player(owner) : null;
                show(audio, player != null && tracks(player, AUDIO).size() > 1);
                show(subtitles, player != null && !tracks(player, TEXT).isEmpty());
            } catch (Throwable failure) {
                show(audio, false);
                show(subtitles, false);
                HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video track menu", failure);
            }
        }

        private static void show(View row, boolean visible) {
            int wanted = visible ? View.VISIBLE : View.GONE;
            if (row.getVisibility() == wanted) return;
            // The menu fades in only the rows it saw showing, so a row shown late starts opaque.
            if (visible) row.setAlpha(1f);
            row.setVisibility(wanted);
        }
    }

    /** One track the player can play. */
    static final class Track {
        final Object group;
        final int index;
        @Nullable final String name;

        Track(Object group, int index, @Nullable String name) {
            this.group = group;
            this.index = index;
            this.name = name;
        }

        /**
         * Groups compare by value, the way the selector keys its overrides: each loop and the
         * preloaded next pass map new groups equal to the ones picked from.
         */
        boolean same(@Nullable Track other) {
            return other != null && other.index == index && Objects.equals(other.group, group);
        }
    }

    /** The tracks of one type the player can play, in the player's order. */
    static List<Track> tracks(Object player, int type) {
        List<Track> found = new ArrayList<>();
        Object mapped = mapped(player);
        if (mapped == null) return found;
        int renderers = renderers(mapped);
        for (int renderer = 0; renderer < renderers; renderer++) {
            Object groups = groups(mapped, renderer);
            if (groups == null) continue;
            int count = groupCount(groups);
            for (int g = 0; g < count; g++) {
                Object group = group(groups, g);
                if (group == null || trackType(group) != type) continue;
                int length = trackCount(group);
                for (int t = 0; t < length; t++) {
                    if ((support(mapped, renderer, g, t) & 7) != HANDLED) continue;
                    found.add(new Track(group, t, trackName(format(group, t))));
                }
            }
        }
        return found;
    }

    @Nullable
    private static String trackName(@Nullable Object format) {
        if (format == null) return null;
        String label = label(format);
        if (!TextUtils.isEmpty(label)) return label;
        return languageName(language(format));
    }

    @Nullable
    static String languageName(@Nullable String tag) {
        if (TextUtils.isEmpty(tag) || "und".equalsIgnoreCase(tag)) return null;
        String shown = Locale.forLanguageTag(tag).getDisplayName();
        if (TextUtils.isEmpty(shown)) return tag;
        return shown.substring(0, 1).toUpperCase(Locale.getDefault()) + shown.substring(1);
    }

    /** Each track's name. A track with no name gets its place, and names that repeat get it too. */
    static String[] names(List<Track> tracks) {
        String[] names = new String[tracks.size()];
        Map<String, Integer> uses = new HashMap<>();
        for (int i = 0; i < names.length; i++) {
            String name = tracks.get(i).name;
            names[i] = name == null ? L10n.f("Track %1$d", i + 1) : name;
            Integer before = uses.get(names[i]);
            uses.put(names[i], before == null ? 1 : before + 1);
        }
        for (int i = 0; i < names.length; i++) {
            Integer count = uses.get(names[i]);
            if (count != null && count > 1 && tracks.get(i).name != null) names[i] = names[i] + " (" + (i + 1) + ")";
        }
        return names;
    }

    static void pick(Activity activity, Object player, int type) {
        List<Track> tracks = tracks(player, type);
        if (tracks.isEmpty()) {
            failed();
            return;
        }
        String[] names = names(tracks);
        CharSequence[] rows = new CharSequence[names.length + 1];
        rows[0] = type == TEXT ? L10n.t("Off") : L10n.t("Automatic");
        Track chosen = (type == TEXT ? TEXT_PICKS : AUDIO_PICKS).get(player);
        int checked = 0;
        for (int i = 0; i < names.length; i++) {
            rows[i + 1] = names[i];
            if (tracks.get(i).same(chosen)) checked = i + 1;
        }
        new AlertDialog.Builder(activity)
                .setTitle(type == TEXT ? L10n.t("Subtitles") : L10n.t("Audio track"))
                .setSingleChoiceItems(rows, checked, (dialog, which) -> {
                    dialog.dismiss();
                    choose(player, type, which <= 0 ? null : tracks.get(which - 1));
                })
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
    }

    /**
     * Hands the pick to the player's track selector: the type's earlier pick goes, the new track
     * comes in, and subtitles turned off keep the player from picking its own.
     */
    static void choose(Object player, int type, @Nullable Track track) {
        try {
            Object builder = builder(player);
            if (builder == null) {
                failed();
                return;
            }
            Map<Object, Object> overrides = overrides(builder);
            for (Iterator<Object> groups = overrides.keySet().iterator(); groups.hasNext(); ) {
                if (trackType(groups.next()) == type) groups.remove();
            }
            if (track != null) overrides.put(track.group, override(track.group, track.index));
            if (type == TEXT) {
                Set<Object> disabled = disabled(builder);
                if (track == null) disabled.add(TEXT);
                else disabled.remove(TEXT);
            }
            apply(player, builder);
            Map<Object, Track> picks = type == TEXT ? TEXT_PICKS : AUDIO_PICKS;
            if (track == null) picks.remove(player);
            else picks.put(player, track);
            if (type == TEXT && track == null) showCue(player, null);
            HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, CHOSEN);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video track", failure);
            failed();
        }
    }

    @Nullable
    static CharSequence text(@Nullable List<?> cues) throws IllegalAccessException {
        if (cues == null || cues.isEmpty()) return null;
        StringBuilder lines = new StringBuilder();
        for (Object cue : cues) {
            Field field = cue == null ? null : cueText(cue.getClass());
            Object line = field == null ? null : field.get(cue);
            if (!(line instanceof CharSequence) || ((CharSequence) line).length() == 0) continue;
            if (lines.length() > 0) lines.append('\n');
            lines.append((CharSequence) line);
        }
        return lines.length() == 0 ? null : lines;
    }

    @Nullable
    private static Field cueText(Class<?> type) {
        if (CUE_TEXT.containsKey(type)) return CUE_TEXT.get(type);
        Field found = null;
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != CharSequence.class) continue;
            field.setAccessible(true);
            found = field;
            break;
        }
        CUE_TEXT.put(type, found);
        return found;
    }

    /** The view the player draws its video into, or null. */
    @Nullable
    static View videoView(Object player) throws IllegalAccessException {
        List<Field> fields = VIDEO_VIEWS.get(player.getClass());
        if (fields == null) {
            fields = new ArrayList<>();
            for (Class<?> type = player.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    if (!TextureView.class.isAssignableFrom(field.getType()) && !SurfaceView.class.isAssignableFrom(field.getType())) continue;
                    field.setAccessible(true);
                    fields.add(field);
                }
            }
            VIDEO_VIEWS.put(player.getClass(), fields);
        }
        for (Field field : fields) {
            Object view = field.get(player);
            if (view instanceof View && ((View) view).getParent() instanceof FrameLayout) return (View) view;
        }
        return null;
    }

    /** Puts the line over the video, at its bottom, or takes it away. */
    static void showCue(Object player, @Nullable CharSequence text) {
        try {
            TextView line = cueLine.get();
            if (TextUtils.isEmpty(text)) {
                if (line != null && cueOwner.get() == player) line.setVisibility(View.GONE);
                return;
            }
            View video = videoView(player);
            ViewParent parent = video == null ? null : video.getParent();
            if (!(parent instanceof FrameLayout)) return;
            FrameLayout frame = (FrameLayout) parent;
            if (line == null || line.getParent() != frame) {
                if (line != null) line.setVisibility(View.GONE);
                View tagged = frame.findViewWithTag(CUE_TAG);
                line = tagged instanceof TextView ? (TextView) tagged : newLine(frame);
                cueLine = new WeakReference<>(line);
            }
            line.setText(text);
            line.setVisibility(View.VISIBLE);
            line.bringToFront();
            cueOwner = new WeakReference<>(player);
            if (!checking) {
                checking = true;
                Utils.runOnMainThreadDelayed(VideoTracks::checkCue, CUE_CHECK_MS);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video subtitles", failure);
        }
    }

    private static TextView newLine(FrameLayout frame) {
        Context context = frame.getContext();
        float density = context.getResources().getDisplayMetrics().density;
        TextView line = new TextView(context);
        line.setTag(CUE_TAG);
        line.setTextColor(Color.WHITE);
        line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        line.setGravity(Gravity.CENTER);
        line.setShadowLayer(3 * density, 0, density, Color.BLACK);
        int sides = Math.round(8 * density);
        int ends = Math.round(3 * density);
        line.setPadding(sides, ends, sides, ends);
        GradientDrawable back = new GradientDrawable();
        back.setColor(0x99000000);
        back.setCornerRadius(4 * density);
        line.setBackground(back);
        line.setClickable(false);
        line.setFocusable(false);
        line.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        int margin = Math.round(16 * density);
        params.setMargins(margin, 0, margin, Math.round(12 * density));
        frame.addView(line, params);
        return line;
    }

    /** The line goes once its player has left every viewer or the line has left the screen. */
    static void checkCue() {
        checking = false;
        TextView line = cueLine.get();
        if (line == null || line.getVisibility() != View.VISIBLE) return;
        Object owner = cueOwner.get();
        if (owner == null || !line.isAttachedToWindow() || !playing(owner)) {
            line.setVisibility(View.GONE);
            return;
        }
        checking = true;
        Utils.runOnMainThreadDelayed(VideoTracks::checkCue, CUE_CHECK_MS);
    }

    private static boolean playing(Object owner) {
        for (WeakReference<Rows> ref : ALL) {
            Rows rows = ref.get();
            Object viewer = rows == null ? null : rows.viewer.get();
            if (viewer != null && player(viewer) == owner) return true;
        }
        return false;
    }

    private static void failed() {
        Utils.showToastShort(L10n.t("Couldn't open that. Try again."));
    }

    static void reset() {
        ALL.clear();
        shown = new WeakReference<>(null);
        AUDIO_PICKS.clear();
        TEXT_PICKS.clear();
        CUE_TEXT.clear();
        VIDEO_VIEWS.clear();
        cueLine = new WeakReference<>(null);
        cueOwner = new WeakReference<>(null);
        checking = false;
    }

    // Each stub below gets the body that reaches this build's piece when patching.

    /** The viewer's video player, or null. */
    public static Object player(Object viewer) { return null; }

    /** The viewer's settings menu, the one Loop video is in. */
    public static Object videoMenu(Object viewer) { return null; }

    /** Adds a row to that menu and returns it. */
    public static Object addRow(Object menu, int id, int icon, CharSequence title) { return null; }

    /** The tracks the player's selector last mapped to its renderers, or null. */
    public static Object mapped(Object player) { return null; }

    /** How many renderers the player has. */
    public static int renderers(Object mapped) { return 0; }

    /** The track groups mapped to one renderer. */
    public static Object groups(Object mapped, int renderer) { return null; }

    /** How well a renderer plays one track. */
    public static int support(Object mapped, int renderer, int group, int track) { return 0; }

    public static int groupCount(Object groups) { return 0; }

    public static Object group(Object groups, int index) { return null; }

    public static int trackType(Object group) { return 0; }

    public static int trackCount(Object group) { return 0; }

    public static Object format(Object group, int track) { return null; }

    public static String language(Object format) { return null; }

    public static String label(Object format) { return null; }

    /** A builder holding the selector's parameters now, or null with no selector. */
    public static Object builder(Object player) { return null; }

    public static Map<Object, Object> overrides(Object builder) { return null; }

    public static Set<Object> disabled(Object builder) { return null; }

    /** A pick of one track of a group. */
    public static Object override(Object group, int track) { return null; }

    /** Gives the selector the builder's parameters. */
    public static void apply(Object player, Object builder) {}
}
