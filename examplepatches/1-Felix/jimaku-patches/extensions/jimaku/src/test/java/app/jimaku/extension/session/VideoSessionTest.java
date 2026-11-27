package app.jimaku.extension.session;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

import app.jimaku.extension.gateway.CaptionResult;
import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.JobStatus;
import app.jimaku.extension.gateway.Lookup;
import app.jimaku.extension.gateway.Reads;
import app.jimaku.extension.gateway.StartRequest;
import app.jimaku.extension.gateway.StartedJob;
import app.jimaku.extension.gateway.StoppedJob;
import app.jimaku.extension.gateway.Writes;
import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;
import app.jimaku.extension.menu.MenuInput;
import app.jimaku.extension.menu.Subtitle;
import app.jimaku.extension.menu.Version;
import app.jimaku.extension.shared.Wording;
import app.jimaku.extension.subtitles.Line;
import app.jimaku.extension.youtube.CaptionTrack;
import app.jimaku.extension.youtube.TrackFixtures;
import app.jimaku.extension.youtube.TrackInfo;

/** The session as the extension's session tests have it, for a signed-out viewer whose app is in German's place: "de". */
public class VideoSessionTest {
    private static final String FIRST = "aaaaaaaaaaa";
    private static final String SECOND = "bbbbbbbbbbb";
    private static final Subtitle STANDARD_DE = new Subtitle("de", Version.STANDARD);
    private static final Subtitle PREMIUM_DE = new Subtitle("de", Version.PREMIUM);

    /** Runs the background work only when the test says so, as a slow gateway would answer. */
    private static final class Delayed implements Executor {
        final ArrayDeque<Runnable> queue = new ArrayDeque<>();

        @Override
        public void execute(Runnable command) {
            queue.add(command);
        }

        void drain() {
            while (!queue.isEmpty()) queue.poll().run();
        }

        void runNext() {
            queue.poll().run();
        }
    }

    private interface Status {
        JobStatus get() throws GatewayException;
    }

    private static final class FakeGateway implements Reads, Writes {
        final Map<String, Lookup> lookups = new HashMap<>();
        final Map<String, List<Line>> documents = new HashMap<>();
        final List<String> requests = new ArrayList<>();
        final ArrayDeque<Status> statuses = new ArrayDeque<>();
        StartedJob started = new StartedJob("job-1", JobKind.CAPTIONS, JobState.WAITING, null, false);
        GatewayException startFails;
        StartRequest lastStart;
        StoppedJob stopped = new StoppedJob(0, false);
        List<Line> partial;
        CaptionResult result;
        Lookup fresh;

        @Override
        public Lookup lookup(String video, Cancellation cancellation) {
            requests.add("lookup " + video);
            return lookups.get(video);
        }

        @Override
        public List<Line> document(String video, String lang, Cancellation cancellation) {
            requests.add("document " + video + " " + lang);
            return documents.get(video + "/" + lang);
        }

        @Override
        public List<Line> original(String video, Cancellation cancellation) {
            requests.add("original " + video);
            return documents.get(video + "/original");
        }

        @Override
        public StartedJob start(StartRequest request, Cancellation cancellation) throws GatewayException {
            requests.add("start " + request.method + " " + request.video + " " + request.lang);
            lastStart = request;
            if (startFails != null) throw startFails;
            return started;
        }

        @Override
        public JobStatus job(String id, Cancellation cancellation) throws GatewayException {
            requests.add("job " + id);
            Status next = statuses.poll();
            if (next == null) throw new GatewayException("unreachable");
            return next.get();
        }

        @Override
        public StoppedJob stop(String id, Cancellation cancellation) {
            requests.add("stop " + id);
            return stopped;
        }

        @Override
        public List<Line> partial(String id, Cancellation cancellation) {
            requests.add("partial " + id);
            return partial;
        }

        @Override
        public CaptionResult result(String id, Cancellation cancellation) {
            requests.add("result " + id);
            return result;
        }

        @Override
        public Lookup freshLookup(String video, Cancellation cancellation) {
            requests.add("fresh lookup " + video);
            return fresh;
        }

        long count(String prefix) {
            return requests.stream().filter(request -> request.startsWith(prefix)).count();
        }
    }

    private static final class FakeYouTube implements VideoSession.Tracks {
        final Map<String, TrackInfo> tracks = new HashMap<>();
        final Map<String, String> bodies = new HashMap<>();
        final List<String> requests = new ArrayList<>();
        final List<Cancellation> cancellations = new ArrayList<>();

        @Override
        public TrackInfo tracks(String video, Cancellation cancellation) {
            requests.add("tracks " + video);
            cancellations.add(cancellation);
            return tracks.get(video);
        }

        @Override
        public String captions(TrackInfo info, CaptionTrack track, Cancellation cancellation) throws GatewayException {
            requests.add("captions " + track.code);
            String body = bodies.get(track.code);
            if (body == null) throw new GatewayException("no_captions");
            return body;
        }
    }

    private static final class MemoryKept implements VideoSession.Kept {
        final Map<String, List<Line>> results = new LinkedHashMap<>();
        final Map<String, String> originals = new HashMap<>();
        boolean refuse;

        @Override
        public List<String> languages(String video) {
            List<String> found = new ArrayList<>();
            for (String key : results.keySet()) if (key.startsWith(video + "/")) found.add(key.substring(video.length() + 1));
            return found;
        }

        @Override
        public String originalLanguage(String video) {
            return originals.get(video);
        }

        @Override
        public List<Line> get(String video, String lang) {
            return results.get(video + "/" + lang);
        }

        @Override
        public boolean keep(String video, String lang, List<Line> lines, boolean original) {
            if (refuse) return false;
            results.put(video + "/" + lang, lines);
            if (original) originals.put(video, lang);
            return true;
        }
    }

    private static final class MemoryPending implements VideoSession.Pending {
        PendingJob job;

        @Override
        public PendingJob load() {
            return job;
        }

        @Override
        public void save(PendingJob job) {
            this.job = job;
        }

        @Override
        public void clear(String expected) {
            if (job != null && job.job.equals(expected)) job = null;
        }
    }

    private static final class FakeHost implements VideoSession.Host {
        boolean on;
        boolean dual;
        MenuInput.Account account;
        boolean minutesKnown;
        Version mode;
        int minutesChanged;
        int accountOpened;

        @Override
        public String preferred() {
            return "de";
        }

        @Override
        public boolean on() {
            return on;
        }

        @Override
        public void setOn(boolean on) {
            this.on = on;
        }

        @Override
        public boolean dual() {
            return dual;
        }

        @Override
        public Double mediaSeconds() {
            return null;
        }

        @Override
        public MenuInput.Account account() {
            return account;
        }

        @Override
        public boolean minutesKnown() {
            return minutesKnown;
        }

        @Override
        public Version mode() {
            return mode;
        }

        @Override
        public void setMode(Version mode) {
            this.mode = mode;
        }

        @Override
        public void minutesChanged() {
            minutesChanged++;
        }

        @Override
        public void openAccount() {
            accountOpened++;
        }

        void signIn(double seconds) {
            account = new MenuInput.Account(seconds, true);
            minutesKnown = true;
        }
    }

    /** The message as the player's: progress behind a question waits, and the question stays. */
    private static final class RecordingToast implements VideoSession.Toast {
        final List<String> said = new ArrayList<>();
        String kind;
        VideoSession.Action forward;
        VideoSession.Action second;
        VideoSession.Action stop;
        Runnable yes;

        @Override
        public void info(String words) {
            kind = "info";
            said.add("info " + words);
        }

        @Override
        public void hold(String words, VideoSession.Action forward, VideoSession.Action second) {
            kind = "hold";
            this.forward = forward;
            this.second = second;
            said.add("hold " + words + (forward != null ? " [" + forward.label + "]" : "") + (second != null ? " [" + second.label + "]" : ""));
        }

        @Override
        public void progress(String words, boolean announce, VideoSession.Action stop, String strong, Glide glide) {
            this.stop = stop;
            if (asking()) return;
            kind = "progress";
            said.add("progress " + words);
        }

        @Override
        public void ask(String question, Runnable onYes) {
            kind = "ask";
            yes = onYes;
            said.add("ask " + question);
        }

        @Override
        public void reask(String question) {
        }

        @Override
        public void hide() {
            kind = null;
        }

        @Override
        public boolean showingProgress() {
            return "progress".equals(kind);
        }

        @Override
        public boolean asking() {
            return "ask".equals(kind);
        }

        String last() {
            return said.get(said.size() - 1);
        }
    }

    private static final class FakeTimer implements VideoSession.Timer {
        private static final class Due {
            final long at;
            final Runnable run;
            boolean gone;

            Due(long at, Runnable run) {
                this.at = at;
                this.run = run;
            }
        }

        long now = 1_000_000;
        final List<Due> due = new ArrayList<>();

        @Override
        public long now() {
            return now;
        }

        @Override
        public Runnable after(long millis, Runnable run) {
            Due timer = new Due(now + millis, run);
            due.add(timer);
            return () -> timer.gone = true;
        }

        /** The clock moves on by {@code millis}, and what fell due runs. */
        void advance(long millis) {
            now += millis;
            for (Due timer : new ArrayList<>(due)) {
                if (timer.gone || timer.at > now) continue;
                timer.gone = true;
                timer.run.run();
            }
        }

        /** In how long the next timer runs, or -1 for none. */
        long next() {
            long next = -1;
            for (Due timer : due) if (!timer.gone && (next < 0 || timer.at - now < next)) next = timer.at - now;
            return next;
        }
    }

    private static final class Recorder implements VideoSession.Display {
        final List<String> events = new ArrayList<>();

        @Override
        public void changed() {
        }

        @Override
        public void lines(String lang, List<Line> lines) {
            events.add(lines == null ? "no lines" : "lines " + lang + " " + lines.get(0).text);
        }

        @Override
        public void original(String lang, List<Line> lines) {
            events.add(lines == null ? "no original" : "original " + lang + " " + lines.get(0).text);
        }

        @Override
        public void clear() {
            events.add("clear");
        }

        String last() {
            return events.get(events.size() - 1);
        }
    }

    private final Delayed background = new Delayed();
    private final FakeGateway gateway = new FakeGateway();
    private final FakeYouTube youtube = new FakeYouTube();
    private final MemoryKept kept = new MemoryKept();
    private final MemoryPending pending = new MemoryPending();
    private final FakeHost host = new FakeHost();
    private final RecordingToast toast = new RecordingToast();
    private final FakeTimer timer = new FakeTimer();
    private final Recorder display = new Recorder();
    private final VideoSession session = new VideoSession(gateway, gateway, youtube, kept, pending, host, toast, timer, background,
            Runnable::run, display);

    private static List<Line> line(String text) {
        return List.of(new Line(0, 2, text));
    }

    private static JobStatus status(JobState state, Double percent) {
        return new JobStatus("job-1", FIRST, JobKind.CAPTIONS, "de", state, percent, null);
    }

    /** {@code video}'s transcript, in {@code original}, cached with its translations into {@code langs}, each one line of its code. */
    private void cache(String video, String original, String... langs) {
        gateway.lookups.put(video, new Lookup(original, List.of(langs), false));
        for (String lang : langs) gateway.documents.put(video + "/" + lang, line(video + " " + lang));
    }

    /** FIRST, in English with its automatic track, opened and read. */
    private void openUncached() {
        youtube.tracks.put(FIRST, TrackFixtures.track(FIRST, "en", 600.0, false));
        youtube.bodies.put("en", "{\"title\":\"A video\",\"events\":[]}");
        session.open(FIRST);
        background.drain();
    }

    /** A Standard job making German for FIRST, started and waited on. */
    private void startStandard() {
        openUncached();
        session.generate(STANDARD_DE);
        background.drain();
    }

    private void check(Status status) {
        gateway.statuses.add(status);
        timer.advance(VideoSession.CHECK_MILLIS);
        background.drain();
    }

    @Test
    public void showsTheCachedSubtitlesInThePreferredLanguage() {
        host.on = true;
        cache(FIRST, "ja", "de");
        session.open(FIRST);
        background.drain();
        assertEquals("lines de aaaaaaaaaaa de", display.last());
        assertEquals(List.of("lookup " + FIRST, "document " + FIRST + " de"), gateway.requests);
    }

    @Test
    public void turningPremiumOffShowsStandardWhereItIsMadeAndOtherwiseNothing() {
        host.on = true;
        host.signIn(18000);
        cache(FIRST, "ja", "de");
        kept.keep(FIRST, "de", line("kept"), false);
        session.open(FIRST);
        background.drain();
        assertEquals(PREMIUM_DE, session.showing());
        session.setMode(Version.STANDARD);
        background.drain();
        assertEquals(Version.STANDARD, host.mode);
        assertEquals(STANDARD_DE, session.showing());
        assertEquals("lines de kept", display.last());

        session.setMode(Version.PREMIUM);
        background.drain();
        assertEquals(PREMIUM_DE, session.showing());
    }

    @Test
    public void turningPremiumOffWithoutStandardLeavesTheScreen() {
        host.on = true;
        host.signIn(18000);
        cache(FIRST, "ja", "de");
        session.open(FIRST);
        background.drain();
        assertEquals(PREMIUM_DE, session.showing());
        session.setMode(Version.STANDARD);
        assertNull(session.showing());
        assertEquals("no lines", display.last());
    }

    @Test
    public void inPremiumModeKeptStandardWaitsForTheGateway() {
        host.on = true;
        host.signIn(18000);
        host.mode = Version.PREMIUM;
        cache(FIRST, "ja", "de");
        kept.keep(FIRST, "de", line("kept"), false);
        session.open(FIRST);
        background.drain();
        assertEquals(PREMIUM_DE, session.showing());
        assertTrue(gateway.requests.contains("lookup " + FIRST));
    }

    @Test
    public void premiumWithoutMinutesOffersStandardAndBuyMinutes() {
        host.signIn(0);
        openUncached();
        session.generate(PREMIUM_DE);
        background.drain();
        assertEquals("hold No Premium minutes left [Use Standard] [Buy minutes]", toast.last());
        toast.second.run.run();
        assertEquals(1, host.accountOpened);
        assertEquals(0, gateway.count("start"));
    }

    @Test
    public void aLateAnswerForTheFirstVideoLandsNowhere() {
        host.on = true;
        cache(FIRST, "ja", "de");
        cache(SECOND, "ja", "de");
        session.open(FIRST);
        session.open(SECOND);
        background.drain();
        assertTrue("the first video's YouTube read is cancelled", youtube.cancellations.get(0).isCancelled());
        assertEquals(List.of("clear", "clear", "lines de bbbbbbbbbbb de"), display.events);
        assertEquals(List.of("lookup " + SECOND, "document " + SECOND + " de"), gateway.requests);
    }

    @Test
    public void standardKeptOnThePhoneShowsWithoutAskingTheGatewayUntilTheMenuOpens() {
        host.on = true;
        kept.keep(FIRST, "de", line("kept"), false);
        session.open(FIRST);
        background.drain();
        assertEquals("lines de kept", display.last());
        assertEquals(STANDARD_DE, session.showing());
        assertEquals(List.of(), gateway.requests);
        session.menuOpened();
        background.drain();
        assertEquals(List.of("lookup " + FIRST), gateway.requests);
    }

    @Test
    public void captionsUploadedInTheLanguageShowAtOnceAndComeFirst() {
        host.on = true;
        cache(FIRST, "ja", "de");
        youtube.tracks.put(FIRST, TrackFixtures.track(FIRST, "ja", 600.0, false, "de"));
        youtube.bodies.put("de", "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"Vom Kanal\"}]}]}");
        session.open(FIRST);
        background.drain();
        assertEquals("lines de Vom Kanal", display.last());
        assertEquals(new Subtitle("de", Version.UPLOADED), session.showing());
        assertEquals(List.of("lookup " + FIRST), gateway.requests);
    }

    @Test
    public void choosingShowsAndShowingAgainReadsNothing() {
        cache(FIRST, "ja", "de", "en");
        session.open(FIRST);
        background.drain();
        Subtitle english = new Subtitle("en", Version.PREMIUM);
        session.choose(english);
        background.drain();
        assertEquals(english, session.showing());
        assertTrue("subtitles stay on", host.on);
        session.hide();
        assertNull(session.showing());
        assertFalse(host.on);
        session.choose(english);
        assertEquals(0, background.queue.size());
        assertEquals(List.of("clear", "lines en aaaaaaaaaaa en", "no lines", "lines en aaaaaaaaaaa en"), display.events);
    }

    @Test
    public void readsTheOriginalOnce() {
        host.on = true;
        host.dual = true;
        cache(FIRST, "ja", "de");
        gateway.documents.put(FIRST + "/original", line("こんにちは"));
        session.open(FIRST);
        background.drain();
        session.originalChanged();
        background.drain();
        assertEquals(List.of("lookup " + FIRST, "document " + FIRST + " de", "original " + FIRST), gateway.requests);
        assertTrue(display.events.contains("original ja こんにちは"));
    }

    @Test
    public void aStandardJobIsFollowedKeptAndShown() {
        openUncached();
        session.generate(STANDARD_DE);
        assertEquals("progress " + Wording.t(Wording.PROGRESS_LINE, "German", Wording.t(Wording.PROGRESS_READING)), toast.last());
        assertTrue(session.control().working);
        background.drain();
        assertEquals("captions", gateway.lastStart.method);
        assertEquals("en", gateway.lastStart.source);
        assertEquals(600, gateway.lastStart.duration, 0);
        assertEquals("job-1", pending.job.job);
        assertEquals(FIRST, pending.job.video);
        assertEquals(VideoSession.CHECK_MILLIS, timer.next());

        gateway.partial = line("bisher");
        check(() -> status(JobState.TRANSLATING, 40.0));
        assertEquals("lines de bisher", display.last());

        gateway.result = new CaptionResult(line("fertig"), "en", line("done"));
        check(() -> status(JobState.DONE, 100.0));
        assertEquals("lines de fertig", display.last());
        assertEquals("info " + Wording.t(Wording.TOAST_READY, "German"), toast.last());
        assertEquals(List.of("en", "de"), kept.languages(FIRST));
        assertEquals("en", kept.originalLanguage(FIRST));
        assertNull("the record is forgotten", pending.job);
        assertFalse(session.control().working);
        assertEquals(STANDARD_DE, session.showing());
        assertEquals("no more checks", -1, timer.next());
    }

    @Test
    public void aResultThatCantBeKeptStillShowsAndKeepsItsRecord() {
        kept.refuse = true;
        startStandard();
        gateway.result = new CaptionResult(line("fertig"), "en", line("done"));
        check(() -> status(JobState.DONE, 100.0));
        assertEquals("lines de fertig", display.last());
        assertEquals("info " + Wording.t(Wording.TOAST_READY_UNSAVED, "German"), toast.last());
        assertEquals("job-1", pending.job.job);
    }

    @Test
    public void aTranslationOfTheCachedTranscriptShowsTheFreshDocument() {
        cache(FIRST, "ja", "en");
        youtube.tracks.put(FIRST, TrackFixtures.track(FIRST, "ja", 600.0, false));
        gateway.started = new StartedJob("job-1", JobKind.TRANSLATE, JobState.TRANSLATING, 0.0, false);
        session.open(FIRST);
        background.drain();
        session.generate(PREMIUM_DE);
        background.drain();
        assertEquals("premium", gateway.lastStart.method);

        gateway.fresh = new Lookup("ja", List.of("en", "de"), false);
        gateway.documents.put(FIRST + "/de", line("übersetzt"));
        check(() -> status(JobState.DONE, 100.0));
        assertEquals("lines de übersetzt", display.last());
        assertEquals("info " + Wording.t(Wording.TOAST_READY, "German"), toast.last());
        assertNull(pending.job);
    }

    @Test
    public void stopFromTheMessageAsksThenStops() {
        startStandard();
        toast.stop.run.run();
        assertEquals("ask " + Wording.t(Wording.ASK_STOP, "German"), toast.last());
        toast.yes.run();
        background.drain();
        assertEquals("info " + Wording.t(Wording.TOAST_STOPPED, "German"), toast.last());
        assertNull(pending.job);
        assertFalse(session.control().working);
        assertEquals(-1, timer.next());
        assertEquals(1, gateway.count("stop job-1"));
    }

    @Test
    public void anUnreachableStartOffersTryAgainAndTheButtonSaysSomethingFailed() {
        openUncached();
        gateway.startFails = new GatewayException("unreachable");
        session.generate(STANDARD_DE);
        background.drain();
        assertEquals("hold " + Wording.t(Wording.FAIL_UNREACHABLE) + " [" + Wording.t(Wording.ACTION_RETRY) + "]", toast.last());
        VideoSession.Control failed = session.control();
        assertTrue(failed.error);
        assertFalse(failed.working);
        assertNull(pending.job);

        gateway.startFails = null;
        toast.forward.run.run();
        background.drain();
        assertEquals("job-1", pending.job.job);
        assertFalse(session.control().error);
    }

    @Test
    public void theDailyLimitSaysSoWithNothingToPress() {
        openUncached();
        gateway.startFails = new GatewayException("daily_limit");
        session.generate(STANDARD_DE);
        background.drain();
        assertEquals("hold " + Wording.t(Wording.FAIL_DAILY_LIMIT), toast.last());
        assertTrue(session.control().error);
    }

    @Test
    public void tooManyNewInstallsSaysSoWithNothingToPress() {
        openUncached();
        gateway.startFails = new GatewayException("too_many_installs");
        session.generate(STANDARD_DE);
        background.drain();
        assertEquals("hold " + Wording.t(Wording.FAIL_TOO_MANY_INSTALLS), toast.last());
    }

    @Test
    public void aPressToMakeAnotherWhileOneIsMadeOnlySaysSo() {
        startStandard();
        session.generate(new Subtitle("fr", Version.STANDARD));
        assertEquals("hold " + Wording.t(Wording.FAIL_VIDEO_BUSY), toast.last());
        assertEquals(1, gateway.count("start"));
        assertEquals("de", session.control().language);
    }

    @Test
    public void aChoiceMadeWhileTheVideoIsLookedUpStaysTheViewers() {
        host.on = true;
        cache(FIRST, "ja", "de", "en");
        session.open(FIRST);
        // YouTube's tracks and what the phone keeps are read; the lookup is still on its way.
        background.runNext();
        background.runNext();
        Subtitle english = new Subtitle("en", Version.PREMIUM);
        session.choose(english);
        background.drain();
        assertEquals(english, session.showing());
        assertEquals(0, gateway.count("document " + FIRST + " de"));
    }

    @Test
    public void readingCaptionsForAStartTheViewerTurnedFromLeavesNoMessage() {
        openUncached();
        gateway.documents.put(FIRST + "/en", line("English"));
        session.generate(STANDARD_DE);
        assertTrue("reading YouTube's captions shows", toast.showingProgress());
        session.choose(new Subtitle("en", Version.PREMIUM));
        background.drain();
        assertFalse("the reading message left", toast.showingProgress());
        assertEquals(0, gateway.count("start"));
        assertFalse(session.control().working);
    }

    @Test
    public void tenFailedChecksSayTheServerCantBeReachedAndCheckLessOften() {
        startStandard();
        for (int i = 0; i < VideoSession.CHECK_FAILURES; i++) check(() -> {
            throw new GatewayException("unreachable");
        });
        assertEquals("hold " + Wording.t(Wording.FAIL_UNREACHABLE) + " [" + Wording.t(Wording.ACTION_RETRY) + "]", toast.last());
        assertTrue(session.control().error);
        assertTrue("the job goes on", session.control().working);
        assertEquals(VideoSession.CHECK_MILLIS * 10, timer.next());

        gateway.statuses.add(() -> status(JobState.TRANSLATING, 20.0));
        toast.forward.run.run();
        timer.advance(0);
        background.drain();
        assertTrue(toast.last().startsWith("progress "));
        assertFalse(session.control().error);
    }

    @Test
    public void theJobWaitedOnIsPickedUpOnItsVideoAlsoAfterLeavingItWhileStarting() {
        openUncached();
        session.generate(STANDARD_DE);
        background.runNext();
        // Left after YouTube's captions were read and before the gateway answered: the job it started is still the one waited on.
        session.open(SECOND);
        background.drain();
        assertEquals(FIRST, pending.job.video);
        assertEquals("not checked on another video", 0, gateway.count("job"));

        session.open(FIRST);
        background.drain();
        assertTrue(session.control().working);
        assertEquals(0, timer.next());
        gateway.statuses.add(() -> status(JobState.TRANSLATING, 40.0));
        timer.advance(0);
        background.drain();
        assertEquals(1, gateway.count("job job-1"));
        assertTrue(toast.last().startsWith("progress "));
    }

    @Test
    public void checksWaitWhileTheAppIsInTheBackground() {
        startStandard();
        session.setForeground(false);
        timer.advance(60_000);
        background.drain();
        assertEquals(0, gateway.count("job"));
        gateway.statuses.add(() -> status(JobState.TRANSLATING, 40.0));
        session.setForeground(true);
        timer.advance(0);
        background.drain();
        assertEquals(1, gateway.count("job"));
    }

    @Test
    public void ignoresSomethingThatIsNotAVideoId() {
        session.open("not an id");
        assertEquals(0, background.queue.size());
        assertNull(session.video());
    }
}
