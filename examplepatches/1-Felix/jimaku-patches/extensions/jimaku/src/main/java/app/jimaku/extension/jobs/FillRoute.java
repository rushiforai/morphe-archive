package app.jimaku.extension.jobs;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The points a progress bar's fill goes through along a glide, ported from the extension's
 * {@code fillRoute} in {@code lib/progress-bar.ts} with its shared cases: from where it stands through
 * the glide's even part, its slowing down and its crawl, to where it stops. Where the glide starts
 * ahead of where the last one had the fill, the fill eases there over 0.3 s instead of jumping.
 */
public final class FillRoute {
    /** How long a fill takes to catch up with a glide that starts ahead of it, in ms. */
    static final double CATCH_UP = 300;

    /** A point the fill passes through, and whether it eases out from there to the next or runs evenly. */
    public static final class Point {
        public final double at;
        public final double share;
        public final boolean easeOut;

        Point(double at, double share, boolean easeOut) {
            this.at = at;
            this.share = share;
            this.easeOut = easeOut;
        }
    }

    /** Where the fill stops. */
    public final double end;
    /** The points it goes through, in time order; with fewer than two it stands still at {@link #end}. */
    public final List<Point> points;

    private FillRoute(double end, List<Point> points) {
        this.end = end;
        this.points = points;
    }

    public static FillRoute of(Glide last, Glide glide, double now) {
        List<TimeLeft.Point> route = TimeLeft.course(glide, now);
        TimeLeft.Point start = route.get(0);
        TimeLeft.Point stop = route.get(route.size() - 1);
        double shown = last != null ? TimeLeft.standing(last, now) : start.share;
        boolean behind = shown < start.share;
        double caught = now + CATCH_UP;
        List<Point> points = new ArrayList<>();
        if (behind) {
            points.add(new Point(now, shown, true));
            points.add(new Point(caught, TimeLeft.standing(glide, caught), false));
            for (TimeLeft.Point point : route) if (point.at > caught) points.add(new Point(point.at, point.share, false));
        } else {
            for (TimeLeft.Point point : route) points.add(new Point(point.at, point.share, false));
        }
        boolean moves = points.size() > 1 && points.get(points.size() - 1).at > now;
        return new FillRoute(stop.share, moves ? Collections.unmodifiableList(points) : Collections.emptyList());
    }

    /** Where the fill stands at {@code at}: along the points, easing out over the first stretch where it catches up. */
    public double at(double at) {
        if (points.isEmpty()) return end;
        Point first = points.get(0);
        if (at <= first.at) return first.share;
        for (int i = 1; i < points.size(); i++) {
            Point to = points.get(i);
            if (at > to.at) continue;
            Point from = points.get(i - 1);
            double t = (at - from.at) / (to.at - from.at);
            // CSS's ease-out, near enough for a bar a few pixels high.
            if (from.easeOut) t = 1 - (1 - t) * (1 - t);
            return from.share + (to.share - from.share) * t;
        }
        return end;
    }

    /** When the fill stops moving, in ms. */
    public double endsAt() {
        return points.isEmpty() ? Double.NEGATIVE_INFINITY : points.get(points.size() - 1).at;
    }
}
