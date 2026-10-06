package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

/**
 * Independently versioned, atomic per-block storage. Every hit is revalidated before publication.
 */
final class RebuildCache {
  static String hash(String s) {
    try {
      byte[] d = MessageDigest.getInstance("SHA-256").digest(s.getBytes(StandardCharsets.UTF_8));
      StringBuilder b = new StringBuilder();
      for (byte x : d) b.append(String.format(java.util.Locale.ROOT, "%02x", x & 255));
      return b.toString();
    } catch (Exception e) {
      throw new IllegalStateException(e);
    }
  }

  /** Historical English/Chinese cache identity for legacy fixtures only. */
  static String identity(RebuildSource s, DeepSeekConfig.Snapshot c, String target) {
    return identity(s,c,target,CaptionLanguageContext.LEGACY);
  }
  static String identity(RebuildSource s,DeepSeekConfig.Snapshot c,String target,CaptionLanguageContext context) {
    StringBuilder b =
        new StringBuilder(RebuildProtocol.VERSION)
            .append('|')
            .append(context.fingerprint(c))
            .append('|')
            .append(target)
            .append('|')
            .append(hash(RebuildApi.prompt(c, target,context)));
    if(!context.canApplyEnglishToChinese)b.append('|').append(context.scope());
    if(!context.renderSpec.legacy)b.append('|').append(context.renderSpec.presentationPolicy);
    for (RebuildSource.Word w : s.words)
      b.append('\n')
          .append(w.start)
          .append(':')
          .append(w.end)
          .append(':')
          .append(w.precision)
          .append(':')
          .append(w.text);
    return hash(b.toString());
  }

  static synchronized void clear(Context c) {
    File[] fs = directory(c).listFiles();
    if (fs != null) for (File f : fs) if (f.isFile()) f.delete();
  }

  static File directory(Context c) {
    File f = new File(c.getCacheDir(), "caption-events-r2.12");
    if (!f.exists()) f.mkdirs();
    return f;
  }

  /** Explicit legacy fixture entry; production reads must pass their immutable context. */
  static RebuildProtocol.Plan read(Context c, String key, RebuildSource s, RebuildPlanner.Block b) {
    return read(c,key,s,b,CaptionLanguageContext.LEGACY);
  }
  static RebuildProtocol.Plan read(Context c,String key,RebuildSource s,RebuildPlanner.Block b,
                                   CaptionLanguageContext context) {
    File f = new File(directory(c), key + "-" + b.id() + ".json");
    if (!f.isFile()) return null;
    try {
      if (f.length() > 256000) throw new IOException("oversized");
      String raw = new String(java.nio.file.Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
      RebuildProtocol.Plan plan=RebuildProtocol.parseBound(raw,s,b,context);
      if(!context.canApplyEnglishToChinese)
        plan=RebuildReview.withLayoutReview(plan,CaptionOverlay.budget(),context);
      return RebuildReview.score(plan.issues)==0 ? plan : null;
    } catch (Exception bad) {
      f.delete();
      return null;
    }
  }

  /** One CAS orders publication admission and revocation; no lifecycle monitor is acquired. */
  static final class Publication {
    static final int OPEN = 0, RETIRED = 1, STOPPED = 2;
    private static final class State {
      final int mode;
      final List<Permit> permits;
      State(int mode, List<Permit> permits) { this.mode = mode; this.permits = permits; }
    }
    private final java.util.concurrent.atomic.AtomicReference<State> state =
        new java.util.concurrent.atomic.AtomicReference<>(new State(OPEN, Collections.emptyList()));

    boolean isOpen() { return state.get().mode == OPEN; }
    boolean finishSent() { return state.get().mode == RETIRED; }

    Permit reserve() {
      Permit permit = new Permit(this);
      for (;;) {
        State before = state.get();
        if (before.mode != OPEN) return null;
        List<Permit> pending = new ArrayList<>(before.permits);
        pending.add(permit);
        if (state.compareAndSet(before, new State(OPEN, Collections.unmodifiableList(pending))))
          return permit;
      }
    }

    // Only atomic state exchange: safe in the Controller's short state-only critical section.
    void revoke(boolean stop) {
      for (;;) {
        State before = state.get();
        int mode = stop || before.mode == STOPPED ? STOPPED : RETIRED;
        if (before.mode == mode || state.compareAndSet(before, new State(mode, before.permits)))
          return;
      }
    }

    void drain() {
      drain(System.nanoTime() + java.util.concurrent.TimeUnit.SECONDS.toNanos(5));
    }

    void drain(long deadline) {
      for (Permit permit : state.get().permits) {
        try {
          if (!permit.done.await(Math.max(0, deadline - System.nanoTime()),
              java.util.concurrent.TimeUnit.NANOSECONDS))
            throw new IllegalStateException("publication_commit_timeout");
        } catch (InterruptedException interrupted) {
          Thread.currentThread().interrupt();
          throw new IllegalStateException("publication_commit_interrupted", interrupted);
        }
      }
    }

    private void release(Permit permit) {
      for (;;) {
        State before = state.get();
        List<Permit> pending = new ArrayList<>(before.permits);
        pending.remove(permit);
        if (state.compareAndSet(before,
            new State(before.mode, Collections.unmodifiableList(pending)))) break;
      }
      permit.done.countDown();
    }
  }

  static final class Permit implements AutoCloseable {
    private final Publication publication;
    private final java.util.concurrent.CountDownLatch done = new java.util.concurrent.CountDownLatch(1);
    private final java.util.concurrent.atomic.AtomicBoolean closed = new java.util.concurrent.atomic.AtomicBoolean();
    Permit(Publication publication) { this.publication = publication; }
    public void close() { if (closed.compareAndSet(false, true)) publication.release(this); }
  }

  // Entries live only while a prepared write is outstanding, not for the lifetime of cache keys.
  // A held old candidate retains the newer successful ordinal even after the newer candidate closes.
  private static final Map<String, WriteOrder> WRITES = new HashMap<>();
  private static long writeOrdinal;
  private static final class WriteOrder { int users; long committed; }

  /** Fully serialized/fsynced candidate. Preparation never holds a lifecycle lock or permit. */
  static final class Prepared implements AutoCloseable {
    final File temporary, destination;
    private final WriteOrder order;
    private final long ordinal;
    private final java.util.concurrent.atomic.AtomicBoolean closed = new java.util.concurrent.atomic.AtomicBoolean();
    Prepared(File temporary, File destination) {
      this.temporary = temporary; this.destination = destination;
      synchronized (RebuildCache.class) {
        order = WRITES.computeIfAbsent(destination.getAbsolutePath(), key -> new WriteOrder());
        order.users++; ordinal = ++writeOrdinal;
      }
    }
    boolean commit() {
      try {
        synchronized (RebuildCache.class) {
          if (closed.get() || ordinal < order.committed) return false;
          java.nio.file.Files.move(temporary.toPath(), destination.toPath(),
              java.nio.file.StandardCopyOption.REPLACE_EXISTING,
              java.nio.file.StandardCopyOption.ATOMIC_MOVE);
          order.committed = ordinal;
        }
        return true;
      } catch (IOException failure) { return false; }
    }
    public void close() {
      if (!closed.compareAndSet(false, true)) return;
      temporary.delete();
      synchronized (RebuildCache.class) {
        if (--order.users == 0) WRITES.remove(destination.getAbsolutePath());
      }
    }
  }

  static Prepared prepare(Context c, String key, RebuildSource source, RebuildPlanner.Block block,
      RebuildProtocol.Plan plan, CaptionLanguageContext context) {
    if (RebuildReview.score(plan.issues) > 0) return null;
    File temporary = null;
    try {
      if (!context.canApplyEnglishToChinese) {
        RebuildProtocol.Plan verified = RebuildProtocol.parseBound(plan.json, source, block, context);
        if (RebuildReview.score(verified.issues) > 0) return null;
      }
      File dir = directory(c);
      temporary = File.createTempFile("events-", ".tmp", dir);
      try (FileOutputStream out = new FileOutputStream(temporary)) {
        out.write(plan.json.getBytes(StandardCharsets.UTF_8));
        out.getFD().sync();
      }
      return new Prepared(temporary, new File(dir, key + "-" + block.id() + ".json"));
    } catch (Exception failure) {
      if (temporary != null) temporary.delete();
      return null;
    }
  }

  static synchronized void trim(Context c) {
    File[] all = directory(c).listFiles((x, n) -> n.endsWith(".json"));
    if (all == null) return;
    Arrays.sort(all, Comparator.comparingLong(File::lastModified).reversed());
    long bytes = 0;
    for (int i = 0; i < all.length; i++) {
      bytes += all[i].length();
      if (i >= 256 || bytes > 64L * 1024 * 1024) all[i].delete();
    }
  }

  static boolean write(Context c, String key, RebuildPlanner.Block block, RebuildProtocol.Plan plan) {
    return write(c, key, null, block, plan, CaptionLanguageContext.LEGACY);
  }
  static boolean write(Context c,String key,RebuildSource source,RebuildPlanner.Block block,
      RebuildProtocol.Plan plan,CaptionLanguageContext context) {
    try (Prepared prepared = prepare(c, key, source, block, plan, context)) {
      if (prepared == null || !prepared.commit()) return false;
      trim(c);
      return true;
    }
  }
}
