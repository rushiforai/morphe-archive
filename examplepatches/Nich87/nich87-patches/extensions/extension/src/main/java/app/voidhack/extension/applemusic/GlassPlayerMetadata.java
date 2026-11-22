package app.voidhack.extension.applemusic;

import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.Layout;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Moves the track text between the two native layouts above their independent fades. */
final class GlassPlayerMetadata extends Drawable {
    private final ViewGroup player;
    private final ViewGroup host;
    private final Label title;
    private final Label artist;
    private final int songId;
    private final int artworkId;
    private final int currentMetadataId;
    private final int titleId;
    private final int subtitleId;
    private final int miniTitleId;
    private final int miniSubtitleId;
    private final int[] location = new int[2];
    private final RectF layers = new RectF();
    private final Paint additive = new Paint();
    private boolean attached;
    private int expandedAlpha;
    private float aroundX;
    private float aroundY;

    GlassPlayerMetadata(ViewGroup player, View mini) {
        this.player = player;
        host = LiquidGlass.find(player, "player_fragments_host") instanceof ViewGroup group ? group : null;
        title = new Label(text(LiquidGlass.find(mini, "mini_player_title")));
        artist = new Label(text(LiquidGlass.find(mini, "mini_player_artist")));
        songId = id("player_container");
        artworkId = id("fullplayerSongImage");
        currentMetadataId = id("text_metadata_container");
        titleId = id("title");
        subtitleId = id("subtitle");
        miniTitleId = id("mini_player_title");
        miniSubtitleId = id("mini_player_subtitle");
        additive.setBlendMode(BlendMode.PLUS);
    }

    void update(float progress, int alpha) {
        View expanded = currentMetadata();
        if (expanded == null) {
            release();
            return;
        }
        boolean song = expanded.getId() == songId;
        title.use(text(expanded.findViewById(song ? titleId : miniTitleId)));
        artist.use(text(expanded.findViewById(song ? subtitleId : miniSubtitleId)));
        if (title.expanded == null && artist.expanded == null) {
            release();
            return;
        }

        player.getLocationOnScreen(location);
        int originX = location[0];
        int originY = location[1];
        layers.setEmpty();
        title.position(progress, originX, originY, location, layers);
        artist.position(progress, originX, originY, location, layers);
        positionAroundArtwork(expanded, progress, originX, originY);
        expandedAlpha = alpha;
        setBounds(0, 0, player.getWidth(), player.getHeight());
        if (!attached) {
            player.getOverlay().add(this);
            attached = true;
        }
        invalidateSelf();
    }

    void release() {
        title.release();
        artist.release();
        if (attached) {
            player.getOverlay().remove(this);
            attached = false;
        }
    }

    @Override public void draw(Canvas canvas) {
        // Blend the two weighted glyph images in a transparent layer. Source-over
        // would dim even identical overlapping glyphs halfway through the handoff.
        int save = canvas.save();
        canvas.translate(aroundX, aroundY);
        int combined = canvas.saveLayer(layers, null);
        int mini = canvas.saveLayerAlpha(layers, 255 - expandedAlpha);
        title.draw(canvas, false);
        artist.draw(canvas, false);
        canvas.restoreToCount(mini);
        additive.setAlpha(expandedAlpha);
        int expanded = canvas.saveLayer(layers, additive);
        title.draw(canvas, true);
        artist.draw(canvas, true);
        canvas.restoreToCount(expanded);
        canvas.restoreToCount(combined);
        canvas.restoreToCount(save);
    }

    @Override public void setAlpha(int alpha) {}
    @Override public void setColorFilter(ColorFilter filter) {}
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }

    private void positionAroundArtwork(View expanded, float progress, int originX, int originY) {
        aroundX = aroundY = 0f;
        if (expanded.getId() != songId || artworkId == 0) return;
        View artwork = expanded.findViewById(artworkId);
        if (artwork == null || !artwork.isShown()) return;
        artwork.getLocationOnScreen(location);
        float left = location[0] - originX;
        float top = location[1] - originY;
        float scaleY = artwork.getScaleY();
        float layoutBottom = top - artwork.getTranslationY()
                - (1f - scaleY) * artwork.getPivotY() + artwork.getHeight();
        Label leading = title.expanded != null ? title : artist;
        if (leading.expandedTop < layoutBottom) return; // The wide layout puts text beside the artwork.

        // Keep the text beside the artwork while it clears the bottom corner.
        // Leave its horizontal path free once the artwork is above both labels.
        float gap = 4f * player.getResources().getDisplayMetrics().density;
        float shiftBelow = GlassPlayerMorph.smoothStep(progress / 0.12f);
        float shiftIn = GlassPlayerMorph.smoothStep((progress - 0.12f) / 0.12f);
        float right = left + artwork.getWidth() * artwork.getScaleX();
        float side = leading.rtl ? Math.min(0f, left - layers.right - gap)
                : Math.max(0f, right - layers.left + gap);
        aroundX = side * (1f - shiftIn);
        aroundY = Math.max(0f, top + artwork.getHeight() * scaleY - layers.top + gap) * shiftBelow;
    }

    private View currentMetadata() {
        View page = LiquidGlass.currentPlayerPage(host);
        if (page == null) return null;
        View song = page.findViewById(songId);
        if (song != null && song.isShown()) return song;
        View other = page.findViewById(currentMetadataId);
        return other != null && other.isShown() ? other : null;
    }

    private int id(String name) {
        return player.getResources().getIdentifier(name, "id", player.getContext().getPackageName());
    }

    private static TextView text(View view) {
        return view instanceof TextView label ? label : null;
    }

    private static final class Label {
        private final TextView mini;
        private TextView expanded;
        private float originalMiniAlpha;
        private float originalExpandedAlpha;
        private float x;
        private float baseline;
        private float size;
        private float miniScaleX;
        private float expandedScaleX;
        private float expandedTop;
        private boolean rtl;

        Label(TextView mini) {
            this.mini = mini;
        }

        void use(TextView next) {
            // The native mini-player can still be INVISIBLE at the endpoint.
            // Its laid-out text can be drawn directly into the crossfade.
            if (!ready(mini) || !ready(next) || !next.isShown()) next = null;
            if (next == expanded) return;
            release();
            if (next == null) return;
            expanded = next;
            originalMiniAlpha = mini.getTransitionAlpha();
            originalExpandedAlpha = expanded.getTransitionAlpha();
            mini.setTransitionAlpha(0f);
            expanded.setTransitionAlpha(0f);
        }

        void release() {
            if (expanded == null) return;
            mini.setTransitionAlpha(originalMiniAlpha);
            expanded.setTransitionAlpha(originalExpandedAlpha);
            expanded = null;
        }

        void position(float progress, int originX, int originY, int[] location, RectF layers) {
            if (expanded == null) return;
            rtl = mini.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            mini.getLocationOnScreen(location);
            float startX = location[0] - originX + edge(mini);
            float startBaseline = location[1] - originY + mini.getBaseline();
            expanded.getLocationOnScreen(location);
            expandedTop = location[1] - originY;
            x = mix(startX, location[0] - originX + edge(expanded), progress);
            baseline = mix(startBaseline, expandedTop + expanded.getBaseline(), progress);
            size = mix(mini.getTextSize(), expanded.getTextSize(), progress);
            miniScaleX = size / mini.getTextSize();
            expandedScaleX = size / expanded.getTextSize();
            float miniWidth = lineWidth(mini);
            float expandedWidth = lineWidth(expanded);
            if (miniWidth > 0f && expandedWidth > 0f && TextUtils.equals(mini.getText(), expanded.getText())) {
                // Font sizes can round spacing differently. Match both line widths
                // before blending so the end of a long title stays aligned.
                float width = mix(miniWidth, expandedWidth, progress);
                miniScaleX = width / miniWidth;
                expandedScaleX = width / expandedWidth;
            }
            include(mini, miniScaleX, layers);
            include(expanded, expandedScaleX, layers);
        }

        void draw(Canvas canvas, boolean useExpanded) {
            if (expanded == null) return;
            TextView view = useExpanded ? expanded : mini;
            float scale = size / view.getTextSize();
            int save = canvas.save();
            canvas.translate(x, baseline);
            canvas.scale(useExpanded ? expandedScaleX : miniScaleX, scale);
            canvas.translate(-edge(view), -view.getBaseline());
            canvas.clipRect(0, 0, view.getWidth(), view.getHeight());
            view.draw(canvas);
            canvas.restoreToCount(save);
        }

        private void include(TextView view, float scaleX, RectF bounds) {
            float scale = size / view.getTextSize();
            float left = x - edge(view) * scaleX;
            float top = baseline - view.getBaseline() * scale;
            bounds.union(left, top, left + view.getWidth() * scaleX, top + view.getHeight() * scale);
        }

        private int edge(TextView view) {
            return rtl ? view.getWidth() : 0;
        }

        private static boolean ready(TextView view) {
            return view != null && view.getVisibility() == View.VISIBLE
                    && view.getWidth() > 0 && view.getHeight() > 0
                    && view.getLayout() != null && view.getTextSize() > 0 && !TextUtils.isEmpty(view.getText());
        }

        private static float lineWidth(TextView view) {
            Layout layout = view.getLayout();
            float width = layout.getLineWidth(0);
            int available = view.getWidth() - view.getCompoundPaddingLeft() - view.getCompoundPaddingRight();
            return layout.getLineCount() == 1 && width <= available && layout.getEllipsisCount(0) == 0
                    ? width : 0f;
        }

        private static float mix(float start, float end, float progress) {
            return start + (end - start) * progress;
        }
    }
}
