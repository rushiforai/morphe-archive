package app.wordfeudwordfinder.extension.core;

import app.wordfeudwordfinder.extension.game.GameStore;
import app.wordfeudwordfinder.extension.play.MoveSubmitter;
import app.wordfeudwordfinder.extension.play.SessionReader;
import app.wordfeudwordfinder.extension.play.UrlConnectionPoster;
import app.wordfeudwordfinder.extension.words.MissingWords;
import app.wordfeudwordfinder.extension.words.RejectedWords;
import app.wordfeudwordfinder.extension.words.UsagePing;
import app.wordfeudwordfinder.extension.words.UrlConnectionFetcher;
import app.wordfeudwordfinder.extension.words.WordListManager;
import app.wordfeudwordfinder.extension.words.WordReporter;
import java.io.File;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Lazy, thread-safe singleton wiring all word finder components together. */
public final class WordFinder {
    private static volatile WordFinder instance;
    private static final Object LOCK = new Object();

    private final Storage storage;
    private final GameStore gameStore;
    private final WordListManager wordLists;
    private final RejectedWords rejected;
    private final MoveSubmitter submitter;
    private final MissingWords missingWords;

    /**
     * Also used by tests: builds an instance rooted at the given directory without Android. The app's own files
     * directory (where its {@code .cookies} live) is taken to be the parent of {@code root}, which is
     * {@code <filesDir>/wfwf} in production.
     */
    public WordFinder(File root) {
        this.storage = new Storage(root);
        this.gameStore = new GameStore(storage);
        this.rejected = new RejectedWords(storage);
        this.wordLists = new WordListManager(storage, new UrlConnectionFetcher(), wordListExecutor());
        File appFiles = root.getAbsoluteFile().getParentFile();
        WordReporter reporter = WordReporter.fromBuild();
        this.submitter = new MoveSubmitter(new SessionReader(appFiles, System::currentTimeMillis),
                new UrlConnectionPoster(), gameStore, rejected, reporter);
        this.missingWords = new MissingWords(storage, reporter);
        GameStore gs = gameStore;
        WordListManager wl = wordLists;
        UsagePing ping = new UsagePing(storage, reporter, System::currentTimeMillis);
        gameStore.addListener(() -> wl.onRulesetsSeen(gs.seenRulesets(), gs::ruleset));
        gameStore.addListener(() -> ping.onGames(gs.seenRulesets()));
    }

    /**
     * One background thread for word list downloads and builds (so at most one graph is built at a time): daemon,
     * low priority, ends after 30 s idle.
     */
    private static ExecutorService wordListExecutor() {
        ThreadPoolExecutor ex = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS, new LinkedBlockingQueue<>(), r -> {
            Thread t = new Thread(r, "wfwf-wordlists");
            t.setDaemon(true);
            t.setPriority(Thread.MIN_PRIORITY);
            return t;
        });
        ex.allowCoreThreadTimeOut(true);
        return ex;
    }

    /** Returns the singleton, or null when no application context is available (yet). Never throws. */
    public static WordFinder get() {
        WordFinder w = instance;
        if (w != null) return w;
        synchronized (LOCK) {
            if (instance == null) {
                try {
                    File files = filesDir();
                    if (files != null) instance = new WordFinder(new File(files, "wfwf"));
                } catch (Throwable ignored) {
                    // no context: callers handle null
                }
            }
            return instance;
        }
    }

    private static File filesDir() throws Exception {
        Class<?> at = Class.forName("android.app.ActivityThread");
        Object app = at.getMethod("currentApplication").invoke(null);
        if (app == null) return null;
        Object dir = app.getClass().getMethod("getFilesDir").invoke(app);
        return dir instanceof File ? (File) dir : null;
    }

    public Storage storage() {
        return storage;
    }

    public GameStore gameStore() {
        return gameStore;
    }

    public WordListManager wordLists() {
        return wordLists;
    }

    public RejectedWords rejected() {
        return rejected;
    }

    /** Sends moves to the Wordfeud API (blocking; call off the main thread). */
    /** Reports played words that are missing from the word list (see {@link MissingWords}). */
    public MissingWords missingWords() {
        return missingWords;
    }

    public MoveSubmitter submitter() {
        return submitter;
    }
}
