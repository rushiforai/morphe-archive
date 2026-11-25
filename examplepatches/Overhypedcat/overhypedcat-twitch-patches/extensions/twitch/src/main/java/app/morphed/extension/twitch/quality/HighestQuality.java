package app.morphed.extension.twitch.quality;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.amazonaws.ivs.player.Player;
import com.amazonaws.ivs.player.Quality;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Included;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.settings.PatchSettings;

/**
 * Highest quality: Twitch starts every stream at Auto; with this on, the stream being watched starts at its highest
 * quality instead (the most lines, then the most frames a second, then the most bits). Once for each stream: a
 * quality chosen afterwards, Auto included, is left as chosen.
 * <p>
 * Each of Twitch's two players is caught once its qualities are known: the React Native one as it hands its list of
 * qualities to its Options (so they show what plays), the native one when its stream is ready.
 */
public final class HighestQuality {
    /** Per player: the stream (its load, and its qualities) it was last given its highest for. */
    private static final Map<Object, String> HANDLED = new WeakHashMap<>();

    /** Forgets every stream given its highest; for tests. */
    static void forget() {
        synchronized (HANDLED) {
            HANDLED.clear();
        }
    }
    private static volatile boolean failureShown;

    private HighestQuality() {
    }

    private static boolean on() {
        return Included.highestQuality() && PatchSettings.highestQuality();
    }

    /** Injected into the React Native player: its qualities about to go to its Options (so they show what plays). */
    @SuppressWarnings("unused")
    public static void onQualities(Player player) {
        if (player == null) return;
        if (!on()) {
            seenWithoutIt(player);
            return;
        }
        apply(player);
    }

    /**
     * Injected into the native player's READY: given its highest once the app is done with it, right after (the app
     * puts back the quality it saved from the last time in the same call: the stream's start is this switch's).
     */
    @SuppressWarnings("unused")
    public static void onReady(Player player) {
        if (player == null) return;
        if (!on()) {
            seenWithoutIt(player);
            return;
        }
        App.MAIN.post(() -> apply(player));
    }

    /**
     * A stream that started with the switch off is Twitch's to the end: the switch, turned on in it, doesn't take a
     * quality picked by hand away (this hook also runs on each quality picked). It counts from the next stream.
     */
    static void seenWithoutIt(Player player) {
        try {
            newStreamsBest(player);
        } catch (Throwable t) {
            failed(t);
        }
    }

    /**
     * Gives the player's stream its highest quality, once, at its start: whatever Twitch started it at (Auto, or a
     * quality it saved), as the switch is for. A quality chosen afterwards in the same stream stays.
     */
    static void apply(Player player) {
        try {
            if (player.isMuted()) return; // a feed preview, not the stream being watched
            Quality best = newStreamsBest(player);
            if (best == null) return;
            Quality now = player.getQuality();
            if (!player.isAutoQualityMode() && now != null && best.getName().equals(now.getName())) return; // (there)
            player.setAutoQualityMode(false);
            player.setQuality(best);
            DebugLog.log("Highest quality: asked for " + best.getName() + " (the Video lines show what plays)");
        } catch (Throwable t) {
            failed(t);
        }
    }

    /** The highest quality of a stream this player wasn't given its highest for yet (marked given), or null. */
    private static Quality newStreamsBest(Player player) {
        Set<Quality> qualities = player.getQualities();
        if (qualities == null || qualities.isEmpty()) return null; // not known yet: asked again when they are
        List<Quality> list = new ArrayList<>(qualities);
        List<Choice> choices = new ArrayList<>();
        for (Quality quality : list) {
            if (quality == null) continue;
            choices.add(new Choice(quality.getName(), quality.getHeight(), quality.getFramerate(), quality.getBitrate()));
        }
        int best = best(choices);
        // An ad's unnamed qualities: not the stream's own yet, which come later in the same stream.
        if (best < 0 || choices.get(best).name.isEmpty()) return null;
        String key = key(sessionOf(player), choices);
        synchronized (HANDLED) {
            if (key.equals(HANDLED.get(player))) return null; // this stream's done: what's chosen now stays
            HANDLED.put(player, key);
        }
        for (Quality quality : list) {
            if (quality != null && choices.get(best).name.equals(quality.getName())) return quality;
        }
        return null;
    }

    private static void failed(Throwable t) {
        Log.e(App.TAG, "Highest quality failed", t);
        DebugLog.log("PROBLEM Highest quality: " + Log.getStackTraceString(t));
        if (failureShown) return;
        failureShown = true;
        App.onMain(() -> {
            Context context = App.application();
            if (context != null) Toast.makeText(context, "Highest quality couldn't be set, the stream plays at Twitch's: "
                    + Messages.of(t), Toast.LENGTH_LONG).show();
        });
    }

    /** One quality as far as choosing goes (plain values: tested without the player). */
    static final class Choice {
        final String name;
        final int height;
        final float framerate;
        final int bitrate;

        Choice(String name, int height, float framerate, int bitrate) {
            this.name = name == null ? "" : name;
            this.height = height;
            this.framerate = framerate;
            this.bitrate = bitrate;
        }
    }

    /** The highest of these (audio only, without lines, never), or -1. */
    static int best(List<Choice> choices) {
        int best = -1;
        for (int i = 0; i < choices.size(); i++) {
            Choice c = choices.get(i);
            if (c.height <= 0) continue;
            if (best < 0 || higher(c, choices.get(best))) best = i;
        }
        return best;
    }

    private static boolean higher(Choice a, Choice b) {
        if (a.height != b.height) return a.height > b.height;
        if (Math.round(a.framerate) != Math.round(b.framerate)) return a.framerate > b.framerate;
        return a.bitrate > b.bitrate;
    }

    /**
     * What makes one stream: the player's session, new with every stream it loads (the same channel again too). A
     * list of qualities that changes within it (a quality added) is the same stream: a quality chosen stays. Only
     * without a session do the qualities' names, in any order, tell streams apart.
     */
    static String key(String session, List<Choice> choices) {
        if (session != null && !session.isEmpty()) return session;
        List<String> names = new ArrayList<>();
        for (Choice c : choices) names.add(c.name);
        Collections.sort(names);
        return "#" + String.join("|", names);
    }

    private static String sessionOf(Player player) {
        try {
            return player.getSessionId();
        } catch (Throwable unknown) { // (not in this player: the qualities alone tell streams apart)
            return null;
        }
    }
}
