package app.jimaku.extension.session;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;

import app.jimaku.extension.JimakuLog;
import app.jimaku.extension.Languages;
import app.jimaku.extension.gateway.CaptionResult;
import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.Gateway;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.JobStatus;
import app.jimaku.extension.gateway.Lookup;
import app.jimaku.extension.gateway.Reads;
import app.jimaku.extension.gateway.StartRequest;
import app.jimaku.extension.gateway.StartedJob;
import app.jimaku.extension.gateway.StoppedJob;
import app.jimaku.extension.gateway.Writes;
import app.jimaku.extension.jobs.Failures;
import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;
import app.jimaku.extension.jobs.TimeLeft;
import app.jimaku.extension.jobs.TimedJob;
import app.jimaku.extension.menu.MenuInput;
import app.jimaku.extension.menu.MenuModel;
import app.jimaku.extension.menu.Plan;
import app.jimaku.extension.menu.Subtitle;
import app.jimaku.extension.menu.Version;
import app.jimaku.extension.shared.Wording;
import app.jimaku.extension.subtitles.Line;
import app.jimaku.extension.youtube.CaptionLines;
import app.jimaku.extension.youtube.CaptionTrack;
import app.jimaku.extension.youtube.TrackInfo;

/**
 * The video in the watch player and its Jimaku, ported from the extension's {@code lib/session.ts}
 * for a signed-out viewer: what shows, the original caption, and the one job this install waits on,
 * with its message and its bar. Account pieces (the Premium switch, minutes, Sign in) come with step 4.
 * <p>
 * A new video drops everything of the last one; an answer for it, or for a press the viewer has
 * since overridden, lands nowhere. A running job is kept as a pending record, so going back to its
 * video picks it up, also after a restart. It is checked every 3 seconds, only while its video is
 * open and the app is in the foreground.
 * <p>
 * Every method is called on the main thread, and every interface is called there too, except
 * {@link Kept}, {@link Pending}'s writes, {@link Reads}, {@link Writes} and {@link Tracks}, which run
 * on the background executor.
 */
public final class VideoSession {
    /** A job is checked this often, and only while this video waits on it. */
    public static final long CHECK_MILLIS = 3000;
    /** Failed checks in a row before checks slow down and the message says the server can't be reached. */
    static final int CHECK_FAILURES = 10;
    /** The gateway's rough check where neither YouTube nor the player knows the length. */
    private static final double UNKNOWN_DURATION = 60;
    /** How long the gateway holds a stopped transcription; a transcript not cached by then isn't coming. */
    static final long TRANSCRIPT_WAIT_MILLIS = 15 * 60 * 1000;

    /** Where what the session decides goes. */
    public interface Display {
        /** What is known, made or on screen changed: the button and the menu draw again. */
        void changed();

        /** The lines on screen, in {@code lang}: a document, or a job's lines so far. Null for none. */
        void lines(String lang, List<Line> lines);

        /** The original caption above them, in {@code lang}, or null for none. */
        void original(String lang, List<Line> lines);

        /** A new video started: everything of the last one goes. */
        void clear();
    }

    /** An action a message offers. */
    public static final class Action {
        public final String label;
        public final Runnable run;

        public Action(String label, Runnable run) {
            this.label = label;
            this.run = run;
        }
    }

    /** The message in the player, as the extension's {@code Toast}. */
    public interface Toast {
        void info(String words);

        void hold(String words, Action forward, Action second);

        void progress(String words, boolean announce, Action stop, String strong, Glide glide);

        void ask(String question, Runnable onYes);

        void reask(String question);

        void hide();

        boolean showingProgress();

        boolean asking();
    }

    /** YouTube's caption tracks for a video, and their lines, read as the installed app reads them. */
    public interface Tracks {
        /** What YouTube says about {@code video}, or null where it gives nothing to go by. */
        TrackInfo tracks(String video, Cancellation cancellation) throws GatewayException;

        /** {@code track}'s captions, as the extension sends them to Standard: {@code {title, events}}. */
        String captions(TrackInfo info, CaptionTrack track, Cancellation cancellation) throws GatewayException;
    }

    /** Standard results kept on the phone, as the extension keeps them in the browser. */
    public interface Kept {
        List<String> languages(String video);

        /** The language kept as the video's original, or null. */
        String originalLanguage(String video);

        List<Line> get(String video, String lang);

        /** Whether it was written; one too big, or one that can't be written, still shows from memory. */
        boolean keep(String video, String lang, List<Line> lines, boolean original);
    }

    /** The job waited on, kept between runs of the app. */
    public interface Pending {
        PendingJob load();

        void save(PendingJob job);

        /** Forgets the record, only if it is still {@code expected}'s. */
        void clear(String expected);
    }

    /** What the session reads from the player and its settings. */
    public interface Host {
        String preferred();

        /** Whether subtitles stay on across videos. */
        boolean on();

        void setOn(boolean on);

        /** Whether Original caption is switched on. */
        boolean dual();

        /** The video's length as the player has it, in seconds, or null. */
        Double mediaSeconds();

        /** The account as last read, or null when it never was. */
        MenuInput.Account account();

        /** Whether its minutes can be counted on. */
        boolean minutesKnown();

        /** The mode the viewer flipped the Premium switch to, or null until they do. */
        Version mode();

        /** Keeps the switch's mode for every video. */
        void setMode(Version mode);

        /** A Premium job came to its end: what it spent or gave back is read. */
        void minutesChanged();

        /** Buy minutes: Account, with the amounts. */
        void openAccount();
    }

    /** The clock, and a timer on the main thread. */
    public interface Timer {
        long now();

        /** Runs {@code run} on the main thread after {@code millis}; the answer cancels it. */
        Runnable after(long millis, Runnable run);
    }

    /** What the button shows, as the extension's {@code ControlState}. */
    public static final class Control {
        public final String language;
        /** Whether subtitles in the language exist for the video; null while that is being looked up. */
        public final Boolean available;
        public final boolean on;
        public final boolean working;
        public final boolean error;
        public final Glide glide;

        Control(String language, Boolean available, boolean on, boolean working, boolean error, Glide glide) {
            this.language = language;
            this.available = available;
            this.on = on;
            this.working = working;
            this.error = error;
            this.glide = glide;
        }

        /** The button's name, as the extension's {@code describeState} says it. */
        public String name() {
            String english = Languages.englishName(language);
            if (working) return Wording.t(Wording.PLAYER_WORKING, english);
            if (error) return Wording.t(Wording.PLAYER_ERROR);
            if (on) return Wording.t(Wording.PLAYER_ON, english);
            if (Boolean.TRUE.equals(available)) return Wording.t(Wording.PLAYER_AVAILABLE, english);
            if (Boolean.FALSE.equals(available)) return Wording.t(Wording.PLAYER_MISSING, english);
            return Wording.t(Wording.PLAYER_NAME);
        }
    }

    private static final class RunningJob {
        final String id;
        final String lang;
        final JobKind kind;
        final boolean joined;
        JobState state;
        Double percent;
        double since;
        TimedJob.Sample first;
        TimedJob.Sample last;
        /** How far it had come when its lines so far were last read. */
        Double read;
        /** How its bar moves, where its progress can be estimated: from the last, never back. */
        Glide glide;

        RunningJob(String id, String lang, JobKind kind, boolean joined, JobState state, Double percent, double since) {
            this.id = id;
            this.lang = lang;
            this.kind = kind;
            this.joined = joined;
            this.state = state;
            this.percent = percent;
            this.since = since;
        }

        TimedJob timed() {
            return new TimedJob(kind, state, percent, since, first, last);
        }

        Subtitle subtitle() {
            return new Subtitle(lang, versionOf(kind));
        }
    }

    private interface Io<T> {
        T run(Cancellation cancellation) throws GatewayException;
    }

    private interface Answer<T> {
        void got(T value, GatewayException error);
    }

    private final Reads reads;
    private final Writes writes;
    private final Tracks tracks;
    private final Kept kept;
    private final Pending pendingJobs;
    private final Host host;
    private final Toast toast;
    private final Timer timer;
    private final Executor background;
    private final Executor main;
    private final Display display;

    private String video;
    private long generation;
    private final Set<Cancellation> open = new HashSet<>();
    private Lookup lookup;
    /** Whether the one lookup for this video was asked for: when it opens or, if kept subtitles showed first, when the menu does. */
    private boolean lookupAsked;
    private boolean lookedUp;
    private final List<Runnable> whenLookedUp = new ArrayList<>();
    private TrackInfo track;
    private boolean trackKnown;
    private final List<Runnable> whenTracked = new ArrayList<>();
    private List<String> keptLanguages = Collections.emptyList();
    private String standardOriginal;
    /** Documents read for this video, by version and language, so showing one again reads nothing. */
    private final Map<String, List<Line>> documents = new HashMap<>();
    /** The subtitles the viewer wants on screen, shown once they exist; null after they hid them. */
    private Subtitle wanted;
    private Subtitle showing;
    private List<Line> showingLines;
    /** Whether what shows was picked for the viewer: it follows what the menu would pick once more is known. */
    private boolean picked;
    private int intent;
    private boolean submitting;
    private RunningJob job;
    /** The job a Stop is under way for: checks wait, as the gateway soon no longer shows it to this install. */
    private RunningJob stopping;
    private long transcriptUntil;
    private Runnable checkTimer;
    private boolean checkDue;
    private int checkFailures;
    private boolean error;
    private boolean foreground = true;
    /** The lines of the job being made translated so far. */
    private List<Line> stream;
    private Subtitle originalWanted;
    private Subtitle originalShown;
    private List<Line> originalLines;
    /** What the display was last given, so it is only told of a change. */
    private String drawnLang;
    private List<Line> drawnLines;
    private String drawnOriginalLang;
    private List<Line> drawnOriginal;

    public VideoSession(Reads reads, Writes writes, Tracks tracks, Kept kept, Pending pending, Host host, Toast toast, Timer timer,
            Executor background, Executor main, Display display) {
        this.reads = reads;
        this.writes = writes;
        this.tracks = tracks;
        this.kept = kept;
        this.pendingJobs = pending;
        this.host = host;
        this.toast = toast;
        this.timer = timer;
        this.background = background;
        this.main = main;
        this.display = display;
    }

    private static Version versionOf(JobKind kind) {
        return kind == JobKind.CAPTIONS ? Version.STANDARD : Version.PREMIUM;
    }

    private static Version other(Version version) {
        return version == Version.PREMIUM ? Version.STANDARD : Version.PREMIUM;
    }

    /** How far a translation has come, as it is shown: in steps of 5%, so the number doesn't flicker. */
    private static String shownPercent(double percent) {
        return Wording.t(Wording.PROGRESS_PERCENT, String.valueOf((long) Math.floor(percent / 5) * 5));
    }

    // What the player and the menu read.

    public String video() {
        return video;
    }

    public Lookup lookup() {
        return lookup;
    }

    public boolean lookedUp() {
        return lookedUp;
    }

    public Subtitle showing() {
        return showing;
    }

    public Subtitle wanted() {
        return wanted;
    }

    /** The language of the original caption that goes with what shows, for Settings' sample; null where the video has none. */
    public String originalLanguage() {
        Subtitle original = video != null ? originalFor() : null;
        return original != null ? original.lang : null;
    }

    private Double duration() {
        if (track != null && track.duration != null && track.duration > 0) return track.duration;
        Double media = host.mediaSeconds();
        return media != null && media > 0 && !media.isInfinite() && !media.isNaN() ? media : null;
    }

    /** What the menu model reads, for a signed-out viewer. */
    public MenuInput input() {
        MenuInput.Builder input = new MenuInput.Builder(host.preferred()).locale(Locale.getDefault()).lookup(lookup)
                .kept(keptLanguages).standardOriginal(standardOriginal).showing(showing).duration(duration())
                .me(host.account()).minutesKnown(host.minutesKnown()).mode(host.mode());
        if (trackKnown) input.track(track != null ? track.language : null);
        if (track != null) {
            List<String> uploaded = new ArrayList<>();
            for (TrackInfo.Uploaded each : track.uploaded) uploaded.add(each.lang);
            input.uploaded(uploaded).live(track.live);
        }
        RunningJob running = job;
        if (running != null) input.working(new MenuInput.Working(running.subtitle(), going(running)));
        return input.build();
    }

    /** What the button shows: the running job's language, otherwise what shows or is wanted, otherwise the preferred one. */
    public Control control() {
        String alone = showing == null && originalShown != null ? originalShown.lang : null;
        String language = job != null ? job.lang : showing != null ? showing.lang : wanted != null ? wanted.lang
                : alone != null ? alone : host.preferred();
        boolean known = lookedUp || keptLanguages.contains(language);
        Boolean available = exists(language) ? Boolean.TRUE : known ? Boolean.FALSE : null;
        return new Control(language, available, showing != null || alone != null, job != null || submitting, error,
                job != null ? job.glide : null);
    }

    private boolean exists(String lang) {
        for (Subtitle subtitle : MenuModel.available(input())) if (subtitle.lang.equals(lang)) return true;
        return false;
    }

    // The video.

    /** A new video started, or nothing may show: everything of the last video goes, and the checks stop. */
    public void reset() {
        generation++;
        for (Cancellation cancellation : open) cancellation.cancel();
        open.clear();
        cancelCheck();
        video = null;
        lookup = null;
        lookupAsked = false;
        lookedUp = false;
        whenLookedUp.clear();
        track = null;
        trackKnown = false;
        whenTracked.clear();
        keptLanguages = Collections.emptyList();
        standardOriginal = null;
        documents.clear();
        wanted = null;
        showing = null;
        showingLines = null;
        picked = false;
        intent++;
        submitting = false;
        job = null;
        stopping = null;
        transcriptUntil = 0;
        checkDue = false;
        checkFailures = 0;
        error = false;
        stream = null;
        originalWanted = null;
        originalShown = null;
        originalLines = null;
        drawnLang = null;
        drawnLines = null;
        drawnOriginalLang = null;
        drawnOriginal = null;
        // A message about the last video has had its say.
        toast.hide();
        display.clear();
    }

    /** What the phone keeps for a video, read together when it opens. */
    private static final class KeptRead {
        final List<String> languages;
        final String original;
        final PendingJob pending;

        KeptRead(List<String> languages, String original, PendingJob pending) {
            this.languages = languages;
            this.original = original;
            this.pending = pending;
        }
    }

    /**
     * {@code videoId} is open in the watch player. Does nothing if it is already the current video.
     * Standard subtitles kept on the phone show without asking the gateway anything; otherwise the
     * video is looked up and, with subtitles on, the version the menu would pick shows. Then a job
     * waited on for this video is picked up.
     */
    public void open(String videoId) {
        if (videoId == null || videoId.equals(video)) return;
        reset();
        if (!Gateway.isVideoId(videoId)) return;
        video = videoId;
        String preferred = host.preferred();
        JimakuLog.info("Opened " + videoId + (host.on() ? ", showing " + preferred : ""));
        // A press while the phone or the gateway is read is the viewer's: nothing is picked over it.
        int at = intent;
        loadTrack();
        io("kept results", false, cancellation -> new KeptRead(kept.languages(videoId), kept.originalLanguage(videoId), pendingJobs.load()),
                (read, failed) -> {
                    if (read != null) {
                        keptLanguages = read.languages;
                        standardOriginal = read.original;
                    }
                    PendingJob pending = read != null ? read.pending : null;
                    boolean resumes = pending != null && pending.video.equals(videoId);
                    boolean standard = host.mode() == Version.STANDARD || !MenuModel.signedIn(input());
                    if (intent == at && host.on() && keptLanguages.contains(preferred) && !resumes && standard) {
                        wanted = new Subtitle(preferred, Version.STANDARD);
                        show(wanted, intent, false, true, shown -> render());
                        return;
                    }
                    ensureLookup(() -> {
                        Subtitle best = intent == at && host.on() ? MenuModel.pick(input(), preferred) : null;
                        if (best == null) {
                            opened(pending);
                            return;
                        }
                        wanted = best;
                        show(best, intent, false, true, shown -> opened(pending));
                    });
                });
        render();
    }

    private void opened(PendingJob pending) {
        if (pending != null && pending.video.equals(video) && job == null && !submitting) resume(pending);
        render();
    }

    /** The one lookup for this video; {@code then} runs once it is answered, also where it failed. */
    private void ensureLookup(Runnable then) {
        if (lookedUp) {
            then.run();
            return;
        }
        whenLookedUp.add(then);
        if (lookupAsked) return;
        lookupAsked = true;
        String videoId = video;
        io("lookup", true, cancellation -> reads.lookup(videoId, cancellation), (found, failed) -> {
            // Where it failed, nothing is known: the menu offers to make subtitles, and a start says what went wrong.
            if (failed == null) lookup = found;
            lookedUp = true;
            if (found == null && failed == null) JimakuLog.info("Not cached: " + videoId);
            List<Runnable> waiting = new ArrayList<>(whenLookedUp);
            whenLookedUp.clear();
            for (Runnable run : waiting) run.run();
            render();
        });
    }

    /** What YouTube says about the video's tracks, read once as it opens. */
    private void loadTrack() {
        String videoId = video;
        io("YouTube read", true, cancellation -> tracks.tracks(videoId, cancellation), (said, failed) -> {
            track = said;
            trackKnown = true;
            if (said != null) {
                JimakuLog.info("YouTube tracks for " + videoId + ": " + (said.language != null ? said.language : "none")
                        + ", " + said.uploaded.size() + " uploaded" + (said.live ? ", live" : ""));
            }
            List<Runnable> waiting = new ArrayList<>(whenTracked);
            whenTracked.clear();
            for (Runnable run : waiting) run.run();
            onTrack();
        });
    }

    /** Runs {@code then} once YouTube's tracks are known. */
    private void whenTracked(Runnable then) {
        if (trackKnown) then.run();
        else whenTracked.add(then);
    }

    /**
     * YouTube said what tracks the video has. Where subtitles stay on, captions uploaded in the
     * preferred language show, in place of nothing or of what was picked before they were known.
     */
    private void onTrack() {
        if (host.on() && wanted == null && showing == null && job == null) {
            Subtitle best = MenuModel.pick(input(), host.preferred());
            if (best != null && best.version == Version.UPLOADED) {
                wanted = best;
                show(best, intent, true, true, null);
            }
        } else {
            followMode();
        }
        render();
    }

    /**
     * The menu opened. What it needs and doesn't have yet is read: the lookup if kept subtitles showed
     * first, YouTube's tracks, and a transcript a stop kept. Then what was picked follows what is known.
     */
    public void menuOpened() {
        if (video == null) return;
        int[] left = {3};
        Runnable joined = () -> {
            if (--left[0] > 0) return;
            followMode();
            render();
        };
        ensureLookup(joined);
        whenTracked(joined);
        awaitTranscript(joined);
    }

    /**
     * Subtitles picked for the viewer showed before more was known. Once it is, the version the menu
     * would pick shows where the language has both.
     */
    private void followMode() {
        Subtitle was = showing;
        if (was == null || !picked) return;
        Subtitle best = MenuModel.pick(input(), was.lang);
        if (best == null || Subtitle.same(best, was)) return;
        wanted = best;
        show(best, intent, true, true, shown -> {
            // What the viewer chose or hid while it was read stays theirs.
            if (!shown && Subtitle.same(wanted, best)) wanted = was;
        });
    }

    /** Whether {@code subtitle} is still what the viewer wants, for the press {@code at}. */
    private boolean current(Subtitle subtitle, int at) {
        return video != null && Subtitle.same(wanted, subtitle) && intent == at;
    }

    // Presses.

    /** A version that exists, pressed: it shows at once, and subtitles stay on for the next video. */
    public void choose(Subtitle subtitle) {
        int at = ++intent;
        wanted = subtitle;
        // A message about something else has had its say; work in progress keeps its own.
        if (!toast.showingProgress() && !toast.asking()) toast.hide();
        host.setOn(true);
        show(subtitle, at, false, false, shown -> render());
    }

    /** The language on screen, pressed again: subtitles are off until the viewer wants them back. */
    public void hide() {
        ++intent;
        wanted = null;
        unshow();
        host.setOn(false);
        render();
    }

    /** A press on a row to make while another is made: only says so. */
    public void busy() {
        toast.hold(Wording.t(Wording.FAIL_VIDEO_BUSY), null, null);
    }

    /** A language confirmed in the menu: the work that makes it starts, and what showed gives way to its lines as they come. */
    public void generate(Subtitle subtitle) {
        if (video == null) return;
        if (job != null || submitting) {
            busy();
            return;
        }
        ++intent;
        wanted = subtitle;
        toast.hide();
        unshow();
        host.setOn(true);
        make(subtitle);
    }

    /** Stop, from the menu's row: the job stops where it is the one being made. */
    public void stop(Subtitle subtitle) {
        if (job != null && Subtitle.same(job.subtitle(), subtitle)) stop(job);
    }

    /** Original caption was switched: the original is read, or leaves. */
    public void originalChanged() {
        render();
    }

    /**
     * The Premium switch, flipped: the mode for every video from now on. What shows follows it where
     * the language has the other version too, and otherwise leaves the screen.
     */
    public void setMode(Version mode) {
        host.setMode(mode);
        Subtitle was = showing;
        // Uploaded captions are in either mode.
        if (was != null && was.version != Version.UPLOADED && was.version != mode) {
            Subtitle same = new Subtitle(was.lang, mode);
            if (MenuModel.has(input(), same)) {
                choose(same);
                return;
            }
            ++intent;
            wanted = null;
            unshow();
        }
        render();
    }

    /** The account was read again: what was picked follows what the menu would pick now. */
    public void accountChanged() {
        if (video == null) return;
        followMode();
        render();
    }

    /** The app came to the foreground or left it. Checks pause while it is away; the first runs as it comes back. */
    public void setForeground(boolean shown) {
        if (foreground == shown) return;
        foreground = shown;
        if (!shown) {
            if (checkTimer != null) {
                cancelCheck();
                checkDue = true;
                JimakuLog.info("In the background: checks wait");
            }
        } else if (checkDue && job != null) {
            checkDue = false;
            JimakuLog.info("Back: checking job " + job.id);
            check(0);
        }
    }

    /** The message was made anew with the player: it shows the job's progress again. */
    public void messageReplaced() {
        if (job != null && stopping == null) announce(job, false);
    }

    // Showing.

    private static String keyFor(Subtitle subtitle) {
        return subtitle.version.id() + ":" + subtitle.lang;
    }

    /** One version's lines: from the shared cache, from the phone, or as YouTube has them uploaded, read once per video. */
    private void lines(Subtitle subtitle, Answer<List<Line>> answer) {
        List<Line> known = documents.get(keyFor(subtitle));
        if (known != null) {
            answer.got(known, null);
            return;
        }
        String videoId = video;
        TrackInfo said = track;
        io("read of " + subtitle, true, cancellation -> switch (subtitle.version) {
            case PREMIUM -> reads.document(videoId, subtitle.lang, cancellation);
            case STANDARD -> kept.get(videoId, subtitle.lang);
            case UPLOADED -> uploaded(said, subtitle.lang, cancellation);
        }, (lines, failed) -> {
            if (lines != null && !lines.isEmpty()) documents.put(keyFor(subtitle), lines);
            answer.got(lines != null && !lines.isEmpty() ? lines : null, failed);
        });
    }

    /** The captions uploaded in {@code lang}. A track that can't be read says so as YouTube's captions do. */
    private List<Line> uploaded(TrackInfo said, String lang, Cancellation cancellation) throws GatewayException {
        CaptionTrack uploaded = said != null ? said.uploadedIn(lang) : null;
        if (uploaded == null) return null;
        try {
            List<Line> lines = CaptionLines.of(tracks.captions(said, uploaded, cancellation));
            return lines.isEmpty() ? null : lines;
        } catch (GatewayException e) {
            if ("cancelled".equals(e.code)) throw e;
            throw new GatewayException("no_captions", e);
        } catch (org.json.JSONException e) {
            throw new GatewayException("no_captions", e);
        }
    }

    private interface Shown {
        void shown(boolean shown);
    }

    /** Shows one version. {@code quiet} says nothing when that fails. */
    private void show(Subtitle subtitle, int at, boolean quiet, boolean pick, Shown done) {
        if (!current(subtitle, at)) {
            if (done != null) done.shown(false);
            return;
        }
        lines(subtitle, (lines, failed) -> {
            if (!current(subtitle, at)) {
                if (done != null) done.shown(false);
                return;
            }
            if (lines == null) {
                if (!quiet) fail(failed != null ? failed.code : "internal", Map.of(), subtitle, false, false);
                if (done != null) done.shown(false);
                return;
            }
            showing = subtitle;
            showingLines = lines;
            picked = pick;
            error = false;
            JimakuLog.info("Showing " + lines.size() + " subtitles in " + subtitle + " for " + video);
            render();
            if (done != null) done.shown(true);
        });
    }

    /** Takes what shows off the screen, and nothing else. */
    private void unshow() {
        showing = null;
        showingLines = null;
        picked = false;
        tick();
    }

    /**
     * The original caption for what shows: the same version's where it has one, then the captions
     * uploaded in the video's own language, then the other version's.
     */
    private Subtitle originalFor() {
        MenuInput input = input();
        Version first = showing != null ? showing.version : Version.PREMIUM;
        Version[] order = first == Version.UPLOADED ? new Version[] {Version.UPLOADED, Version.PREMIUM, Version.STANDARD}
                : new Version[] {first, Version.UPLOADED, other(first)};
        for (Version version : order) {
            String lang = MenuModel.originalOf(input, version);
            if (lang != null) return new Subtitle(lang, version);
        }
        return null;
    }

    /** Reads the original caption's lines where Original caption is on and the video has one, and drops them where not. */
    private void syncOriginal() {
        // Where it would only repeat a row, as its greyed-out switch says, it shows nothing.
        Subtitle want = host.dual() && MenuModel.originalAvailable(input()) ? originalFor() : null;
        if (Subtitle.same(want, originalWanted) || (want == null && originalWanted == null)) return;
        originalWanted = want;
        if (want == null) {
            originalShown = null;
            originalLines = null;
            tick();
            display.changed();
            return;
        }
        Answer<List<Line>> got = (lines, failed) -> {
            if (!Subtitle.same(want, originalWanted)) return;
            originalShown = lines != null ? want : null;
            originalLines = lines;
            tick();
            display.changed();
        };
        // Premium's is the transcript as said, which in two languages isn't its language's subtitles.
        if (want.version != Version.PREMIUM) {
            lines(want, got);
            return;
        }
        List<Line> known = documents.get("original");
        if (known != null) {
            got.got(known, null);
            return;
        }
        String videoId = video;
        io("read of the original", true, cancellation -> reads.original(videoId, cancellation), (lines, failed) -> {
            if (lines != null && !lines.isEmpty()) documents.put("original", lines);
            got.got(lines != null && !lines.isEmpty() ? lines : null, failed);
        });
    }

    private void render() {
        if (video == null) return;
        syncOriginal();
        tick();
        display.changed();
    }

    /** What shows for the player to draw: what was chosen, or the lines so far of the job the viewer waits on, and the original. */
    private void tick() {
        String lang = null;
        List<Line> lines = null;
        if (showing != null && showingLines != null) {
            lang = showing.lang;
            lines = showingLines;
        } else if (stream != null && job != null && Subtitle.same(wanted, job.subtitle())) {
            lang = job.lang;
            lines = stream;
        }
        // The original in the language that already shows would say the same thing twice, unless the transcript is in two languages.
        boolean repeats = originalShown != null && MenuModel.repeats(input(), originalShown, lang);
        String originalLang = originalShown != null && !repeats ? originalShown.lang : null;
        List<Line> original = originalLang != null ? originalLines : null;
        if (lines != drawnLines || !java.util.Objects.equals(lang, drawnLang)) {
            drawnLang = lang;
            drawnLines = lines;
            display.lines(lang, lines);
        }
        if (original != drawnOriginal || !java.util.Objects.equals(originalLang, drawnOriginalLang)) {
            drawnOriginalLang = originalLang;
            drawnOriginal = original;
            display.original(originalLang, original);
        }
    }

    // Making.

    /** Runs {@code then} once the lookup and YouTube's tracks are both known. */
    private void whenKnown(Runnable then) {
        ensureLookup(() -> whenTracked(then));
    }

    /** Starts the work that makes {@code subtitle}: Standard from YouTube's captions, Premium from the cached transcript. */
    private void make(Subtitle subtitle) {
        if (submitting) return;
        submitting = true;
        int at = intent;
        render();
        whenKnown(() -> {
            if (!current(subtitle, at)) {
                done();
                return;
            }
            // Checked again against what is known now. Standard is never turned into Premium, nor the other way.
            Plan made = MenuModel.plan(input(), subtitle);
            if (made.method == Plan.Method.NONE) {
                done();
                fail(reason(made.why), Map.of(), subtitle, false, false);
                return;
            }
            Double length = duration();
            double seconds = length != null ? length : UNKNOWN_DURATION;
            String videoId = video;
            String title = track != null && track.title != null ? track.title : "";
            if (made.method != Plan.Method.CAPTIONS) {
                start(subtitle, at, StartRequest.premium(videoId, title, subtitle.lang, seconds));
                return;
            }
            TrackInfo said = track;
            if (said == null || said.language == null || said.source == null) {
                done();
                fail("no_captions", Map.of(), subtitle, false, false);
                return;
            }
            toast.progress(Wording.t(Wording.PROGRESS_LINE, Languages.englishName(subtitle.lang), Wording.t(Wording.PROGRESS_READING)),
                    true, null, null, null);
            io("read of YouTube's captions", true, cancellation -> tracks.captions(said, said.source, cancellation), (body, failed) -> {
                if (!current(subtitle, at)) {
                    dropReading();
                    done();
                    return;
                }
                if (body == null) {
                    done();
                    fail("no_captions", Map.of(), subtitle, false, false);
                    return;
                }
                start(subtitle, at, StartRequest.captions(videoId, title, subtitle.lang, seconds, said.language, body));
            });
        });
    }

    private static String reason(Plan.Why why) {
        return switch (why) {
            case SIGN_IN, NO_MINUTES -> "no_minutes";
            case TOO_LONG -> "too_long";
            case NO_CAPTIONS -> "no_captions";
            case LIVE -> "live";
        };
    }

    private void done() {
        submitting = false;
        render();
    }

    /** The reading message of a start the viewer turned away from leaves; a job's own progress stays. */
    private void dropReading() {
        if (job == null && toast.showingProgress()) toast.hide();
    }

    /**
     * Asks the gateway to start. The request goes on when the viewer leaves the video, and the job it
     * started is kept as the pending record before anything else, so it is picked up again.
     */
    private void start(Subtitle subtitle, int at, StartRequest request) {
        io("start of " + subtitle, false, cancellation -> {
            StartedJob started = writes.start(request, cancellation);
            pendingJobs.save(new PendingJob(started.job, request.video, request.lang, started.kind, request.title, started.joined));
            return started;
        }, (started, failed) -> {
            submitting = false;
            if (started == null) {
                render();
                if (!current(subtitle, at)) {
                    dropReading();
                    return;
                }
                String code = failed != null ? failed.code : "internal";
                if (code.equals("exists")) {
                    refreshAndShow(subtitle);
                    return;
                }
                fail(code, failed != null ? failed.extra : Map.of(), subtitle, false, true);
                return;
            }
            JimakuLog.info("Started " + started.kind.wire + " job " + started.job + " for " + subtitle + (started.joined ? ", joined" : ""));
            long now = timer.now();
            job = new RunningJob(started.job, subtitle.lang, started.kind, started.joined, started.state, started.percent, now);
            reglide(job, now);
            error = false;
            announce(job, true);
            check(CHECK_MILLIS);
            render();
        });
    }

    /** Picks up the job this install was waiting on when the viewer left this video. */
    private void resume(PendingJob pending) {
        JimakuLog.info("Picking up job " + pending.job + " for " + pending.lang);
        job = new RunningJob(pending.job, pending.lang, pending.kind, pending.joined, JobState.WAITING, null, timer.now());
        // Subtitles that stay on show the language the viewer started, once it is made.
        if (host.on() && wanted == null && showing == null) wanted = job.subtitle();
        render();
        check(0);
    }

    private void cancelCheck() {
        if (checkTimer != null) checkTimer.run();
        checkTimer = null;
    }

    private void check(long delay) {
        cancelCheck();
        if (!foreground) {
            checkDue = true;
            return;
        }
        long readFor = generation;
        checkTimer = timer.after(delay, () -> {
            checkTimer = null;
            if (readFor == generation) runCheck();
        });
    }

    private void runCheck() {
        RunningJob checked = job;
        if (checked == null || stopping == checked) return;
        boolean recovering = error;
        io("check of job " + checked.id, true, cancellation -> writes.job(checked.id, cancellation), (status, failed) -> {
            if (job != checked || stopping == checked) return;
            if (status == null) {
                String code = failed != null ? failed.code : "internal";
                // A job the gateway no longer has finished long ago or never was this install's.
                if (code.equals("not_found")) {
                    forget();
                    return;
                }
                if (++checkFailures >= CHECK_FAILURES) {
                    recover(checked);
                    return;
                }
                check(CHECK_MILLIS);
                return;
            }
            checkFailures = 0;
            error = false;
            boolean moved = status.state != checked.state;
            long now = timer.now();
            if (moved) checked.since = now;
            checked.state = status.state;
            checked.percent = status.percent;
            // The translation's pace, from the percents seen move.
            if (status.state == JobState.TRANSLATING && status.percent != null
                    && (checked.last == null || checked.last.percent != status.percent)) {
                checked.last = new TimedJob.Sample(now, status.percent);
                if (checked.first == null) checked.first = checked.last;
            }
            reglide(checked, now);
            if (status.state == JobState.DONE) {
                finish(checked);
                return;
            }
            if (status.state == JobState.FAILED) {
                fail(status.reason != null ? status.reason : "internal", Map.of(), checked.subtitle(), true, false);
                return;
            }
            if (moved || recovering || toast.showingProgress() || toast.asking()) {
                announce(checked, moved || recovering);
                // A job that moved on to transcribing while Stop asks: the question now says the minutes stay spent.
                toast.reask(stopQuestion(checked));
            }
            readSoFar(checked);
            render();
            check(CHECK_MILLIS);
        });
    }

    /**
     * The lines translated so far show while the rest is made, for a viewer waiting on this language.
     * They are read once each time the job has come further, never on a timer of their own.
     */
    private void readSoFar(RunningJob running) {
        if (running.state != JobState.TRANSLATING || running.percent == null || running.percent == 0
                || running.percent.equals(running.read)) return;
        if (showing != null || !Subtitle.same(wanted, running.subtitle())) return;
        Double read = running.percent;
        running.read = read;
        io("lines so far of job " + running.id, true, cancellation -> writes.partial(running.id, cancellation), (lines, failed) -> {
            // An answer that a later read overtook holds fewer lines than the ones on screen.
            if (job != running || !read.equals(running.read) || lines == null || lines.isEmpty()) return;
            stream = lines;
            tick();
        });
    }

    private void recover(RunningJob running) {
        error = true;
        toast.hold(Wording.t(Wording.FAIL_UNREACHABLE), new Action(Wording.t(Wording.ACTION_RETRY), () -> {
            checkFailures = 0;
            check(0);
            render();
        }), null);
        render();
        if (job == running) check(CHECK_MILLIS * 10);
    }

    private static final class Finished {
        boolean saved = true;
        List<String> keptNow;
        String original;
        Lookup lookup;
        CaptionResult result;
    }

    private void finish(RunningJob running) {
        String videoId = video;
        io("result of job " + running.id, true, cancellation -> {
            Finished finished = new Finished();
            if (running.kind == JobKind.CAPTIONS) {
                CaptionResult result = writes.result(running.id, cancellation);
                finished.result = result;
                if (result.originalLang != null) {
                    finished.original = result.originalLang;
                    if (!result.originalLang.equals(running.lang)) {
                        finished.saved &= kept.keep(videoId, result.originalLang, result.originalLines, true);
                    }
                }
                finished.saved &= kept.keep(videoId, running.lang, result.lines, running.lang.equals(result.originalLang));
                // Keeping the target can push the source out where the pair is over the budget.
                if (finished.saved && result.originalLang != null) finished.saved = kept.get(videoId, result.originalLang) != null;
                finished.keptNow = kept.languages(videoId);
            } else {
                finished.lookup = writes.freshLookup(videoId, cancellation);
            }
            return finished;
        }, (finished, failed) -> {
            if (job != running) return;
            if (finished == null) {
                if (failed != null && failed.code.equals("not_found")) forget();
                else recover(running);
                return;
            }
            if (finished.result != null) {
                CaptionResult result = finished.result;
                if (finished.original != null) standardOriginal = finished.original;
                List<String> languages = new ArrayList<>(finished.keptNow != null ? finished.keptNow : keptLanguages);
                if (!languages.contains(running.lang)) languages.add(running.lang);
                if (result.originalLang != null && !languages.contains(result.originalLang)) languages.add(result.originalLang);
                keptLanguages = languages;
                documents.put(keyFor(new Subtitle(running.lang, Version.STANDARD)), result.lines);
                if (result.originalLang != null && result.originalLines != null && !result.originalLang.equals(running.lang)) {
                    documents.put(keyFor(new Subtitle(result.originalLang, Version.STANDARD)), result.originalLines);
                }
            } else {
                lookup = finished.lookup;
                lookedUp = true;
            }
            // Where keeping failed, the record stays, so the result can still be read from the gateway.
            if (finished.saved) forgetRecord(running.id);
            job = null;
            stream = null;
            error = false;
            if (running.kind == JobKind.PREMIUM) host.minutesChanged();
            Subtitle made = running.subtitle();
            String name = Languages.englishName(running.lang);
            String ready = finished.saved ? Wording.t(Wording.TOAST_READY, name) : Wording.t(Wording.TOAST_READY_UNSAVED, name);
            JimakuLog.info("Job " + running.id + " done" + (finished.saved ? "" : ", not kept"));
            // The new subtitles show at once, unless the viewer turned to something else meanwhile.
            if (Subtitle.same(wanted, made)) {
                show(made, intent, false, false, shown -> {
                    if (shown) toast.info(ready);
                    tick();
                    render();
                });
                return;
            }
            toast.info(ready);
            render();
        });
    }

    private void forgetRecord(String id) {
        io("pending record", false, cancellation -> {
            pendingJobs.clear(id);
            return Boolean.TRUE;
        }, (value, failed) -> {
        });
    }

    private void forget() {
        RunningJob was = job;
        job = null;
        stream = null;
        cancelCheck();
        if (was != null) forgetRecord(was.id);
        toast.hide();
        render();
    }

    private void refreshAndShow(Subtitle subtitle) {
        String videoId = video;
        io("fresh lookup", true, cancellation -> writes.freshLookup(videoId, cancellation), (found, failed) -> {
            if (failed != null) {
                fail(failed.code, Map.of(), subtitle, false, false);
                return;
            }
            lookup = found;
            show(subtitle, intent, false, false, shown -> render());
        });
    }

    /**
     * Says what went wrong in a few plain words, with the action that helps: Standard where a Premium
     * request failed and the video allows it, Try again where a start didn't reach the server, and
     * Buy minutes where Premium needs more of them.
     */
    private void fail(String reason, Map<String, Object> extra, Subtitle subtitle, boolean terminal, boolean retry) {
        if (video == null) return;
        RunningJob was = terminal ? job : null;
        if (terminal) {
            job = null;
            stream = null;
            cancelCheck();
            tick();
        }
        if (was != null) forgetRecord(was.id);
        // They are no longer on their way.
        if (Subtitle.same(wanted, subtitle)) wanted = null;
        error = true;
        JimakuLog.info("Failed " + subtitle + ": " + reason);
        PendingJob running = pendingJobs.load();
        Object busyVideo = extra.get("video");
        String runningTitle = running != null && running.video.equals(busyVideo) && !running.title.isEmpty() ? running.title : null;
        MenuInput.Account account = host.account();
        Double balance = host.minutesKnown() && account != null ? account.balance : null;
        Failures.Explained explained = Failures.explain(Locale.getDefault(), reason, extra, new Failures.Context(
                subtitle.version == Version.PREMIUM && MenuModel.captionsAllowed(input()), runningTitle, balance));
        boolean unreachable = reason.equals("unreachable") || reason.equals("offline");
        Action action = null;
        if (explained.standard) {
            Subtitle standard = new Subtitle(subtitle.lang, Version.STANDARD);
            action = new Action(Wording.t(Wording.ACTION_STANDARD), () -> generate(standard));
        } else if (retry && unreachable && subtitle.version != Version.UPLOADED) {
            action = new Action(Wording.t(Wording.ACTION_RETRY), () -> generate(subtitle));
        }
        Action buy = explained.buy ? new Action(Wording.t(Wording.ACTION_BUY_MINUTES), host::openAccount) : null;
        toast.hold(explained.text, action, buy);
        if (was != null && was.kind == JobKind.PREMIUM) host.minutesChanged();
        render();
    }

    /** The job's step in the message, with how far the translation has come in bold, about how long it has left, and Stop. */
    private void announce(RunningJob running, boolean aloud) {
        String strong = running.state == JobState.TRANSLATING && running.percent != null ? shownPercent(running.percent) : null;
        String left = timeLeft(running);
        String step = left == null ? going(running) : Wording.t(Wording.PROGRESS_LEFT, step(running), left);
        toast.progress(Wording.t(Wording.PROGRESS_LINE, Languages.englishName(running.lang), step), aloud, stopAction(running), strong,
                running.glide);
    }

    /** About how long the job has left, in words, where the video's length is known and it is 2 minutes or more. */
    private String timeLeft(RunningJob running) {
        Double length = duration();
        if (length == null) return null;
        return TimeLeft.timeLeftText(Locale.getDefault(), TimeLeft.secondsLeft(running.timed(), length, translates(running), timer.now()));
    }

    /** Premium for a video already in the language being made ends with the transcript. */
    private boolean translates(RunningJob running) {
        return running.kind != JobKind.PREMIUM || track == null || !running.lang.equals(track.language);
    }

    /** The job's bar from where it stands now, for the message and the button alike; none while nothing can be estimated. */
    private void reglide(RunningJob running, long now) {
        Double length = duration();
        Glide next = length == null ? null : TimeLeft.progressOf(running.timed(), length, translates(running), now);
        running.glide = next != null ? TimeLeft.onward(running.glide, next) : null;
    }

    private Action stopAction(RunningJob running) {
        return new Action(Wording.t(Wording.ACTION_STOP), () -> {
            if (job == running) toast.ask(stopQuestion(running), () -> stop(running));
        });
    }

    /** Whether stopping leaves this install's minutes spent: Premium it paid for, once transcribing has started. */
    private static boolean spent(RunningJob running) {
        return running.kind == JobKind.PREMIUM && !running.joined
                && (running.state == JobState.TRANSCRIBING || running.state == JobState.TRANSLATING);
    }

    /** What Stop asks in the message: "Stop German?", with the minutes where they stay spent. */
    private String stopQuestion(RunningJob running) {
        String name = Languages.englishName(running.lang);
        if (!spent(running)) return Wording.t(Wording.ASK_STOP, name);
        Double length = duration();
        return length == null ? Wording.t(Wording.ASK_STOP_SPENT_UNKNOWN, name)
                : Wording.t(Wording.ASK_STOP_SPENT, name, String.valueOf(MenuModel.minutesFor(length)));
    }

    /**
     * Yes to Stop. The job stops for this install, its progress leaves, and the message says what came
     * back. A job that finished meanwhile shows how it ended instead.
     */
    private void stop(RunningJob running) {
        if (job != running || stopping != null) return;
        stopping = running;
        cancelCheck();
        io("stop of job " + running.id, false, cancellation -> {
            StoppedJob stopped = writes.stop(running.id, cancellation);
            // Nothing is left to pick up: the job is stopped for this install.
            pendingJobs.clear(running.id);
            return stopped;
        }, (stopped, failed) -> {
            stopping = null;
            if (job != running) return;
            if (stopped == null) {
                String code = failed != null ? failed.code : "internal";
                if (code.equals("finished")) {
                    check(0);
                    return;
                }
                if (code.equals("not_found")) {
                    forget();
                    return;
                }
                // The job still runs, and the checks go on.
                toast.hold(Failures.explain(Locale.getDefault(), code, failed != null ? failed.extra : Map.of(),
                        new Failures.Context(false, null, null)).text, null, null);
                check(CHECK_MILLIS);
                return;
            }
            JimakuLog.info("Stopped job " + running.id);
            job = null;
            stream = null;
            error = false;
            if (running.kind == JobKind.PREMIUM) host.minutesChanged();
            if (Subtitle.same(wanted, running.subtitle())) wanted = null;
            toast.info(stoppedText(running, stopped));
            render();
            if (stopped.keptTranscript) {
                transcriptUntil = timer.now() + TRANSCRIPT_WAIT_MILLIS;
                awaitTranscript(this::render);
            }
        });
    }

    /**
     * Reads the cache past the edge while a stopped job's transcript is on its way: every language is
     * a free translation once it is there. Read when the stop is answered and each time the menu
     * opens after, never on a timer.
     */
    private void awaitTranscript(Runnable then) {
        if (video == null || timer.now() >= transcriptUntil) {
            then.run();
            return;
        }
        String videoId = video;
        io("fresh lookup", true, cancellation -> writes.freshLookup(videoId, cancellation), (found, failed) -> {
            if (failed == null) {
                lookup = found;
                lookedUp = true;
                if (found != null) transcriptUntil = 0;
            }
            then.run();
        });
    }

    /** "German stopped", with what came back where minutes were spent: the minutes, or the transcript paid for. */
    private String stoppedText(RunningJob running, StoppedJob stopped) {
        String name = Languages.englishName(running.lang);
        if (stopped.keptTranscript) return Wording.t(Wording.TOAST_STOPPED_KEPT, name);
        if (running.kind == JobKind.PREMIUM && !running.joined) {
            Double seconds = stopped.refunded > 0 ? Double.valueOf(stopped.refunded) : duration();
            if (seconds != null) return Wording.t(Wording.TOAST_STOPPED_MINUTES, name, String.valueOf(MenuModel.minutesFor(seconds)));
        }
        return Wording.t(Wording.TOAST_STOPPED, name);
    }

    /** The step a job is on, in a few words: "transcribing", "translating 25%". */
    private static String step(RunningJob running) {
        return switch (running.state) {
            case WAITING -> Wording.t(Wording.PROGRESS_WAITING);
            case DOWNLOADING -> Wording.t(Wording.PROGRESS_GETTING_READY);
            case TRANSCRIBING -> Wording.t(Wording.PROGRESS_TRANSCRIBING);
            case TRANSLATING -> running.percent == null ? Wording.t(Wording.PROGRESS_TRANSLATING)
                    : Wording.t(Wording.PROGRESS_TRANSLATING_PERCENT, shownPercent(running.percent));
            case DONE -> Wording.t(Wording.PROGRESS_DONE);
            case FAILED -> "";
        };
    }

    /** The step with nothing after it, as the menu's row reads it: "transcribing…", or "translating 25%". */
    private static String going(RunningJob running) {
        boolean on = running.state == JobState.WAITING || running.state == JobState.DOWNLOADING || running.state == JobState.TRANSCRIBING
                || (running.state == JobState.TRANSLATING && running.percent == null);
        return on ? Wording.t(Wording.PROGRESS_GOING, step(running)) : step(running);
    }

    // Requests.

    /**
     * Runs {@code work} on the background executor and gives its answer on the main thread, if the
     * video is still the same. A {@code cancellable} request stops with the video; a start or a stop
     * goes on, so its answer is kept.
     */
    private <T> void io(String what, boolean cancellable, Io<T> work, Answer<T> answer) {
        long readFor = generation;
        String videoId = video;
        Cancellation cancellation = new Cancellation();
        if (cancellable) open.add(cancellation);
        background.execute(() -> {
            T value = null;
            GatewayException error = null;
            try {
                value = work.run(cancellation);
            } catch (GatewayException e) {
                error = e;
                if (!"cancelled".equals(e.code)) {
                    JimakuLog.warn(what + " for " + videoId + " failed: " + e.code + (e.getCause() != null ? " (" + e.getCause() + ")" : ""));
                }
            } catch (RuntimeException e) {
                JimakuLog.fault(what, e);
                error = new GatewayException("internal", e);
            }
            T got = value;
            GatewayException failed = error;
            main.execute(() -> {
                open.remove(cancellation);
                if (readFor != generation) return;
                answer.got(got, failed);
            });
        });
    }
}
