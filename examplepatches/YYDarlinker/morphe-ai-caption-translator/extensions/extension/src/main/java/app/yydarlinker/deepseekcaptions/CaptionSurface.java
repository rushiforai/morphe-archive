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

  private static boolean geometryInvalid=true;
  private static WeakReference<View> observedRoot=new WeakReference<>(null);
  private static final WeakHashMap<View,WeakReference<View>> renderedSurfaces=new WeakHashMap<>();
  private static final View.OnLayoutChangeListener GEOMETRY_LAYOUT=(v,l,t,r,b,ol,ot,or,ob)->{
    if(l!=ol||t!=ot||r!=or||b!=ob)invalidateGeometry();
  };
  static long refreshSearchCount, renderedSearchCount, geometrySearchNanos;
  static void invalidateGeometry(){geometryInvalid=true;renderedSurfaces.clear();}
  /** True while a real surface layout invalidated the cached player rectangle and it was not re-proven. */
  static boolean geometryInvalidated(){return geometryInvalid;}

  static void activity(Activity a) {
    View old=observedRoot.get();if(old!=null)old.removeOnLayoutChangeListener(GEOMETRY_LAYOUT);
    observedRoot.clear();invalidateGeometry();
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
    if(observedRoot.get()!=root){View old=observedRoot.get();if(old!=null)old.removeOnLayoutChangeListener(GEOMETRY_LAYOUT);observedRoot=new WeakReference<>(root);root.addOnLayoutChangeListener(GEOMETRY_LAYOUT);invalidateGeometry();}
    if(!geometryInvalid && visible(player.get()))return player.get();
    geometryInvalid=false;refreshSearchCount++;
    long started=System.nanoTime();
    Set<Integer> ids = new HashSet<>();
    for (String name : SHORTS) {
      int id = a.getResources().getIdentifier(name, "id", a.getPackageName());
      if (id != 0) ids.add(id);
    }
    View shortView = discover(root, ids);
    if (shortView != null) {
      player = new WeakReference<>(shortView);
      geometrySearchNanos+=System.nanoTime()-started;
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
    geometrySearchNanos+=System.nanoTime()-started;
    return best;
  }

  static View player() {
    View v = player.get();
    return !geometryInvalid && visible(v) ? v : refresh();
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
    WeakReference<View> cached=renderedSurfaces.get(root);
    if(cached!=null && visible(cached.get()))return relative(cached.get(),host);
    renderedSearchCount++;
    View selected=null;
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
          selected=v;
          area = (long) b.width() * b.height();
        }
      }
      if (v instanceof ViewGroup) {
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) q.add(g.getChildAt(i));
      }
    }
    if(selected!=null){renderedSurfaces.put(root,new WeakReference<>(selected));selected.removeOnLayoutChangeListener(GEOMETRY_LAYOUT);selected.addOnLayoutChangeListener(GEOMETRY_LAYOUT);}
    return best;
  }

  /** Read-only direction evidence from the current cached player; never triggers discovery. */
  static int playerLayoutDirection() {
    View p=player.get();return p==null ? View.LAYOUT_DIRECTION_INHERIT : p.getLayoutDirection();
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
