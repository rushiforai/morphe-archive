package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Rect;
import android.view.*;
import java.lang.ref.WeakReference;
import java.util.*;

/** Verified player geometry only. No Activity-wide surface search and no unrelated previews. */
final class CaptionSurface {
  private static final String[] SHORTS = {
    "reel_player_overlay_root",
    "reel_watch_player",
    "shorts_player_view_container",
    "reel_player_page_container",
    "reel_watch_fragment_root"
  };
  private static final String[] REGULAR = {
    "inset_overlay_view_layout", "player_overlays", "player_overlay", "watch_player"
  };
  private static WeakReference<Activity> activity = new WeakReference<>(null);
  private static WeakReference<View> shorts = new WeakReference<>(null),
      player = new WeakReference<>(null),
      nativeView = new WeakReference<>(null);

  static void activity(Activity a) {
    activity = new WeakReference<>(a);
    shorts = new WeakReference<>(null);
    player = new WeakReference<>(null);
    nativeView = new WeakReference<>(null);
  }

  static boolean visible(View v) {
    if (v == null || !v.isAttachedToWindow() || !v.isShown() || v.getAlpha() <= .01) return false;
    Rect r = new Rect();
    return v.getGlobalVisibleRect(r) && r.width() > 40 && r.height() > 40;
  }

  static boolean isShorts() {
    return visible(shorts.get());
  }

  static View refresh() {
    Activity a = activity.get();
    if (a == null || a.getWindow() == null) return null;
    View root = a.getWindow().getDecorView();
    Set<Integer> ids = new HashSet<>();
    for (String name : SHORTS) {
      int id = a.getResources().getIdentifier(name, "id", a.getPackageName());
      if (id != 0) ids.add(id);
    }
    View shortView = discover(root, ids);
    if (shortView != null) {
      player = new WeakReference<>(shortView);
      return shortView;
    }
    View best = null;
    long area = 0;
    boolean proven = false;
    for (String name : REGULAR) {
      int id = a.getResources().getIdentifier(name, "id", a.getPackageName());
      View v = id == 0 ? null : root.findViewById(id);
      if (visible(v)) {
        Rect r = new Rect();
        v.getGlobalVisibleRect(r);
        Rect rendered = renderedBounds(v, root);
        boolean hasSurface = rendered != null;
        long n = (long) r.width() * r.height();
        if (best == null || hasSurface && !proven || hasSurface == proven && n < area) {
          area = n;
          best = v;
          proven = hasSurface;
        }
      }
    }
    player = new WeakReference<>(best);
    return best;
  }

  static View player() {
    View v = player.get();
    return visible(v) ? v : refresh();
  }

  static View discover(View root, Set<Integer> ids) {
    View best = null;
    long largest = 0;
    ArrayDeque<View> q = new ArrayDeque<>();
    if (root != null) q.add(root);
    int visited = 0;
    while (!q.isEmpty() && visited++ < 1800) {
      View v = q.remove();
      Object tag = v.getTag();
      if (tag != null && tag.toString().startsWith("yydarlinker.deepseek.caption")) continue;
      if (ids.contains(v.getId()) && visible(v)) {
        Rect b = new Rect();
        v.getGlobalVisibleRect(b);
        long area = (long) b.width() * b.height();
        if (area > largest) {
          largest = area;
          best = v;
        }
      }
      if (v instanceof ViewGroup && v.getVisibility() == View.VISIBLE) {
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) q.add(g.getChildAt(i));
      }
    }
    shorts = new WeakReference<>(best);
    return best;
  }

  static Rect bounds(View host) {
    return relative(shorts.get(), host);
  }

  private static Rect relative(View v, View host) {
    if (!visible(v) || host == null) return null;
    Rect b = new Rect(), h = new Rect();
    if (!v.getGlobalVisibleRect(b) || !host.getGlobalVisibleRect(h) || !b.intersect(h)) return null;
    int[] xy = new int[2];
    host.getLocationOnScreen(xy);
    b.offset(-xy[0], -xy[1]);
    return b;
  }

  static Rect renderedBounds(View root, View host) {
    if (root == null || host == null) return null;
    ArrayDeque<View> q = new ArrayDeque<>();
    q.add(root);
    Rect best = null;
    long area = 0;
    int visited = 0;
    while (!q.isEmpty() && visited++ < 900) {
      View v = q.remove();
      if (!v.isShown() || v.getAlpha() <= .01) continue;
      if (v instanceof SurfaceView || v instanceof TextureView) {
        Rect b = relative(v, host);
        if (b != null && (long) b.width() * b.height() > area) {
          best = b;
          area = (long) b.width() * b.height();
        }
      }
      if (v instanceof ViewGroup) {
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) q.add(g.getChildAt(i));
      }
    }
    return best;
  }

  static Rect videoBounds(View host) {
    View p = player();
    Rect b = renderedBounds(p, host);
    return b == null ? relative(p, host) : b;
  }

  static void nativeRenderer(View v) {
    nativeView = new WeakReference<>(v);
  }

  static Float nativeCenter(View host, Rect video) {
    Rect b = relative(nativeView.get(), host);
    if (b == null
        || video == null
        || !Rect.intersects(b, video)
        || b.height() > video.height() * .4f) return null;
    return (b.exactCenterY() - video.top) / video.height();
  }
}
