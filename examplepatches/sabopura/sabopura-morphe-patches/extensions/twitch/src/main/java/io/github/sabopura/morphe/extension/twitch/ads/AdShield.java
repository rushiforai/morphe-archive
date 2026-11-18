package io.github.sabopura.morphe.extension.twitch.ads;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Text;
import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * The last resort: covers the video and mutes the player while a stitched ad plays that no
 * backup session could replace. Added to the player layout right above the video, below the
 * player controls. All state is touched on the main thread only.
 */
public final class AdShield extends FrameLayout {
    private static final Pattern DURATION = Pattern.compile("[(,] ?duration=([0-9.]+)");
    private static final Pattern POD_DURATION = Pattern.compile("podDuration=([0-9.]+)");
    private static final Pattern POD_POSITION = Pattern.compile("podPosition=(\\d+)");
    /** Ends the cover if Twitch never reports the return to live. */
    private static final long GRACE_MS = 5000;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final List<AdShield> attached = new ArrayList<>();
    private static final Runnable TICK = AdShield::tick;
    /** The one ad being covered, or null. */
    private static Cover cover;

    private final TextView text;

    /** The player whose ad is covered, the shield that shows it and how to undo the mute. */
    private static final class Cover {
        final WeakReference<Object> player;
        final AdShield shield;
        final Muting muting;
        long endsAt;

        Cover(Object player, AdShield shield, Muting muting) {
            this.player = new WeakReference<>(player);
            this.shield = shield;
            this.muting = muting;
        }

        boolean of(Object other) {
            return player.get() == other;
        }
    }

    public AdShield(Context context, AttributeSet attrs) {
        super(context, attrs);
        Text.use(context);
        setBackgroundColor(Color.BLACK);
        setClickable(false);
        text = new TextView(context);
        text.setTextColor(0xFFDDDDDD);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setGravity(Gravity.CENTER);
        addView(text, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        setVisibility(GONE);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        attached.add(this);
    }

    @Override
    protected void onDetachedFromWindow() {
        attached.remove(this);
        if (cover != null && cover.shield == this) stop();
        super.onDetachedFromWindow();
    }

    private void render(long endsAt) {
        long left = Math.max(0, (endsAt - GRACE_MS - System.currentTimeMillis() + 999) / 1000);
        text.setText(left > 0
                ? label("広告をブロック中・残り " + left + " 秒", "Ad blocked · " + left + " s left")
                : label("広告をブロック中", "Ad blocked"));
        setVisibility(VISIBLE);
    }

    /** A stitched ad started. Called from a player thread. */
    static void start(Object player, Object event) {
        String description = String.valueOf(event);
        float seconds = number(DURATION, description);
        float pod = number(POD_DURATION, description);
        boolean first = number(POD_POSITION, description) <= 0;
        float span = first && pod > seconds ? pod : seconds;
        final float shown = span > 0 ? span : 30;
        long until = System.currentTimeMillis() + (long) (shown * 1000) + GRACE_MS;
        main.post(() -> {
            try {
                begin(player, until, shown);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("ads.cover-begin", e);
            }
        });
    }

    private static void begin(Object player, long until, float shown) {
        if (cover != null && cover.of(player)) {
            cover.endsAt = until;
            cover.shield.render(until);
            AdBlock.count(AdBlock.COVERED);
            return;
        }
        AdShield target = largestShown();
        if (target == null) return;
        Muting muting = Muting.of(player);
        // A muted player beside another one is a preview; its ad must not black out the stream.
        if (muting != null && muting.wasMuted && shownCount() > 1) return;
        if (cover != null) stop();
        cover = new Cover(player, target, muting);
        cover.endsAt = until;
        if (muting != null) muting.apply(true);
        AdBlock.count(AdBlock.COVERED);
        AdBlock.log("Covering an ad that could not be replaced: " + shown + " s");
        tick();
    }

    /** The stream is live again. Called from a player thread. */
    static void end(Object player) {
        main.post(() -> {
            if (cover != null && cover.of(player)) stop();
        });
    }

    /** Whether an ad on this IVS player is being covered, which keeps it muted. Main thread. */
    public static boolean covering(Object ivsPlayer) {
        return cover != null && cover.muting != null && cover.muting.target == ivsPlayer;
    }

    private static void stop() {
        Cover ended = cover;
        cover = null;
        main.removeCallbacks(TICK);
        if (ended == null) return;
        if (ended.muting != null) ended.muting.apply(false);
        ended.shield.setVisibility(GONE);
    }

    private static void tick() {
        main.removeCallbacks(TICK);
        if (cover == null) return;
        if (System.currentTimeMillis() >= cover.endsAt) {
            stop();
            return;
        }
        cover.shield.render(cover.endsAt);
        main.postDelayed(TICK, 1000);
    }

    /** The shield is GONE until needed, so its parent tells whether the player is showing. */
    private static View shownPlayer(AdShield shield) {
        Object parent = shield.getParent();
        return parent instanceof View && ((View) parent).isShown() ? (View) parent : null;
    }

    private static int shownCount() {
        int count = 0;
        for (AdShield s : attached) if (shownPlayer(s) != null) count++;
        return count;
    }

    private static AdShield largestShown() {
        AdShield best = null;
        long bestArea = 0;
        for (AdShield s : attached) {
            View player = shownPlayer(s);
            long area = player == null ? 0 : (long) player.getWidth() * player.getHeight();
            if (area > bestArea) {
                bestArea = area;
                best = s;
            }
        }
        return best;
    }

    private static float number(Pattern pattern, String text) {
        Matcher m = pattern.matcher(text);
        try {
            return m.find() ? Float.parseFloat(m.group(1)) : -1;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /**
     * Mutes the media player inside Twitch's player wrapper, Amazon IVS (setMuted) or ExoPlayer
     * (setVolume), and puts back what it was before.
     */
    private static final class Muting {
        final Object target;
        final Method setMuted, setVolume;
        final boolean wasMuted;
        final float volume;

        private Muting(Object target, Method setMuted, Method setVolume, boolean wasMuted, float volume) {
            this.target = target;
            this.setMuted = setMuted;
            this.setVolume = setVolume;
            this.wasMuted = wasMuted;
            this.volume = volume;
        }

        static Muting of(Object wrapper) {
            try {
                for (Class<?> c = wrapper.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if (f.getType().isPrimitive()) continue;
                        f.setAccessible(true);
                        Object target = f.get(wrapper);
                        if (target == null) continue;
                        String name = target.getClass().getName();
                        Method setMuted = find(target, "setMuted", boolean.class);
                        if (setMuted != null && name.startsWith("com.amazonaws.ivs.")) {
                            Method isMuted = find(target, "isMuted");
                            // The viewer's own mute is not Twitch's, and is read again when the cover ends.
                            boolean muted = isMuted != null && Boolean.TRUE.equals(isMuted.invoke(target))
                                    && !PlayerTools.viewerMuted(target);
                            return new Muting(target, setMuted, null, muted, 0f);
                        }
                        Method setVolume = find(target, "setVolume", float.class);
                        if (setVolume != null && name.startsWith("androidx.media3.")) {
                            Method getVolume = find(target, "getVolume");
                            float volume = getVolume == null ? 1f : (Float) getVolume.invoke(target);
                            return new Muting(target, null, setVolume, volume == 0f, volume);
                        }
                    }
                }
            } catch (Exception e) {
                Diagnostics.note("ads.cover-find-player", e);
            }
            return null;
        }

        void apply(boolean mute) {
            try {
                if (setMuted != null) setMuted.invoke(target, mute || wasMuted || PlayerTools.viewerMuted(target));
                else setVolume.invoke(target, mute ? 0f : volume);
            } catch (Exception e) {
                Diagnostics.note("ads.cover-mute", e);
            }
        }

        private static Method find(Object target, String name, Class<?>... types) {
            try {
                Method m = target.getClass().getMethod(name, types);
                m.setAccessible(true);
                return m;
            } catch (Exception e) {
                return null;
            }
        }
    }
}
