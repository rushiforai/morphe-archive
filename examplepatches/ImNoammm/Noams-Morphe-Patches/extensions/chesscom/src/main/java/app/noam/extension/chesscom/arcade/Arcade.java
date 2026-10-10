package app.noam.extension.chesscom.arcade;

import android.animation.ValueAnimator;
import android.provider.Settings;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.board.Board;
import app.noam.extension.chesscom.board.BoardViews;

/** The website's Arcade animations, with the timings and sizes of its two-d/arcade renderer. */
public final class Arcade {
    static final long MOVE_MS = 400;
    static final long DROP_MS = 40;
    static final long PULSE_MS = 500;
    static final long HIGHLIGHT_FADE_MS = 150;
    static final float MOVE_LANDS = 0.6f;
    static final float MOVE_SCALE = 1.1f;
    static final float CAPTURE_DELAY = 0.3f;
    static final float TRAIL_WIDTH_RATIO = 0.55f;
    static final float TRAIL_OFFSET_RATIO = 0.35f;
    static final float ROOK_ARC_RATIO = 0.5f;
    static final float BURST_SCALE = 1.75f;
    static final float CHECK_SCALE = 1.1875f;
    static final float OUTLINE_RATIO = 0.05f;
    static final int WHITE_ACCENT = 0xFF38DCFF;
    static final int BLACK_ACCENT = 0xFFFF5252;

    /** Marks configurations built here, so they are not wrapped twice. */
    private static final String MARKER = "MorpheArcade";

    /** Position moves linearly and arrives at 60 % of the move, as on the website. */
    private static final Interpolator MOVE_INTERPOLATOR = new Interpolator() {
        @Override
        public float getInterpolation(float t) {
            return t >= MOVE_LANDS ? 1f : t / MOVE_LANDS;
        }

        @Override
        public String toString() {
            return MARKER;
        }
    };

    private static final Map<ViewGroup, ArcadeLayer[]> LAYERS = new WeakHashMap<>();
    private static final List<WeakReference<View>> HOSTS = new ArrayList<>();
    private static Object castlingRook;
    private static int hoverSquare = Board.NONE;

    private Arcade() {}

    public static boolean enabled() {
        return Features.arcadePatched() && Features.isEnabled(Features.ARCADE);
    }

    // The patch fills in these obfuscated class names.

    private static String easingCurveClass() {
        return "";
    }

    private static String fixedDurationClass() {
        return "";
    }

    private static String dragCancelGetter() {
        return "";
    }

    /** The board's animation settings: Arcade replaces the move animation with its own timing. */
    public static Object animations(Object standardAnimations) {
        if (standardAnimations == null || !enabled()) return standardAnimations;
        if (String.valueOf(standardAnimations).contains(MARKER)) return standardAnimations;
        try {
            Class<?> easingCurve = Class.forName(easingCurveClass());
            Class<?> fixedDuration = Class.forName(fixedDurationClass());
            Object duration = fixedDuration.getConstructor(long.class).newInstance(MOVE_MS);
            Object move = easingCurve.getConstructor(Interpolator.class, fixedDuration.getSuperclass())
                .newInstance(MOVE_INTERPOLATOR, duration);
            Object dragCancel = standardAnimations.getClass().getMethod(dragCancelGetter()).invoke(standardAnimations);
            Class<?> animationType = easingCurve.getSuperclass();
            return standardAnimations.getClass().getConstructor(animationType, animationType).newInstance(move, dragCancel);
        } catch (Throwable throwable) {
            Utils.logError("Arcade animation settings failed", throwable);
            return standardAnimations;
        }
    }

    /** The app's "Dynamic" style check: off while Arcade draws the effects. */
    public static boolean dynamicAllowed() {
        return !enabled();
    }

    /** Called once a board's piece view has its layers: adds the Arcade layers. */
    public static void attach(ViewGroup pieceView) {
        if (pieceView == null || !enabled() || LAYERS.containsKey(pieceView)) return;
        try {
            ArcadeLayer below = new ArcadeLayer(pieceView, false);
            ArcadeLayer above = new ArcadeLayer(pieceView, true);
            // Under the resting pieces, and over them (under moving ones) for the check flash.
            pieceView.addView(below, 0);
            pieceView.addView(above, Math.min(3, pieceView.getChildCount()));
            BoardViews.fill(pieceView, below);
            BoardViews.fill(pieceView, above);
            LAYERS.put(pieceView, new ArcadeLayer[]{below, above});
            Object host = host(pieceView);
            if (host instanceof View) HOSTS.add(new WeakReference<>((View) host));
            Sprites.prepare();
        } catch (Throwable throwable) {
            Utils.logError("Arcade layers failed", throwable);
        }
    }

    private static ArcadeLayer[] layers(View piece) {
        ViewParent parent = piece == null ? null : piece.getParent();
        return parent instanceof ViewGroup ? LAYERS.get(parent) : null;
    }

    /** Before a move is animated: the second piece of a castling move is the rook. */
    public static void onMoves(Object second) {
        castlingRook = second;
    }

    /** A piece starts moving to its square: by itself, or dropped there by the player. */
    public static void onMove(View piece, Object animation, boolean dropped) {
        try {
            ArcadeLayer[] layers = layers(piece);
            if (layers == null || !enabled()) {
                piece.animate().setUpdateListener(null);
                return;
            }
            Board.Move move = Board.move(animation);
            if (move == null) return;
            ArcadeLayer below = layers[0], above = layers[1];
            boolean white = move.white();
            long now = AnimationUtils.currentAnimationTimeMillis();
            below.endDrag();

            if (dropped) {
                piece.animate().setUpdateListener(null);
                below.add(new ArcadeLayer.Burst(Sprites.release(white), now, BURST_SCALE, Board.NONE, piece, false));
                below.add(new ArcadeLayer.Burst(Sprites.squareFill(white), now + DROP_MS, 1f, move.to, null, false));
                if (move.captured != 0) {
                    below.add(new ArcadeLayer.Burst(Sprites.CAPTURE, now + Math.round(CAPTURE_DELAY * DROP_MS), 1f,
                        move.capturedSquare(), null, false));
                }
                above.add(new ArcadeLayer.KingCheck(white, now + DROP_MS));
                return;
            }

            boolean rook = animation != null && animation == castlingRook;
            float size = squareSize(below.pieceView);
            boolean flip = flip(below.pieceView);
            float fromX = piece.getTranslationX(), fromY = piece.getTranslationY();
            float toX = Board.left(move.to, flip, size), toY = Board.top(move.to, flip, size);
            float arc = size * ROOK_ARC_RATIO * (fromY >= size ? -1 : 1);
            MoveState state = new MoveState(piece, now, rook, fromX, fromY, toX, toY, arc);
            piece.animate().setUpdateListener(state);

            float half = size / 2;
            boolean vertical = move.from % 8 == move.to % 8;
            below.add(new ArcadeLayer.Trail(piece, state, white, fromX + half, fromY + half, toX + half, toY + half,
                vertical, rook));
            if (move.captured != 0) {
                below.add(new ArcadeLayer.Burst(Sprites.CAPTURE, now + Math.round(CAPTURE_DELAY * MOVE_MS), 1f,
                    move.capturedSquare(), null, false));
            }
            if (!rook) above.add(new ArcadeLayer.KingCheck(white, now + MOVE_MS));
        } catch (Throwable throwable) {
            Utils.logError("Arcade move failed", throwable);
        }
    }

    public static void onDragStart(View piece) {
        ArcadeLayer[] layers = layers(piece);
        if (layers != null && enabled()) layers[0].startDrag(piece);
    }

    /** The player let go of a piece off the board or on an illegal square. */
    public static void onDragEnd(View piece) {
        ArcadeLayer[] layers = layers(piece);
        if (layers != null) layers[0].endDrag();
    }

    /** The square under a dragged piece. Arcade outlines it itself, so the app's mark is hidden. */
    public static Object onHover(ViewGroup pieceView, Object square) {
        ArcadeLayer[] layers = LAYERS.get(pieceView);
        if (layers == null || !enabled()) return square;
        hoverSquare = Board.square(square);
        layers[0].setHover(hoverSquare);
        return null;
    }

    static int hoverSquare() {
        return hoverSquare;
    }

    /** Colour of the piece a piece view shows, or null. */
    static Boolean pieceWhite(View piece) {
        try {
            char letter = Board.piece(piece.getClass().getMethod("getPiece").invoke(piece));
            if (letter != 0) return Character.isUpperCase(letter);
            Object square = piece.getClass().getMethod("getAnimatedSquare").invoke(piece);
            ArcadeLayer[] layers = layers(piece);
            char[] position = layers == null ? null : Board.position(board(layers[0].pieceView));
            int index = Board.square(square);
            if (position != null && index != Board.NONE && position[index] != 0) {
                return Character.isUpperCase(position[index]);
            }
        } catch (Throwable ignored) {
            // Not known yet.
        }
        return null;
    }

    public static void drawLastMove(Object show, Object squares, android.graphics.Canvas canvas, boolean flip,
                                    float size, Object board, Object painter) {
        try {
            Decor.drawLastMove(show, squares, canvas, flip, size, board, painter);
        } catch (Throwable throwable) {
            Utils.logError("Arcade highlights failed", throwable);
        }
    }

    /** True when Arcade drew the move hints; otherwise the app draws its own. */
    public static boolean drawHints(Object show, Object hints, android.graphics.Canvas canvas, boolean flip,
                                    float size, Object painter) {
        try {
            return Decor.drawHints(show, hints, canvas, flip, size, painter);
        } catch (Throwable throwable) {
            Utils.logError("Arcade hints failed", throwable);
            return false;
        }
    }

    private static long framesUntil;
    private static boolean framePosted;
    private static final Choreographer.FrameCallback FRAME = new Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            framePosted = false;
            for (Iterator<WeakReference<View>> iterator = HOSTS.iterator(); iterator.hasNext(); ) {
                View host = iterator.next().get();
                if (host == null) iterator.remove();
                else if (host.isAttachedToWindow()) host.invalidate();
            }
            if (AnimationUtils.currentAnimationTimeMillis() < framesUntil) {
                framePosted = true;
                Choreographer.getInstance().postFrameCallback(this);
            }
        }
    };

    /** Redraws the boards every frame until {@code until} (painter animations). */
    static void animateBoards(long until) {
        framesUntil = Math.max(framesUntil, until);
        if (framePosted) return;
        framePosted = true;
        Choreographer.getInstance().postFrameCallback(FRAME);
    }

    static Object host(ViewGroup pieceView) {
        return BoardViews.host(pieceView);
    }

    static boolean flip(ViewGroup pieceView) {
        return BoardViews.flip(host(pieceView));
    }

    static Object board(ViewGroup pieceView) {
        return BoardViews.position(host(pieceView));
    }

    static float squareSize(ViewGroup pieceView) {
        return BoardViews.squareSize(host(pieceView), pieceView);
    }

    static float ease(float t, boolean inOutQuad) {
        t = t < 0 ? 0 : t > 1 ? 1 : t;
        if (!inOutQuad) return t;
        return t < 0.5f ? 2 * t * t : -1 + (4 - 2 * t) * t;
    }

    /** Value at {@code t} of keyframes a (0) → b (mid) → c (1), eased per segment. */
    static float keyframes(float t, float mid, float a, float b, float c, boolean inOutQuad) {
        if (t <= mid && mid > 0) return a + (b - a) * ease(t / mid, inOutQuad);
        if (mid >= 1) return b;
        return b + (c - b) * ease((t - mid) / (1 - mid), inOutQuad);
    }

    private static float durationScale() {
        try {
            return Settings.Global.getFloat(Utils.context().getContentResolver(),
                Settings.Global.ANIMATOR_DURATION_SCALE, 1f);
        } catch (Throwable throwable) {
            return 1f;
        }
    }

    static float easeOutQuad(float t) {
        t = t < 0 ? 0 : t > 1 ? 1 : t;
        return t * (2 - t);
    }

    /**
     * Follows the app's own move animation (it runs the position with {@link #MOVE_INTERPOLATOR})
     * and adds the website's bounce, plus the arc of a castling rook.
     */
    static final class MoveState implements ValueAnimator.AnimatorUpdateListener {
        private final View piece;
        private final long created;
        private final boolean rook;
        private final float fromX, fromY, toX, toY, arc;
        /** The system's animator duration scale (developer options), which stretches the move. */
        private final float durationScale = durationScale();
        private ValueAnimator animator;
        private float progress;

        MoveState(View piece, long created, boolean rook, float fromX, float fromY, float toX, float toY, float arc) {
            this.piece = piece;
            this.created = created;
            this.rook = rook;
            this.fromX = fromX;
            this.fromY = fromY;
            this.toX = toX;
            this.toY = toY;
            this.arc = arc;
        }

        float progress(long now) {
            // A move that stopped ticking was replaced or cancelled.
            if (now - created > MOVE_MS * 3) return 1f;
            return animator != null ? progress : 0f;
        }

        @Override
        public void onAnimationUpdate(ValueAnimator animation) {
            if (animator == null) animator = animation;
            else if (animator != animation) return;
            float duration = animation.getDuration() * durationScale;
            progress = duration <= 0 ? 1f : Math.min(1f, animation.getCurrentPlayTime() / duration);

            float t = progress;
            float size = t >= MOVE_LANDS ? 1f : keyframes(t / MOVE_LANDS, 0.5f, 1f, MOVE_SCALE, 1f, rook);
            piece.setScaleX(size);
            piece.setScaleY(size);
            if (rook) {
                float along = ease(t / MOVE_LANDS, true);
                piece.setTranslationX(fromX + (toX - fromX) * along);
                float y = t >= MOVE_LANDS ? toY : keyframes(t / MOVE_LANDS, 0.5f, fromY, fromY + arc, toY, true);
                piece.setTranslationY(y);
            }
        }
    }
}
