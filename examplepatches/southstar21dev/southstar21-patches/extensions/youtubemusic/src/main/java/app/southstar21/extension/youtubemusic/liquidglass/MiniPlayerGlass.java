package app.southstar21.extension.youtubemusic.liquidglass;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Turns YouTube Music's mini player into a small glass capsule docked right of the tab bar
 * (see {@link Dock}): the round thumbnail ringed by the song's progress, and play/pause. A
 * glass chip above it shows the title and artist.
 * <p>
 * The mini player is the top strip of the player page ({@code player_page}), which slides up
 * from it to the full player. The page's own background (YouTube Music's gradient) paints both
 * the mini player's grey and the full player behind its controls, so it isn't thrown away: the
 * page gets a background that draws the glass while the player is collapsed and fades
 * YouTube Music's background back in as the mini player fades out on the way up.
 * <p>
 * Where the player can't rest in the bar's row (the patch's hook is missing, or the bar is
 * hidden) the mini player stays a full width glass card above the bar.
 */
final class MiniPlayerGlass implements ViewTreeObserver.OnPreDrawListener {
    /**
     * Moves the thumbnail and the buttons in from the glass's round ends (YouTube Music places
     * the thumbnail where the mini player's spacer is, so it follows the padding).
     */
    private static final int SIDE_PADDING_DP = 8;
    /** Docked: the album art's size, and the space around it in its slot. */
    private static final int ART_SIZE_DP = 56;
    private static final int ART_PADDING_DP = (Dock.WIDTH_DP - ART_SIZE_DP) / 2;
    /** YouTube Music's own thumbnail size and margins, put back when the player undocks. */
    private static final int YT_ART_SIZE_DP = 48;
    private static final int YT_ART_MARGIN_DP = 16;
    private static final int CHIP_HEIGHT_DP = 48;
    private static final int CHIP_GAP_DP = 8;
    private static final int CHIP_PADDING_DP = 16;
    private static final int BUTTON_SIZE_DP = 44;
    /** The progress ring around the thumbnail. */
    private static final float RING_GAP_DP = 2.5f;
    private static final float RING_WIDTH_DP = 2.5f;
    private static final int RING_COLOR = 0xFFFF4E45;
    private static final int RING_TRACK_COLOR = 0x2EFFFFFF;

    private final Activity activity;
    private final ViewGroup page;
    private final int miniPlayerId;
    private final int artId;
    private final int spacerId, titleId, subtitleId, routeId, askId, playId;
    private final int pagerId, swipeTitleId, swipeSubtitleId, swipeThumbId;
    /** The album art: a card YouTube Music grows from the mini player into the full player. */
    private View art;
    /** 1 for a round thumbnail, 0 for YouTube Music's own corners (the full player's art). */
    private float artRound = -1f;
    private final android.graphics.Outline artOutline = new android.graphics.Outline();
    private final android.view.ViewOutlineProvider roundArt = new android.view.ViewOutlineProvider() {
        @Override
        public void getOutline(View view, android.graphics.Outline out) {
            int w = view.getWidth(), h = view.getHeight();
            // YouTube Music's own corner radius, from the card's background.
            artOutline.setEmpty();
            android.view.ViewOutlineProvider.BACKGROUND.getOutline(view, artOutline);
            float own = Math.max(0f, artOutline.getRadius());
            float radius = own + (Math.min(w, h) / 2f - own) * Math.max(0f, artRound);
            out.setRoundRect(0, 0, w, h, radius);
        }
    };
    private final float density;
    private final LiquidGlassDrawable glass;
    private final LiquidGlassDrawable chipGlass;
    private final Background background = new Background();
    /** The glass bar above the tabs: title and artist, then previous, play/pause and next. */
    private final android.widget.LinearLayout chip;
    private TextView chipText;
    private android.widget.ImageButton playButton;
    private final Glyph playGlyph = new Glyph(Glyph.PLAY);
    private View miniPlayer;
    /** When the glass was last redrawn for what's behind it (uptime ms). */
    private long lastRefresh;
    private boolean layoutChanged = true;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> {
        layoutChanged = true;
        fullLayoutChanged = true;
    };
    /** Views of YouTube Music's this hid for the capsule, shown again when it undocks. */
    private final ArrayList<View> hidden = new ArrayList<>();
    private boolean docked;
    private CharSequence chipTitle, chipSubtitle;
    private final FullPlayerGlass fullGlass;
    /** When the full player's blurred art was last redrawn (uptime ms). */
    private long lastBackdrop;
    private final int pageBackgroundId, thumbnailId;
    private View pageBackground, thumbnail;
    /** The cover image the backdrop was last drawn from. */
    private Drawable lastCover;
    /** A layout pass since the full player's glass last looked; kept apart from {@link #layoutChanged}. */
    private boolean fullLayoutChanged = true;
    private long lastFullLayout;

    MiniPlayerGlass(Activity activity, ViewGroup page, int miniPlayerId, int artId) {
        this.activity = activity;
        this.page = page;
        this.miniPlayerId = miniPlayerId;
        this.artId = artId;
        this.spacerId = LiquidGlassNavBarPatch.id(activity, "mini_player_watch_fragment_spacer");
        this.titleId = LiquidGlassNavBarPatch.id(activity, "mini_player_title");
        this.subtitleId = LiquidGlassNavBarPatch.id(activity, "mini_player_subtitle");
        this.routeId = LiquidGlassNavBarPatch.id(activity, "mini_player_media_route_container");
        this.askId = LiquidGlassNavBarPatch.id(activity, "mini_player_ask_music_global_entry_button");
        this.playId = LiquidGlassNavBarPatch.id(activity, "mini_player_play_pause_replay_button");
        this.pagerId = LiquidGlassNavBarPatch.id(activity, "mini_player_view_pager_container");
        this.swipeTitleId = LiquidGlassNavBarPatch.id(activity, "swipeable_mini_player_title");
        this.swipeSubtitleId = LiquidGlassNavBarPatch.id(activity, "swipeable_mini_player_subtitle");
        this.swipeThumbId = LiquidGlassNavBarPatch.id(activity, "swipeable_mini_player_thumbnail_container");
        this.density = page.getResources().getDisplayMetrics().density;
        this.sheetId = LiquidGlassNavBarPatch.id(activity, "player_bottom_sheet");
        this.pageBackgroundId = LiquidGlassNavBarPatch.id(activity, "player_page_background");
        this.thumbnailId = LiquidGlassNavBarPatch.id(activity, "player_thumbnail");
        this.fullGlass = new FullPlayerGlass(activity, page, canvas -> background.drawUnder(canvas));
        this.glass = new LiquidGlassDrawable(page, density, NavbarStyle::miniPlayer);
        glass.setCallback(background);
        this.chip = makeChip();
        // The chip carries its own glass: it floats above the page's top, outside its bounds,
        // so it lives beside the page and looks through the page and the content below it.
        this.chipGlass = new LiquidGlassDrawable(chip, density, NavbarStyle::miniPlayer);
        chip.setBackground(chipGlass);
    }

    void install() {
        for (LiquidGlassDrawable g : new LiquidGlassDrawable[]{glass, chipGlass}) {
            g.setDark(true);
            g.setSouthstar21(NavbarStyle.miniPlayer().southstar21);
        }
        adoptBackground();
        if (page.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) page.getParent();
            parent.addView(chip, parent.indexOfChild(page) + 1,
                    new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(CHIP_HEIGHT_DP)));
        }
        page.getViewTreeObserver().addOnPreDrawListener(this);
        page.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        page.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().addOnPreDrawListener(MiniPlayerGlass.this);
                v.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                v.getViewTreeObserver().removeOnPreDrawListener(MiniPlayerGlass.this);
            }
        });
    }

    /** The glass bar: the title and artist (a tap opens the player), then the buttons. */
    private android.widget.LinearLayout makeChip() {
        android.widget.LinearLayout bar = new android.widget.LinearLayout(page.getContext());
        bar.setOrientation(android.widget.LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(0, 0, dp(4), 0);
        bar.setVisibility(View.GONE);

        TextView text = new TextView(page.getContext());
        text.setSingleLine(true);
        text.setEllipsize(TextUtils.TruncateAt.END);
        text.setGravity(Gravity.CENTER_VERTICAL);
        text.setIncludeFontPadding(false);
        text.setPadding(dp(CHIP_PADDING_DP), 0, dp(8), 0);
        text.setTextColor(Color.WHITE);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        // A tap opens the player, like a tap on the mini player.
        text.setOnClickListener(v -> {
            if (miniPlayer != null) miniPlayer.performClick();
        });
        bar.addView(text, new android.widget.LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        chipText = text;

        bar.addView(button(new Glyph(Glyph.PREVIOUS), "Previous", v -> {
            MediaController c = controller();
            if (c != null) c.getTransportControls().skipToPrevious();
        }));
        playButton = button(playGlyph, "Play", v -> togglePlay());
        bar.addView(playButton);
        bar.addView(button(new Glyph(Glyph.NEXT), "Next", v -> {
            MediaController c = controller();
            if (c != null) c.getTransportControls().skipToNext();
        }));
        return bar;
    }

    private android.widget.ImageButton button(Drawable glyph, String description, View.OnClickListener click) {
        android.widget.ImageButton button = new android.widget.ImageButton(page.getContext());
        button.setImageDrawable(glyph);
        button.setScaleType(android.widget.ImageView.ScaleType.CENTER);
        // No ripple on the glass: the glyph shrinks a little while pressed instead.
        button.setBackground(null);
        button.setOnTouchListener((v, event) -> {
            int action = event.getActionMasked();
            if (action == android.view.MotionEvent.ACTION_DOWN) {
                v.animate().scaleX(0.82f).scaleY(0.82f).setDuration(90).start();
            } else if (action == android.view.MotionEvent.ACTION_UP || action == android.view.MotionEvent.ACTION_CANCEL) {
                v.animate().scaleX(1f).scaleY(1f).setDuration(160).start();
            }
            return false;
        });
        button.setContentDescription(description);
        button.setOnClickListener(click);
        button.setLayoutParams(new android.widget.LinearLayout.LayoutParams(dp(BUTTON_SIZE_DP), dp(BUTTON_SIZE_DP)));
        return button;
    }

    private boolean isPlaying() {
        PlaybackState state = playbackState();
        if (state == null) return false;
        int s = state.getState();
        return s == PlaybackState.STATE_PLAYING || s == PlaybackState.STATE_BUFFERING;
    }

    /** Through the media session; without one, through YouTube Music's own (hidden) button. */
    private void togglePlay() {
        MediaController c = controller();
        if (c != null && playbackState() != null) {
            if (isPlaying()) c.getTransportControls().pause();
            else c.getTransportControls().play();
        } else {
            View play = playId == 0 ? null : page.findViewById(playId);
            if (play != null) play.performClick();
        }
        // Read the new state soon, for the button's glyph.
        nextRead = SystemClock.uptimeMillis() + 150;
    }

    /** The buttons' white glyphs: previous, play, pause, next. */
    private final class Glyph extends Drawable {
        static final int PREVIOUS = 0, PLAY = 1, PAUSE = 2, NEXT = 3;
        private int kind;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final android.graphics.Path path = new android.graphics.Path();

        Glyph(int kind) {
            this.kind = kind;
            paint.setColor(Color.WHITE);
        }

        void setKind(int kind) {
            if (this.kind == kind) return;
            this.kind = kind;
            invalidateSelf();
        }

        @Override
        public int getIntrinsicWidth() {
            return dp(24);
        }

        @Override
        public int getIntrinsicHeight() {
            return dp(24);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float u = b.width() / 24f;
            canvas.save();
            canvas.translate(b.left, b.top);
            canvas.scale(u, u);
            path.reset();
            switch (kind) {
                case PLAY:
                    path.moveTo(7f, 4.5f);
                    path.lineTo(19.5f, 12f);
                    path.lineTo(7f, 19.5f);
                    path.close();
                    canvas.drawPath(path, paint);
                    break;
                case PAUSE:
                    canvas.drawRoundRect(6f, 5f, 10f, 19f, 1f, 1f, paint);
                    canvas.drawRoundRect(14f, 5f, 18f, 19f, 1f, 1f, paint);
                    break;
                case NEXT:
                    path.moveTo(5f, 6f);
                    path.lineTo(14.5f, 12f);
                    path.lineTo(5f, 18f);
                    path.close();
                    canvas.drawPath(path, paint);
                    canvas.drawRoundRect(16f, 6f, 18.5f, 18f, 1f, 1f, paint);
                    break;
                default:
                    path.moveTo(19f, 6f);
                    path.lineTo(9.5f, 12f);
                    path.lineTo(19f, 18f);
                    path.close();
                    canvas.drawPath(path, paint);
                    canvas.drawRoundRect(5.5f, 6f, 8f, 18f, 1f, 1f, paint);
                    break;
            }
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Wraps whatever background YouTube Music gave the page (it may set a new one). */
    private void adoptBackground() {
        Drawable current = page.getBackground();
        if (current == background) return;
        background.setOriginal(current);
        page.setBackground(background);
    }

    @Override
    public boolean onPreDraw() {
        try {
            adoptBackground();
            if (miniPlayer == null || !isInside(miniPlayer)) miniPlayer = page.findViewById(miniPlayerId);
            View mini = miniPlayer;
            Dock.playerShown = mini != null && isPlayerShown();
            float shown = mini == null || mini.getWidth() == 0 ? 0f : visibleAlpha(mini);
            // With the queue sheet pulled up YouTube Music shows its mini player again (the small
            // cover top right): still the open player, not one closing.
            boolean pulled = sheetPulled();
            if (shown > 0f && pulled) shown = 0f;
            background.setGlassAlpha(shown);
            roundArt(shown);
            trackSheet();
            // Not with the queue sheet up: YouTube Music makes the mini player the bar above it
            // (cover, title, pause), laid out for its own full width.
            boolean dock = Dock.resting && Dock.rightInset >= 0 && page.getWidth() > 0 && !pulled;
            if (mini != null && dock != docked) {
                docked = dock;
                if (!dock) undock(mini);
            }
            // The art follows the player's slide, not the mini player's fade: the mini player is
            // gone a third of the way up, and the art would jump back to where YouTube Music
            // thinks the mini player is.
            if (docked && mini != null) alignArt(mini, slide(shown));
            // The full player, while it shows at all: glass on its parts, and its blurred art
            // backdrop kept up to date (the song can change under it).
            // (Its own layout flag: the mini player's is only cleared while the mini player shows,
            // so with the player open it stayed set and the art was re-blurred every frame.)
            if (shown < 1f && page.getVisibility() == View.VISIBLE && Dock.playerShown) {
                long now = SystemClock.uptimeMillis();
                // Swiping between songs lays the page out nearly every frame: what a layout pass
                // costs (finding views, walking the chips) runs at most every 300ms.
                boolean relayout = fullLayoutChanged && now - lastFullLayout >= 300;
                if (relayout) {
                    fullLayoutChanged = false;
                    lastFullLayout = now;
                }
                fullGlass.apply(relayout, now);
                // YouTube Music fades its own song color in over the page while swiping between
                // songs, over the blurred cover: kept clear while the player is open.
                if (pageBackground == null || !isInside(pageBackground)) {
                    pageBackground = pageBackgroundId == 0 ? null : page.findViewById(pageBackgroundId);
                }
                if (pageBackground != null && pageBackground.getAlpha() != 0f) pageBackground.setAlpha(0f);
                // Redrawn when the cover image changes (a new song), fading over from the old one.
                // A video can't be drawn: the last cover stays behind it.
                Drawable cover = coverImage();
                boolean due = cover != null ? cover != lastCover : !background.hasBackdrop() && now - lastBackdrop > 1000;
                if (due) {
                    lastCover = cover;
                    lastBackdrop = now;
                    background.refreshBackdrop();
                }
                if (due || background.fading()) fullGlass.backdropChanged();
            } else {
                fullGlass.hide();
                // Collapsed: YouTube Music's own background back as it was.
                if (shown >= 1f && pageBackground != null && pageBackground.getAlpha() == 0f) pageBackground.setAlpha(1f);
            }
            if (shown == 0f) {
                hideChip();
                Dock.capsuleShown = false;
                return true;
            }
            if (docked) dock(mini);

            int pad = dp(docked ? ART_PADDING_DP : SIDE_PADDING_DP);
            if (mini.getPaddingLeft() != pad || mini.getPaddingRight() != pad) {
                mini.setPadding(pad, mini.getPaddingTop(), pad, mini.getPaddingBottom());
            }

            // The mini player's bounds in the page's coordinates.
            float left = 0, top = 0;
            View v = mini;
            while (v != page) {
                left += v.getLeft() + v.getTranslationX();
                top += v.getTop() + v.getTranslationY();
                ViewParent p = v.getParent();
                if (!(p instanceof View)) return true;
                v = (View) p;
            }
            int l = Math.round(left), t = Math.round(top);
            int glassTop = t + dp(Dock.TOP_INSET_DP);
            // Docked, the mini player's margins place it; otherwise the card keeps 8dp from the edges.
            int side = docked ? 0 : dp(NavbarStyle.miniPlayer().sideMarginDp);
            glass.setPillInsets(l + side, glassTop,
                    page.getWidth() - (l + mini.getWidth()) + side,
                    page.getHeight() - (t + mini.getHeight()));

            // Where the capsule is on screen, for the edge blur to leave it clear.
            Dock.capsuleShown = docked;
            if (docked) {
                page.getLocationOnScreen(location);
                Dock.capsule.set(location[0] + l, location[1] + glassTop,
                        location[0] + l + mini.getWidth(), location[1] + t + mini.getHeight());
            }

            if (docked) {
                placeChip(shown, glassTop, page.getWidth() - (l + mini.getWidth()));
            } else {
                hideChip();
            }

            // What's behind can only have moved during or just after a touch, or with a layout
            // pass; otherwise once a second (which also moves the progress ring on).
            // (Every frame kept the app drawing nonstop.)
            long now = SystemClock.uptimeMillis();
            if (layoutChanged || Interaction.recent(now) || now - lastRefresh > 1000) {
                layoutChanged = false;
                lastRefresh = now;
                background.invalidateSelf();
                if (chip.getVisibility() == View.VISIBLE) chipGlass.invalidateSelf();
            }
        } catch (Throwable t) {
            page.getViewTreeObserver().removeOnPreDrawListener(this);
            Log.e(LiquidGlassNavBarPatch.TAG, "Disabling mini player glass", t);
        }
        return true;
    }

    /** The player is on screen (collapsed or open), not hidden below it. */
    private boolean isPlayerShown() {
        if (page.getVisibility() != View.VISIBLE || !(page.getParent() instanceof View)) return false;
        View parent = (View) page.getParent();
        return page.getTop() + page.getTranslationY() < parent.getHeight() - dp(8);
    }

    /**
     * Shrinks YouTube Music's mini player to its album art: margins put it right of the tabs,
     * the thumbnail grows to fill the slot, and everything else goes (the glass bar above has
     * the title and the buttons).
     */
    private void dock(View mini) {
        int right = Dock.rightInset;
        int left = page.getWidth() - right - dp(Dock.WIDTH_DP);
        setMargins(mini, left, right);
        View spacer = spacerId == 0 ? null : mini.findViewById(spacerId);
        if (spacer != null) setSlot(spacer, dp(ART_SIZE_DP), 0, 0);
        View title = titleId == 0 ? null : mini.findViewById(titleId);
        if (title != null && title.getParent() instanceof View) hide((View) title.getParent());
        hide(routeId == 0 ? null : mini.findViewById(routeId));
        hide(askId == 0 ? null : mini.findViewById(askId));
        hide(playId == 0 ? null : mini.findViewById(playId));

        // Some versions show a swipeable pager of songs over the mini player instead: keep it
        // to the album art's slot.
        View pager = pagerId == 0 ? null : page.findViewById(pagerId);
        if (pager instanceof ViewGroup && pager.getVisibility() == View.VISIBLE) {
            setMargins(pager, left, right);
            dockPagerItems((ViewGroup) pager);
            // Its thumbnails slide past whenever the song changes and poke out around the art
            // (YouTube Music's own art card covers the slot): keep it for its swipes, unseen.
            if (pager.getAlpha() != 0f) pager.setAlpha(0f);
        }
    }

    private void dockPagerItems(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            int id = child.getId();
            if (id != View.NO_ID && id == swipeThumbId) {
                setStartEnd(child, dp(ART_PADDING_DP), 0);
            } else if (id != View.NO_ID && id == swipeTitleId && child.getParent() instanceof View) {
                hide((View) child.getParent());
            } else if (child instanceof ViewGroup) {
                dockPagerItems((ViewGroup) child);
            }
        }
    }

    // YouTube Music moves and sizes the album art itself, for a full width mini player: the
    // capsule's margins leave it behind, and closing the player it lands still large, over the
    // tab bar. So the art's rect is blended from YouTube Music's towards the capsule's slot as
    // the player closes: all YouTube Music's while open, all the slot's at rest. Its translation
    // and scale are YouTube Music's own plus this, and whatever YouTube Music sets in between
    // becomes the new base.
    private float baseTx, baseTy, baseSx = 1f, baseSy = 1f;
    private float setTx = Float.NaN, setTy = Float.NaN, setSx = Float.NaN, setSy = Float.NaN;

    /** The page's top while the player rests (-1 until seen). */
    private float restTop = -1f;
    private final int[] location = new int[2];

    /** 1 while the player rests, 0 once it's fully open, following the page as it slides. */
    private float slide(float shown) {
        float top = page.getTop() + page.getTranslationY();
        if (shown >= 0.999f) restTop = top;
        if (restTop <= 0f) return shown;
        return Math.max(0f, Math.min(1f, top / restTop));
    }

    /**
     * Puts the album art on the spacer YouTube Music keeps for it in the capsule.
     *
     * @param weight 1 while the player rests, 0 once it's open: how far towards the slot
     */
    private void alignArt(View mini, float weight) {
        View a = art;
        if (a == null || a.getWidth() == 0 || mini.getWidth() == 0 || !(a.getParent() instanceof View)) return;
        float tx = a.getTranslationX(), ty = a.getTranslationY();
        float sx = a.getScaleX(), sy = a.getScaleY();
        if (tx != setTx) baseTx = tx;
        if (ty != setTy) baseTy = ty;
        if (sx != setSx) baseSx = sx;
        if (sy != setSy) baseSy = sy;
        // The slot from the docked player's own frame, not YouTube Music's spacer: YouTube
        // Music shows its play button again for a frame whenever playback toggles, which
        // squeezes the spacer and made the art twitch.
        float[] frame = offsetInPage(mini);
        float[] parent = offsetInPage((View) a.getParent());
        if (frame == null || parent == null) return;
        float size = dp(ART_SIZE_DP);
        float[] slot = {frame[0] + dp(ART_PADDING_DP), frame[1] + (mini.getHeight() - size) / 2f};

        float w = a.getWidth(), h = a.getHeight();
        float px = a.getPivotX(), py = a.getPivotY();
        // YouTube Music's rect for the art, in the page's coordinates.
        float ytLeft = parent[0] + a.getLeft() + baseTx + px * (1f - baseSx);
        float ytTop = parent[1] + a.getTop() + baseTy + py * (1f - baseSy);
        float ytW = w * baseSx, ytH = h * baseSy;
        // Blended towards the slot.
        float left = ytLeft + (slot[0] - ytLeft) * weight;
        float top = ytTop + (slot[1] - ytTop) * weight;
        float width = ytW + (size - ytW) * weight;
        float height = ytH + (size - ytH) * weight;

        setSx = width / w;
        setSy = height / h;
        setTx = left - parent[0] - a.getLeft() - px * (1f - setSx);
        setTy = top - parent[1] - a.getTop() - py * (1f - setSy);
        if (sx != setSx) a.setScaleX(setSx);
        if (sy != setSy) a.setScaleY(setSy);
        if (tx != setTx) a.setTranslationX(setTx);
        if (ty != setTy) a.setTranslationY(setTy);
    }

    /** Gives YouTube Music its own translation and scale back. */
    private void releaseArt() {
        View a = art;
        if (a != null && !Float.isNaN(setTx)) {
            if (a.getTranslationX() == setTx) a.setTranslationX(baseTx);
            if (a.getTranslationY() == setTy) a.setTranslationY(baseTy);
            if (a.getScaleX() == setSx) a.setScaleX(baseSx);
            if (a.getScaleY() == setSy) a.setScaleY(baseSy);
        }
        setTx = setTy = setSx = setSy = Float.NaN;
    }

    /** {@code view}'s top left in the page's coordinates, or null if it isn't on the page. */
    private float[] offsetInPage(View view) {
        float x = 0, y = 0;
        for (View v = view; v != page; ) {
            x += v.getLeft() + v.getTranslationX();
            y += v.getTop() + v.getTranslationY();
            ViewParent p = v.getParent();
            if (!(p instanceof View)) return null;
            v = (View) p;
        }
        return new float[]{x, y};
    }

    /** Back to YouTube Music's full width mini player. */
    private void undock(View mini) {
        releaseArt();
        setMargins(mini, 0, 0);
        View pager = pagerId == 0 ? null : page.findViewById(pagerId);
        if (pager != null) {
            setMargins(pager, 0, 0);
            pager.setAlpha(1f);
        }
        View spacer = spacerId == 0 ? null : mini.findViewById(spacerId);
        if (spacer != null) setSlot(spacer, dp(YT_ART_SIZE_DP), dp(YT_ART_MARGIN_DP), dp(YT_ART_MARGIN_DP));
        for (View view : hidden) {
            if (view.getVisibility() == View.GONE) view.setVisibility(View.VISIBLE);
        }
        hidden.clear();
        hideChip();
    }

    private void hide(View view) {
        if (view == null || view.getVisibility() == View.GONE) return;
        view.setVisibility(View.GONE);
        if (!hidden.contains(view)) hidden.add(view);
    }

    private static void setMargins(View view, int left, int right) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
        if (mlp.leftMargin == left && mlp.rightMargin == right) return;
        mlp.leftMargin = left;
        mlp.rightMargin = right;
        view.setLayoutParams(mlp);
    }

    /** The spacer YouTube Music keeps for the art: its size and margins. */
    private static void setSlot(View view, int size, int start, int end) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null) return;
        if (lp.width != size || lp.height != size) {
            lp.width = size;
            lp.height = size;
            view.setLayoutParams(lp);
        }
        setStartEnd(view, start, end);
    }

    private static void setStartEnd(View view, int start, int end) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
        if (mlp.getMarginStart() == start && mlp.getMarginEnd() == end) return;
        mlp.setMarginStart(start);
        mlp.setMarginEnd(end);
        view.setLayoutParams(mlp);
    }

    /** The chip spans the row above the tab bar and the capsule, and fades with the mini player. */
    private void placeChip(float shown, int capsuleTop, int capsuleRightInset) {
        if (!updateChipText()) {
            hideChip();
            return;
        }
        if (chip.getVisibility() != View.VISIBLE) chip.setVisibility(View.VISIBLE);
        if (chip.getAlpha() != shown) chip.setAlpha(shown);
        boolean playing = isPlaying();
        playGlyph.setKind(playing ? Glyph.PAUSE : Glyph.PLAY);
        playButton.setContentDescription(playing ? "Pause" : "Play");
        // As wide as the tab bar and the docked art together.
        int width = page.getWidth() - Dock.leftInset - capsuleRightInset;
        ViewGroup.LayoutParams lp = chip.getLayoutParams();
        if (lp != null && width > 0 && lp.width != width) {
            lp.width = width;
            chip.setLayoutParams(lp);
        }
        int w = chip.getWidth(), h = chip.getHeight();
        if (w == 0 || h == 0) return;
        // The chip is laid out at its parent's top left (the page's parent); the translation
        // places it over the capsule, following the page as it slides.
        float x = page.getLeft() + page.getTranslationX() + page.getWidth() - capsuleRightInset - w - chip.getLeft();
        float y = page.getTop() + page.getTranslationY() + capsuleTop - dp(CHIP_GAP_DP) - h - chip.getTop();
        if (chip.getTranslationX() != x) chip.setTranslationX(x);
        if (chip.getTranslationY() != y) chip.setTranslationY(y);
    }

    private void hideChip() {
        if (chip.getVisibility() != View.GONE) chip.setVisibility(View.GONE);
    }

    /** Copies the title and artist from YouTube Music's mini player; false if there's no title. */
    private boolean updateChipText() {
        // The media session first: with the swipeable mini player the views can be empty or
        // belong to the neighbouring songs.
        CharSequence title = null, subtitle = null;
        MediaMetadata metadata = metadata();
        if (metadata != null) {
            title = metadata.getText(MediaMetadata.METADATA_KEY_TITLE);
            subtitle = metadata.getText(MediaMetadata.METADATA_KEY_ARTIST);
            if (TextUtils.isEmpty(subtitle)) subtitle = metadata.getText(MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE);
        }
        if (TextUtils.isEmpty(title)) {
            title = textOf(titleId);
            subtitle = textOf(subtitleId);
        }
        if (TextUtils.isEmpty(title)) {
            title = textOf(swipeTitleId);
            subtitle = textOf(swipeSubtitleId);
        }
        if (TextUtils.isEmpty(title)) return false;
        if (TextUtils.equals(title, chipTitle) && TextUtils.equals(subtitle, chipSubtitle)) return true;
        chipTitle = title;
        chipSubtitle = subtitle;
        SpannableStringBuilder text = new SpannableStringBuilder(title.toString());
        if (!TextUtils.isEmpty(subtitle)) {
            text.append("  ");
            int start = text.length();
            text.append(subtitle.toString());
            text.setSpan(new ForegroundColorSpan(0xA6FFFFFF), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            text.setSpan(new RelativeSizeSpan(12f / 13f), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        chipText.setText(text);
        chipText.setContentDescription(subtitle == null ? title : title + ", " + subtitle);
        return true;
    }

    private CharSequence textOf(int id) {
        if (id == 0) return null;
        View view = page.findViewById(id);
        return view instanceof TextView ? ((TextView) view).getText() : null;
    }

    /**
     * Makes the mini player's album art a circle, turning back into YouTube Music's own rounded
     * square as the full player opens ({@code round} follows the mini player's fade).
     */
    private void roundArt(float round) {
        if (artId == 0) return;
        if (art == null || !isInside(art)) {
            art = page.findViewById(artId);
            artRound = -1f;
            if (art == null) return;
        }
        if (art.getOutlineProvider() != roundArt) {
            art.setOutlineProvider(roundArt);
            art.setClipToOutline(true);
            artRound = -1f;
        }
        if (round != artRound) {
            artRound = round;
            art.invalidateOutline();
        }
    }

    /**
     * The full player's cover image (YouTube Music's thumbnail), or null (none yet). It may be
     * hidden: YouTube Music hides it for a moment while swiping between songs.
     */
    private Drawable coverImage() {
        if (thumbnail == null || !isInside(thumbnail)) {
            thumbnail = thumbnailId == 0 ? null : page.findViewById(thumbnailId);
        }
        if (!(thumbnail instanceof android.widget.ImageView)) return null;
        Drawable d = ((android.widget.ImageView) thumbnail).getDrawable();
        return d != null && d.getIntrinsicWidth() > 0 && d.getIntrinsicHeight() > 0 ? d : null;
    }

    private final int sheetId;
    private View sheet;
    private final int[] sheetAt = new int[2];
    private final int[] pageAt = new int[2];

    /** Notes where the queue sheet rests while collapsed. */
    private void trackSheet() {
        if (sheet == null || !isInside(sheet)) sheet = sheetId == 0 ? null : page.findViewById(sheetId);
        if (sheet == null || !sheet.isShown()) return;
        sheet.getLocationInWindow(sheetAt);
        page.getLocationInWindow(pageAt);
        int top = sheetAt[1] - pageAt[1];
        if (sheetRest == Integer.MAX_VALUE || top > sheetRest) sheetRest = top;
    }

    /** Whether the queue sheet is pulled up (a little or all the way). */
    private boolean sheetPulled() {
        if (sheet == null || !isInside(sheet)) sheet = sheetId == 0 ? null : page.findViewById(sheetId);
        if (sheet == null || !sheet.isShown() || sheetRest == Integer.MAX_VALUE) return false;
        sheet.getLocationInWindow(sheetAt);
        page.getLocationInWindow(pageAt);
        return sheetRest - (sheetAt[1] - pageAt[1]) > 48 * density;
    }

    /** The sheet's top while collapsed, in the page's coordinates. */
    private int sheetRest = Integer.MAX_VALUE;

    /** The mini player's alpha with its parents' up to the page: it fades as the player opens. */
    private float visibleAlpha(View view) {
        float alpha = 1f;
        for (View v = view; v != page; v = (View) v.getParent()) {
            if (v.getVisibility() != View.VISIBLE) return 0f;
            alpha *= v.getAlpha();
            if (!(v.getParent() instanceof View)) return 0f;
        }
        return alpha;
    }

    private boolean isInside(View view) {
        for (ViewParent p = view.getParent(); p != null; p = p.getParent()) {
            if (p == page) return true;
        }
        return false;
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    // The song's progress, from YouTube Music's media session.

    private MediaController controller;
    private long nextLookup;
    // The session's state and song, read at most twice a second: each read is a call to
    // YouTube Music's media service, and the bar asks every frame.
    private PlaybackState cachedState;
    private MediaMetadata cachedMetadata;
    private long nextRead;

    private void readSession() {
        long now = SystemClock.uptimeMillis();
        if (now < nextRead) return;
        nextRead = now + 500;
        MediaController c = controller();
        cachedState = c == null ? null : c.getPlaybackState();
        cachedMetadata = c == null ? null : c.getMetadata();
    }

    private PlaybackState playbackState() {
        readSession();
        return cachedState;
    }

    private MediaMetadata metadata() {
        readSession();
        return cachedMetadata;
    }

    /** How far into the song playback is, 0..1, or -1 if unknown. */
    private float progress() {
        MediaController c = controller();
        if (c == null) return -1f;
        PlaybackState state = playbackState();
        MediaMetadata metadata = metadata();
        if (state == null || metadata == null) return -1f;
        long duration = metadata.getLong(MediaMetadata.METADATA_KEY_DURATION);
        if (duration <= 0) return -1f;
        long position = state.getPosition();
        if (state.getState() == PlaybackState.STATE_PLAYING && state.getLastPositionUpdateTime() > 0) {
            position += (long) ((SystemClock.elapsedRealtime() - state.getLastPositionUpdateTime())
                    * state.getPlaybackSpeed());
        }
        return Math.max(0f, Math.min(1f, position / (float) duration));
    }

    /**
     * The activity's media controller if YouTube Music set one, else one for the session its
     * playback notification names (an app may read its own notifications). Looked up again
     * every few seconds, since a new session can replace the old one.
     */
    private MediaController controller() {
        long now = SystemClock.uptimeMillis();
        if (now < nextLookup) return controller;
        nextLookup = now + (controller == null ? 3000 : 15000);
        try {
            MediaController c = activity.getMediaController();
            if (c == null) {
                NotificationManager nm = activity.getSystemService(NotificationManager.class);
                if (nm != null) {
                    for (StatusBarNotification sbn : nm.getActiveNotifications()) {
                        Object token = sbn.getNotification().extras.getParcelable(Notification.EXTRA_MEDIA_SESSION);
                        if (token instanceof MediaSession.Token) {
                            c = new MediaController(activity, (MediaSession.Token) token);
                            break;
                        }
                    }
                }
            }
            controller = c;
        } catch (Throwable t) {
            Log.w(LiquidGlassNavBarPatch.TAG, "No media session for the progress ring", t);
        }
        return controller;
    }

    /**
     * The page's background: the glass capsule (or card) and the progress ring over YouTube
     * Music's own background, cross-faded.
     */
    private final class Background extends Drawable implements Drawable.Callback {
        private Drawable original;
        /** 1 while the mini player shows, 0 once the full player is open. */
        private float glassAlpha = 1f;
        private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF ring = new RectF();

        Background() {
            ringPaint.setStyle(Paint.Style.STROKE);
            ringPaint.setStrokeCap(Paint.Cap.ROUND);
        }

        void setOriginal(Drawable drawable) {
            if (original != null) original.setCallback(null);
            original = drawable == null ? null : drawable.mutate();
            if (original != null) {
                original.setCallback(this);
                original.setBounds(getBounds());
            }
            invalidateSelf();
        }

        void setGlassAlpha(float alpha) {
            if (alpha == glassAlpha) return;
            glassAlpha = alpha;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (glassAlpha < 1f) {
                // Under a full blurred cover YouTube Music's background can't be seen: not drawn
                // (a whole screen less to paint each frame). It may have none (with the queue
                // sheet up): the blurred cover is drawn all the same.
                if (original != null && (glassAlpha > 0f || !hasBackdrop())) {
                    original.setAlpha(Math.round((1f - glassAlpha) * 255));
                    original.draw(canvas);
                }
                drawArtBackdrop(canvas, 1f - glassAlpha);
            }
            if (glassAlpha <= 0f) return;
            int save = glassAlpha >= 1f ? -1
                    : canvas.saveLayerAlpha(b.left, b.top, b.right, b.bottom, Math.round(glassAlpha * 255));
            // Docked, the album art stands alone, ringed by the progress: no glass behind it.
            if (!docked) glass.draw(canvas);
            if (docked) drawRing(canvas);
            if (save >= 0) canvas.restoreToCount(save);
        }

        // The full player's backdrop: the album cover, blurred across the whole page. It's drawn
        // small and scaled up, which blurs it cheaply, from the cover image itself (the cover's
        // view is blank while a new song loads), and only when that image changes. Two of them,
        // the new one fading in over the old.
        private final android.graphics.RenderNode[] backdrops = new android.graphics.RenderNode[2];
        private int current;
        private long fadeStart = -FADE_MS;
        private static final long FADE_MS = 450;
        private boolean backdropDirty = true;
        private float backdropAlpha;

        /** Records the backdrop again on the next draw, fading over from the old one. */
        void refreshBackdrop() {
            backdropDirty = true;
            invalidateSelf();
        }

        boolean hasBackdrop() {
            return backdrops[current] != null && backdrops[current].hasDisplayList();
        }

        /** Whether the new backdrop is still fading in. */
        boolean fading() {
            return SystemClock.uptimeMillis() - fadeStart < FADE_MS;
        }

        @android.annotation.SuppressLint("NewApi")
        private void drawArtBackdrop(Canvas canvas, float alpha) {
            View a = art;
            if (android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.S || !canvas.isHardwareAccelerated()
                    || alpha <= 0f) return;
            // Recording needs the cover laid out; painting what was recorded doesn't (YouTube Music
            // lays the cover out again, empty for a few frames, as the queue sheet opens).
            // The cover image too, when there is one: drawn at no size it left the backdrop empty.
            boolean canRecord = coverImage() != null
                    ? thumbnail.getWidth() > 0 && thumbnail.getHeight() > 0
                    : a != null && a.getWidth() > 0 && a.getHeight() > 0;
            if (!canRecord && !hasBackdrop()) return;
            if (backdrops[0] == null) {
                for (int i = 0; i < 2; i++) {
                    backdrops[i] = new android.graphics.RenderNode("FullPlayerBackdrop");
                    backdrops[i].setRenderEffect(android.graphics.RenderEffect.createBlurEffect(
                            6 * density, 6 * density, android.graphics.Shader.TileMode.CLAMP));
                }
            }
            if (backdropDirty && canRecord) {
                backdropDirty = false;
                if (fading()) {
                    // A second image while fading in (YouTube Music sets a first version, then the
                    // full one): replaces the one fading in, the fade still starting from the old song.
                    record(backdrops[current], a);
                } else {
                    boolean had = backdrops[current].hasDisplayList();
                    current ^= 1;
                    record(backdrops[current], a);
                    fadeStart = had ? SystemClock.uptimeMillis() : -FADE_MS;
                }
            }
            backdropAlpha = alpha;
            paintBackdrop(canvas);
            if (fading()) invalidateSelf();
        }

        @android.annotation.SuppressLint("NewApi")
        private void record(android.graphics.RenderNode backdrop, View a) {
            Rect b = getBounds();
            int w = Math.max(1, b.width() / 8), h = Math.max(1, b.height() / 8);
            backdrop.setPosition(0, 0, w, h);
            android.graphics.RecordingCanvas rc = backdrop.beginRecording(w, h);
            try {
                // Opaque whatever the cover holds: the backdrop is all that's behind the player.
                rc.drawColor(Color.BLACK);
                // Covering the page, centered, a little larger so the blur has no edges.
                float side = Math.max(w, h) * 1.25f;
                rc.save();
                rc.translate(w / 2f, h / 2f);
                drawCover(rc, a, side, side);
                rc.restore();
                // Darkened, so white text and glass stay legible over light covers (in the small
                // drawing, not as a layer over the whole screen).
                rc.drawColor(Color.argb(0x70, 0, 0, 0));
            } finally {
                backdrop.endRecording();
            }
        }

        /** The cover filling {@code w} x {@code h} centered on the origin, cropped to fit. */
        private void drawCover(Canvas canvas, View a, float w, float h) {
            // The image as its view shows it: video thumbnails come with black bars the view crops.
            View image = coverImage() != null ? thumbnail : null;
            if (image != null && image.getWidth() > 0 && image.getHeight() > 0) {
                float s = Math.max(w / image.getWidth(), h / image.getHeight());
                canvas.scale(s, s);
                canvas.translate(-image.getWidth() / 2f, -image.getHeight() / 2f);
                image.draw(canvas);
                return;
            }
            // No image (a video): the cover's view as it is.
            float s = Math.max(w / a.getWidth(), h / a.getHeight());
            canvas.scale(s, s);
            canvas.translate(-a.getWidth() / 2f, -a.getHeight() / 2f);
            a.draw(canvas);
        }

        @android.annotation.SuppressLint("NewApi")
        private void paintBackdrop(Canvas canvas) {
            android.graphics.RenderNode now = backdrops[current], before = backdrops[current ^ 1];
            if (now == null || backdropAlpha <= 0f || !now.hasDisplayList()) return;
            float t = Math.min(1f, (SystemClock.uptimeMillis() - fadeStart) / (float) FADE_MS);
            Rect b = getBounds();
            if (t < 1f && before.hasDisplayList()) {
                before.setAlpha(backdropAlpha);
                drawScaled(canvas, before, b);
                now.setAlpha(backdropAlpha * t);
            } else {
                now.setAlpha(backdropAlpha);
            }
            drawScaled(canvas, now, b);
        }

        @android.annotation.SuppressLint("NewApi")
        private void drawScaled(Canvas canvas, android.graphics.RenderNode node, Rect b) {
            int save = canvas.save();
            canvas.translate(b.left, b.top);
            canvas.scale(b.width() / (float) node.getWidth(), b.height() / (float) node.getHeight());
            canvas.drawRenderNode(node);
            canvas.restoreToCount(save);
        }

        /**
         * What the full player's glass looks through: YouTube Music's background and the blurred
         * art as last drawn, without recording anything again.
         */
        void drawUnder(Canvas canvas) {
            if (original != null && glassAlpha < 1f && (glassAlpha > 0f || !hasBackdrop())) original.draw(canvas);
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S
                    && canvas.isHardwareAccelerated()) {
                paintBackdrop(canvas);
            }
        }

        /** The progress ring around the round thumbnail. */
        private void drawRing(Canvas canvas) {
            View a = art;
            if (a == null || a.getWidth() == 0 || a.getVisibility() != View.VISIBLE) return;
            float progress = progress();
            if (progress < 0f) return;
            float left = 0, top = 0;
            for (View v = a; v != page; ) {
                left += v.getLeft() + v.getTranslationX();
                top += v.getTop() + v.getTranslationY();
                ViewParent p = v.getParent();
                if (!(p instanceof View)) return;
                v = (View) p;
            }
            float cx = left + a.getWidth() / 2f, cy = top + a.getHeight() / 2f;
            float r = Math.min(a.getWidth() * a.getScaleX(), a.getHeight() * a.getScaleY()) / 2f
                    + RING_GAP_DP * density;
            ring.set(cx - r, cy - r, cx + r, cy + r);
            ringPaint.setStrokeWidth(RING_WIDTH_DP * density);
            ringPaint.setColor(RING_TRACK_COLOR);
            canvas.drawOval(ring, ringPaint);
            if (progress > 0f) {
                ringPaint.setColor(RING_COLOR);
                canvas.drawArc(ring, -90f, 360f * progress, false, ringPaint);
            }
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            glass.setBounds(bounds);
            if (original != null) original.setBounds(bounds);
        }

        @Override
        public boolean getPadding(Rect padding) {
            // Keep the page's own padding.
            padding.set(0, 0, 0, 0);
            return false;
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public void invalidateDrawable(Drawable who) {
            invalidateSelf();
        }

        @Override
        public void scheduleDrawable(Drawable who, Runnable what, long when) {
            scheduleSelf(what, when);
        }

        @Override
        public void unscheduleDrawable(Drawable who, Runnable what) {
            unscheduleSelf(what);
        }
    }
}
