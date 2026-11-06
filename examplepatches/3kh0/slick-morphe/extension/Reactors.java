package slick.android;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Shader;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.util.Log;
import android.util.LruCache;
import android.widget.TextView;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class Reactors {
  private static final int SHOWN = 8, PX = 72;
  private static final Handler main = new Handler(Looper.getMainLooper());
  private static final ThreadPoolExecutor io =
      new ThreadPoolExecutor(
          2,
          2,
          0,
          TimeUnit.SECONDS,
          new ArrayBlockingQueue<>(64),
          r -> new Thread(r, "Slick-reactors"),
          new ThreadPoolExecutor.DiscardPolicy());
  private static final List<WeakReference<Object>> repositories = new CopyOnWriteArrayList<>();
  private static final LruCache<String, String> urls = new LruCache<>(2048);
  private static final LruCache<String, Long> tried = new LruCache<>(2048);
  private static final LruCache<String, Bitmap> faces =
      new LruCache<String, Bitmap>(4 << 20) {
        @Override
        protected int sizeOf(String url, Bitmap b) {
          return b.getByteCount();
        }
      };

  public static void repository(Object repository) {
    repositories.removeIf(r -> r.get() == null);
    repositories.add(new WeakReference<>(repository));
  }

  public static void bind(Object view) {
    if (!Settings.enabled("who_reacted")) return;
    try {
      Object model = Host.get(view, "viewModel");
      LinkedHashSet<String> ids = new LinkedHashSet<>();
      for (Object r : (Collection<?>) Host.get(model, "reactions"))
        for (Object u : (Collection<?>) Host.get(r, "users")) ids.add(u.toString());
      List<String> shown = new ArrayList<>(ids).subList(0, Math.min(ids.size(), SHOWN));
      List<Bitmap> ready = new ArrayList<>();
      boolean missing = false;
      for (String id : shown) {
        String url = urls.get(id);
        Bitmap face = url == null ? null : faces.get(url);
        if (face != null) ready.add(face);
        else missing = true;
      }
      render((TextView) Host.get(view, "count"), ready, ids.size() - shown.size());
      if (missing) load(shown, new WeakReference<>(view), model);
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Reaction hook failed", e);
    }
  }

  private static void render(TextView count, List<Bitmap> ready, int more) {
    CharSequence text = count.getText();
    SpannableStringBuilder s = new SpannableStringBuilder(text);
    Faces[] old = s.getSpans(0, s.length(), Faces.class);
    if (old.length > 0) s.delete(s.getSpanStart(old[0]), s.length());
    if (!ready.isEmpty()) {
      s.append('￼');
      s.setSpan(
          new Faces(ready, more), s.length() - 1, s.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }
    if (old.length > 0 || !ready.isEmpty()) count.setText(s);
  }

  private static void load(List<String> ids, WeakReference<Object> view, Object model) {
    io.execute(() -> {
      try {
        Set<String> need = new LinkedHashSet<>();
        long now = SystemClock.elapsedRealtime();
        for (String id : ids) {
          Long last = tried.get(id);
          if (urls.get(id) == null && (last == null || now - last > 30_000)) need.add(id);
        }
        for (String id : need) tried.put(id, now);
        for (WeakReference<Object> ref : repositories) {
          Object repository = ref.get();
          if (repository == null || need.isEmpty()) continue;
          Map<?, ?> users =
              (Map<?, ?>)
                  repository
                      .getClass()
                      .getMethod("getLocalUsersSync", Set.class)
                      .invoke(repository, new LinkedHashSet<>(need));
          for (Map.Entry<?, ?> e : users.entrySet()) {
            String url = avatar(e.getValue());
            if (url != null) urls.put(e.getKey().toString(), url);
            need.remove(e.getKey().toString());
          }
        }
        boolean changed = false;
        for (String id : ids) {
          String url = urls.get(id);
          if (url != null && faces.get(url) == null && download(url)) changed = true;
        }
        if (changed)
          main.post(() -> {
            Object v = view.get();
            try {
              if (v != null && Host.get(v, "viewModel") == model) bind(v);
            } catch (ReflectiveOperationException e) {
              Log.e("Slick", "Reaction refresh failed", e);
            }
          });
      } catch (ReflectiveOperationException | RuntimeException e) {
        Log.e("Slick", "Reactor lookup failed", e);
      }
    });
  }

  private static String avatar(Object user) throws ReflectiveOperationException {
    Object model = user.getClass().getMethod("getAvatarModel").invoke(user);
    if (model == null) return null;
    Object url =
        Class.forName("slack.model.AvatarModel").getMethod("getUrl", int.class).invoke(model, PX);
    return url instanceof String && ((String) url).startsWith("https://") ? (String) url : null;
  }

  private static boolean download(String url) {
    HttpURLConnection c = null;
    try {
      c = (HttpURLConnection) new URL(url).openConnection();
      c.setConnectTimeout(10_000);
      c.setReadTimeout(10_000);
      Bitmap raw;
      try (InputStream in = c.getInputStream()) {
        raw = BitmapFactory.decodeStream(in);
      }
      if (raw == null) return false;
      Bitmap round = Bitmap.createBitmap(PX, PX, Bitmap.Config.ARGB_8888);
      Paint p = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
      BitmapShader shader = new BitmapShader(raw, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
      android.graphics.Matrix m = new android.graphics.Matrix();
      m.setScale((float) PX / raw.getWidth(), (float) PX / raw.getHeight());
      shader.setLocalMatrix(m);
      p.setShader(shader);
      new Canvas(round).drawCircle(PX / 2f, PX / 2f, PX / 2f, p);
      raw.recycle();
      faces.put(url, round);
      return true;
    } catch (Exception e) {
      Log.w("Slick", "Avatar download failed", e);
      return false;
    } finally {
      if (c != null) c.disconnect();
    }
  }

  /** Then "+N" in the count's own paint for reactors beyond the first few, like desktop. */
  private static final class Faces extends ReplacementSpan {
    private final List<Bitmap> faces;
    private final String more;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);

    Faces(List<Bitmap> faces, int more) {
      this.faces = faces;
      this.more = more > 0 ? "+" + more : "";
    }

    private static float size(Paint p) {
      Paint.FontMetrics f = p.getFontMetrics();
      return f.descent - f.ascent;
    }

    private float avatars(float d) {
      return d * 0.3f + d + (faces.size() - 1) * d * 0.67f;
    }

    @Override
    public int getSize(Paint p, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
      float d = size(p);
      return Math.round(avatars(d) + (more.isEmpty() ? 0 : d * 0.25f + p.measureText(more)));
    }

    @Override
    public void draw(
        Canvas canvas,
        CharSequence text,
        int start,
        int end,
        float x,
        int top,
        int y,
        int bottom,
        Paint p) {
      float d = size(p), cy = (top + bottom) / 2f;
      for (int i = faces.size() - 1; i >= 0; i--) {
        float left = x + d * 0.3f + i * d * 0.67f;
        canvas.drawBitmap(
            faces.get(i),
            null,
            new android.graphics.RectF(left, cy - d / 2, left + d, cy + d / 2),
            paint);
      }
      if (!more.isEmpty()) canvas.drawText(more, x + avatars(d) + d * 0.25f, y, p);
    }
  }
}
