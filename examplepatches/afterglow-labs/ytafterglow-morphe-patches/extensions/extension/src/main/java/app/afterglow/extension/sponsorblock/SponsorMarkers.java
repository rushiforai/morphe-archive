package app.afterglow.extension.sponsorblock;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.View;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.theme.SeekBarHost;
import app.afterglow.extension.video.VideoState;

/** Drawn after native track/glow and before the deferred scrubber. Layout is cached between changes. */
public final class SponsorMarkers {
    private static final Map<View, Cache> CACHES = new WeakHashMap<>();
    private static final Paint PAINT = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final class Cache {
        long revision = -1, preferences = -1, duration = -1;
        List<SponsorMarkerLayout.Marker> markers = Collections.emptyList();
    }
    private SponsorMarkers() {}

    static void invalidate() {
        for (View view : CACHES.keySet()) if (view != null) view.postInvalidateOnAnimation();
    }

    public static void draw(View view, Canvas canvas) {
        if (!InstalledTweaks.has("sponsorblock") || !(view instanceof SeekBarHost)) return;
        try {
            Cache cache = CACHES.get(view);
            if (cache == null) { cache = new Cache(); CACHES.put(view, cache); }
            SponsorSettings.Snapshot settings = SponsorSettings.current();
            if (!settings.markers || !SponsorBlock.eligible() || view.getAlpha() == 0
                    || !VideoState.videoId().equals(SponsorBlock.SESSION.videoId())) return;
            long revision = SponsorBlock.SESSION.revision(), duration = VideoState.videoLength();
            if (cache.revision != revision || cache.preferences != settings.revision || cache.duration != duration) {
                cache.markers = SponsorMarkerLayout.layout(SponsorBlock.SESSION.segments(), duration / 1000.0, settings.markerCategories);
                cache.revision = revision; cache.preferences = settings.revision; cache.duration = duration;
            }
            if (cache.markers.isEmpty()) return;
            SeekBarHost host = (SeekBarHost) view;
            Rect bounds = host.afterglow_visibleTrackBounds();
            int alpha = host.afterglow_trackAlpha();
            if (bounds == null || bounds.isEmpty() || alpha == 0) return;
            float density = view.getResources().getDisplayMetrics().density;
            float half = 1.5f * density, cap = 2 * density;
            for (SponsorMarkerLayout.Marker marker : cache.markers) {
                float left = bounds.left + bounds.width() * (float) marker.startFraction;
                float right = Math.max(left + 1, bounds.left + bounds.width() * (float) marker.endFraction);
                float y = bounds.exactCenterY() + SponsorMarkerLayout.laneOffset(marker.lane) * density;
                if (y + half + cap < 0 || y - half - cap > view.getHeight()) continue;
                PAINT.setStyle(Paint.Style.FILL); PAINT.setColor(marker.category.color);
                PAINT.setAlpha(alpha);
                canvas.drawRoundRect(left, y - half, right, y + half, 1, 1, PAINT);
                PAINT.setStyle(Paint.Style.STROKE); PAINT.setStrokeWidth(Math.max(2, density));
                PAINT.setColor(SponsorMarkerLayout.outlineColor(marker.category.color));
                PAINT.setAlpha(alpha);
                canvas.drawRoundRect(left, y - half, right, y + half, 1, 1, PAINT);
                canvas.drawLine(left, y - half - cap, left, y + half + cap, PAINT);
                canvas.drawLine(right, y - half - cap, right, y + half + cap, PAINT);
                PAINT.setStrokeWidth(1); PAINT.setColor(marker.category.color);
                PAINT.setAlpha(alpha);
                canvas.drawLine(left, y - half - cap, left, y + half + cap, PAINT);
                canvas.drawLine(right, y - half - cap, right, y + half + cap, PAINT);
            }
        } catch (Throwable error) { Afterglow.error("SponsorBlock.markers", error); }
    }
}
