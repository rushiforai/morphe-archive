package slick.android;

import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

public final class CacheCleaner {
  private static final List<WeakReference<Object>> OWNERS = new ArrayList<>();
  private static final ExecutorService WORKER =
      Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "Slick cache");
        thread.setDaemon(true);
        return thread;
      });

  public static final class Category {
    public final String id, title, detail;
    public final long bytes;
    public final boolean clearable;

    Category(String id, String title, String detail, long bytes, boolean clearable) {
      this.id = id;
      this.title = title;
      this.detail = detail;
      this.bytes = bytes;
      this.clearable = clearable;
    }
  }

  public static final class Snapshot {
    public final List<Category> categories;
    public final String notice;

    Snapshot(List<Category> categories, String notice) {
      this.categories = Collections.unmodifiableList(new ArrayList<>(categories));
      this.notice = notice;
    }

    public long total() {
      long total = 0;
      for (Category c : categories) if (c.bytes > 0) total = add(total, c.bytes);
      return total;
    }
  }

  private static long add(long a, long b) {
    return Long.MAX_VALUE - a < b ? Long.MAX_VALUE : a + b;
  }

  private static boolean image(Object owner) {
    return owner.getClass().getName().equals("coil.disk.RealDiskCache");
  }

  private static String id(boolean image) {
    return image ? "coil_disk" : "video_disk";
  }

  private static String title(boolean image) {
    return image ? "Images" : "Video";
  }

  public static void images(Object owner) {
    capture(owner, "coil.disk.RealDiskCache");
  }

  public static void video(Object owner) {
    capture(owner, "androidx.media3.datasource.cache.SimpleCache");
  }

  private static void capture(Object owner, String type) {
    if (owner == null || !owner.getClass().getName().equals(type)) return;
    synchronized (OWNERS) {
      for (int i = OWNERS.size() - 1; i >= 0; i--) {
        Object existing = OWNERS.get(i).get();
        if (existing == null) OWNERS.remove(i);
        else if (existing == owner) return;
      }
      OWNERS.add(new WeakReference<>(owner));
    }
  }

  public static String format(long bytes) {
    if (bytes < 0) return "Unavailable";
    if (bytes < 1024) return bytes + " B";
    double amount = bytes;
    String[] units = {"B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB"};
    int unit = 0;
    while (amount >= 1024 && unit < units.length - 1) {
      amount /= 1024;
      unit++;
    }
    return String.format(Locale.US, "%.1f %s", amount, units[unit]);
  }

  public static void scan(Consumer<Snapshot> callback) {
    submit(Collections.emptySet(), callback);
  }

  public static void clear(Set<String> ids, Consumer<Snapshot> callback) {
    submit(ids == null ? Collections.emptySet() : new HashSet<>(ids), callback);
  }

  private static void submit(Set<String> ids, Consumer<Snapshot> callback) {
    WORKER.execute(() -> callback.accept(inspect(ids)));
  }

  private static Object field(Object object, String name) throws Exception {
    Field field = object.getClass().getDeclaredField(name);
    field.setAccessible(true);
    return field.get(object);
  }

  private static final class Owner {
    final Object cache;
    final File directory;
    final boolean image;

    Owner(Object cache, File directory, boolean image) {
      this.cache = cache;
      this.directory = directory;
      this.image = image;
    }
  }

  private static File directory(Object cache, boolean image) throws Exception {
    Object path = field(cache, image ? "directory" : "cacheDir");
    File raw = image ? (File) path.getClass().getMethod("toFile").invoke(path) : (File) path;
    return raw.getAbsoluteFile();
  }

  private static boolean allowed(File raw, boolean image) throws Exception {
    if (Settings.context == null) return false;
    File rawCacheRoot = Settings.context.getCacheDir();
    File cacheRoot = rawCacheRoot.getCanonicalFile();
    File imageRoot = new File(rawCacheRoot, "slack_image_cache");
    if (image
        && (java.nio.file.Files.isSymbolicLink(imageRoot.toPath())
            || !cacheRoot.equals(imageRoot.getCanonicalFile().getParentFile()))) return false;
    File root = image ? imageRoot.getCanonicalFile() : cacheRoot;
    File canonical = raw.getCanonicalFile();
    return !java.nio.file.Files.isSymbolicLink(raw.toPath())
        && raw.getParentFile() != null
        && root.equals(raw.getParentFile().getCanonicalFile())
        && root.equals(canonical.getParentFile())
        && (image || canonical.getName().endsWith("_cache_type_multimedia"));
  }

  private static Snapshot inspect(Set<String> selected) {
    List<Object> captured = new ArrayList<>();
    synchronized (OWNERS) {
      for (WeakReference<Object> ref : OWNERS) {
        Object owner = ref.get();
        if (owner != null) captured.add(owner);
      }
    }
    List<Category> result = new ArrayList<>();
    Map<File, Owner> directories = new HashMap<>();
    Set<File> conflicts = new HashSet<>();
    boolean unavailable = false;
    for (Object owner : captured)
      try {
        boolean image = image(owner);
        Object cache = image ? field(owner, "cache") : owner;
        synchronized (cache) {
          File raw = directory(cache, image);
          File directory = raw.getCanonicalFile();
          if (!allowed(raw, image)) {
            conflicts.add(directory);
            throw new IllegalStateException();
          }
          Owner previous = directories.putIfAbsent(directory, new Owner(cache, directory, image));
          if (previous != null && previous.cache != cache) conflicts.add(directory);
        }
      } catch (Exception | LinkageError failure) {
        unavailable = true;
        boolean image = image(owner);
        result.add(
            new Category(
                id(image),
                title(image),
                "Unavailable: captured owner directory could not be verified",
                -1,
                false));
      }
    for (Owner owner : directories.values()) {
      String id = id(owner.image);
      long bytes = -1;
      boolean clearable = false;
      String detail = "Unavailable: owner state could not be verified";
      try {
        if (conflicts.contains(owner.directory)) throw new IllegalStateException();
        synchronized (owner.cache) {
          File raw = directory(owner.cache, owner.image);
          if (!allowed(raw, owner.image) || !raw.getCanonicalFile().equals(owner.directory))
            throw new IllegalStateException();
          if (owner.image) {
            if (!(Boolean) field(owner.cache, "initialized")
                || (Boolean) field(owner.cache, "closed")) throw new IllegalStateException();
            if ((Long) field(owner.cache, "size") < 0) throw new IllegalStateException();
            if (selected.contains(id)) {
              Object[] entries = ((Map<?, ?>) field(owner.cache, "lruEntries")).values().toArray();
              Method remove =
                  owner
                      .cache
                      .getClass()
                      .getDeclaredMethod(
                          "removeEntry",
                          Class.forName(
                              "coil.disk.DiskLruCache$Entry",
                              false,
                              owner.cache.getClass().getClassLoader()));
              remove.setAccessible(true);
              for (Object entry : entries) remove.invoke(owner.cache, entry);
              owner.cache.getClass().getMethod("flush").invoke(owner.cache);
            }
            bytes = (Long) field(owner.cache, "size");
            clearable = bytes >= 0;
            detail =
                selected.contains(id)
                    ? "Owner eviction requested; active entries remain until released"
                    : "Live image cache; active entries are deferred when cleared";
          } else {
            if ((Boolean) field(owner.cache, "released")
                || field(owner.cache, "initializationException") != null)
              throw new IllegalStateException();
            bytes = (Long) field(owner.cache, "totalSpace");
            detail = "Read-only live video cache; clearing is not supported";
          }
          if (bytes < 0) throw new IllegalStateException();
        }
      } catch (Exception | LinkageError failure) {
        bytes = -1;
        clearable = false;
        unavailable = true;
        if (conflicts.contains(owner.directory))
          detail = "Unavailable: conflicting live owners for this directory";
        else if (selected.contains(id))
          detail = "Clear incomplete or unavailable; no further eviction attempted";
      }
      result.add(new Category(id, title(owner.image), detail, bytes, clearable));
    }
    // Every directory owner added a category above, so absence means none was captured.
    if (result.stream().noneMatch(c -> c.id.equals("coil_disk")))
      result.add(
          new Category("coil_disk", "Images", "No verified live image cache captured", -1, false));
    if (result.stream().noneMatch(c -> c.id.equals("video_disk")))
      result.add(
          new Category("video_disk", "Video", "No verified live video cache captured", -1, false));
    List<Category> aggregate = new ArrayList<>();
    for (String id : new String[] {"coil_disk", "video_disk"}) {
      long bytes = -1;
      int measured = 0, unknown = 0;
      boolean clearable = false;
      Set<String> details = new java.util.TreeSet<>();
      for (Category c : result)
        if (c.id.equals(id)) {
          if (c.bytes >= 0) {
            bytes = add(Math.max(bytes, 0), c.bytes);
            measured++;
          } else unknown++;
          clearable |= c.clearable;
          details.add(c.detail);
        }
      aggregate.add(
          new Category(
              id,
              id.equals("coil_disk") ? "Images" : "Audio and video",
              measured
                  + " measured owner(s), "
                  + unknown
                  + " unavailable. "
                  + String.join("; ", details),
              bytes,
              clearable));
    }
    return new Snapshot(
        aggregate,
        "Best effort measurement of cache."
            + (unavailable ? " Some owners are unavailable; clearing may be incomplete." : ""));
  }
}
