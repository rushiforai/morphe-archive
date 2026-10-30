/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Reflect;
import app.pixkk.extension.core.Settings;

/**
 * Puts the video's sound name on its own line under the description, the way the feed showed it
 * before the redesign.
 *
 * TikTok 47.4.3 builds the music row under the description only for a video that carries a
 * {@code MusicPromoTagInfo} with some text, and writes that text into the row. A video with an
 * ordinary "original sound" carries none, so this hands out a tag naming the sound for it: the row
 * is then drawn, styled and positioned by TikTok and nothing is added to the layout here. The tag
 * has no link, so tapping the row opens nothing. A video whose sound TikTok has matched to a song
 * may get its own "Contains: ..." row too, and then the sound's name is put into that row's title;
 * TikTok does not draw it for every matched song, so the tag is handed out for those as well.
 */
public final class SoundUnderDescription {
    private static final String PROMO_TAG_CLASS = "com.ss.android.ugc.aweme.music.model.MusicPromoTagInfo";
    private static final String NOTE = "♫ ";
    /**
     * 47.5.3's ids: the music row's root ({@code id/o8s}), its music title ({@code pqy}), its note
     * icon ({@code ppa}) and the chip the promo tag's text is drawn in ({@code ppw}).
     */
    private static final int ROW_ID = 0x7f0a4c7d;
    private static final int TITLE_ID = 0x7f0a549b;
    private static final int CHIP_ID = 0x7f0a5474;
    private static final int ICON_ID = 0x7f0a545e;

    /** The tags made so far, so a video keeps one for as long as it lives. */
    private static final Map<Object, Object> made = new WeakHashMap<>();
    private SoundUnderDescription() {
    }

    /**
     * Called as a video hands out its promo tag.
     *
     * @param aweme the video
     * @param tag the tag it carries, or null
     * @return the tag to use
     */
    public static Object promoTag(Object aweme, Object tag) {
        if (tag != null || !Settings.SOUND_UNDER_DESCRIPTION.get()) return tag;
        try {
            synchronized (made) {
                Object own = made.get(aweme);
                if (own != null) return own;
                String text = soundText(aweme);
                Object created = text == null ? null : create(aweme.getClass().getClassLoader(), NOTE + text);
                if (created != null) made.put(aweme, created);
                return created;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not name the sound under the description", ex);
            return null;
        }
    }

    /**
     * Called right after TikTok writes a promo tag's text into the tag's view. The tag only opens
     * the row; for the text this class handed out, the row's own title view shows it instead, so
     * every sound looks the same whether or not a song was matched. Other tags are left alone.
     */
    public static void showInMusicTitle(TextView tag) {
        if (tag == null) return;
        CharSequence text = tag.getText();
        if (text == null || !text.toString().startsWith(NOTE)) return;
        View row = rowOf(tag);
        if (row == null) return;
        View chip = row.findViewById(CHIP_ID);
        View title = row.findViewById(TITLE_ID);
        if (!(title instanceof TextView)) return;
        tag.setVisibility(View.GONE);
        // TikTok shows and hides the row's views as the rest of the bind runs, so this goes last.
        title.post(() -> {
            TextView titleView = (TextView) title;
            String sound = text.toString().substring(NOTE.length());
            // The tag only opens the row. The chip it is drawn in goes, so that the music title
            // beside TikTok's own note gets the room, and the sound's name is that title.
            if (chip != null && chip.getParent() instanceof View) ((View) chip.getParent()).setVisibility(View.GONE);
            // A matched song's own "Contains: ..." title already carries the sound's name (see
            // title) and is left as TikTok wrote it.
            CharSequence drawn = titleView.getText();
            if (drawn == null || !drawn.toString().contains(sound)) {
                titleView.setText(sound);
            }
            show(titleView, row);
            View icon = row.findViewById(ICON_ID);
            if (icon != null) show(icon, row);
            SoundNameScroll.start(titleView);
        });
    }

    private static void show(View view, View row) {
        for (View current = view; current != null && current != row;
             current = current.getParent() instanceof View ? (View) current.getParent() : null) {
            current.setVisibility(View.VISIBLE);
        }
    }

    private static View rowOf(View view) {
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (((View) parent).getId() == ROW_ID) return (View) parent;
        }
        return null;
    }

    /**
     * Called as TikTok writes the title of its music row. For a video whose sound it has matched
     * to a song, that title is "Contains: song - artist" and says nothing of the sound itself, so
     * the sound's name goes in front of it: "sound name (Contains: song - artist)".
     *
     * @param assem the music component, which keeps the bound video behind its cell proxy
     * @param title the title TikTok is about to write
     * @return the title to write
     */
    public static String title(Object assem, String title) {
        if (title == null || !Settings.SOUND_UNDER_DESCRIPTION.get()) return title;
        try {
            Object item = Reflect.readField(Reflect.readField(assem, "cellProxy"), "LL");
            Object music = Reflect.property(Reflect.property(item, "getAweme", "aweme"), "getMusic", "music");
            if (music == null || !hasMatchedSong(music)) return title;
            String name = soundName(music);
            // The flow that already writes the sound's own name needs no second one.
            if (name == null || title.contains(name)) return title;
            return name + " (" + title + ")";
        } catch (Exception ex) {
            Logger.printException(() -> "Could not put the sound name into the music row", ex);
            return title;
        }
    }

    private static String soundText(Object aweme) {
        Object music = Reflect.property(aweme, "getMusic", "music");
        return music == null ? null : soundName(music);
    }

    private static String soundName(Object music) {
        String name = Reflect.string(music, "getMusicName", "musicName");
        if (name == null) return null;
        String author = Reflect.string(music, "getAuthorName", "authorName");
        // An original sound's name already ends in its maker ("original sound - maker"), and some
        // library names carry the artist too. Only a bare title gets the author added.
        if (author != null && !name.contains(" - ") && !name.contains(author)) name = name + " - " + author;
        return name;
    }

    private static boolean hasMatchedSong(Object music) {
        if (hasStreamingSongs(music)) return true;
        Object fusion = Reflect.property(music, "getMusicFusion", "musicFusion");
        Object fused = Reflect.property(fusion, "getFusedMusicInfos", "fusedMusicInfos");
        if (!(fused instanceof List)) return false;
        for (Object item : (List<?>) fused) {
            if (hasStreamingSongs(Reflect.property(item, "getMusic", "music"))) return true;
        }
        return false;
    }

    private static boolean hasStreamingSongs(Object music) {
        Object songs = Reflect.property(music, "getTT2DSPSongInfos", "tt2DSPSongInfos");
        return songs instanceof List && !((List<?>) songs).isEmpty();
    }

    private static Object create(ClassLoader loader, String text) throws Exception {
        Class<?> type = loader.loadClass(PROMO_TAG_CLASS);
        Object tag = type.getConstructor().newInstance();
        Field field = type.getField("text");
        field.set(tag, text);
        return tag;
    }
}
