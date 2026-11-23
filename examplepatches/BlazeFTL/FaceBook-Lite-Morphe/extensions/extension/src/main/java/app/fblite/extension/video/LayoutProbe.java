package app.fblite.extension.video;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.fblite.extension.settings.MorpheLog;

final class LayoutProbe {
    private static final int MAX_NODES = 900;
    private static final int MAX_DEPTH = 32;
    private static final int MAX_CANDIDATES = 60;
    private static final int PER_KIND = 2;
    private static final int MAX_DUMPS = 16;
    private static final long DELAY_MS = 900;
    private static final float REFERENCE_WIDTH = 702f;
    private static final float ASSUMED_COLUMN = 320f;
    private static final float ASSUMED_BUTTON_CENTER = 392f;
    private static final Map<String, Integer> COUNTS = new HashMap<>();
    private static final int[] LOC = new int[2];
    private static int dumps;

    private LayoutProbe() {
    }

    private static final class Box {
        final View view;
        final int l;
        final int t;
        final int r;
        final int b;
        final int depth;

        Box(View view, int l, int t, int r, int b, int depth) {
            this.view = view;
            this.l = l;
            this.t = t;
            this.r = r;
            this.b = b;
            this.depth = depth;
        }

        int h() {
            return b - t;
        }
    }

    private static final class Ctx {
        final View video;
        final StringBuilder out = new StringBuilder();
        final List<Box> candidates = new ArrayList<>();
        final List<Box> ours = new ArrayList<>();
        final int rootW;
        final int rootH;
        final boolean rtl;
        int nodes;
        boolean cut;

        Ctx(View video, int rootW, int rootH, boolean rtl) {
            this.video = video;
            this.rootW = rootW;
            this.rootH = rootH;
            this.rtl = rtl;
        }
    }

    static void schedule(final View video) {
        if (dumps >= MAX_DUMPS || !MorpheLog.enabled("layout")) return;
        View pager = FeedItems.pagerOf(video);
        final String kind = (video.getHeight() >= video.getWidth() * 1.5f ? "REEL" : "VIDEO")
                + (pager != null ? " list " + pager.getWidth() + "x" + pager.getHeight() : " plain")
                + " video " + video.getWidth() + "x" + video.getHeight();
        Integer count = COUNTS.get(kind);
        if (count != null && count >= PER_KIND) return;
        COUNTS.put(kind, count == null ? 1 : count + 1);
        dumps++;
        video.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (!video.isAttachedToWindow()) return;
                try {
                    dump(video, kind);
                } catch (Throwable t) {
                    MorpheLog.log("layout", "Dump failed", t);
                }
            }
        }, DELAY_MS);
    }

    private static void dump(View video, String kind) {
        View root = video.getRootView();
        Resources res = video.getResources();
        DisplayMetrics dm = res.getDisplayMetrics();
        Configuration cfg = res.getConfiguration();
        boolean rtl = cfg.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        Ctx c = new Ctx(video, root.getWidth(), root.getHeight(), rtl);

        StringBuilder head = new StringBuilder("LAYOUT ").append(kind)
                .append(" | screen ").append(dm.widthPixels).append('x').append(dm.heightPixels)
                .append(" density=").append(dm.density).append(" dpi=").append(dm.densityDpi)
                .append(" fontScale=").append(cfg.fontScale)
                .append(" widthDp=").append(cfg.screenWidthDp).append(" heightDp=").append(cfg.screenHeightDp)
                .append(" smallestDp=").append(cfg.smallestScreenWidthDp)
                .append(" orientation=").append(cfg.orientation).append(" rtl=").append(rtl)
                .append(" locale=").append(Locale.getDefault())
                .append(" window=").append(c.rootW).append('x').append(c.rootH);
        if (Build.VERSION.SDK_INT >= 23) {
            WindowInsets insets = video.getRootWindowInsets();
            if (insets != null) {
                head.append(" insets top=").append(insets.getSystemWindowInsetTop())
                        .append(" bottom=").append(insets.getSystemWindowInsetBottom())
                        .append(" left=").append(insets.getSystemWindowInsetLeft())
                        .append(" right=").append(insets.getSystemWindowInsetRight());
            }
        }
        MorpheLog.log("layout", head.toString());

        video.getLocationInWindow(LOC);
        int videoLeft = LOC[0];
        int videoTop = LOC[1];
        int videoBottom = videoTop + video.getHeight();
        View pager = FeedItems.pagerOf(video);
        View item = pager != null ? FeedItems.childOf(pager, video) : null;
        StringBuilder where = new StringBuilder("VIDEO ").append(type(video)).append(' ')
                .append(video.getWidth()).append('x').append(video.getHeight())
                .append('@').append(videoLeft).append(',').append(videoTop);
        if (pager != null) {
            pager.getLocationInWindow(LOC);
            where.append(" | PAGER ").append(type(pager)).append(' ').append(pager.getWidth()).append('x')
                    .append(pager.getHeight()).append('@').append(LOC[0]).append(',').append(LOC[1]);
        }
        if (item != null) {
            item.getLocationInWindow(LOC);
            where.append(" | ITEM ").append(type(item)).append(' ').append(item.getWidth()).append('x')
                    .append(item.getHeight()).append('@').append(LOC[0]).append(',').append(LOC[1]);
        }
        MorpheLog.log("layout", where.toString());

        walk(root, 0, c);
        MorpheLog.log("layout", "TREE views=" + c.nodes + (c.cut ? " (cut)" : "") + "\n" + c.out);

        StringBuilder sum = new StringBuilder("SUMMARY");
        float unit = video.getWidth() / REFERENCE_WIDTH;
        int assumedHeight = Math.round(ASSUMED_COLUMN * unit);
        sum.append("\n  assumed column: height=").append(assumedHeight).append(" top=").append(videoBottom - assumedHeight)
                .append(" | assumed button center y=").append(videoBottom - Math.round(ASSUMED_BUTTON_CENTER * unit))
                .append(" | video bottom=").append(videoBottom);
        for (Box o : c.ours) {
            sum.append("\n  OURS ").append(type(o.view)).append(' ').append(o.r - o.l).append('x').append(o.h())
                    .append('@').append(o.l).append(',').append(o.t).append(" center=")
                    .append((o.l + o.r) / 2).append(',').append((o.t + o.b) / 2);
        }

        List<Box> chain = chain(c, videoBottom);
        if (chain.isEmpty()) {
            sum.append("\n  column chain: none found");
        } else {
            int top = chain.get(chain.size() - 1).t;
            int bottom = chain.get(0).b;
            sum.append("\n  column chain: n=").append(chain.size()).append(" top=").append(top).append(" bottom=").append(bottom)
                    .append(" height=").append(bottom - top).append(" gap to video bottom=").append(videoBottom - bottom)
                    .append(" | measured/assumed height=").append(assumedHeight > 0 ? (bottom - top) / (float) assumedHeight : 0f);
            for (Box x : chain) sum.append("\n    ").append(boxLine(x));
        }

        List<Box> sorted = new ArrayList<>(c.candidates);
        Collections.sort(sorted, new Comparator<Box>() {
            @Override
            public int compare(Box a, Box b) {
                return a.t != b.t ? Integer.compare(a.t, b.t) : Integer.compare(a.depth, b.depth);
            }
        });
        sum.append("\n  right-zone candidates (").append(sorted.size()).append("):");
        for (int i = 0; i < sorted.size() && i < MAX_CANDIDATES; i++) sum.append("\n    ").append(boxLine(sorted.get(i)));
        MorpheLog.log("layout", sum.toString());
    }

    private static List<Box> chain(Ctx c, int videoBottom) {
        List<Box> chain = new ArrayList<>();
        int tol = Math.max(4, Math.round(c.rootH * 0.004f));
        int gapMax = Math.round(c.rootH * 0.04f);
        Box cur = null;
        for (Box x : c.candidates) {
            if (x.b > videoBottom + tol) continue;
            if (cur == null || x.b > cur.b || (x.b == cur.b && x.h() > cur.h())) cur = x;
        }
        while (cur != null && chain.size() < 12) {
            chain.add(cur);
            Box next = null;
            for (Box x : c.candidates) {
                if (chain.contains(x)) continue;
                if (x.b > cur.t + tol || x.b < cur.t - gapMax) continue;
                if (next == null || x.b > next.b || (x.b == next.b && x.h() > next.h())) next = x;
            }
            cur = next;
        }
        return chain;
    }

    private static String boxLine(Box x) {
        return line(x.view, x.l, x.t);
    }

    private static void walk(View v, int depth, Ctx c) {
        if (c.nodes >= MAX_NODES) {
            c.cut = true;
            return;
        }
        if (v.getVisibility() == View.GONE) return;
        c.nodes++;
        v.getLocationInWindow(LOC);
        int l = LOC[0];
        int t = LOC[1];
        int r = l + v.getWidth();
        int b = t + v.getHeight();
        for (int i = 0; i < depth; i++) c.out.append(' ');
        c.out.append(line(v, l, t));
        if (v.getClass().getName().startsWith("app.fblite.extension.")) {
            c.out.append(" OURS\n");
            c.ours.add(new Box(v, l, t, r, b, depth));
            return;
        }
        c.out.append('\n');
        if (isCandidate(c, v, l, t, r, b)) c.candidates.add(new Box(v, l, t, r, b, depth));
        if (!(v instanceof ViewGroup) || depth >= MAX_DEPTH) return;
        ViewGroup group = (ViewGroup) v;
        if (FeedItems.isPager(v)) {
            View item = FeedItems.childOf(v, c.video);
            if (item != null) walk(item, depth + 1, c);
            return;
        }
        for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), depth + 1, c);
    }

    private static boolean isCandidate(Ctx c, View v, int l, int t, int r, int b) {
        int w = r - l;
        int h = b - t;
        if (!v.isShown() || w < c.rootW * 0.04f || w > c.rootW * 0.25f || h < c.rootH * 0.015f || h > c.rootH * 0.2f) {
            return false;
        }
        float cx = (l + r) / 2f;
        return c.rtl ? cx <= c.rootW * 0.2f : cx >= c.rootW * 0.8f;
    }

    private static String line(View v, int l, int t) {
        StringBuilder sb = new StringBuilder(type(v));
        int id = v.getId();
        if (id != View.NO_ID) sb.append(" id=").append(idName(v, id));
        sb.append(' ').append(v.getWidth()).append('x').append(v.getHeight()).append('@').append(l).append(',').append(t);
        if (v.getVisibility() == View.INVISIBLE) sb.append(" INV");
        if (v.getAlpha() < 1f) sb.append(" a=").append(v.getAlpha());
        if (v.getZ() != 0f) sb.append(" z=").append(v.getZ());
        if (v.getTranslationX() != 0f || v.getTranslationY() != 0f) {
            sb.append(" tr=").append(v.getTranslationX()).append(',').append(v.getTranslationY());
        }
        if (v.isClickable()) sb.append(" click");
        if (v.isLongClickable()) sb.append(" long");
        if (!v.isEnabled()) sb.append(" off");
        if (v.isSelected()) sb.append(" sel");
        if (v.getBackground() != null) sb.append(" bg");
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp != null) {
            sb.append(" lp=").append(dim(lp.width)).append('x').append(dim(lp.height));
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
                if (m.leftMargin != 0 || m.topMargin != 0 || m.rightMargin != 0 || m.bottomMargin != 0) {
                    sb.append(" m=").append(m.leftMargin).append(',').append(m.topMargin).append(',')
                            .append(m.rightMargin).append(',').append(m.bottomMargin);
                }
            }
            if (lp instanceof FrameLayout.LayoutParams && ((FrameLayout.LayoutParams) lp).gravity != -1) {
                sb.append(" grav=0x").append(Integer.toHexString(((FrameLayout.LayoutParams) lp).gravity));
            }
        }
        if (v.getPaddingLeft() != 0 || v.getPaddingTop() != 0 || v.getPaddingRight() != 0 || v.getPaddingBottom() != 0) {
            sb.append(" pad=").append(v.getPaddingLeft()).append(',').append(v.getPaddingTop()).append(',')
                    .append(v.getPaddingRight()).append(',').append(v.getPaddingBottom());
        }
        CharSequence cd = v.getContentDescription();
        if (cd != null && cd.length() > 0) sb.append(" cd=\"").append(clip(cd, 28)).append('"');
        Object tag = v.getTag();
        if (tag instanceof String && ((String) tag).length() > 0) sb.append(" tag=\"").append(clip((String) tag, 28)).append('"');
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            CharSequence text = tv.getText();
            if (text != null && text.length() > 0) sb.append(" text=\"").append(clip(text, 20)).append('"');
            sb.append(" ts=").append(tv.getTextSize());
        }
        if (v instanceof ImageView) sb.append(" img");
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            int gone = 0;
            for (int i = 0; i < g.getChildCount(); i++) if (g.getChildAt(i).getVisibility() == View.GONE) gone++;
            sb.append(" kids=").append(g.getChildCount());
            if (gone > 0) sb.append(" gone=").append(gone);
            if (FeedItems.isPager(v)) sb.append(" LIST");
        }
        return sb.toString();
    }

    private static String type(View v) {
        StringBuilder sb = new StringBuilder();
        Class<?> c = v.getClass();
        for (int i = 0; c != null && i < 5; i++) {
            String n = c.getName();
            if (sb.length() > 0) sb.append('<');
            if (n.startsWith("android.") || n.startsWith("androidx.")) {
                sb.append(n.substring(n.lastIndexOf('.') + 1));
                break;
            }
            sb.append(n);
            c = c.getSuperclass();
        }
        return sb.toString();
    }

    private static String idName(View v, int id) {
        try {
            return v.getResources().getResourceEntryName(id);
        } catch (Throwable t) {
            return "#" + Integer.toHexString(id);
        }
    }

    private static String dim(int value) {
        return value == ViewGroup.LayoutParams.MATCH_PARENT ? "M" : value == ViewGroup.LayoutParams.WRAP_CONTENT ? "W" : String.valueOf(value);
    }

    private static String clip(CharSequence text, int max) {
        String s = text.toString().replace('\n', ' ');
        return s.length() > max ? s.substring(0, max) + "..." : s;
    }
}
