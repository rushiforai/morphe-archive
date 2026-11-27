package app.jimaku.extension.jobs;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.jimaku.extension.shared.Wording;

/**
 * About how long a job has left and how far its bar stands, ported from the extension's
 * {@code lib/time-left.ts} with its shared cases. Times are in ms, lengths in seconds.
 */
public final class TimeLeft {
    /*
     * About how long each step of a job takes: a fixed part and a part per minute of video, from the
     * jobs of 2026-10-14 and 15 in production.
     */
    private static final double READY_FIXED = 5, READY_PER_MINUTE = 0.1;
    private static final double TRANSCRIBE_FIXED = 2, TRANSCRIBE_PER_MINUTE = 0.6;
    private static final double TRANSLATE_FIXED = 3, TRANSLATE_PER_MINUTE = 0.8;

    /** The bar stops short of its end until the job is done. */
    private static final double FULLEST = 0.95;
    /** The last step, once it runs long, may crawl on from 95% up to here. */
    private static final double LAST_CEILING = 0.98;
    /** How far into the next step's share a step that runs long may crawl. */
    private static final double INTO_NEXT = 0.5;
    /** The slowest the bar moves before it stops, in shares a second. */
    public static final double CRAWL = 0.006;
    /** How quickly, in seconds, a bar past its estimate slows down to the crawl. */
    private static final double SLOWING = 2.5;

    /** A point a bar passes through: when, in ms, and where, as a share. */
    public static final class Point {
        public final double at;
        public final double share;

        public Point(double at, double share) {
            this.at = at;
            this.share = share;
        }
    }

    private TimeLeft() {
    }

    /** Seconds each step is expected to take: ready, transcribe, translate, 0 for a step the job doesn't have. */
    private static double[] steps(JobKind kind, double duration, boolean translates) {
        double minutes = duration / 60;
        boolean premium = kind == JobKind.PREMIUM;
        return new double[]{
                premium ? READY_FIXED + READY_PER_MINUTE * minutes : 0,
                premium ? TRANSCRIBE_FIXED + TRANSCRIBE_PER_MINUTE * minutes : 0,
                translates ? TRANSLATE_FIXED + TRANSLATE_PER_MINUTE * minutes : 0,
        };
    }

    private static double percentOf(TimedJob job) {
        return job.percent != null ? job.percent : 0;
    }

    /**
     * About how many seconds {@code job} has left, for a video {@code duration} seconds long. Before
     * translating, from the video's length, counting down within each step; while translating, from the
     * pace seen, once the percent has moved. {@code translates} says whether a translation follows the
     * transcript. Never below 0.
     */
    public static double secondsLeft(TimedJob job, double duration, boolean translates, double now) {
        double[] s = steps(job.kind, duration, translates);
        double ready = s[0], transcribe = s[1], translate = s[2];
        double spent = (now - job.since) / 1000;
        switch (job.state) {
            case WAITING:
                return ready + transcribe + translate;
            case DOWNLOADING:
                return Math.max(ready - spent, 0) + transcribe + translate;
            case TRANSCRIBING:
                return Math.max(transcribe - spent, 0) + translate;
            case TRANSLATING: {
                TimedJob.Sample first = job.first, last = job.last;
                if (first != null && last != null && last.percent > first.percent) {
                    double perPercent = (last.at - first.at) / 1000 / (last.percent - first.percent);
                    return Math.max(perPercent * (100 - last.percent) - (now - last.at) / 1000, 0);
                }
                return Math.max(translate * (100 - percentOf(job)) / 100 - spent, 0);
            }
            default:
                return 0;
        }
    }

    /**
     * A glide from {@code from} to {@code to} over {@code seconds} from {@code at}, then on into its tail up
     * to {@code ceiling}. The even part is never slower than the crawl; without one it is all crawl.
     */
    public static Glide evenGlide(double from, double to, double at, double seconds, double ceiling) {
        double room = to - from;
        if (seconds <= 0 || room <= 0) return new Glide(from, from, at, 0, CRAWL, SLOWING, Math.max(ceiling, from));
        double speed = Math.max(room / seconds, CRAWL);
        return new Glide(from, to, at, room / speed, speed, SLOWING, Math.max(ceiling, to));
    }

    /**
     * How far {@code job} has come, as a share of the whole, and where it heads; each step takes a share
     * by how long it is expected to take. Null where nothing can be estimated: while the job waits for the
     * server, and once it has ended.
     */
    public static Glide progressOf(TimedJob job, double duration, boolean translates, double now) {
        double[] s = steps(job.kind, duration, translates);
        double ready = s[0], transcribe = s[1], translate = s[2];
        double total = ready + transcribe + translate;
        if (total <= 0) return null;
        double spent = (now - job.since) / 1000;
        switch (job.state) {
            case DOWNLOADING:
                return timed(total, spent, now, 0, ready, transcribe);
            case TRANSCRIBING:
                return timed(total, spent, now, ready, transcribe, translate);
            case TRANSLATING:
                return within(total, now, ready + transcribe, translate, percentOf(job) / 100, secondsLeft(job, duration, translates, now), 0);
            default:
                return null;
        }
    }

    /** A step from {@code start} seconds into the job, {@code length} long, {@code done} of it behind, {@code left} seconds to go. */
    private static Glide within(double total, double now, double start, double length, double done, double left, double next) {
        double end = Math.min((start + length) / total, FULLEST);
        double ceiling = next > 0 ? Math.min((start + length + INTO_NEXT * next) / total, FULLEST) : LAST_CEILING;
        return evenGlide(Math.min((start + length * done) / total, end), end, now, Math.max(left, 0), ceiling);
    }

    private static Glide timed(double total, double spent, double now, double start, double length, double next) {
        return within(total, now, start, length, length > 0 ? Math.min(spent / length, 1) : 1, length - spent, next);
    }

    /** Where the glide has the bar at {@code now}: [share, speed, tau]. */
    private static double[] place(Glide glide, double now) {
        double s = Math.max((now - glide.at) / 1000, 0);
        if (s < glide.seconds) return new double[]{glide.from + (glide.to - glide.from) * s / glide.seconds, glide.speed, glide.tau};
        double u = s - glide.seconds;
        double gone = CRAWL * u;
        double speed = CRAWL;
        double tau = glide.tau;
        if (glide.speed > CRAWL) {
            // It slows from its speed to the crawl over these seconds, then crawls.
            double slowing = glide.tau * (Math.sqrt(glide.speed / CRAWL) - 1);
            if (u <= slowing) {
                gone = glide.speed * glide.tau * u / (u + glide.tau);
                speed = glide.speed / Math.pow(1 + u / glide.tau, 2);
                tau = glide.tau + u;
            } else {
                gone = glide.speed * glide.tau * slowing / (slowing + glide.tau) + CRAWL * (u - slowing);
            }
        }
        double share = glide.to + gone;
        return share >= glide.ceiling ? new double[]{Math.max(glide.ceiling, glide.to), 0, tau} : new double[]{share, speed, tau};
    }

    /** Where {@code glide} has the bar at {@code now}. */
    public static double standing(Glide glide, double now) {
        return place(glide, now)[0];
    }

    /**
     * The points {@code glide} takes the bar through from {@code now} until it stops, close enough together
     * to draw with straight lines between them: the end of its even part, its slowing down every 250 ms,
     * and the end of its crawl.
     */
    public static List<Point> course(Glide glide, double now) {
        List<Point> points = new ArrayList<>();
        points.add(new Point(now, standing(glide, now)));
        double tail = glide.at + glide.seconds * 1000;
        if (tail > now && add(points, glide, tail)) return points;
        double slowing = glide.speed > CRAWL ? glide.tau * (Math.sqrt(glide.speed / CRAWL) - 1) * 1000 : 0;
        for (double at = Math.max(now, tail) + 250; at < tail + slowing; at += 250) if (add(points, glide, at)) return points;
        double crawling = Math.max(now, tail + slowing);
        if (add(points, glide, crawling)) return points;
        double left = glide.ceiling - standing(glide, crawling);
        if (left > 0) points.add(new Point(crawling + left / CRAWL * 1000, glide.ceiling));
        return points;
    }

    /** Adds the point at {@code at} when it is later than the last; true once the bar has stopped. */
    private static boolean add(List<Point> points, Glide glide, double at) {
        double share = standing(glide, at);
        if (at > points.get(points.size() - 1).at) points.add(new Point(at, share));
        return share >= glide.ceiling;
    }

    /**
     * {@code next}, starting from where {@code last} has the bar by then wherever that is further on: the
     * bar never goes back. Where {@code next} has no even part left from there, the tail goes on at the
     * speed it has.
     */
    public static Glide onward(Glide last, Glide next) {
        if (last == null) return next;
        double[] here = place(last, next.at);
        double from = Math.max(next.from, here[0]);
        if (next.seconds > 0 && from < next.to) return evenGlide(from, next.to, next.at, next.seconds, next.ceiling);
        return new Glide(from, from, next.at, 0, here[1] > 0 ? here[1] : CRAWL, here[2], Math.max(next.ceiling, from));
    }

    /** The time left in words, "about 3 min left", or null under 2 minutes. */
    public static String timeLeftText(Locale locale, double seconds) {
        long minutes = Math.round(seconds / 60);
        return minutes < 2 ? null : Wording.t(locale, Wording.PROGRESS_MINUTES_LEFT, String.valueOf(minutes));
    }
}
