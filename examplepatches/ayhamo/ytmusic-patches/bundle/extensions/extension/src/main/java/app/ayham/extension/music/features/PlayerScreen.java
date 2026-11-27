package app.ayham.extension.music.features;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * BitChord's phone now-playing screen, built from YT Music's own views. Property ui=bitchord.
 * <p>
 * Nothing of YT's is hidden or redrawn: its title row, seek bar + controls and chips row stay
 * YT's views and only get drawn in BitChord's order (translationY, given back whenever the player
 * collapses, a sheet opens or the switch goes off). Ours fills the gaps between them, as in
 * BitChord: the artwork mesh behind the page, the stats on the art's lower edge, the lyric line
 * under the title (filled word by word when the lyrics carry word timings), the volume row under the
 * controls and the automix band on YT's seek bar. YT's chips row stays whole, under the volume (its
 * Lyrics chip and the swipe-up sheet cover lyrics and the queue); YT's cast button stays in its top bar. Every text and icon is white at a fixed alpha.
 */
final class PlayerScreen {
    private static final String TAG = "AyhamScreen";
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static FrameLayout overlay;
    private static MeshView mesh;
    private static TextView stats;
    private static Karaoke lyric;
    private static LinearLayout lyricRow, volRow;
    private static Glyph star, more;
    /** YT's title and artist max widths: they end before the star and "...". */
    private static final Map<TextView, Integer> ytMaxWidth = new WeakHashMap<>();
    private static ThinBar volume;
    private static MixZone zone;
    private static long durationMs;
    private static String meshFor = "", meshWanted = "";
    private static long meshTry;
    private static boolean layoutLogged;
    /** Where the bottom sheet's handle rests while the sheet is closed. */
    private static int sheetRest, sheetRestFor, sheetSeen = -1;
    private static long sheetSeenAt;
    private static boolean sheetOpenLogged;
    /** YT's views we draw elsewhere: {YT's own translationY, the one we set}. */
    private static final Map<View, float[]> moved = new WeakHashMap<>();
    /** YT's own title and artist colours, given back when the BitChord screen is switched off. */
    private static final Map<TextView, android.content.res.ColorStateList> ytColors = new WeakHashMap<>();

    private PlayerScreen() {
    }

    static boolean on() {
        return "bitchord".equals(Features.props().getProperty("ui"));
    }

    private static final Map<String, Integer> ids = new java.util.HashMap<>();

    /** YT's view ids by name, looked up once (tick runs on every frame). */
    static int id(Activity a, String name) {
        Integer v = ids.get(name);
        if (v == null) {
            v = a.getResources().getIdentifier(name, "id", a.getPackageName());
            ids.put(name, v);
        }
        return v;
    }

    private static int dp(Context c, float v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, c.getResources().getDisplayMetrics()));
    }

    private static int top(View v) {
        int[] at = new int[2];
        v.getLocationOnScreen(at);
        return at[1];
    }

    /** Called on every pre-draw of the activity while the player page exists. */
    static void tick(Activity a, View decor, ViewGroup page, boolean expanded) {
        if (!on()) {
            if (overlay != null && overlay.getVisibility() != View.GONE) {
                overlay.setVisibility(View.GONE);
                if (mesh != null) mesh.setVisibility(View.GONE);
                giveBack();
                giveSheetBack();
                giveColorsBack();
                FullArt.giveBack();
                Log.i(TAG, "BitChord screen switched off: YT's layout given back");
            }
            return;
        }
        ViewGroup layer = decor.findViewById(id(a, "player_page_bottom_layer"));
        if (layer == null) return;
        if (overlay != null && (overlay.getContext() != a || overlay.getParent() != layer || mesh.getParent() != page)) {
            // a new activity or player page (rotation, theme change): build ours again there
            for (View v : new View[]{overlay, mesh})
                if (v.getParent() instanceof ViewGroup) ((ViewGroup) v.getParent()).removeView(v);
            if (overlay.getContext() != a) letGo(); // the old activity's views would keep it alive
            overlay = null;
            moved.clear();
        }
        if (overlay == null) build(a, page, layer);
        overlay.setVisibility(View.VISIBLE);

        // The mesh fades with the page: full when expanded, gone by the time it reaches the mini player.
        int pageY = top(page);
        float shown = Math.max(0f, Math.min(1f, 1f - pageY / (decor.getHeight() * 0.5f)));
        mesh.setVisibility(shown > 0 ? View.VISIBLE : View.INVISIBLE);
        if (Math.abs(mesh.getAlpha() - shown) > 0.01f) mesh.setAlpha(shown);

        View art = decor.findViewById(id(a, "player_view_pager_container"));
        View song = decor.findViewById(id(a, "current_song_view"));
        View controls = decor.findViewById(id(a, "music_playback_controls"));
        View chips = decor.findViewById(id(a, "video_action_bar"));
        View sheet = decor.findViewById(id(a, "player_bottom_sheet"));
        // YT's Up next / Lyrics / Related sheet shrinks the art to a strip: the sheet owns the screen then
        boolean sheetOpen = art != null && art.getHeight() > 0 && art.getHeight() < decor.getWidth() / 2;
        // ...and the sheet starts rising before that: its handle leaves its resting place
        // (YT's own place: our drop taken out, or the drop would be learnt as YT's and add up)
        int sheetAt = sheet != null && sheet.isShown() ? top(sheet) - Math.round(ourDrop(sheet)) : decor.getHeight() - dp(a, 64);
        // YT parks the sheet below the window while it lays the page out (on the phone: 2922 on a
        // 2340 screen). That is not its resting place: learnt as one, the real place would read as
        // "sheet open" from then on and keep our layout off for good (items 2 and 9).
        if (sheetAt > decor.getHeight() - dp(a, 24)) sheetAt = decor.getHeight() - dp(a, 64);
        if (decor.getHeight() != sheetRestFor) {
            // a new window height (rotation, split screen) moves the resting place: learnt again, as
            // an old, lower one would read as "sheet open" from then on and keep our layout off
            sheetRestFor = decor.getHeight();
            sheetRest = 0;
        }
        long now = SystemClock.uptimeMillis();
        if (sheetAt != sheetSeen) {
            sheetSeen = sheetAt;
            sheetSeenAt = now;
        }
        if (expanded && pageY <= dp(a, 2) && !sheetOpen) {
            if (sheetAt > sheetRest) sheetRest = sheetAt;
            // still for a while with the art full size: wherever it is now is where it rests, also
            // when that is higher than the place learnt (a guessed or parked one)
            // (only near the bottom: Back from the open queue leaves YT's sheet half open, the art
            // still full size, and learnt there the column would squeeze above it)
            else if (now - sheetSeenAt > 600 && sheetRest != sheetAt && sheetAt > decor.getHeight() * 0.7f) sheetRest = sheetAt;
        }
        if (sheetAt < sheetRest - dp(a, 12)) sheetOpen = true;
        if (sheetOpen != sheetOpenLogged) {
            sheetOpenLogged = sheetOpen;
            Log.i(TAG, "sheet " + (sheetOpen ? "open" : "closed") + ": at " + sheetAt + ", rests at " + sheetRest
                    + ", art " + (art == null ? -1 : art.getHeight()) + ", window " + decor.getHeight());
        }
        // A drag of the page keeps our layout (it slides with the page); only near the mini player
        // is YT's given back, or every small drag would snap the art to YT's card and back
        boolean down = !page.isShown() || pageY > decor.getHeight() - dp(a, 200);
        // the sheet rests a little lower than YT has it, so the art gets the room; its drop eases out
        // as it is pulled up, and it is YT's again by the time it is open
        int drop = 0;
        if (down || sheet == null || !sheet.isShown() || sheetRest <= 0) {
            giveSheetBack();
        } else {
            float k = (sheetAt - (sheetRest - dp(a, SHEET_EASE_DP))) / (float) dp(a, SHEET_EASE_DP);
            drop = Math.round(dp(a, SHEET_DROP_DP) * Math.max(0f, Math.min(1f, k)));
            dropSheet(sheet, drop);
        }
        if (down || sheetOpen || art == null || song == null || controls == null || art.getHeight() == 0) {
            for (int i = 0; i < overlay.getChildCount(); i++) overlay.getChildAt(i).setVisibility(View.INVISIBLE);
            giveBack();
            FullArt.giveBack();
            return;
        }

        // BitChord's column: art | title row | lyric | seek bar + controls | volume | YT's chips.
        int hSong = song.getHeight(), hLyric = dp(a, 32), hCtl = controls.getHeight(), hVol = dp(a, 32);
        int hChips = chips == null ? 0 : chips.getHeight();
        int gArt = dp(a, 14), gLyric = dp(a, 2), gCtl = dp(a, 4), gVol = dp(a, 4), gChips = dp(a, 10), gEnd = dp(a, 6);
        int need = gArt + hSong + gLyric + hLyric + gCtl + hCtl + gVol + hVol + gChips + hChips + gEnd;
        // while the page is dragged the column keeps its room: the sheet's resting place, moved with the page
        int sheetTop = (pageY > dp(a, 2) && sheetRest > 0 ? sheetRest + pageY : sheetAt) + drop;

        // YT's art as BitChord's card, or its fullscreen banner: the column starts below the card's
        // box, which stays put; the mesh meets the art where it is drawn
        int artBottom = FullArt.apply(a, decor, art, sheetTop - need, Math.max(0, pageY));
        int seam = FullArt.drawnBottom() - top(mesh);
        int bannerTop = Math.max(0, pageY) - top(mesh);
        float e = FullArt.progress();
        if (mesh.seam != seam || mesh.bannerTop != bannerTop || mesh.e != e) {
            mesh.seam = seam;
            mesh.bannerTop = bannerTop;
            mesh.e = e;
            mesh.invalidate();
        }
        ArtBackdrop.tick(a, decor, mesh);
        catchArt(a, decor, song);
        int avail = sheetTop - artBottom;
        int extra = avail - need;
        if (extra < 0) {
            // a short screen: the gaps give way first, evenly
            float k = Math.max(0f, 1f + extra / (float) (gArt + gLyric + gCtl + gVol + gChips + gEnd));
            gArt *= k; gLyric *= k; gCtl *= k; gVol *= k; gChips *= k; gEnd *= k;
        } else {
            // tall-screen slack: up to 48dp split around the transport (BitChord's controlSpread),
            // the rest above and below the column
            int spread = Math.min(extra, dp(a, 48));
            gCtl += spread / 2;
            gVol += spread / 2;
            // the rest above the column (the user: the whole column lower, the art bigger); it used to
            // be split above and below, and the sheet rested [drop] higher
            gArt += extra - spread;
        }
        int y = artBottom + gArt;
        // Metrolist's fade bounds for an animated cover: from above the title to the artist's line
        int[] so = new int[2], vo = new int[2];
        song.getLocationOnScreen(so);
        View tv = song.findViewById(id(a, "title")), av = song.findViewById(id(a, "artist"));
        float titleTop = y, artistBottom = y + hSong;
        if (tv != null && tv.isShown()) {
            tv.getLocationOnScreen(vo);
            titleTop = y + vo[1] - so[1];
        }
        if (av != null && av.isShown()) {
            av.getLocationOnScreen(vo);
            artistBottom = y + vo[1] - so[1] + av.getHeight();
        }
        int pageTop = Math.max(0, pageY);
        FullArt.bounds(titleTop - pageTop, artistBottom - pageTop, decor.getHeight(), decor);
        place(song, y);
        int songEnd = y + hSong;
        y += hSong + gLyric + hLyric + gCtl;
        place(controls, y);
        // the lyric line sits in the middle of the room between the title row and the seek bar
        int lyricY = songEnd + (y - songEnd - hLyric) / 2;
        int ctlY = y;
        y += hCtl + gVol;
        int volY = y;
        y += hVol + gChips;
        if (chips != null && hChips > 0) place(chips, y);

        int oy = top(overlay);
        for (int i = 0; i < overlay.getChildCount(); i++) overlay.getChildAt(i).setVisibility(View.VISIBLE);
        moveTo(lyricRow, lyricY - oy);
        moveTo(volRow, volY - oy);
        // the stats stay where the square art would end (the grown banner runs on to the title)
        moveTo(stats, Math.min(FullArt.drawnBottom(), FullArt.squareBottom()) - dp(a, 10) - stats.getHeight() - oy);
        // the star and "..." at the title row's end, centred on it; the row ends before them
        int g = dp(a, 34), right = decor.getWidth() - (song.getLeft() > 0 ? song.getLeft() : dp(a, 20));
        View titleView = song.findViewById(id(a, "title"));
        if (titleView != null && titleView.getLeft() > 0) right = decor.getWidth() - titleView.getLeft();
        int songMid = top(song) + song.getHeight() / 2 - oy;
        moveTo(more, songMid - g / 2f);
        if (more.getTranslationX() != right - g) more.setTranslationX(right - g);
        moveTo(star, songMid - g / 2f);
        if (star.getTranslationX() != right - 2 * g - dp(a, 8)) star.setTranslationX(right - 2 * g - dp(a, 8));
        // the title and artist end before the star (their max width: YT re-sets the row's padding on
        // every layout, so padding it would lay the page out again on every frame)
        int room = right - 2 * g - dp(a, 8) - dp(a, 10) - (song.getLeft() + (titleView != null ? titleView.getLeft() : 0));
        maxWidth(titleView, room);
        maxWidth(song.findViewById(id(a, "artist")), room);
        View bar = decor.findViewById(id(a, "time_bar"));
        if (bar != null) {
            moveTo(zone, top(bar) - oy);
            // the zone runs on under the bar, over YT's times: the "Mixing" label goes there
            zone.barH = bar.getHeight();
            ViewGroup.LayoutParams lp = zone.getLayoutParams();
            if (lp.height != bar.getHeight() + dp(a, 32)) {
                lp.height = bar.getHeight() + dp(a, 32);
                zone.setLayoutParams(lp);
            }
        }
        // YT's title and artist in BitChord's colours: white, the artist at 55%
        View t = song.findViewById(id(a, "title"));
        View ar = song.findViewById(id(a, "artist"));
        tint(t, Color.WHITE);
        tint(ar, 0x8CFFFFFF);
        whiteTimes(bar);
        dimTopIcons(a, decor);
        if (!layoutLogged) {
            layoutLogged = true;
            Log.i(TAG, "laid out: art ends " + artBottom + ", title " + top(song) + ", lyric " + lyricY + ", controls " + ctlY
                    + ", volume " + volY + ", chips " + (chips == null ? -1 : top(chips))
                    + ", sheet " + sheetTop + " (slack " + extra + "px)");
        }
    }

    /** Draw one of YT's views with its top at screenY; its own translation is kept to give back. */
    private static void place(View v, int screenY) {
        float cur = v.getTranslationY();
        float[] s = moved.get(v);
        if (s == null || Math.abs(cur - s[1]) > 0.5f) {
            // first time, or YT moved it itself since: that is its own value now
            s = new float[]{cur, cur};
            moved.put(v, s);
        }
        float want = cur + (screenY - top(v));
        if (Math.abs(want - cur) > 0.5f) v.setTranslationY(want);
        s[1] = want;
    }

    private static void tint(View v, int color) {
        if (!(v instanceof TextView)) return;
        TextView t = (TextView) v;
        if (t.getCurrentTextColor() == color) return;
        if (!ytColors.containsKey(t)) ytColors.put(t, t.getTextColors());
        t.setTextColor(color);
    }

    /** YT's title and artist colours back (switch off). */
    private static void giveColorsBack() {
        for (Map.Entry<TextView, android.content.res.ColorStateList> e : ytColors.entrySet())
            if (e.getKey() != null && e.getValue() != null) e.getKey().setTextColor(e.getValue());
        ytColors.clear();
        for (Map.Entry<Paint, Integer> e : ytTimeColors.entrySet()) e.getKey().setColor(e.getValue());
        ytTimeColors.clear();
        if (timesBar != null) timesBar.invalidate();
        timesBar = null;
        timePaints = null;
    }

    /** YT's time bar draws its times itself: its text paints (and their own colours, to give back). */
    private static View timesBar;
    private static List<Paint> timePaints;
    private static final Map<Paint, Integer> ytTimeColors = new java.util.HashMap<>();

    /** The times under the seek bar in the title's white (YT's grey is hard to read on light art). */
    private static void whiteTimes(View bar) {
        if (bar == null) return;
        if (bar != timesBar) {
            timesBar = bar;
            timePaints = new ArrayList<>();
            // the paints with a text size set: the default is 12 px, YT's times are 12 sp and up
            for (Class<?> c = bar.getClass(); c != null && c != View.class; c = c.getSuperclass())
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (!Paint.class.isAssignableFrom(f.getType()) || java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                    try {
                        f.setAccessible(true);
                        Paint pt = (Paint) f.get(bar);
                        if (pt != null && pt.getTextSize() > 13 && !timePaints.contains(pt)) timePaints.add(pt);
                    } catch (Throwable ignored) {
                    }
                }
            StringBuilder sb = new StringBuilder();
            for (Paint pt : timePaints) sb.append(String.format(java.util.Locale.ROOT, " #%08X/%.0fpx", pt.getColor(), pt.getTextSize()));
            Log.i(TAG, "time bar " + bar.getClass().getName() + ": " + timePaints.size() + " text paints" + sb);
        }
        boolean changed = false;
        for (Paint pt : timePaints) {
            if (pt.getColor() == Color.WHITE) continue;
            if (!ytTimeColors.containsKey(pt)) ytTimeColors.put(pt, pt.getColor());
            pt.setColor(Color.WHITE);
            changed = true;
        }
        if (changed) bar.invalidate();
    }

    /** How bright the cast and ⋮ buttons in YT's top bar are drawn: quieter, like its audio/video switch (item 1). */
    private static final float TOP_ICONS_ALPHA = 0.55f;
    private static final List<View> dimmed = new ArrayList<>();
    /** The automix stats line: whether it was shown last refresh, and its last text (for the log). */
    private static boolean mixShown;
    private static String lastMix;

    /** Cast and ⋮ of the player's top bar (its ⋮ is looked up next to the cast button: feed rows have one too). */
    private static void dimTopIcons(Activity a, View decor) {
        View cast = decor.findViewById(id(a, "cast_button_container"));
        View menu = cast != null && cast.getParent() instanceof ViewGroup
                ? ((ViewGroup) cast.getParent()).findViewById(id(a, "contextual_menu")) : null;
        for (View v : new View[]{cast, menu}) {
            if (v == null || v.getAlpha() == TOP_ICONS_ALPHA) continue;
            if (v.getAlpha() != 1f) continue; // YT is fading it itself (the page moving): leave it
            v.setAlpha(TOP_ICONS_ALPHA);
            if (!dimmed.contains(v)) dimmed.add(v);
        }
    }

    /** How far the Up next sheet rests below YT's place, giving the art room (the user's ask). */
    private static final int SHEET_DROP_DP = 28;
    /** Over how much of the sheet's own rise the drop eases out, so a drag meets YT's sheet smoothly. */
    private static final int SHEET_EASE_DP = 160;
    private static View droppedSheet;
    private static float sheetYt, sheetOurs;

    /** Our drop on [sheet] now (0 when YT has moved it itself since: its value then). */
    private static float ourDrop(View sheet) {
        if (sheet != droppedSheet) return 0;
        if (Math.abs(sheet.getTranslationY() - sheetOurs) > 0.5f) {
            droppedSheet = null;
            return 0;
        }
        return sheetOurs - sheetYt;
    }

    private static void dropSheet(View sheet, float drop) {
        if (sheet != droppedSheet) {
            giveSheetBack();
            droppedSheet = sheet;
            sheetYt = sheet.getTranslationY();
            sheetOurs = sheetYt;
        }
        float want = sheetYt + drop;
        if (Math.abs(want - sheetOurs) > 0.5f) {
            sheet.setTranslationY(want);
            sheetOurs = want;
        }
    }

    /** YT's sheet where YT put it (the page collapsed, or the screen switched off). */
    private static void giveSheetBack() {
        View s = droppedSheet;
        droppedSheet = null;
        if (s != null && Math.abs(s.getTranslationY() - sheetOurs) < 0.5f) s.setTranslationY(sheetYt);
    }

    /** YT's views of a gone activity let go, not given back (they went with it): held, they keep it alive. */
    private static void letGo() {
        dimmed.clear();
        droppedSheet = null;
        timesBar = null;
        timePaints = null;
        ytTimeColors.clear();
    }

    /** YT's views back where YT put them (collapse, sheet, switch off). */
    private static void giveBack() {
        for (View v : dimmed) if (v.getAlpha() == TOP_ICONS_ALPHA) v.setAlpha(1f);
        dimmed.clear();
        if (zone != null) zone.showYts(); // a mix may have hidden YT's seek bar
        for (Map.Entry<TextView, Integer> e : ytMaxWidth.entrySet())
            if (e.getKey() != null) e.getKey().setMaxWidth(e.getValue());
        ytMaxWidth.clear();
        if (moved.isEmpty()) return;
        for (Map.Entry<View, float[]> e : moved.entrySet()) {
            View v = e.getKey();
            if (v != null && Math.abs(v.getTranslationY() - e.getValue()[1]) < 0.5f) v.setTranslationY(e.getValue()[0]);
        }
        moved.clear();
    }

    private static void moveTo(View v, float y) {
        if (Math.abs(v.getTranslationY() - y) > 0.5f) v.setTranslationY(y);
    }

    private static TextView text(Context c, float sp, int color, boolean bold) {
        TextView t = new TextView(c);
        t.setTextSize(sp);
        t.setTextColor(color);
        t.setSingleLine(true);
        t.setEllipsize(TextUtils.TruncateAt.END);
        t.setIncludeFontPadding(false);
        if (bold) t.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        return t;
    }

    private static FrameLayout.LayoutParams at(int w, int h, int sideMargin) {
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(w, h, Gravity.TOP | Gravity.START);
        lp.leftMargin = sideMargin;
        lp.rightMargin = sideMargin;
        return lp;
    }

    private static void build(Activity a, ViewGroup page, ViewGroup layer) {
        // The mesh goes right above YT's own page background, under everything else.
        mesh = new MeshView(a);
        View bg = page.findViewById(id(a, "player_page_background"));
        int at = bg != null && bg.getParent() == page ? page.indexOfChild(bg) + 1 : 0;
        page.addView(mesh, at, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Ours over YT's bottom layer. The frame takes no touches; only its children do.
        overlay = new FrameLayout(a);
        int side = dp(a, 20); // YT's own side margin on the title row
        View song = layer.findViewById(id(a, "current_song_view"));
        View t = song == null ? null : song.findViewById(id(a, "title"));
        if (t != null && t.getLeft() > 0) side = t.getLeft();

        // BitChord's SleeveNerdStats: centred labelSmall with a soft black shadow; the stream line at
        // 65% white, the Automix line under it at 50% (up to two lines)
        stats = text(a, 11, 0xA6FFFFFF, false);
        stats.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        stats.setSingleLine(false);
        stats.setMaxLines(3);
        stats.setGravity(Gravity.CENTER_HORIZONTAL);
        stats.setShadowLayer(dp(a, 4), 0, dp(a, 1), 0x8C000000);
        overlay.addView(stats, at(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, side + dp(a, 12)));
        // the automix line opens the Automix overview (the extension's Automix toast does the same)
        stats.setOnClickListener(v -> MixOverview.show(a));

        // lyric line (BitChord's strip): 16sp W600, its chevron drawn right after the words; opens YT's Lyrics tab
        lyricRow = new LinearLayout(a);
        lyricRow.setGravity(Gravity.CENTER_VERTICAL);
        lyric = new Karaoke(a);
        lyric.setTextSize(16);
        lyric.setTextColor(Color.WHITE);
        lyric.setSingleLine(true);
        lyric.setEllipsize(TextUtils.TruncateAt.END);
        lyric.setIncludeFontPadding(false);
        lyric.setLetterSpacing(0.05f / 16f);
        lyric.setTypeface(android.os.Build.VERSION.SDK_INT >= 28 ? Typeface.create(Typeface.DEFAULT, 600, false)
                : Typeface.create("sans-serif-medium", Typeface.NORMAL));
        lyric.setPadding(0, 0, dp(a, Karaoke.CHEVRON_ROOM), 0);
        lyricRow.addView(lyric, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        lyricRow.setOnClickListener(v -> openLyrics(a));
        lyricRow.setClickable(false);
        overlay.addView(lyricRow, at(ViewGroup.LayoutParams.MATCH_PARENT, dp(a, 32), side));

        // the automix band, drawn on YT's own seek bar
        zone = new MixZone(a);
        overlay.addView(zone, at(ViewGroup.LayoutParams.MATCH_PARENT, dp(a, 24), 0));

        // volume: quiet icon | thin bar | loud icon
        AudioManager am = (AudioManager) a.getSystemService(Context.AUDIO_SERVICE);
        volRow = new LinearLayout(a);
        volRow.setGravity(Gravity.CENTER_VERTICAL);
        volume = new ThinBar(a, am.getStreamMaxVolume(AudioManager.STREAM_MUSIC), value -> {
            am.setStreamVolume(AudioManager.STREAM_MUSIC, value, 0);
            Log.i(TAG, "volume -> " + value + " (stream now " + am.getStreamVolume(AudioManager.STREAM_MUSIC) + ")");
        });
        LinearLayout.LayoutParams icon = new LinearLayout.LayoutParams(dp(a, 20), dp(a, 20));
        volRow.addView(new Speaker(a, false), icon);
        LinearLayout.LayoutParams bar = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f);
        bar.leftMargin = dp(a, 10);
        bar.rightMargin = dp(a, 10);
        volRow.addView(volume, bar);
        volRow.addView(new Speaker(a, true), new LinearLayout.LayoutParams(dp(a, 20), dp(a, 20)));
        overlay.addView(volRow, at(ViewGroup.LayoutParams.MATCH_PARENT, dp(a, 32), side));

        // Apple Music / BitChord: a star and a "..." beside the title
        star = new Glyph(a, Glyph.STAR, true);
        star.setOnClickListener(v -> {
            View like = likeChip(a);
            Log.i(TAG, "star -> YT's like chip" + (like == null ? " (missing)" : " click=" + like.performClick()));
        });
        more = new Glyph(a, Glyph.MORE, true);
        more.setOnClickListener(v -> menu(a, v));
        overlay.addView(star, at(dp(a, 34), dp(a, 34), 0));
        overlay.addView(more, at(dp(a, 34), dp(a, 34), 0));

        layer.addView(overlay, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        layoutLogged = false;
        sheetRest = 0;
        meshFor = "";
        Log.i(TAG, "BitChord layout on YT's views: mesh in " + page.getClass().getSimpleName() + " at " + at
                + ", our pieces in player_page_bottom_layer");
        loop(a);
    }

    /** ArtistArt's Apple palette. BitChord keeps every text and icon white, so nothing takes it now. */
    static void accent(int background, int accent) {
    }

    private static void loop(Activity a) {
        FrameLayout mine = overlay;
        main.postDelayed(() -> {
            if (overlay == null || overlay != mine) return;
            if (a.isDestroyed()) {
                // the activity is gone (closed with the music still playing): our views would keep it
                // alive in these fields until the next one opens; built again then
                if (mesh != null && mesh.getParent() instanceof ViewGroup) ((ViewGroup) mesh.getParent()).removeView(mesh);
                overlay = null;
                mesh = null;
                stats = null;
                lyric = null;
                lyricRow = volRow = null;
                star = more = null;
                volume = null;
                zone = null;
                moved.clear();
                letGo();
                FullArt.giveBack();
                return;
            }
            // only while it shows: not while collapsed, under a sheet or switched off
            if (lyricRow.isShown()) refresh(a);
            loop(a);
        }, 500);
    }

    /** Our pieces' contents. */
    private static void refresh(Activity a) {
        try {
            View decor = a.getWindow().getDecorView();
            View bar = decor.findViewById(id(a, "time_bar"));
            if (bar != null) {
                // YT's time bar is a custom view; its accessibility text has the length:
                // "1 minutes 5 seconds of 3 minutes 20 seconds"
                CharSequence d = bar.createAccessibilityNodeInfo().getContentDescription();
                java.util.regex.Matcher m = java.util.regex.Pattern
                        .compile("of (?:(\\d+) hours? )?(\\d+) minutes? (\\d+) seconds?").matcher(String.valueOf(d));
                if (m.find()) {
                    long h = m.group(1) == null ? 0 : Long.parseLong(m.group(1));
                    durationMs = ((h * 60 + Long.parseLong(m.group(2))) * 60 + Long.parseLong(m.group(3))) * 1000;
                }
                // The zone carries the player's own length, so the band also draws when YT's text is in
                // another language (the English parse above is only the fallback).
                long[] z = app.ayham.extension.music.automix.Automix.zone();
                if (durationMs > 0 || z != null) zone.set(z, durationMs);
            }
            zone.badge(PlayerTap.badge());
            // canvas.md §14: the best part, its mark on the bar and its button
            try {
                String bpId = app.ayham.extension.music.automix.Automix.currentId();
                long bpPos = app.ayham.extension.music.automix.Automix.positionMs(), bpDur = app.ayham.extension.music.automix.Automix.durationMs();
                BestPart.tick(bpId, bpPos, bpDur);
                long part = BestPart.partMs(bpId);
                boolean button = part >= 0 && Features.switchOn("bestPartButton") && BestPart.shows(bpPos, part, BestPart.knownAtMs());
                zone.best(part, bpDur, button, BestPart.mine(bpId));
            } catch (Throwable t) {
                Features.failed("bestPart", t);
            }
            AudioManager am = (AudioManager) a.getSystemService(Context.AUDIO_SERVICE);
            volume.setValue(am.getStreamVolume(AudioManager.STREAM_MUSIC));
            refreshLine(a);
            star.setLit(likeLit(a));
            String s = Features.currentStats(), mix = Features.currentAutomixStats();
            android.text.SpannableStringBuilder b = new android.text.SpannableStringBuilder();
            if (s != null && !s.isEmpty()) b.append(s);
            if (mix != null && !mix.isEmpty()) {
                if (b.length() > 0) b.append('\n');
                int from = b.length();
                b.append(mix);
                b.setSpan(new android.text.style.ForegroundColorSpan(0x80FFFFFF), from, b.length(), android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            boolean hasMix = mix != null && !mix.isEmpty();
            if (hasMix != mixShown) {
                // the automix line coming and going, with why and where (the user saw it vanish at
                // 0:22 into Vaina Loca; caught on the final phone pass)
                Log.i(TAG, "automix stats line " + (hasMix ? "shown: '" + mix + "'" : "gone ("
                        + app.ayham.extension.music.automix.Automix.noStatusWhy + "), was '" + lastMix + "'")
                        + " at " + String.format(java.util.Locale.US, "%.1f",
                        app.ayham.extension.music.automix.Automix.positionMs() / 1000.0) + " s");
                mixShown = hasMix;
            }
            if (hasMix) lastMix = mix;
            stats.setText(b);
            stats.setVisibility(b.length() == 0 ? View.INVISIBLE : View.VISIBLE);
        } catch (Throwable e) {
            Log.w(TAG, "refresh failed", e);
        }
    }

    /** BitChord's lines while lyrics load, and before the first sung line (one per song). */
    private static final String[] LOADING_LINES = {"Getting the lyrics", "Finding the words", "Fetching the verses",
            "Lyrics are loading", "Checking the lyric sheet", "Searching the songbook", "Lining up the lyrics",
            "Words are on the way", "Checking the archives", "Finding the right words", "Lyrics are coming together",
            "Almost found the words"};
    private static final String[] INTRO_LINES = {"The beat is landing", "The song is starting", "Warming up",
            "Setting the mood", "Bass first, words later", "Wait for it", "Feel that build", "Just the groove for now",
            "The hook is on the way", "Let it breathe", "Cue the vocals", "First notes in"};

    private static String pick(String[] lines, String song) {
        return lines[Math.floorMod(song.hashCode(), lines.length)];
    }

    /**
     * The lyric line, as BitChord's strip: Morphe's line (word fill when timed), the intro and
     * instrumental gaps with a note, a loading line, "Lyrics not available", or a note and "Lyrics"
     * for lyrics without timing. The chevron and the tap only when there are lyrics.
     */
    static void refreshLine(Activity a) {
        if (lyric == null) return;
        if (tapPaused() && lyric.kind == Karaoke.LINE) {
            // just paused: Morphe's line would run on for a second and come back
            lyric.invalidate();
            return;
        }
        Features.readLyricLine();
        String line = Features.currentLyricLine();
        boolean off = "0".equals(Features.props().getProperty("lyricLine"));
        // No song on the page (YT's restored queue offline shows an empty title): no line either,
        // or Morphe's last line from an earlier song would stay up.
        View song = a.getWindow().getDecorView().findViewById(id(a, "current_song_view"));
        View title = song == null ? null : song.findViewById(id(a, "title"));
        String name = title instanceof TextView ? ((TextView) title).getText().toString().trim() : "";
        String shown = line == null ? "" : line.trim();
        // Morphe's line past its end (it fades out): the line due instead, as BitChord never leaves it blank
        if (!Features.lyricHeld()) shown = LyricTiming.catchUp(shown);
        // mid-mix, YT shows the incoming song but it plays on our deck: its line where the singing is
        String deck = LyricTiming.deckLine();
        if (deck != null) shown = deck;
        int status = off || name.isEmpty() ? LyricTiming.NONE : LyricTiming.status();
        String text = "";
        int kind = Karaoke.INFO;
        boolean lyrics = false;
        if (off || name.isEmpty()) {
            // nothing
        } else if (!shown.isEmpty() || status == LyricTiming.TIMED) {
            lyrics = true;
            int phase = Features.lyricHeld() ? 0 : LyricTiming.phase(shown);
            if (phase == 1) {
                text = pick(INTRO_LINES, name);
                kind = Karaoke.NOTE;
            } else if (phase == 2 || LyricTiming.letters(shown).isEmpty()) {
                text = "Instrumental";
                kind = Karaoke.NOTE;
            } else {
                text = shown;
                kind = Karaoke.LINE;
            }
        } else if (status == LyricTiming.LOADING) {
            text = pick(LOADING_LINES, name);
        } else if (status == LyricTiming.MISSING) {
            text = "Lyrics not available";
            kind = Karaoke.MISSING;
        } else if (status == LyricTiming.PLAIN) {
            lyrics = true;
            text = "Lyrics";
            kind = Karaoke.NOTE;
        }
        lyricRow.setClickable(lyrics);
        lyric.show(text, kind, lyrics);
    }

    // ---- the artwork mesh (BitChord ArtworkMeshBackdrop) ----

    /** On a new song, copy the art off the screen (a few tries: the art loads late) and build the mesh. */
    private static void catchArt(Activity a, View decor, View song) {
        View t = song.findViewById(id(a, "title"));
        View ar = song.findViewById(id(a, "artist"));
        String key = (t instanceof TextView ? ((TextView) t).getText() : "") + "\u0000" + (ar instanceof TextView ? ((TextView) ar).getText() : "");
        long now = SystemClock.uptimeMillis();
        if (!key.equals(meshWanted)) {
            meshWanted = key;
            meshTry = now + 700; // first copy once YT has drawn the new art
            return;
        }
        if (key.equals(meshFor) || now < meshTry) return;
        meshTry = now + 1500;
        // The art card, without its edges (our own mesh shows beside it).
        View card = decor.findViewById(id(a, "card_view_container"));
        if (card == null || !card.isShown()) card = decor.findViewById(id(a, "watch_fragment_container"));
        if (card == null || !card.isShown()) card = decor.findViewById(id(a, "player_view_pager_container"));
        if (card == null || card.getWidth() == 0) return;
        int[] at = new int[2];
        card.getLocationInWindow(at);
        // the art as drawn: the fullscreen banner scales it, and fades its lower part out
        float sc = 1f;
        for (View v = card; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) sc *= v.getScaleX();
        int w = Math.round(card.getWidth() * sc), h = Math.round(Math.min(card.getHeight(), card.getWidth()) * sc);
        h = Math.round(h * (1 - 0.3f * FullArt.progress())); // above where the banner's blur starts
        int inset = w / 12;
        Rect src = new Rect(at[0] + inset, at[1] + inset, at[0] + w - inset, at[1] + h - inset);
        if (src.width() <= 0 || src.height() <= 0) return;
        Bitmap shot = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888);
        try {
            PixelCopy.request(a.getWindow(), src, shot, result -> {
                if (result != PixelCopy.SUCCESS || !key.equals(meshWanted) || mesh == null) return;
                Bitmap m = buildMesh(shot);
                if (m == null) return; // nothing drawn there yet
                meshFor = key;
                int[] px = new int[48 * 48];
                shot.getPixels(px, 0, 48, 0, 0, 48, 48);
                mesh.show(m, ArtMesh.glare(px));
                Log.i(TAG, "mesh from the art of '" + key.replace('\u0000', '/') + "'");
            }, main);
        } catch (Throwable e) {
            Log.w(TAG, "art copy failed", e);
        }
    }

    /** 6x6 averaged grid, a little more saturated, flipped so row 0 is the colour the art ends on, blurred at 32x32. */
    private static Bitmap buildMesh(Bitmap shot) {
        final int n = 6, cell = 8;
        int[] grid = new int[n * n];
        float[] hsv = new float[3];
        long lum = 0;
        for (int gy = 0; gy < n; gy++)
            for (int gx = 0; gx < n; gx++) {
                long r = 0, g = 0, b = 0;
                for (int y = 0; y < cell; y++)
                    for (int x = 0; x < cell; x++) {
                        int p = shot.getPixel(gx * cell + x, gy * cell + y);
                        r += Color.red(p);
                        g += Color.green(p);
                        b += Color.blue(p);
                    }
                int c = Color.rgb((int) (r / 64), (int) (g / 64), (int) (b / 64));
                lum += r + g + b;
                Color.colorToHSV(c, hsv);
                hsv[1] = Math.min(1f, hsv[1] * 1.12f);
                // BitChord's floor keeps black art from a dead black page; the cap is ours: plain white
                // text (no blend modes here) has to stay readable on light art.
                hsv[2] = Math.max(0.06f, Math.min(0.42f, hsv[2]));
                grid[(n - 1 - gy) * n + gx] = Color.HSVToColor(hsv);
            }
        if (lum == 0) return null;
        Bitmap small = Bitmap.createBitmap(grid, n, n, Bitmap.Config.ARGB_8888);
        Bitmap big = Bitmap.createScaledBitmap(small, 32, 32, true);
        int[] px = new int[32 * 32];
        big.getPixels(px, 0, 32, 0, 0, 32, 32);
        for (int pass = 0; pass < 3; pass++) px = boxBlur(px, 32);
        return Bitmap.createBitmap(px, 32, 32, Bitmap.Config.ARGB_8888);
    }

    private static int[] boxBlur(int[] in, int s) {
        int[] out = new int[in.length];
        for (int y = 0; y < s; y++)
            for (int x = 0; x < s; x++) {
                int r = 0, g = 0, b = 0, k = 0;
                for (int dy = -1; dy <= 1; dy++)
                    for (int dx = -1; dx <= 1; dx++) {
                        int xx = Math.max(0, Math.min(s - 1, x + dx)), yy = Math.max(0, Math.min(s - 1, y + dy));
                        int p = in[yy * s + xx];
                        r += Color.red(p);
                        g += Color.green(p);
                        b += Color.blue(p);
                        k++;
                    }
                out[y * s + x] = Color.rgb(r / k, g / k, b / k);
            }
        return out;
    }

    /** Floor #121212, the mesh stretched from the art's lower edge down, row 0 stretched above it, a dark gradient on top. */
    private static final class MeshView extends View {
        private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
        private final Paint shade = new Paint();
        private Bitmap now, before;
        private long fadeStart;
        int seam, bannerTop;
        float e;
        private int shadeFor = -1, glare, shown;

        MeshView(Context c) {
            super(c);
        }

        void show(Bitmap m, int glare) {
            before = now;
            now = m;
            this.glare = glare;
            fadeStart = SystemClock.uptimeMillis();
            invalidate();
        }

        private void draw(Canvas c, Bitmap m, int alpha) {
            paint.setAlpha(alpha);
            int w = getWidth(), h = getHeight(), s = Math.max(0, Math.min(seam, h));
            if (s > 0) c.drawBitmap(m, new Rect(0, 0, m.getWidth(), 1), new RectF(0, 0, w, s), paint);
            c.drawBitmap(m, null, new RectF(0, s, w, h), paint);
        }

        @Override
        protected void onDraw(Canvas c) {
            c.drawColor(0xFF121212);
            // Metrolist's bleed (or an animated cover's backdrop); the colour mesh until there is one
            int extra = ArtBackdrop.glare();
            if (!ArtBackdrop.draw(c, this, bannerTop, e)) {
                if (now == null) return;
                extra = glare;
                float t = Math.min(1f, (SystemClock.uptimeMillis() - fadeStart) / 900f);
                if (before != null && t < 1f) draw(c, before, 255);
                draw(c, now, Math.round(255 * t));
                if (t < 1f) postInvalidateOnAnimation();
            }
            // BitChord's scrim over every backdrop (ArtworkMeshBackdrop: black 6% to 30%), enough to keep
            // white text off a bright sleeve; the bleed and the clip's backdrop had none (a near-white
            // cover left the title, times and controls white on white); a bright cover gets more (ArtMesh.glare)
            // eased to a new song's amount, no step
            if (shown != extra) {
                shown += Math.abs(extra - shown) < 4 ? extra - shown : (extra - shown) / 6;
                postInvalidateOnAnimation();
            }
            if (shown > 0) c.drawColor(shown << 24);
            if (shadeFor != getHeight()) {
                shadeFor = getHeight();
                shade.setShader(new LinearGradient(0, 0, 0, getHeight(), 0x0F000000, 0x4D000000, Shader.TileMode.CLAMP));
            }
            c.drawRect(0, 0, getWidth(), getHeight(), shade);
        }
    }

    // ---- small pieces ----

    /** BitChord's ThinSlider: a capsule, no thumb, 6dp (10dp while dragged), white 92% on white 26%. */
    private static final class ThinBar extends View {
        interface Listener {
            void changed(int value);
        }

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int max;
        private final Listener listener;
        private int value;
        private boolean active;

        ThinBar(Context c, int max, Listener l) {
            super(c);
            this.max = Math.max(1, max);
            this.listener = l;
        }

        void setValue(int v) {
            if (active || v == value) return;
            value = v;
            invalidate();
        }

        @Override
        public boolean onTouchEvent(MotionEvent e) {
            switch (e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    getParent().requestDisallowInterceptTouchEvent(true);
                    active = true;
                    // fall through
                case MotionEvent.ACTION_MOVE:
                    int v = Math.round(Math.max(0f, Math.min(1f, e.getX() / getWidth())) * max);
                    if (v != value) {
                        value = v;
                        listener.changed(v);
                    }
                    invalidate();
                    return true;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    active = false;
                    invalidate();
                    return true;
            }
            return super.onTouchEvent(e);
        }

        @Override
        protected void onDraw(Canvas c) {
            float d = getResources().getDisplayMetrics().density;
            float h = (active ? 10 : 6) * d, cy = getHeight() / 2f, w = getWidth();
            paint.setColor(0x42FFFFFF);
            c.drawRoundRect(0, cy - h / 2, w, cy + h / 2, h / 2, h / 2, paint);
            float fill = Math.max(h, w * value / max);
            paint.setColor(0xEBFFFFFF);
            c.drawRoundRect(0, cy - h / 2, fill, cy + h / 2, h / 2, h / 2, paint);
        }
    }

    /** Volume icons, white at 50%: a speaker with one wave (quiet) or three (loud). */
    private static final class Speaker extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean loud;

        Speaker(Context c, boolean loud) {
            super(c);
            this.loud = loud;
            paint.setColor(0x80FFFFFF);
        }

        @Override
        protected void onDraw(Canvas c) {
            float s = Math.min(getWidth(), getHeight()) / 20f;
            paint.setStyle(Paint.Style.FILL);
            Path p = new Path();
            p.moveTo(2 * s, 7 * s);
            p.lineTo(6 * s, 7 * s);
            p.lineTo(11 * s, 3 * s);
            p.lineTo(11 * s, 17 * s);
            p.lineTo(6 * s, 13 * s);
            p.lineTo(2 * s, 13 * s);
            p.close();
            c.drawPath(p, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.6f * s);
            paint.setStrokeCap(Paint.Cap.ROUND);
            for (int i = 0; i < (loud ? 3 : 1); i++) {
                float r = (3 + i * 3) * s;
                c.drawArc(11 * s - r, 10 * s - r, 11 * s + r, 10 * s + r, -45, 90, false, paint);
            }
        }
    }

    /**
     * The part of the song automix mixes over, drawn on YT's seek bar as BitChord does: a white band
     * at 50% with soft ends from the takeover to the end. While the mix runs, YT's bar is hidden and
     * the fill sweeps to the end and pulses on the beat ({@link #mixLook}).
     */
    private static final class MixZone extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);
        /** YT's seek bar's height: the track is centred in it; the zone reaches below it. */
        int barH;
        private long from = -1, dur;
        private boolean running;

        MixZone(Context c) {
            super(c);
            label.setColor(Color.WHITE);
            label.setTextAlign(Paint.Align.CENTER);
            label.setTextSize(12 * c.getResources().getDisplayMetrics().scaledDensity);
            label.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            label.setShadowLayer(4 * c.getResources().getDisplayMetrics().density, 0, c.getResources().getDisplayMetrics().density, 0x8C000000);
        }

        // ---- the quality badge (BitChord's LosslessOrStats), where "Mixing" goes when no mix runs ----
        private app.ayham.extension.music.addons.Quality.Badge badge = app.ayham.extension.music.addons.Quality.Badge.NONE;
        private final Paint badgeText = new Paint(Paint.ANTI_ALIAS_FLAG), glyph = new Paint(Paint.ANTI_ALIAS_FLAG);
        private Paint layerPaint, bandPaint;
        private android.graphics.Path wave, dolby;
        private final long badgeStart = android.os.SystemClock.uptimeMillis();

        void badge(app.ayham.extension.music.addons.Quality.Badge b) {
            if (b == null || b == badge) return;
            Log.i(TAG, "quality badge: " + (b == app.ayham.extension.music.addons.Quality.Badge.NONE ? "none" : b.label()));
            badge = b;
            invalidate();
        }

        /** BitChord's chrome: full white is 0.73 under the blend, anything else 0.15 below its strength. */
        private final float FULL = CHROME_FULL;

        private int white(float a) {
            float v = chromeWhite(a);
            return (Math.round(255 * v) << 24) | 0xFFFFFF;
        }

        private void sweep(Canvas canvas, float l, float r, float top, float bottom, float centre, float band, int base, int peak) {
            bandPaint.setShader(new LinearGradient(centre - band, 0, centre + band, 0,
                    new int[]{base, peak, base}, null, Shader.TileMode.CLAMP));
            canvas.drawRect(l, top, r, bottom, bandPaint);
        }

        private void drawBadge(Canvas canvas, float d, float cy) {
            app.ayham.extension.music.addons.Quality.Badge b = badge;
            if (b == app.ayham.extension.music.addons.Quality.Badge.NONE) return;
            long t = android.os.SystemClock.uptimeMillis() - badgeStart;
            if (badgeText.getTextSize() == 0 || badgeText.getTypeface() == null) {
                badgeText.setTextSize(12.5f * getResources().getDisplayMetrics().scaledDensity);
                badgeText.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            }
            if (wave == null) {
                wave = new android.graphics.Path();
                for (float[] poly : app.ayham.extension.music.addons.Quality.wave()) {
                    wave.moveTo(poly[0], poly[1]);
                    for (int i = 2; i < poly.length; i += 2) wave.lineTo(poly[i], poly[i + 1]);
                    wave.close();
                }
            }
            String text = b.label();
            boolean shimmer = b.shimmers();
            boolean headphones = b == app.ayham.extension.music.addons.Quality.Badge.HIGH_QUALITY;
            boolean atmos = b == app.ayham.extension.music.addons.Quality.Badge.DOLBY_ATMOS;
            float gw = headphones ? 13 * d : atmos ? 13 * d : 15 * d, gh = headphones ? 13 * d : atmos ? 9 * d : 8 * d, gap = 4 * d;
            float tw = badgeText.measureText(text);
            // centred by eye: the glyph is fainter and lighter than the word, so the row measured
            // centre looked right of the play button; it sits a third of the glyph's width left
            float x0 = getWidth() / 2f - (gw + gap + tw) / 2f - gw / 3f;
            // "Upgrading Quality" breathes 1 → 0.4 → 1 (900 ms each way): a wait, not a result
            float alpha = 1f;
            if (b == app.ayham.extension.music.addons.Quality.Badge.UPGRADING) {
                float ph = (t % 1800) / 900f;
                float k = ph <= 1 ? ph : 2 - ph;
                k = k * k * (3 - 2 * k);
                alpha = 1f - 0.6f * k;
            }
            // BitChord's LosslessLabel under its additiveChrome: the row is added onto the backdrop
            // (Plus), so the artwork's colour tints the white and no shadow is needed. Glyph at
            // chromeWhite(0.7), text at 0.73 ("full" under the blend); unconfirmed rows at 0.45.
            // Each chrome white is 0.15 under its plain strength, so more of the backdrop shows.
            float all = gw + gap + tw, top = cy - 12 * d, bottom = cy + 12 * d;
            // the Best part button (canvas.md §14 rule 3) is up to 45 s: the badge moves left of it,
            // clear of YT's time on the left (~48 dp); it waits only when it can't fit there.
            // (Hidden outright, "Hi-Res Lossless" was gone for a song's first 30 s, phone 2026-11-24.)
            if (!pill.isEmpty() && pill.left < x0 + all + 6 * d) {
                x0 = pill.left - 6 * d - all;
                if (x0 < 60 * d) return;
            }
            if (layerPaint == null) {
                layerPaint = new Paint();
                layerPaint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.ADD));
                bandPaint = new Paint();
                bandPaint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN));
            }
            layerPaint.setAlpha(Math.round(255 * alpha));
            int layer = canvas.saveLayer(x0 - 2 * d, top, x0 + all + 2 * d, bottom, layerPaint);
            glyph.clearShadowLayer();
            glyph.setShader(null);
            glyph.setColor(white(shimmer ? 0.7f : 0.45f));
            canvas.save();
            if (headphones) {
                float s = gw / 24f;
                canvas.translate(x0, cy - gh / 2);
                canvas.scale(s, s);
                glyph.setStyle(Paint.Style.STROKE);
                glyph.setStrokeWidth(2f);
                canvas.drawArc(new android.graphics.RectF(4, 3, 20, 19), 180, 180, false, glyph);
                glyph.setStyle(Paint.Style.FILL);
                canvas.drawRoundRect(new android.graphics.RectF(3, 12, 9, 21), 2, 2, glyph);
                canvas.drawRoundRect(new android.graphics.RectF(15, 12, 21, 21), 2, 2, glyph);
            } else if (atmos) {
                // BitChord's ic_dolby_atmos: Dolby's double-D as Apple Music draws it, the two Ds filled
                if (dolby == null) {
                    dolby = new android.graphics.Path();
                    dolby.moveTo(0, 0);
                    dolby.lineTo(12.382f, 0);
                    dolby.cubicTo(25.274f, 0, 36.05f, 12.87f, 36.05f, 28.164f);
                    dolby.cubicTo(36.053f, 43.896f, 25.274f, 56.625f, 12.382f, 56.625f);
                    dolby.lineTo(0, 56.625f);
                    dolby.close();
                    dolby.moveTo(70.806f, 0);
                    dolby.lineTo(83.288f, 0);
                    dolby.lineTo(83.288f, 56.625f);
                    dolby.lineTo(70.806f, 56.625f);
                    dolby.cubicTo(57.908f, 56.625f, 47.135f, 43.896f, 47.135f, 28.164f);
                    dolby.cubicTo(47.135f, 12.87f, 57.908f, 0, 70.806f, 0);
                    dolby.close();
                }
                canvas.translate(x0, cy - gh / 2);
                canvas.scale(gw / 83.288f, gh / 56.625f);
                glyph.setStyle(Paint.Style.FILL);
                canvas.drawPath(dolby, glyph);
            } else {
                canvas.translate(x0, cy - gh / 2);
                canvas.scale(gw / app.ayham.extension.music.addons.Quality.WAVE_W, gh / app.ayham.extension.music.addons.Quality.WAVE_H);
                glyph.setStyle(Paint.Style.FILL);
                canvas.drawPath(wave, glyph);
            }
            canvas.restore();
            float tx = x0 + gw + gap, ty = cy - (badgeText.descent() + badgeText.ascent()) / 2;
            badgeText.clearShadowLayer();
            badgeText.setShader(null);
            badgeText.setTextAlign(Paint.Align.LEFT);
            badgeText.setColor(white(shimmer ? FULL : 0.45f));
            canvas.drawText(text, tx, ty, badgeText);
            if (shimmer) {
                // ShimmerText's band, painted over what is drawn (SrcIn keeps the shapes and takes
                // the band's colour): the plain tint, full white at the centre, 0.6 of the width
                // each side, sweeping left to right every 3 s. Here it runs over the glyph too,
                // which keeps its own lower tint at the band's ends.
                float band = all * 0.6f, centre = x0 + bandCentre((t % 3000) / 3000f, all);
                // the glyph peaks at solid white: from its 0.55 to the word's 0.73 was too small a
                // step to see on a 13 dp glyph
                sweep(canvas, x0, x0 + gw + gap / 2, top, bottom, centre, band, white(0.7f), 0xFFFFFFFF);
                sweep(canvas, x0 + gw + gap / 2, x0 + all + 2 * d, top, bottom, centre, band, white(0.55f), white(FULL));
            }
            canvas.restoreToCount(layer);
            if (shimmer || b == app.ayham.extension.music.addons.Quality.Badge.UPGRADING) postInvalidateOnAnimation();
        }

        // ---- canvas.md §14: the best part's mark (rule 4) and its button (rule 3) ----
        private long bestMs = -1, bestDur;
        private boolean bestButton, bestMine;
        private final android.graphics.RectF pill = new android.graphics.RectF();
        private long downAt = -1;
        private final Runnable longPress = () -> {
            downAt = -1;
            if (getContext() instanceof Activity) BestPart.yours((Activity) getContext());
        };

        void best(long ms, long durationMs, boolean button, boolean mine) {
            if (ms == bestMs && durationMs == bestDur && button == bestButton && mine == bestMine) return;
            bestMs = ms;
            bestDur = durationMs;
            bestButton = button;
            bestMine = mine;
            invalidate();
        }

        private void drawBest(Canvas canvas, float d, float left, float right, float cy) {
            if (bestMs < 0 || bestDur <= 0) {
                pill.setEmpty();
                return;
            }
            float f = bestMs / (float) bestDur;
            if (f > 0.01f && f < 0.99f) {
                paint.setShader(null);
                paint.setColor(0xE6FFFFFF);
                canvas.drawCircle(left + (right - left) * f, cy, 2.5f * d, paint);
            }
            if (!bestButton) {
                pill.setEmpty();
                return;
            }
            String text = (bestMine ? "\uD83D\uDD25 Your best part" : "Best part");
            float tw = label.measureText(text), h = 22 * d, pr = right - 48 * d, ty = cy + 13 * d;
            pill.set(pr - tw - 20 * d, ty - h / 2, pr, ty + h / 2);
            paint.setShader(null);
            paint.setColor(0x33FFFFFF);
            canvas.drawRoundRect(pill, h / 2, h / 2, paint);
            label.setAlpha(230);
            canvas.drawText(text, pill.centerX(), ty - (label.descent() + label.ascent()) / 2, label);
        }

        @Override
        public boolean onTouchEvent(android.view.MotionEvent e) {
            // only the button's own touches: the rest go on to YT's seek bar underneath
            if (pill.isEmpty()) return false;
            switch (e.getActionMasked()) {
                case android.view.MotionEvent.ACTION_DOWN:
                    if (!pill.contains(e.getX(), e.getY())) return false;
                    downAt = android.os.SystemClock.uptimeMillis();
                    postDelayed(longPress, android.view.ViewConfiguration.getLongPressTimeout());
                    return true;
                case android.view.MotionEvent.ACTION_UP:
                    removeCallbacks(longPress);
                    if (downAt >= 0 && pill.contains(e.getX(), e.getY()) && getContext() instanceof Activity) BestPart.play((Activity) getContext());
                    downAt = -1;
                    return true;
                case android.view.MotionEvent.ACTION_CANCEL:
                    removeCallbacks(longPress);
                    downAt = -1;
                    return true;
                default:
                    return downAt >= 0;
            }
        }

        void set(long[] z, long durationMs) {
            long f = z == null ? -1 : z[0];
            long d = z == null || z[1] <= 0 ? durationMs : z[1];
            boolean r = z != null && z[2] == 1;
            if (f == from && d == dur && r == running) return;
            from = f;
            dur = d;
            running = r;
            invalidate();
        }

        /** Where the mix fill starts on the bar (0-1): the takeover, kept once the mix runs. */
        private float base = -1;
        /** When the mix fill appeared (uptime ms): its sweep and the pulse's fade-in run from here. */
        private long mixStart = -1;
        /** YT's seek bar, hidden under the mix fill while a mix is heard. */

        private View hidden;

        /** YT's seek bar shown again (the mix ended, or our screen is given back). */
        void showYts() {
            if (hidden != null) hidden.setAlpha(1f);
            hidden = null;
        }

        @Override
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            showYts();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float d = getResources().getDisplayMetrics().density;
            // YT's seek track: inset like its title row, centred in the bar's height
            float left = 20 * d, right = getWidth() - 20 * d;
            float[] mix = running ? app.ayham.extension.music.automix.Automix.mixUi() : null;
            if (mix != null) {
                // the mix as the extension draws it: YT's progress hidden, a white fill growing to the
                // bar's end and pulsing on the mix's beats
                if (base < 0) {
                    base = from >= 0 && dur > 0 ? Math.min(1f, from / (float) dur) : 0f;
                    mixStart = android.os.SystemClock.uptimeMillis();
                }
                View bar = getContext() instanceof Activity ? getRootView().findViewById(id((Activity) getContext(), "time_bar")) : null;
                if (bar != hidden) {
                    showYts();
                    hidden = bar;
                }
                if (bar != null && bar.getAlpha() != 0f) bar.setAlpha(0f);
                float[] look = mixLook(android.os.SystemClock.uptimeMillis() - mixStart, mix[1]);
                float h = 4 * d, cy = (barH > 0 ? barH : getHeight()) / 2f;
                paint.setShader(null);
                paint.setColor(0x42FFFFFF); // BitChord's track: white at 0.26
                canvas.drawRoundRect(left, cy - h / 2, right, cy + h / 2, h / 2, h / 2, paint);
                float w = base + (1 - base) * look[0];
                paint.setColor((Math.round(255 * look[1]) << 24) | 0xFFFFFF);
                canvas.drawRoundRect(left, cy - h / 2, left + (right - left) * w, cy + h / 2, h / 2, h / 2, paint);
                // BitChord's time label turns into "Mixing" (the extension's too), pulsing on the same beat,
                // just under the bar (it sat level with YT's times and touched the pause button: item 5)
                pill.setEmpty();
                label.setAlpha(Math.round(255 * look[2]));
                canvas.drawText("Mixing", getWidth() / 2f, cy + 12 * d - (label.descent() + label.ascent()) / 2, label);
                postInvalidateOnAnimation();
                return;
            }
            base = -1;
            mixStart = -1;
            showYts();
            // just above YT's times (their digits sit 19 dp under the bar's line; at 19 the badge met the play button, 16 sat a bit low)
            drawBest(canvas, d, left, right, (barH > 0 ? barH : getHeight()) / 2f);
            drawBadge(canvas, d, (barH > 0 ? barH : getHeight()) / 2f + 13 * d);
            if (running) postInvalidateDelayed(100); // the decks get onto YT's clock in a moment
            if (from < 0 || dur <= 0 || from >= dur) return;
            float x = left + (right - left) * from / dur;
            float h = 3 * d, cy = (barH > 0 ? barH : getHeight()) / 2f;
            int alpha = 0x80;
            float feather = Math.max(6 * d, Math.min(40 * d, (right - x) * 0.4f));
            paint.setShader(new LinearGradient(x, 0, x + feather, 0, 0x00FFFFFF, (alpha << 24) | 0xFFFFFF, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(x, cy - h / 2, right, cy + h / 2, h / 2, h / 2, paint);
        }
    }

    /** BitChord's mix bar (PlayerControls PlayerScrubber): the sweep to the bar's end, the beat pulse fading in. */
    static final long COVER_MS = 700, PULSE_FADE_MS = 900;
    static final float FILL_ALPHA = 0.92f, LABEL_ALPHA = 0.85f;

    static final float CHROME_FULL = 0.73f;

    /** BitChord's additive chrome: full white is 0.73 under the blend, anything else 0.15 below its strength. */
    static float chromeWhite(float a) {
        return a >= CHROME_FULL ? CHROME_FULL : a - 0.15f;
    }

    /** ShimmerText's band centre at [progress] (0..1) of the sweep over [width]: from -band to width + band, the band 0.6 x width. */
    static float bandCentre(float progress, float width) {
        float band = width * 0.6f;
        return -band + progress * (width + 2 * band);
    }

    /**
     * The mix bar [ms] after it appeared, with the beat at [pulse] (0.1 between beats, 1 on one):
     * {cover 0-1 (how far the fill has swept from where the song was to the bar's end), the fill's
     * alpha, the "Mixing" label's alpha}. The fill does not follow the song any more: it sweeps to
     * the end in 700 ms (FastOutSlowIn) and pulses there for the whole blend.
     */
    static float[] mixLook(long ms, float pulse) {
        float cover = fastOutSlowIn(Math.max(0f, Math.min(1f, ms / (float) COVER_MS)));
        float in = Math.max(0f, Math.min(1f, ms / (float) PULSE_FADE_MS));
        float p = Math.max(0f, Math.min(1f, pulse));
        float level = 1 - in * (1 - p);
        return new float[]{cover, FILL_ALPHA * level, LABEL_ALPHA * cover * (0.5f + 0.5f * level)};
    }

    /** Material's FastOutSlowIn, cubic-bezier(0.4, 0, 0.2, 1), at [x] in 0-1. */
    static float fastOutSlowIn(float x) {
        float lo = 0, hi = 1;
        for (int i = 0; i < 24; i++) {
            float t = (lo + hi) / 2, u = 1 - t;
            if (3 * u * u * t * 0.4f + 3 * u * t * t * 0.2f + t * t * t < x) lo = t;
            else hi = t;
        }
        float t = (lo + hi) / 2, u = 1 - t;
        return 3 * u * t * t + t * t * t;
    }

    private static void maxWidth(View v, int w) {
        if (!(v instanceof TextView) || w <= 0) return;
        TextView t = (TextView) v;
        if (!ytMaxWidth.containsKey(t)) ytMaxWidth.put(t, t.getMaxWidth());
        if (t.getMaxWidth() != w) t.setMaxWidth(w);
    }

    /**
     * The lyric line, BitChord's strip (PlayerLyrics.kt CurrentLyricStrip), all white:
     * - a sung line at 78%; with Morphe's word timings the unsung part at 55% of that and the sung
     *   part clipped on top in full (redrawn 25 times a second while singing, never laid out again);
     * - each line fades out over the last 28% of its time (160-700 ms) before the next one starts;
     * - a new line slides up from +35% of its height while the old one fades up to -35% (340 ms,
     *   FastOutSlowIn);
     * - the intro, instrumental gaps and plain lyrics with a 16dp note at 50%;
     * - loading at 55%; "Lyrics not available" at 55%, held 5 s, then faded over 900 ms;
     * - a 14dp chevron at 50% right after the words whenever there are lyrics.
     */
    private static final class Karaoke extends TextView {
        static final int LINE = 0, NOTE = 1, INFO = 2, MISSING = 3;
        static final int CHEVRON_ROOM = 22;
        private static final long SLIDE_MS = 340, HOLD_MS = 5000, GONE_MS = 900;
        private static final android.view.animation.Interpolator EASE =
                new android.view.animation.PathInterpolator(0.4f, 0f, 0.2f, 1f);

        private final Activity a;
        private final Paint icon = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int noteRoom;
        private final Runnable lineEnd, lineNext;
        private int kind = INFO;
        private boolean chevron;
        private long changedAt, shownAt;
        private float alpha;
        /** The line going out: its own copy of the text's layout, kind, chevron and alpha. */
        private android.text.Layout old;
        private int oldKind;
        private boolean oldChevron;
        private float oldAlpha, oldChevronX = -1, chevronX = -1;

        Karaoke(Activity a) {
            super(a);
            this.a = a;
            noteRoom = dp(a, 22);
            icon.setColor(Color.WHITE);
            icon.setStrokeCap(Paint.Cap.ROUND);
            icon.setStrokeJoin(Paint.Join.ROUND);
            // the next line shows the moment this one ends, not at the next 500 ms poll
            lineEnd = () -> {
                if (isAttachedToWindow() && isShown()) refreshLine(a);
            };
            // the next sung line's own wake-up: redraws re-set it only while it is still ahead, so the
            // fade's 40 ms redraws can't cancel it in its last moments (the next line came up late)
            lineNext = () -> {
                if (isAttachedToWindow() && isShown()) refreshLine(a);
            };
        }

        void show(String text, int kind, boolean chevron) {
            if (text.contentEquals(getText()) && kind == this.kind && chevron == this.chevron) {
                invalidate(); // the word fill and the fade carry on after a pause
                return;
            }
            long now = SystemClock.uptimeMillis();
            android.text.Layout l = getLayout();
            old = null;
            if (l != null && getText().length() > 0 && getWidth() > 0) {
                // the new line slides in even when the old one has already faded out
                changedAt = now;
                oldKind = this.kind;
                oldChevron = this.chevron;
                oldAlpha = alpha;
                oldChevronX = chevronX;
                if (alpha > 0.01f) {
                    // a copy: TextView may reuse its own layout object for the new text
                    CharSequence was = getText();
                    old = android.text.StaticLayout.Builder.obtain(was, 0, was.length(), new android.text.TextPaint(getPaint()), Math.max(1, l.getWidth()))
                            .setMaxLines(1).setEllipsize(TextUtils.TruncateAt.END).setIncludePad(false).build();
                }
            }
            if (kind != this.kind) shownAt = now;
            this.kind = kind;
            this.chevron = chevron;
            int pad = kind == NOTE ? noteRoom : 0;
            if (getPaddingLeft() != pad) setPadding(pad, 0, getPaddingRight(), 0);
            setText(text);
            invalidate();
        }

        private static int white(float alpha) {
            return (Math.round(Math.max(0f, Math.min(1f, alpha)) * 255) << 24) | 0xFFFFFF;
        }

        @Override
        protected void onDraw(Canvas c) {
            android.text.Layout l = getLayout();
            if (l == null) return;
            long now = SystemClock.uptimeMillis();
            String text = getText().toString();
            boolean playing = LyricTiming.playing();
            int h = getHeight();
            float e = EASE.getInterpolation(Math.min(1f, (now - changedAt) / (float) SLIDE_MS));
            boolean sliding = e < 1f;
            if (!sliding) old = null;

            float fill = -1;
            switch (kind) {
                case LINE:
                    fill = LyricTiming.fill(text);
                    alpha = 0.78f * LyricTiming.lineFade();
                    break;
                case NOTE:
                    alpha = 0.5f;
                    break;
                case MISSING:
                    alpha = 0.55f * (1f - Math.max(0f, Math.min(1f, (now - shownAt - HOLD_MS) / (float) GONE_MS)));
                    break;
                default:
                    alpha = 0.55f;
            }
            float top = getExtendedPaddingTop();
            c.save();
            c.clipRect(0, 0, getWidth(), h);
            if (old != null) {
                c.save();
                c.translate(0, -0.35f * h * e);
                drawLine(c, old, oldKind, -1, oldAlpha * (1 - e), top);
                c.restore();
            }
            c.save();
            c.translate(0, 0.35f * h * (1 - e));
            drawLine(c, l, kind, fill, alpha, top);
            c.restore();
            c.restore();

            // the chevron stays put across a line change: it only slides to the new line's end
            chevronX = text.isEmpty() ? -1 : getPaddingLeft() + l.getLineRight(0) + dp(a, 6);
            float cx = chevronX, ca = chevron ? 0.5f : 0f;
            if (sliding) {
                float ox = oldChevronX < 0 ? cx : oldChevronX, oa = oldChevron ? 0.5f : 0f;
                cx = cx < 0 ? ox : ox + (cx - ox) * e;
                ca = oa + (ca - oa) * e;
            }
            if (ca > 0 && cx >= 0) drawChevron(c, cx, top + l.getHeight() / 2f, ca);

            // redraws: only while something moves
            if (sliding) postInvalidateOnAnimation();
            else if (kind == MISSING && alpha > 0) postInvalidateDelayed(Math.max(16, shownAt + HOLD_MS - now));
            else if (kind == LINE && playing) {
                long toFade = LyricTiming.msToFade(), toEnd = LyricTiming.msToEnd();
                if ((fill >= 0 && fill < text.length()) || (toFade <= 0 && toEnd > 0)) postInvalidateDelayed(40);
                else if (toFade > 0) postInvalidateDelayed(toFade);
                removeCallbacks(lineEnd);
                // the next sung line comes up its slide early, to be in place when it is sung
                long toNext = LyricTiming.msToNext();
                if (toNext > 0) {
                    removeCallbacks(lineNext);
                    postDelayed(lineNext, toNext + 5);
                }
                if (toEnd >= 0) {
                    postDelayed(lineEnd, toEnd + 30);
                    // Morphe a little late: the line due is put up as soon as it counts as overdue
                    postDelayed(lineEnd, toEnd + LyricTiming.CATCH_UP_MS + 20);
                }
            } else if (kind == NOTE && playing) {
                // the intro or a gap: the first line after it comes up early too, not at the next poll
                removeCallbacks(lineEnd);
                long toNext = LyricTiming.msToNext();
                if (toNext > 0) {
                    removeCallbacks(lineNext);
                    postDelayed(lineNext, toNext + 5);
                }
            }
        }

        private void drawLine(Canvas c, android.text.Layout l, int kind, float fill, float alpha, float top) {
            if (alpha <= 0.004f || l.getText().length() == 0) return;
            float mid = top + l.getHeight() / 2f;
            if (kind == NOTE) drawNote(c, 0, mid, alpha);
            // the layout's own paint: the outgoing line's copy has its own
            android.text.TextPaint p = l.getPaint();
            int was = p.getColor();
            c.save();
            c.translate(kind == NOTE ? noteRoom : 0, top);
            if (fill < 0) {
                p.setColor(white(alpha));
                l.draw(c);
            } else {
                int n = l.getText().length(), i = Math.min(n, (int) fill);
                float x = l.getPrimaryHorizontal(i);
                if (i < n) x += (l.getPrimaryHorizontal(i + 1) - x) * (fill - i);
                if (l.getEllipsisCount(0) > 0 && i >= l.getEllipsisStart(0)) x = l.getLineRight(0);
                p.setColor(white(alpha * 0.55f));
                l.draw(c);
                c.clipRect(0, 0, x, l.getHeight());
                p.setColor(white(alpha));
                l.draw(c);
            }
            c.restore();
            p.setColor(was);
        }

        /** A 16dp eighth note: a filled head, a stem and a flag. */
        private void drawNote(Canvas c, float left, float mid, float alpha) {
            float s = dp(a, 16) / 16f, y0 = mid - 8 * s;
            icon.setColor(white(alpha));
            icon.setStyle(Paint.Style.FILL);
            c.drawOval(left + 2.5f * s, y0 + 10 * s, left + 7.5f * s, y0 + 14 * s, icon);
            icon.setStyle(Paint.Style.STROKE);
            icon.setStrokeWidth(1.6f * s);
            path.reset();
            path.moveTo(left + 7f * s, y0 + 12 * s);
            path.lineTo(left + 7f * s, y0 + 2.5f * s);
            path.quadTo(left + 9.5f * s, y0 + 5 * s, left + 12.5f * s, y0 + 5.5f * s);
            c.drawPath(path, icon);
        }

        /** A 14dp chevron pointing right. */
        private void drawChevron(Canvas c, float left, float mid, float alpha) {
            float s = dp(a, 14) / 14f;
            icon.setColor(white(alpha));
            icon.setStyle(Paint.Style.STROKE);
            icon.setStrokeWidth(1.8f * s);
            path.reset();
            path.moveTo(left + 5 * s, mid - 4.5f * s);
            path.lineTo(left + 9.5f * s, mid);
            path.lineTo(left + 5 * s, mid + 4.5f * s);
            c.drawPath(path, icon);
        }

        @Override
        protected void onDetachedFromWindow() {
            removeCallbacks(lineEnd);
            removeCallbacks(lineNext);
            super.onDetachedFromWindow();
        }
    }

    /** YT's like chip: the first button of its chips row (its label is translated, its place is not). */
    private static View likeChip(Activity a) {
        View chips = a.getWindow().getDecorView().findViewById(id(a, "video_action_bar"));
        return chips == null ? null : firstClickable(chips);
    }

    private static View firstClickable(View v) {
        if (v.isClickable() && v.getContentDescription() != null) return v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View f = firstClickable(g.getChildAt(i));
                if (f != null) return f;
            }
        }
        return null;
    }

    private static android.media.session.MediaController controller;
    private static String likeLogged;
    /** YT's session state as its callback last said (-1: no session found yet), and when it changed. */
    private static volatile int sessionState = -1;
    private static volatile long sessionChangedAt;
    private static long sessionLookedAt;

    private static final android.media.session.MediaController.Callback sessionWatch =
            new android.media.session.MediaController.Callback() {
                @Override
                public void onPlaybackStateChanged(android.media.session.PlaybackState s) {
                    int state = s == null ? -1 : s.getState();
                    if (state != sessionState) {
                        boolean was = playingState(sessionState);
                        sessionState = state;
                        if (playingState(state) != was) {
                            long now = SystemClock.uptimeMillis();
                            // YT's session says it about a second after a tap on its button: the tap's
                            // time counts, so BitChord's one second hold is not doubled
                            sessionChangedAt = now - tappedAt < 3000 && playingState(state) == tappedTo ? tappedAt : now;
                            Log.i(TAG, "YT's session: " + (playingState(state) ? "playing" : "paused") + " (state " + state + ")");
                            // the cover reacts on the next frame (play), or once the pause has held for a second
                            FullArt.wake();
                        }
                    }
                }

                @Override
                public void onSessionDestroyed() {
                    sessionState = -1;
                    controller = null;
                }
            };

    /**
     * YT's session says paused or stopped (not buffering: a song loading is no pause). False when
     * the session is not found.
     */
    static boolean sessionPaused() {
        int s = sessionState;
        return s >= 0 && !playingState(s);
    }

    private static boolean playingState(int s) {
        switch (s) {
            case android.media.session.PlaybackState.STATE_PLAYING:
            case android.media.session.PlaybackState.STATE_BUFFERING:
            case android.media.session.PlaybackState.STATE_CONNECTING:
            case android.media.session.PlaybackState.STATE_FAST_FORWARDING:
            case android.media.session.PlaybackState.STATE_REWINDING:
            case android.media.session.PlaybackState.STATE_SKIPPING_TO_NEXT:
            case android.media.session.PlaybackState.STATE_SKIPPING_TO_PREVIOUS:
            case android.media.session.PlaybackState.STATE_SKIPPING_TO_QUEUE_ITEM:
                return true;
            default:
                return false;
        }
    }

    /**
     * YT's media session (the one its notification carries), watched for play and pause. Looked up
     * at most once a second while it is missing.
     */
    static android.media.session.MediaController session(Activity a) {
        android.media.session.MediaController c = controller;
        if (c != null && c.getPlaybackState() != null) return c;
        long now = SystemClock.uptimeMillis();
        if (c == null && now - sessionLookedAt < 1000) return null;
        sessionLookedAt = now;
        try {
            if (c != null) c.unregisterCallback(sessionWatch);
            c = null;
            android.app.NotificationManager nm = a.getSystemService(android.app.NotificationManager.class);
            for (android.service.notification.StatusBarNotification n : nm.getActiveNotifications()) {
                Object tok = n.getNotification().extras.getParcelable(android.app.Notification.EXTRA_MEDIA_SESSION);
                if (tok instanceof android.media.session.MediaSession.Token) {
                    // the app context: this controller is static and outlives the Activity
                    c = new android.media.session.MediaController(a.getApplicationContext(), (android.media.session.MediaSession.Token) tok);
                    break;
                }
            }
            controller = c;
            if (c != null) {
                c.registerCallback(sessionWatch, new Handler(Looper.getMainLooper()));
                android.media.session.PlaybackState s = c.getPlaybackState();
                sessionState = s == null ? -1 : s.getState();
                sessionChangedAt = 0; // found while paused: the card at once, as BitChord opens a paused player

            } else sessionState = -1;
        } catch (Throwable t) {
            controller = null;
            sessionState = -1;
        }
        return controller;
    }

    /**
     * BitChord's "awake" art rule from YT's session: true while YT plays or buffers (a track change
     * or a seek is no pause), and for [holdMs] after it paused. Null when the session is not found.
     */
    static Boolean playingFor(Activity a, long holdMs) {
        if (controller == null) session(a);
        watchPlayButton(a);
        long now = SystemClock.uptimeMillis();
        if (tapFresh(now)) return tappedTo || now - tappedAt < holdMs;
        int s = sessionState;
        if (s < 0) return null;
        return playingState(s) || now - sessionChangedAt < holdMs;
    }

    /** A tap on YT's play button that its session has not confirmed yet. */
    private static volatile long tappedAt;
    private static volatile boolean tappedTo;
    private static java.lang.ref.WeakReference<View> watchedButton;
    private static long buttonLookedAt;

    private static boolean tapFresh(long now) {
        return tappedAt > sessionChangedAt && now - tappedAt < 3000;
    }

    private static void onPlayTapped() {
        long now = SystemClock.uptimeMillis();
        boolean was = tapFresh(now) ? tappedTo : playingState(sessionState);
        tappedTo = !was;
        tappedAt = now;
        // Morphe's lyric clock runs on until YT's session says paused: the line stops here instead
        if (!tappedTo) LyricTiming.freeze();
        Log.i(TAG, "play button tapped: " + (tappedTo ? "playing" : "paused") + " (before YT's session says so)");
        FullArt.wake();
        if (lyric != null) lyric.invalidate();
    }

    /** The play button was just tapped to pause, and YT's session has not said so yet. */
    static boolean tapPaused() {
        return !tappedTo && tapFresh(SystemClock.uptimeMillis());
    }

    /**
     * Sees taps on YT's play/pause button the moment they happen: its click sends an accessibility
     * event (always, on any click), which a delegate wrapped around YT's own one hears and passes on.
     */
    private static void watchPlayButton(Activity a) {
        View known = watchedButton == null ? null : watchedButton.get();
        long now = SystemClock.uptimeMillis();
        if ((known != null && known.isAttachedToWindow()) || now - buttonLookedAt < 1000) return;
        buttonLookedAt = now;
        View b = a.getWindow().getDecorView().findViewById(id(a, "player_control_play_pause_replay_button"));
        if (b == null) return;
        final View.AccessibilityDelegate yt;
        if (android.os.Build.VERSION.SDK_INT >= 29) yt = b.getAccessibilityDelegate();
        else {
            // no getter before Android 10: its field, else no watching (YT's own delegate is never dropped)
            View.AccessibilityDelegate f;
            try {
                java.lang.reflect.Field fd = View.class.getDeclaredField("mAccessibilityDelegate");
                fd.setAccessible(true);
                f = (View.AccessibilityDelegate) fd.get(b);
            } catch (Throwable t) {
                Log.i(TAG, "YT's play button delegate unreadable here: taps not watched");
                buttonLookedAt = now + 3_600_000L;
                return;
            }
            yt = f;
        }
        // the same button back on the window: it already carries ours (wrapping again would count taps twice)
        if (!(yt instanceof PlayTapDelegate)) b.setAccessibilityDelegate(new PlayTapDelegate(yt));
        watchedButton = new java.lang.ref.WeakReference<>(b);
        Log.i(TAG, "watching YT's play button" + (yt == null ? "" : " (its own delegate kept: " + yt.getClass().getName() + ")"));
    }

    /** Passes everything to YT's own delegate (when it has one); a click also marks a play/pause tap. */
    private static final class PlayTapDelegate extends View.AccessibilityDelegate {
        private final View.AccessibilityDelegate yt;

        PlayTapDelegate(View.AccessibilityDelegate yt) {
            this.yt = yt;
        }

        @Override
        public void sendAccessibilityEvent(View host, int eventType) {
            if (eventType == android.view.accessibility.AccessibilityEvent.TYPE_VIEW_CLICKED) {
                try {
                    onPlayTapped();
                } catch (Throwable t) {
                    Log.w(TAG, "play tap", t);
                }
            }
            if (yt != null) yt.sendAccessibilityEvent(host, eventType);
            else super.sendAccessibilityEvent(host, eventType);
        }

        @Override
        public void sendAccessibilityEventUnchecked(View host, android.view.accessibility.AccessibilityEvent event) {
            if (yt != null) yt.sendAccessibilityEventUnchecked(host, event);
            else super.sendAccessibilityEventUnchecked(host, event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(View host, android.view.accessibility.AccessibilityEvent event) {
            return yt != null ? yt.dispatchPopulateAccessibilityEvent(host, event) : super.dispatchPopulateAccessibilityEvent(host, event);
        }

        @Override
        public void onPopulateAccessibilityEvent(View host, android.view.accessibility.AccessibilityEvent event) {
            if (yt != null) yt.onPopulateAccessibilityEvent(host, event);
            else super.onPopulateAccessibilityEvent(host, event);
        }

        @Override
        public void onInitializeAccessibilityEvent(View host, android.view.accessibility.AccessibilityEvent event) {
            if (yt != null) yt.onInitializeAccessibilityEvent(host, event);
            else super.onInitializeAccessibilityEvent(host, event);
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
            if (yt != null) yt.onInitializeAccessibilityNodeInfo(host, info);
            else super.onInitializeAccessibilityNodeInfo(host, info);
        }

        @Override
        public void addExtraDataToAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info,
                                                        String extraDataKey, android.os.Bundle arguments) {
            if (yt != null) yt.addExtraDataToAccessibilityNodeInfo(host, info, extraDataKey, arguments);
            else super.addExtraDataToAccessibilityNodeInfo(host, info, extraDataKey, arguments);
        }

        @Override
        public boolean onRequestSendAccessibilityEvent(ViewGroup host, View child, android.view.accessibility.AccessibilityEvent event) {
            return yt != null ? yt.onRequestSendAccessibilityEvent(host, child, event) : super.onRequestSendAccessibilityEvent(host, child, event);
        }

        @Override
        public android.view.accessibility.AccessibilityNodeProvider getAccessibilityNodeProvider(View host) {
            return yt != null ? yt.getAccessibilityNodeProvider(host) : super.getAccessibilityNodeProvider(host);
        }

        @Override
        public boolean performAccessibilityAction(View host, int action, android.os.Bundle args) {
            return yt != null ? yt.performAccessibilityAction(host, action, args) : super.performAccessibilityAction(host, action, args);
        }
    }

    /**
     * Whether YT has this song liked. Its like chip shows that only in its drawing, so this reads YT's
     * media session (the one its notification carries): the like action's id or icon says which way
     * it goes. Logged when it changes, to check on a new YT version.
     */
    private static boolean likeLit(Activity a) {
        try {
            android.media.session.MediaController c = session(a);
            if (c == null || c.getPlaybackState() == null) return false;
            StringBuilder seen = new StringBuilder();
            Boolean lit = null;
            for (android.media.session.PlaybackState.CustomAction x : c.getPlaybackState().getCustomActions()) {
                String icon = "";
                try {
                    icon = a.getResources().getResourceEntryName(x.getIcon());
                } catch (Throwable ignored) {
                }
                String key = (x.getAction() + " " + icon).toLowerCase(java.util.Locale.ROOT);
                seen.append(x.getAction()).append('/').append(icon).append(' ');
                if (lit == null && LikeKey.isLike(key)) lit = LikeKey.liked(key);
            }
            String log = seen + "-> " + lit;
            if (!log.equals(likeLogged)) {
                likeLogged = log;
                Log.i(TAG, "like state from YT's session: " + log);
            }
            return lit != null && lit;
        } catch (Throwable t) {
            return false;
        }
    }


    /** The "..." menu: BitChord's two art switches, then YT's own menu. */
    private static void menu(Activity a, View anchor) {
        android.widget.PopupMenu m = new android.widget.PopupMenu(a, anchor);
        m.getMenu().add(0, 4, 0, "Automix overview");
        m.getMenu().add(0, 5, 0, "Play from the best part");
        m.getMenu().add(0, 1, 0, "Fullscreen cover art").setCheckable(true).setChecked(Features.switchOn("fullArt"));
        m.getMenu().add(0, 2, 1, "Animated covers").setCheckable(true).setChecked(Features.switchOn("canvas"));
        // canvas.md §13 rule 1: Canvas and Animated covers are two separate master switches
        m.getMenu().add(0, 6, 1, "Canvas").setCheckable(true).setChecked(Features.switchOn("canvasSpotify"));
        String song = app.ayham.extension.music.automix.AddonDirect.playingId();
        boolean onAddon = song != null && app.ayham.extension.music.automix.AddonDirect.inUse(song);
        if (song != null && app.ayham.extension.music.addons.AddonSettings.on())
            m.getMenu().add(0, 7, 1, onAddon ? "Use YouTube quality" : "Upgrade quality");
        // canvas.md §15: one song's canvas
        if (CanvasSongMenu.offers()) m.getMenu().add(0, 8, 1, "This song's canvas");
        m.getMenu().add(0, 3, 2, "More options");
        m.setOnMenuItemClickListener(item -> {
            switch (item.getItemId()) {
                case 1:
                    Features.setSwitch("fullArt", !item.isChecked());
                    return true;
                case 2:
                    Features.setSwitch("canvas", !item.isChecked());
                    return true;
                case 6:
                    Features.setSwitch("canvasSpotify", !item.isChecked());
                    return true;
                case 4:
                    MixOverview.show(a);
                    return true;
                case 8:
                    CanvasSongMenu.show(a);
                    return true;
                case 5:
                    BestPart.play(a);
                    return true;
                case 7:
                    // the song changed while the menu was open: its label was for the one before
                    if (!song.equals(app.ayham.extension.music.automix.AddonDirect.playingId())) {
                        android.widget.Toast.makeText(a, "The song changed: open the menu again", android.widget.Toast.LENGTH_SHORT).show();
                        return true;
                    }
                    if (onAddon) {
                        app.ayham.extension.music.addons.AddonPrep.useYouTube(song);
                        android.widget.Toast.makeText(a, "Playing YouTube's quality", android.widget.Toast.LENGTH_SHORT).show();
                    } else {
                        app.ayham.extension.music.addons.AddonPrep.upgrade(song);
                        android.widget.Toast.makeText(a, "Looking for a lossless file", android.widget.Toast.LENGTH_SHORT).show();
                    }
                    return true;
                default:
                    View yt = a.getWindow().getDecorView().findViewById(id(a, "contextual_menu"));
                    Log.i(TAG, "more options -> YT's menu" + (yt == null ? " (missing)" : " click=" + yt.performClick()));
                    return true;
            }
        });
        m.show();
    }

    /** The lyric line opens YT's own Lyrics tab. */
    private static void openLyrics(Activity a) {
        View tab = findLabel(a.getWindow().getDecorView(), "lyrics");
        View chips = a.getWindow().getDecorView().findViewById(id(a, "video_action_bar"));
        if (tab == null && chips != null) tab = findLabel(chips, "lyrics", true);
        if (tab == null) {
            Log.i(TAG, "lyrics tab: not found");
            return;
        }
        View c = tab;
        while (c != null && !c.isClickable()) c = c.getParent() instanceof View ? (View) c.getParent() : null;
        Log.i(TAG, "lyrics tab: " + tab.getClass().getSimpleName() + " click=" + (c != null && c.performClick()));
    }

    private static View findLabel(View v, String label) {
        return findLabel(v, label, false);
    }

    /** [hidden]: also inside views we hid (YT's chips row). */
    private static View findLabel(View v, String label, boolean hidden) {
        if (v == overlay || (!hidden && v.getVisibility() != View.VISIBLE)) return null;
        CharSequence d = v.getContentDescription();
        CharSequence t = v instanceof TextView ? ((TextView) v).getText() : null;
        if ((d != null && d.toString().trim().equalsIgnoreCase(label)) || (t != null && t.toString().trim().equalsIgnoreCase(label)))
            return v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View f = findLabel(g.getChildAt(i), label, hidden);
                if (f != null) return f;
            }
        }
        return null;
    }

    /** BitChord's title row glyphs: a star and a "...", each on a 34dp white disc at 18%. */
    private static final class Glyph extends View {
        static final int STAR = 0, MORE = 1;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int kind;
        private final boolean disc;
        private boolean lit;

        Glyph(Context c, int kind, boolean disc) {
            super(c);
            this.kind = kind;
            this.disc = disc;
            setClickable(true);
            setContentDescription(kind == STAR ? "Like" : "More");
        }

        void setLit(boolean on) {
            if (on == lit) return;
            lit = on;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas c) {
            float w = getWidth(), h = getHeight(), cx = w / 2f, cy = h / 2f;
            float d = getResources().getDisplayMetrics().density;
            if (disc) {
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(lit ? 0x57FFFFFF : 0x2EFFFFFF);
                c.drawCircle(cx, cy, Math.min(w, h) / 2f, paint);
            }
            float s = (disc ? 19 : 26) * d / 24f; // drawn on a 24-unit grid
            c.save();
            c.translate(cx - 12 * s, cy - 12 * s);
            paint.setColor(disc ? Color.WHITE : 0xD9FFFFFF);
            paint.setStrokeWidth(2 * s);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            Path p = path;
            p.reset();
            switch (kind) {
                case STAR:
                    for (int i = 0; i < 10; i++) {
                        double ang = Math.PI / 2 + i * Math.PI / 5;
                        float r = (i % 2 == 0 ? 10 : 4.2f) * s;
                        float x = 12 * s + (float) (r * Math.cos(ang)), y = 12.8f * s - (float) (r * Math.sin(ang));
                        if (i == 0) p.moveTo(x, y);
                        else p.lineTo(x, y);
                    }
                    p.close();
                    paint.setStyle(lit ? Paint.Style.FILL_AND_STROKE : Paint.Style.STROKE);
                    paint.setStrokeWidth(1.6f * s);
                    c.drawPath(p, paint);
                    break;
                default:
                    paint.setStyle(Paint.Style.FILL);
                    for (int i = -1; i <= 1; i++) c.drawCircle((12 + i * 6) * s, 12 * s, 1.9f * s, paint);
            }
            c.restore();
        }
    }
}
