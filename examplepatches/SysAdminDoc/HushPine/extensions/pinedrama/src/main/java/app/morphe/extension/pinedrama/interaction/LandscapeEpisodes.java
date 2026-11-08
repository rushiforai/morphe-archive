/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.interaction;

import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Gives a drama's full screen player the whole series to page through.
 *
 * <p>Issue #1: the "Full screen" pill opens {@code LandscapeFeedActivity} with a list of exactly
 * one video, the episode you were on. Its pager swipes fine and its end-of-video handler already
 * moves to the next page, but with one page there's nothing to move to, so swipes do nothing and
 * the episode loops. Its own load-more only re-reads that same one-item list.
 *
 * <p>So the list it opens with becomes the series the portrait screen already holds, and its
 * load-more asks the series model for the next page instead. Everything else stays PineDrama's:
 * the pager, the swipe, the autoplay at the end of an episode. Any other full screen (a video in
 * the feed, a profile) keeps its one video and its own code.
 */
public final class LandscapeEpisodes {
    /** The Hook status family this reports under. */
    static final String FAMILY = "full screen episodes";
    static final String SERIES_MODEL =
            "com.ss.android.ugc.aweme.series.innerfeed.viewmodel.SeriesInnerFeedViewModel";
    /** The viewer's own append and prepend, which skip what it already has by video id. */
    private static final String APPEND = "R3";
    private static final String PREPEND = "Qc";
    /**
     * Tells the viewer a load started by itself rather than by a pull past the last page. After a
     * pull its append moves on a page, so left unset every load would skip an episode.
     */
    private static final String SET_AUTOMATIC = "fr";
    /** Takes down the spinner a pull started when there's nothing to load. */
    private static final String LOAD_ENDED = "B3";
    /** The viewer's pager ability, and that ability's current video. */
    private static final String PAGER_ABILITY = "Hz";
    private static final String CURRENT_ITEM = "LLLILZLLLI";
    /** The modes the series model's {@code request} takes for its next and previous pages. */
    private static final int MODE_NEXT = 4;
    private static final int MODE_PREVIOUS = 2;
    /** Same margin the viewer's own load-more uses before it asks for more. */
    static final int LOAD_WHEN_LEFT = 3;
    static final int LOAD_BACK_WITHIN = 1;
    private static final long POLL_MILLIS = 300;
    private static final int POLLS = 27;
    private static final long CATCH_UP_MILLIS = 100;
    private static final int CATCH_UP_POLLS = 30;
    private static final int HOLD_POLLS = 8;
    private static final long TRY_AGAIN_MILLIS = 5000;

    private static WeakReference<Object> seriesModel = new WeakReference<>(null);
    private static WeakReference<View> portraitRoot = new WeakReference<>(null);
    private static WeakReference<Object> viewer = new WeakReference<>(null);
    private static volatile boolean active;
    private static boolean loadingNext;
    private static boolean loadingPrevious;
    /** Changes when full screen opens or closes, so a jump still waiting knows it's out of date. */
    private static int moveTicket;
    private static int lastIndex;
    private static int lastCount;

    private LandscapeEpisodes() {}

    /** The pill was tapped: remember the screen's model if it's a series. */
    public static void remember(Object assem, Object viewModel) {
        HookStatus.bound(FAMILY, "full screen entry");
        active = false;
        moveTicket++;
        boolean series = viewModel != null && SERIES_MODEL.equals(viewModel.getClass().getName());
        seriesModel = new WeakReference<>(series ? viewModel : null);
        Object container = series ? Reflect.invoke(assem, "getContainerView") : null;
        portraitRoot = new WeakReference<>(
                container instanceof View ? ((View) container).getRootView() : null);
    }

    /** The viewer reads the list it opens with. */
    public static List<Object> episodes(List<Object> seed) {
        HookStatus.bound(FAMILY, "full screen list");
        active = false;
        if (!Settings.LANDSCAPE_EPISODES.get()) return seed;
        Object series = seriesModel.get();
        if (series == null) return seed;
        List<Object> chosen = select(seed, awemeList(series));
        if (chosen == null) return seed;
        active = true;
        loadingNext = false;
        loadingPrevious = false;
        return chosen;
    }

    /**
     * The series without its ads, or null unless {@code seed} is one video of that series. Ads go
     * because the end-of-episode handler would otherwise play them as the next episode.
     */
    static List<Object> select(List<?> seed, List<?> all) {
        if (seed == null || seed.size() != 1 || all == null) return null;
        Object entry = seed.get(0);
        String entryId = id(entry);
        if (entryId == null) return null;
        List<Object> chosen = withoutAds(all);
        for (Object item : chosen) {
            if (entryId.equals(id(item))) return chosen;
        }
        return null;
    }

    static List<Object> withoutAds(List<?> all) {
        List<Object> kept = new ArrayList<>(all.size());
        for (Object item : all) {
            if (item instanceof Aweme && !((Aweme) item).isAd()) kept.add(item);
        }
        return kept;
    }

    static boolean nearEnd(int index, int count) {
        return count - 1 - index <= LOAD_WHEN_LEFT;
    }

    static boolean nearStart(int index) {
        return index <= LOAD_BACK_WITHIN;
    }

    /**
     * The viewer's load-more, run as each page settles and on a pull past the last page. True means
     * this took it over.
     */
    public static boolean loadMore(Object loadLogic, int index, int count, boolean manual) {
        HookStatus.bound(FAMILY, "full screen load more");
        if (!active) return false;
        viewer = new WeakReference<>(loadLogic);
        lastIndex = index;
        lastCount = count;
        call(loadLogic, SET_AUTOMATIC, new Class<?>[] {boolean.class}, !manual);
        if (nearEnd(index, count)) fetch(loadLogic, true);
        if (nearStart(index)) fetch(loadLogic, false);
        if (manual && !loadingNext) endLoad(loadLogic);
        return true;
    }

    /** The viewer's load-previous. True means this took it over. */
    public static boolean loadPrevious(Object loadLogic) {
        HookStatus.bound(FAMILY, "full screen load previous");
        if (!active) return false;
        viewer = new WeakReference<>(loadLogic);
        fetch(loadLogic, false);
        return true;
    }

    private static void fetch(Object loadLogic, boolean next) {
        Object series = seriesModel.get();
        if (series == null || (next ? loadingNext : loadingPrevious)) return;
        if (Boolean.TRUE.equals(Reflect.invoke(series, "isLoading"))) return;
        if (next && !Boolean.TRUE.equals(Reflect.invoke(series, "hasNext"))) return;
        int before = awemeCount(series);
        if (!request(series, next ? MODE_NEXT : MODE_PREVIOUS)) return;
        setLoading(next, true);
        poll(loadLogic, series, next, before, POLLS);
    }

    /** The model loads off the main thread and tells only the portrait screen, so this watches it. */
    private static void poll(Object loadLogic, Object series, boolean next, int before, int left) {
        Utils.runOnMainThreadDelayed(() -> {
            if (!active || seriesModel.get() != series) {
                setLoading(next, false);
                return;
            }
            List<?> all = awemeList(series);
            if (all != null && all.size() > before) {
                setLoading(next, false);
                hand(loadLogic, all, next);
            } else if (left > 1) {
                poll(loadLogic, series, next, before, left - 1);
            } else {
                setLoading(next, false);
                if (next) {
                    endLoad(loadLogic);
                    tryAgainLater(loadLogic, series, before);
                }
            }
        }, POLL_MILLIS);
    }

    /**
     * Nothing else asks again after a page doesn't come (no signal, say), and on the last episode
     * there's no swipe left to set off a load. So this keeps asking while the player is near the end.
     */
    private static void tryAgainLater(Object loadLogic, Object series, int before) {
        Utils.runOnMainThreadDelayed(() -> {
            if (!active || seriesModel.get() != series || !nearEnd(lastIndex, lastCount)) return;
            List<?> all = awemeList(series);
            if (all != null && all.size() > before) {
                hand(loadLogic, all, true);
            } else if (Boolean.TRUE.equals(Reflect.invoke(series, "isLoading"))) {
                tryAgainLater(loadLogic, series, before);
            } else {
                fetch(loadLogic, true);
            }
        }, TRY_AGAIN_MILLIS);
    }

    private static void setLoading(boolean next, boolean loading) {
        if (next) loadingNext = loading;
        else loadingPrevious = loading;
    }

    private static void hand(Object loadLogic, List<?> all, boolean next) {
        List<Object> episodes = withoutAds(all);
        call(loadLogic, next ? APPEND : PREPEND, new Class<?>[] {List.class, boolean.class}, episodes, true);
    }

    private static void endLoad(Object loadLogic) {
        call(loadLogic, LOAD_ENDED, new Class<?>[] {Exception.class}, new Exception("can't load more"));
    }

    private static void call(Object loadLogic, String name, Class<?>[] types, Object... arguments) {
        try {
            loadLogic.getClass().getMethod(name, types).invoke(loadLogic, arguments);
        } catch (NoSuchMethodException e) {
            HookStatus.missingMember(FAMILY, "method", loadLogic.getClass().getName(), name);
        } catch (Exception e) {
            HookStatus.threw(FAMILY, name, e);
        }
    }

    /** Full screen is closing: put the portrait screen on the episode it's leaving on. */
    public static void leaving(Object activity) {
        boolean wasActive = active;
        active = false;
        Object series = seriesModel.get();
        Object loadLogic = viewer.get();
        View root = portraitRoot.get();
        seriesModel = new WeakReference<>(null);
        viewer = new WeakReference<>(null);
        portraitRoot = new WeakReference<>(null);
        if (!wasActive || series == null || loadLogic == null || root == null) return;

        Object ability = Reflect.invoke(loadLogic, PAGER_ABILITY);
        Object current = ability == null ? null : Reflect.invoke(ability, CURRENT_ITEM);
        String episode = id(current);
        View pager = indexOf(awemeList(series), episode) < 0 ? null : findPager(root);
        if (pager == null) return;
        moveWhenCaughtUp(pager, series, episode, ++moveTicket, CATCH_UP_POLLS);
    }

    /**
     * The portrait pager only takes what full screen loaded once its screen is back, and a jump past
     * the pages it has lands on its last one. So the jump waits for it to hold the whole list.
     */
    private static void moveWhenCaughtUp(View pager, Object series, String episode, int ticket, int left) {
        if (ticket != moveTicket) return;
        if (left > 1 && !holdsWholeList(pager, series)) {
            Utils.runOnMainThreadDelayed(
                    () -> moveWhenCaughtUp(pager, series, episode, ticket, left - 1), CATCH_UP_MILLIS);
            return;
        }
        keepOn(pager, series, episode, ticket, HOLD_POLLS);
    }

    /**
     * Taking in a longer list, the portrait screen puts itself back on the video it had, which can
     * undo the jump. So this looks again for a moment.
     */
    private static void keepOn(View pager, Object series, String episode, int ticket, int left) {
        if (ticket != moveTicket) return;
        int index = indexOf(awemeList(series), episode);
        if (index < 0) return;
        Object on = Reflect.invoke(pager, "getCurrentItem");
        if (!Integer.valueOf(index).equals(on)) setCurrentItem(pager, index);
        if (left > 1) {
            Utils.runOnMainThreadDelayed(
                    () -> keepOn(pager, series, episode, ticket, left - 1), CATCH_UP_MILLIS);
        }
    }

    private static void setCurrentItem(View pager, int index) {
        try {
            pager.getClass().getMethod("setCurrentItem", int.class).invoke(pager, index);
        } catch (NoSuchMethodException e) {
            HookStatus.missingMember(FAMILY, "method", pager.getClass().getName(), "setCurrentItem");
        } catch (Exception e) {
            HookStatus.threw(FAMILY, "setCurrentItem", e);
        }
    }

    /** An unreadable count reads as yes: waiting wouldn't change it. */
    private static boolean holdsWholeList(View pager, Object series) {
        Object count = Reflect.invoke(Reflect.invoke(pager, "getAdapter"), "getCount");
        return !(count instanceof Integer) || (Integer) count == awemeCount(series);
    }

    static int indexOf(List<?> all, String wanted) {
        if (all == null || wanted == null) return -1;
        for (int i = 0; i < all.size(); i++) {
            if (wanted.equals(id(all.get(i)))) return i;
        }
        return -1;
    }

    private static String id(Object item) {
        return item instanceof Aweme ? ((Aweme) item).getAid() : null;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> awemeList(Object series) {
        Object list = Reflect.invoke(series, "getAwemeList");
        return list instanceof List ? (List<Object>) list : null;
    }

    private static int awemeCount(Object series) {
        List<Object> all = awemeList(series);
        return all == null ? 0 : all.size();
    }

    /** The model's public {@code request(int, X, int, boolean)}; its second type is obfuscated. */
    private static boolean request(Object series, int mode) {
        for (Method method : series.getClass().getMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (!"request".equals(method.getName()) || types.length != 4
                    || types[0] != int.class || types[2] != int.class || types[3] != boolean.class) {
                continue;
            }
            try {
                method.invoke(series, mode, null, -1, false);
                return true;
            } catch (Exception e) {
                HookStatus.threw(FAMILY, "request", e);
                return false;
            }
        }
        HookStatus.missingMember(FAMILY, "method", series.getClass().getName(), "request");
        return false;
    }

    /** A covered activity's root reads as invisible, so only views below it are checked. */
    private static View findPager(View view) {
        if (view.getClass().getName().endsWith(".VerticalViewPager")) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE) continue;
                View found = findPager(child);
                if (found != null) return found;
            }
        }
        return null;
    }
}
