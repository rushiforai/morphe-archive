package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Independently versioned, atomic per-block storage. Every hit is revalidated before publication.
 */
final class RebuildCache {
    private static final int MAX_FILES = 256;
    private static final long MAX_BYTES = 64L * 1024 * 1024;
    private static final long MAX_ENTRY_BYTES = 256000;

    static String hash(String s) {
        try {
            byte[] digest =
                    MessageDigest.getInstance("SHA-256").digest(s.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest) hex.append(String.format(Locale.ROOT, "%02x", b & 255));
            return hex.toString();
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    /** What a cached plan depends on: protocol, settings, prompt, language policy and the words. */
    static String identity(
            RebuildSource source,
            TranslationSettings config,
            String target,
            CaptionLanguageContext context) {
        return identity(source, config, target, context, false);
    }

    /**
     * The authored flag and cue sequence are part of a cached plan's identity. A manual cue is a
     * display boundary; a plan produced under another cue partition must not be restored as if it
     * were the same page.
     */
    static String identity(
            RebuildSource source,
            TranslationSettings config,
            String target,
            CaptionLanguageContext context,
            boolean authored) {
        StringBuilder b =
                new StringBuilder(RebuildProtocol.VERSION)
                        .append("|source-coverage-v2")
                        .append('|')
                        .append(context.fingerprint(config))
                        .append('|')
                        .append(target)
                        .append('|')
                        .append(hash(RebuildApi.prompt(config, target, context)));
        if (!context.canApplyEnglishToChinese) b.append('|').append(context.scope());
        b.append('|').append(context.renderSpec.presentationPolicy);
        if (authored) b.append('|').append(RebuildCueContract.VERSION).append("|authored=1");
        for (RebuildSource.Word w : source.words) {
            b.append('\n')
                    .append(w.start)
                    .append(':')
                    .append(w.end)
                    .append(':')
                    .append(w.precision)
                    .append(':')
                    .append(w.text);
            if (authored) b.append(':').append(w.cue);
        }
        return hash(b.toString());
    }

    static synchronized void clear(Context c) {
        File[] files = directory(c).listFiles();
        if (files != null) for (File f : files) if (f.isFile()) f.delete();
    }

    private static File directory(Context c) {
        File f = new File(c.getCacheDir(), "caption-events-r2.12");
        if (!f.exists()) f.mkdirs();
        return f;
    }

    private static File entry(Context c, String key, RebuildPlanner.Block block) {
        return new File(directory(c), key + "-" + block.id() + ".json");
    }

    /** The cached plan of a block, re-parsed against the source; null (and deleted) if unusable. */
    static RebuildProtocol.Plan read(
            Context c,
            String key,
            RebuildSource source,
            RebuildPlanner.Block block,
            CaptionLanguageContext context) {
        File f = entry(c, key, block);
        if (!f.isFile()) return null;
        try {
            if (f.length() > MAX_ENTRY_BYTES) throw new IOException("oversized");
            String raw = new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
            RebuildProtocol.Plan plan = RebuildProtocol.parseBound(raw, source, block, context);
            if (!context.canApplyEnglishToChinese)
                plan = RebuildReview.withLayoutReview(plan, TranslationOutput.budget(), context);
            return RebuildReview.score(plan.issues) == 0 ? plan : null;
        } catch (Exception bad) {
            f.delete();
            return null;
        }
    }

    /**
     * Orders publication admission against revocation. A permit is held from the moment a result is
     * admitted until it is published; after a revoke no new permit is granted and the caller can
     * wait for those already out. Its monitor is a leaf: nothing is called while holding it.
     */
    static final class Publication {
        private static final int OPEN = 0, RETIRED = 1, STOPPED = 2;
        private int mode = OPEN;
        private int outstanding;

        synchronized boolean isOpen() {
            return mode == OPEN;
        }

        /** Retired: the session was replaced, a request already sent may still finish. */
        synchronized boolean finishSent() {
            return mode == RETIRED;
        }

        synchronized Permit reserve() {
            if (mode != OPEN) return null;
            outstanding++;
            return new Permit(this);
        }

        synchronized void revoke(boolean stop) {
            mode = stop || mode == STOPPED ? STOPPED : RETIRED;
        }

        /** Waits until every granted permit has been closed. */
        synchronized void drain(long deadline) {
            while (outstanding > 0) {
                long left = deadline - System.nanoTime();
                if (left <= 0) throw new IllegalStateException("publication_commit_timeout");
                try {
                    TimeUnit.NANOSECONDS.timedWait(this, left);
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    throw new IllegalStateException("publication_commit_interrupted", interrupted);
                }
            }
        }

        private synchronized void release() {
            outstanding--;
            notifyAll();
        }
    }

    static final class Permit implements AutoCloseable {
        private final Publication publication;
        private final AtomicBoolean closed = new AtomicBoolean();

        Permit(Publication publication) {
            this.publication = publication;
        }

        @Override
        public void close() {
            if (closed.compareAndSet(false, true)) publication.release();
        }
    }

    // Entries live only while a prepared write is outstanding, not for the lifetime of cache keys.
    // A held old candidate keeps the newer successful ordinal even after the newer one closes.
    private static final Map<String, WriteOrder> WRITES = new HashMap<>();
    private static long writeOrdinal;

    private static final class WriteOrder {
        int users;
        long committed;
    }

    /** A fully serialized and fsynced candidate. Preparing it holds no lifecycle lock or permit. */
    static final class Prepared implements AutoCloseable {
        private final File temporary, destination;
        private final WriteOrder order;
        private final long ordinal;
        private final AtomicBoolean closed = new AtomicBoolean();

        Prepared(File temporary, File destination) {
            this.temporary = temporary;
            this.destination = destination;
            synchronized (RebuildCache.class) {
                order =
                        WRITES.computeIfAbsent(
                                destination.getAbsolutePath(), key -> new WriteOrder());
                order.users++;
                ordinal = ++writeOrdinal;
            }
        }

        /** Moves the candidate into place unless a newer candidate of the block already won. */
        boolean commit() {
            try {
                synchronized (RebuildCache.class) {
                    if (closed.get() || ordinal < order.committed) return false;
                    Files.move(
                            temporary.toPath(),
                            destination.toPath(),
                            StandardCopyOption.REPLACE_EXISTING,
                            StandardCopyOption.ATOMIC_MOVE);
                    order.committed = ordinal;
                }
                return true;
            } catch (IOException failure) {
                return false;
            }
        }

        @Override
        public void close() {
            if (!closed.compareAndSet(false, true)) return;
            temporary.delete();
            synchronized (RebuildCache.class) {
                if (--order.users == 0) WRITES.remove(destination.getAbsolutePath());
            }
        }
    }

    /** The candidate for a plan with no open review risk, or null (such a plan is not cached). */
    static Prepared prepare(
            Context c,
            String key,
            RebuildSource source,
            RebuildPlanner.Block block,
            RebuildProtocol.Plan plan,
            CaptionLanguageContext context) {
        if (RebuildReview.score(plan.issues) > 0) return null;
        File temporary = null;
        try {
            if (!context.canApplyEnglishToChinese) {
                RebuildProtocol.Plan verified =
                        RebuildProtocol.parseBound(plan.json, source, block, context);
                if (RebuildReview.score(verified.issues) > 0) return null;
            }
            temporary = File.createTempFile("events-", ".tmp", directory(c));
            try (FileOutputStream out = new FileOutputStream(temporary)) {
                out.write(plan.json.getBytes(StandardCharsets.UTF_8));
                out.getFD().sync();
            }
            return new Prepared(temporary, entry(c, key, block));
        } catch (Exception failure) {
            if (temporary != null) temporary.delete();
            return null;
        }
    }

    /** Keeps the newest files within the count and size limits. */
    static synchronized void trim(Context c) {
        File[] all = directory(c).listFiles((dir, name) -> name.endsWith(".json"));
        if (all == null) return;
        Arrays.sort(all, Comparator.comparingLong(File::lastModified).reversed());
        long bytes = 0;
        for (int i = 0; i < all.length; i++) {
            bytes += all[i].length();
            if (i >= MAX_FILES || bytes > MAX_BYTES) all[i].delete();
        }
    }
}
